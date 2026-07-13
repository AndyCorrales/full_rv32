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

// CPU RV32I monociclo. INITIATOR puro hacia el Bus: toda direccion que
// maneja (fetch, load, store) es GLOBAL dentro del mapa de memoria.
SC_MODULE(Processor) {
    tlm_utils::simple_initiator_socket<Processor, 32> init_socket;

    std::array<uint32_t, 32> regs{};
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
                    switch (f3) {
                        case rv32i::Funct3::ADD_SUB:
                            result = (f7 == rv32i::Funct7::ALT) ? (r1 - r2) : (r1 + r2);
                            break;
                        case rv32i::Funct3::SLL:
                            result = static_cast<uint32_t>(r1) << (r2 & 0x1F);
                            break;
                        case rv32i::Funct3::SLT:
                            result = (r1 < r2) ? 1 : 0;
                            break;
                        case rv32i::Funct3::SLTU:
                            result = (regs[rs1i] < regs[rs2i]) ? 1 : 0;
                            break;
                        case rv32i::Funct3::XOR:
                            result = regs[rs1i] ^ regs[rs2i];
                            break;
                        case rv32i::Funct3::SRL_SRA:
                            result = (f7 == rv32i::Funct7::ALT)
                                         ? static_cast<uint32_t>(r1 >> (r2 & 0x1F))
                                         : (regs[rs1i] >> (regs[rs2i] & 0x1F));
                            break;
                        case rv32i::Funct3::OR:
                            result = regs[rs1i] | regs[rs2i];
                            break;
                        case rv32i::Funct3::AND:
                            result = regs[rs1i] & regs[rs2i];
                            break;
                    }
                    write_reg(rd, result);
                    break;
                }

                case rv32i::Opcode::OP_IMM: {
                    int32_t imm = rv32i::imm_i(instr);
                    uint32_t result = 0;
                    switch (f3) {
                        case rv32i::Funct3::ADD_SUB:
                            result = r1 + imm;
                            break;
                        case rv32i::Funct3::SLL:
                            result = static_cast<uint32_t>(r1) << (imm & 0x1F);
                            break;
                        case rv32i::Funct3::SLT:
                            result = (r1 < imm) ? 1 : 0;
                            break;
                        case rv32i::Funct3::SLTU:
                            result = (regs[rs1i] < static_cast<uint32_t>(imm)) ? 1 : 0;
                            break;
                        case rv32i::Funct3::XOR:
                            result = regs[rs1i] ^ static_cast<uint32_t>(imm);
                            break;
                        case rv32i::Funct3::SRL_SRA:
                            result = (rv32i::funct7(instr) == rv32i::Funct7::ALT)
                                         ? static_cast<uint32_t>(r1 >> (imm & 0x1F))
                                         : (regs[rs1i] >> (imm & 0x1F));
                            break;
                        case rv32i::Funct3::OR:
                            result = regs[rs1i] | static_cast<uint32_t>(imm);
                            break;
                        case rv32i::Funct3::AND:
                            result = regs[rs1i] & static_cast<uint32_t>(imm);
                            break;
                    }
                    write_reg(rd, result);
                    break;
                }

                case rv32i::Opcode::LOAD: {
                    int32_t imm = rv32i::imm_i(instr);
                    uint32_t addr = regs[rs1i] + imm;
                    uint32_t result = 0;
                    switch (f3) {
                        case rv32i::Funct3::LB:
                            result = static_cast<uint32_t>(static_cast<int32_t>(static_cast<int8_t>(load(addr, 1))));
                            break;
                        case rv32i::Funct3::LH:
                            result = static_cast<uint32_t>(static_cast<int32_t>(static_cast<int16_t>(load(addr, 2))));
                            break;
                        case rv32i::Funct3::LW:
                            result = load(addr, 4);
                            break;
                        case rv32i::Funct3::LBU:
                            result = load(addr, 1) & 0xFF;
                            break;
                        case rv32i::Funct3::LHU:
                            result = load(addr, 2) & 0xFFFF;
                            break;
                    }
                    write_reg(rd, result);
                    break;
                }

                case rv32i::Opcode::STORE: {
                    int32_t imm = rv32i::imm_s(instr);
                    uint32_t addr = regs[rs1i] + imm;
                    switch (f3) {
                        case rv32i::Funct3::SB: store(addr, regs[rs2i], 1); break;
                        case rv32i::Funct3::SH: store(addr, regs[rs2i], 2); break;
                        case rv32i::Funct3::SW: store(addr, regs[rs2i], 4); break;
                    }
                    break;
                }

                case rv32i::Opcode::BRANCH: {
                    int32_t imm = rv32i::imm_b(instr);
                    bool taken = false;
                    switch (f3) {
                        case rv32i::Funct3::BEQ:  taken = (r1 == r2); break;
                        case rv32i::Funct3::BNE:  taken = (r1 != r2); break;
                        case rv32i::Funct3::BLT:  taken = (r1 < r2); break;
                        case rv32i::Funct3::BGE:  taken = (r1 >= r2); break;
                        case rv32i::Funct3::BLTU: taken = (regs[rs1i] < regs[rs2i]); break;
                        case rv32i::Funct3::BGEU: taken = (regs[rs1i] >= regs[rs2i]); break;
                    }
                    if (taken) next_pc = pc + imm;
                    break;
                }

                case rv32i::Opcode::JAL: {
                    int32_t imm = rv32i::imm_j(instr);
                    write_reg(rd, pc + 4);
                    next_pc = pc + imm;
                    break;
                }

                case rv32i::Opcode::JALR: {
                    int32_t imm = rv32i::imm_i(instr);
                    uint32_t link = pc + 4;
                    next_pc = (regs[rs1i] + imm) & ~static_cast<uint32_t>(1);
                    write_reg(rd, link);
                    break;
                }

                case rv32i::Opcode::LUI:
                    write_reg(rd, static_cast<uint32_t>(rv32i::imm_u(instr)));
                    break;

                case rv32i::Opcode::AUIPC:
                    write_reg(rd, pc + static_cast<uint32_t>(rv32i::imm_u(instr)));
                    break;

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
};

#endif // PROCESSOR_H
