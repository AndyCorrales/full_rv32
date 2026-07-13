#ifndef PROCESSOR_H
#define PROCESSOR_H

#include <systemc.h>
#include <tlm.h>
#include <tlm_utils/simple_initiator_socket.h>
#include <array>
#include <cstring>
#include <iostream>

#include "rv32i_defs.h"
#include "immediates.h"
#include "fp_ops.h"

// CPU RV32I monociclo. INITIATOR puro hacia el Bus: toda direccion que
// maneja (fetch, load, store) es GLOBAL dentro del mapa de memoria.
SC_MODULE(Processor) {
    tlm_utils::simple_initiator_socket<Processor, 32> init_socket;

    std::array<uint32_t, 32> regs{};
    std::array<float, 32> fregs{}; // banco de registros f0-f31 (extension F, simple precision)
    uint32_t pc = 0;
    bool halted = false;
    sc_event finished; // se notifica cuando el programa llega a instr==0

    SC_CTOR(Processor) : init_socket("init_socket") {
        SC_THREAD(run);
    }

    // Lectura/escritura generica de 'len' bytes en direccion GLOBAL via Bus.
    void bus_access(tlm::tlm_command cmd, uint32_t addr, uint8_t* data, unsigned int len) {
        tlm::tlm_generic_payload trans;
        sc_time delay = SC_ZERO_TIME;

        trans.set_command(cmd);
        trans.set_address(addr);
        trans.set_data_ptr(data);
        trans.set_data_length(len);
        trans.set_streaming_width(len);
        trans.set_byte_enable_ptr(nullptr);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);

        init_socket->b_transport(trans, delay);
        wait(delay);

        if (trans.get_response_status() != tlm::TLM_OK_RESPONSE) {
            std::cerr << "[Processor] Error de bus en direccion 0x" << std::hex << addr << std::dec << std::endl;
            halted = true;
        }
    }

    uint32_t fetch(uint32_t addr) {
        uint32_t instr = 0;
        bus_access(tlm::TLM_READ_COMMAND, addr, reinterpret_cast<uint8_t*>(&instr), 4);
        return instr;
    }

    uint32_t load(uint32_t addr, unsigned int len) {
        uint32_t value = 0;
        bus_access(tlm::TLM_READ_COMMAND, addr, reinterpret_cast<uint8_t*>(&value), len);
        return value;
    }

    void store(uint32_t addr, uint32_t value, unsigned int len) {
        bus_access(tlm::TLM_WRITE_COMMAND, addr, reinterpret_cast<uint8_t*>(&value), len);
    }

    void write_reg(uint32_t idx, uint32_t value) {
        if (idx != 0) regs[idx] = value;
    }

    void run() {
        while (!halted) {
            uint32_t instr = fetch(pc);

            // Instruccion nula (memoria sin programa): fin de ejecucion.
            if (instr == 0) {
                halted = true;
                break;
            }

            uint32_t opcode = rv32i::opcode(instr);
            uint32_t rd     = rv32i::rd(instr);
            uint32_t f3     = rv32i::funct3(instr);
            uint32_t rs1i   = rv32i::rs1(instr);
            uint32_t rs2i   = rv32i::rs2(instr);
            uint32_t f7     = rv32i::funct7(instr);

            uint32_t next_pc = pc + 4;

            int32_t r1 = static_cast<int32_t>(regs[rs1i]);
            int32_t r2 = static_cast<int32_t>(regs[rs2i]);

            switch (opcode) {
                case rv32i::Opcode::OP: {
                    uint32_t result = 0;

                    if (f7 == rv32i::Funct7::MULDIV) {
                        // Extension M: mismo opcode OP, distinguida solo por
                        // funct7. Los productos de 64 bits se calculan en
                        // int64_t/uint64_t y se toma la mitad alta o baja
                        // segun corresponda.
                        int64_t  r1_64  = static_cast<int64_t>(r1);
                        int64_t  r2_64  = static_cast<int64_t>(r2);
                        uint64_t u1_64  = static_cast<uint64_t>(regs[rs1i]);
                        uint64_t u2_64  = static_cast<uint64_t>(regs[rs2i]);

                        switch (f3) {
                            case rv32i::Funct3_MULDIV::MUL:
                                result = static_cast<uint32_t>(regs[rs1i] * regs[rs2i]);
                                break;
                            case rv32i::Funct3_MULDIV::MULH:
                                result = static_cast<uint32_t>(static_cast<uint64_t>(r1_64 * r2_64) >> 32);
                                break;
                            case rv32i::Funct3_MULDIV::MULHSU:
                                result = static_cast<uint32_t>(static_cast<uint64_t>(r1_64 * static_cast<int64_t>(u2_64)) >> 32);
                                break;
                            case rv32i::Funct3_MULDIV::MULHU:
                                result = static_cast<uint32_t>((u1_64 * u2_64) >> 32);
                                break;
                            case rv32i::Funct3_MULDIV::DIV:
                                if (r2 == 0) {
                                    result = 0xFFFFFFFF; // division por cero: -1
                                } else if (regs[rs1i] == 0x80000000 && r2 == -1) {
                                    result = 0x80000000; // overflow: INT32_MIN / -1
                                } else {
                                    result = static_cast<uint32_t>(r1 / r2);
                                }
                                break;
                            case rv32i::Funct3_MULDIV::DIVU:
                                result = (regs[rs2i] == 0) ? 0xFFFFFFFF : (regs[rs1i] / regs[rs2i]);
                                break;
                            case rv32i::Funct3_MULDIV::REM:
                                if (r2 == 0) {
                                    result = regs[rs1i]; // division por cero: resto = dividendo
                                } else if (regs[rs1i] == 0x80000000 && r2 == -1) {
                                    result = 0; // overflow: resto = 0
                                } else {
                                    result = static_cast<uint32_t>(r1 % r2);
                                }
                                break;
                            case rv32i::Funct3_MULDIV::REMU:
                                result = (regs[rs2i] == 0) ? regs[rs1i] : (regs[rs1i] % regs[rs2i]);
                                break;
                        }
                    } else {
                        switch (f3) {
                            case rv32i::Funct3_ALU::ADD_SUB:
                                result = (f7 == rv32i::Funct7::ALT) ? (r1 - r2) : (r1 + r2);
                                break;
                            case rv32i::Funct3_ALU::SLL:
                                result = static_cast<uint32_t>(r1) << (r2 & 0x1F);
                                break;
                            case rv32i::Funct3_ALU::SLT:
                                result = (r1 < r2) ? 1 : 0;
                                break;
                            case rv32i::Funct3_ALU::SLTU:
                                result = (regs[rs1i] < regs[rs2i]) ? 1 : 0;
                                break;
                            case rv32i::Funct3_ALU::XOR:
                                result = regs[rs1i] ^ regs[rs2i];
                                break;
                            case rv32i::Funct3_ALU::SRL_SRA:
                                result = (f7 == rv32i::Funct7::ALT)
                                             ? static_cast<uint32_t>(r1 >> (r2 & 0x1F))
                                             : (regs[rs1i] >> (regs[rs2i] & 0x1F));
                                break;
                            case rv32i::Funct3_ALU::OR:
                                result = regs[rs1i] | regs[rs2i];
                                break;
                            case rv32i::Funct3_ALU::AND:
                                result = regs[rs1i] & regs[rs2i];
                                break;
                        }
                    }

                    write_reg(rd, result);
                    break;
                }

                case rv32i::Opcode::OP_IMM: {
                    int32_t imm = rv32i::get_imm_I(instr);
                    uint32_t shamt = rv32i::get_shamt(instr);
                    uint32_t result = 0;
                    switch (f3) {
                        case rv32i::Funct3_ALU::ADD_SUB:
                            result = r1 + imm;
                            break;
                        case rv32i::Funct3_ALU::SLL:
                            result = static_cast<uint32_t>(r1) << shamt;
                            break;
                        case rv32i::Funct3_ALU::SLT:
                            result = (r1 < imm) ? 1 : 0;
                            break;
                        case rv32i::Funct3_ALU::SLTU:
                            result = (regs[rs1i] < static_cast<uint32_t>(imm)) ? 1 : 0;
                            break;
                        case rv32i::Funct3_ALU::XOR:
                            result = regs[rs1i] ^ static_cast<uint32_t>(imm);
                            break;
                        case rv32i::Funct3_ALU::SRL_SRA:
                            result = (rv32i::funct7(instr) == rv32i::Funct7::ALT)
                                         ? static_cast<uint32_t>(r1 >> shamt)
                                         : (regs[rs1i] >> shamt);
                            break;
                        case rv32i::Funct3_ALU::OR:
                            result = regs[rs1i] | static_cast<uint32_t>(imm);
                            break;
                        case rv32i::Funct3_ALU::AND:
                            result = regs[rs1i] & static_cast<uint32_t>(imm);
                            break;
                    }
                    write_reg(rd, result);
                    break;
                }

                case rv32i::Opcode::LOAD: {
                    int32_t imm = rv32i::get_imm_I(instr);
                    uint32_t addr = regs[rs1i] + imm;
                    uint32_t result = 0;
                    switch (f3) {
                        case rv32i::Funct3_LOAD::LB:
                            result = static_cast<uint32_t>(static_cast<int32_t>(static_cast<int8_t>(load(addr, 1))));
                            break;
                        case rv32i::Funct3_LOAD::LH:
                            result = static_cast<uint32_t>(static_cast<int32_t>(static_cast<int16_t>(load(addr, 2))));
                            break;
                        case rv32i::Funct3_LOAD::LW:
                            result = load(addr, 4);
                            break;
                        case rv32i::Funct3_LOAD::LBU:
                            result = load(addr, 1) & 0xFF;
                            break;
                        case rv32i::Funct3_LOAD::LHU:
                            result = load(addr, 2) & 0xFFFF;
                            break;
                    }
                    write_reg(rd, result);
                    break;
                }

                case rv32i::Opcode::STORE: {
                    int32_t imm = rv32i::get_imm_S(instr);
                    uint32_t addr = regs[rs1i] + imm;
                    switch (f3) {
                        case rv32i::Funct3_STORE::SB: store(addr, regs[rs2i], 1); break;
                        case rv32i::Funct3_STORE::SH: store(addr, regs[rs2i], 2); break;
                        case rv32i::Funct3_STORE::SW: store(addr, regs[rs2i], 4); break;
                    }
                    break;
                }

                case rv32i::Opcode::BRANCH: {
                    int32_t imm = rv32i::get_imm_B(instr);
                    bool taken = false;
                    switch (f3) {
                        case rv32i::Funct3_BRANCH::BEQ:  taken = (r1 == r2); break;
                        case rv32i::Funct3_BRANCH::BNE:  taken = (r1 != r2); break;
                        case rv32i::Funct3_BRANCH::BLT:  taken = (r1 < r2); break;
                        case rv32i::Funct3_BRANCH::BGE:  taken = (r1 >= r2); break;
                        case rv32i::Funct3_BRANCH::BLTU: taken = (regs[rs1i] < regs[rs2i]); break;
                        case rv32i::Funct3_BRANCH::BGEU: taken = (regs[rs1i] >= regs[rs2i]); break;
                    }
                    if (taken) next_pc = pc + imm;
                    break;
                }

                case rv32i::Opcode::JAL: {
                    int32_t imm = rv32i::get_imm_J(instr);
                    write_reg(rd, pc + 4);
                    next_pc = pc + imm;
                    break;
                }

                case rv32i::Opcode::JALR: {
                    int32_t imm = rv32i::get_imm_I(instr);
                    uint32_t link = pc + 4;
                    next_pc = (regs[rs1i] + imm) & ~static_cast<uint32_t>(1);
                    write_reg(rd, link);
                    break;
                }

                case rv32i::Opcode::LUI:
                    write_reg(rd, static_cast<uint32_t>(rv32i::get_imm_U(instr)));
                    break;

                case rv32i::Opcode::AUIPC:
                    write_reg(rd, pc + static_cast<uint32_t>(rv32i::get_imm_U(instr)));
                    break;

                case rv32i::Opcode::LOAD_FP: {
                    // Unico ancho soportado: FLW (f3 == Funct3_FP_MEM::W).
                    int32_t imm = rv32i::get_imm_I(instr);
                    uint32_t addr = regs[rs1i] + imm;
                    fregs[rd] = rv32i::bits_to_float(load(addr, 4));
                    break;
                }

                case rv32i::Opcode::STORE_FP: {
                    // Unico ancho soportado: FSW (f3 == Funct3_FP_MEM::W).
                    int32_t imm = rv32i::get_imm_S(instr);
                    uint32_t addr = regs[rs1i] + imm;
                    store(addr, rv32i::float_to_bits(fregs[rs2i]), 4);
                    break;
                }

                // FMADD/FMSUB/FNMSUB/FNMADD: R4-type, un tercer operando
                // fuente (rs3) ademas de rs1/rs2. std::fma calcula
                // (a*b)+c con un unico redondeo final (fused), igual que
                // exige el ISA (a diferencia de hacer a*b y despues +c
                // por separado, que redondearia dos veces).
                case rv32i::Opcode::FMADD: {
                    uint32_t r3 = rv32i::rs3(instr);
                    fregs[rd] = std::fma(fregs[rs1i], fregs[rs2i], fregs[r3]);
                    break;
                }
                case rv32i::Opcode::FMSUB: {
                    uint32_t r3 = rv32i::rs3(instr);
                    fregs[rd] = std::fma(fregs[rs1i], fregs[rs2i], -fregs[r3]);
                    break;
                }
                case rv32i::Opcode::FNMSUB: {
                    uint32_t r3 = rv32i::rs3(instr);
                    fregs[rd] = std::fma(-fregs[rs1i], fregs[rs2i], fregs[r3]);
                    break;
                }
                case rv32i::Opcode::FNMADD: {
                    uint32_t r3 = rv32i::rs3(instr);
                    fregs[rd] = std::fma(-fregs[rs1i], fregs[rs2i], -fregs[r3]);
                    break;
                }

                case rv32i::Opcode::OP_FP: {
                    switch (f7) {
                        case rv32i::Funct7_FP::FADD_S:
                            fregs[rd] = fregs[rs1i] + fregs[rs2i];
                            break;
                        case rv32i::Funct7_FP::FSUB_S:
                            fregs[rd] = fregs[rs1i] - fregs[rs2i];
                            break;
                        case rv32i::Funct7_FP::FMUL_S:
                            fregs[rd] = fregs[rs1i] * fregs[rs2i];
                            break;
                        case rv32i::Funct7_FP::FDIV_S:
                            fregs[rd] = fregs[rs1i] / fregs[rs2i];
                            break;
                        case rv32i::Funct7_FP::FSQRT_S:
                            fregs[rd] = std::sqrt(fregs[rs1i]);
                            break;

                        case rv32i::Funct7_FP::FSGNJ_S: {
                            uint32_t a = rv32i::float_to_bits(fregs[rs1i]);
                            uint32_t b = rv32i::float_to_bits(fregs[rs2i]);
                            uint32_t sign = 0;
                            switch (f3) {
                                case rv32i::Funct3_FSGNJ::FSGNJ:  sign = b & 0x80000000; break;
                                case rv32i::Funct3_FSGNJ::FSGNJN: sign = (~b) & 0x80000000; break;
                                case rv32i::Funct3_FSGNJ::FSGNJX: sign = (a ^ b) & 0x80000000; break;
                            }
                            fregs[rd] = rv32i::bits_to_float((a & 0x7FFFFFFF) | sign);
                            break;
                        }

                        case rv32i::Funct7_FP::FMINMAX_S:
                            if (f3 == rv32i::Funct3_FMINMAX::FMIN)
                                fregs[rd] = std::fmin(fregs[rs1i], fregs[rs2i]);
                            else
                                fregs[rd] = std::fmax(fregs[rs1i], fregs[rs2i]);
                            break;

                        case rv32i::Funct7_FP::FCMP_S: {
                            // Los comparadores de C++ con NaN siempre dan
                            // false (IEEE-754), que es exactamente el
                            // resultado que exige el ISA para FEQ/FLT/FLE
                            // con NaN, sin necesitar codigo especial.
                            uint32_t result = 0;
                            switch (f3) {
                                case rv32i::Funct3_FCMP::FLE: result = (fregs[rs1i] <= fregs[rs2i]) ? 1 : 0; break;
                                case rv32i::Funct3_FCMP::FLT: result = (fregs[rs1i] <  fregs[rs2i]) ? 1 : 0; break;
                                case rv32i::Funct3_FCMP::FEQ: result = (fregs[rs1i] == fregs[rs2i]) ? 1 : 0; break;
                            }
                            write_reg(rd, result);
                            break;
                        }

                        case rv32i::Funct7_FP::FCVT_W_S: {
                            uint32_t r2 = rv32i::rs2(instr); // reusado como selector W/WU
                            uint32_t result = (r2 == rv32i::Rs2_FCVT::WU)
                                                  ? rv32i::fcvt_wu_s(fregs[rs1i])
                                                  : static_cast<uint32_t>(rv32i::fcvt_w_s(fregs[rs1i]));
                            write_reg(rd, result);
                            break;
                        }

                        case rv32i::Funct7_FP::FCVT_S_W: {
                            uint32_t r2 = rv32i::rs2(instr); // reusado como selector W/WU
                            fregs[rd] = (r2 == rv32i::Rs2_FCVT::WU)
                                            ? static_cast<float>(regs[rs1i])
                                            : static_cast<float>(static_cast<int32_t>(regs[rs1i]));
                            break;
                        }

                        case rv32i::Funct7_FP::FMV_X_W_FCLASS_S:
                            if (f3 == rv32i::Funct3_FMV_FCLASS::FCLASS_S)
                                write_reg(rd, rv32i::fclass_s(fregs[rs1i]));
                            else
                                write_reg(rd, rv32i::float_to_bits(fregs[rs1i]));
                            break;

                        case rv32i::Funct7_FP::FMV_W_X:
                            fregs[rd] = rv32i::bits_to_float(regs[rs1i]);
                            break;
                    }
                    break;
                }

                default:
                    std::cerr << "[Processor] Opcode desconocido 0x" << std::hex << opcode
                              << " en PC=0x" << pc << std::dec << std::endl;
                    halted = true;
                    break;
            }

            pc = next_pc;
        }
        finished.notify();
    }

    void dump_regs() const {
        for (int i = 0; i < 32; ++i) {
            std::cout << "x" << i << "=0x" << std::hex << regs[i] << std::dec;
            std::cout << ((i == 31) ? "\n" : " ");
        }
    }

    void dump_fregs() const {
        for (int i = 0; i < 32; ++i) {
            std::cout << "f" << i << "=" << fregs[i]
                       << "(0x" << std::hex << rv32i::float_to_bits(fregs[i]) << std::dec << ")";
            std::cout << ((i == 31) ? "\n" : " ");
        }
    }
};

#endif // PROCESSOR_H
