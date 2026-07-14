#include "rv32_core.h"
#include "immediates_hls.h"
#include "rv32i_defs.h"
#include "fp_ops.h"
#include "rv32c_defs.h"
#include <cmath>

// Funcion libre en vez de lambda con captura: mas conservador para
// sintesis HLS (evita depender del soporte de closures del front-end).
static inline void write_reg(ap_uint<32> regs_out[32], uint32_t idx, ap_uint<32> value) {
    if (idx != 0) regs_out[idx] = value;
}

// Lectura por el maestro AXI4 Full: memoria direccionada por PALABRA
// (mem[] es ap_uint<32>*), asi que toda direccion de byte se parte en
// word_addr (que palabra) + byte_off (que byte dentro de esa palabra).
// Limitacion conocida (ver README.md (esta misma carpeta)): un acceso que cruce el
// limite de una palabra (p.ej. LW en addr=3) no se resuelve correctamente
// con esta lectura de una sola palabra -- queda como trabajo futuro de
// esta pista, el modelo TLM en RV32IMFC_tlm/src/ si soporta cualquier desalineado
// porque ahi la memoria es un arreglo de bytes, no de palabras AXI.
static ap_uint<32> mem_load(ap_uint<32>* mem, ap_uint<32> addr, uint32_t f3) {
    ap_uint<32> word_addr = addr >> 2;
    ap_uint<5> shift = ap_uint<5>(addr.range(1, 0)) * 8; // 0, 8, 16 o 24
    ap_uint<32> word = mem[word_addr];
    ap_uint<32> shifted = word >> shift;

    switch (f3) {
        case rv32i::Funct3_LOAD::LB: {
            int8_t b = static_cast<int8_t>(ap_uint<8>(shifted.range(7, 0)).to_uint());
            return static_cast<uint32_t>(static_cast<int32_t>(b));
        }
        case rv32i::Funct3_LOAD::LH: {
            int16_t h = static_cast<int16_t>(ap_uint<16>(shifted.range(15, 0)).to_uint());
            return static_cast<uint32_t>(static_cast<int32_t>(h));
        }
        case rv32i::Funct3_LOAD::LW:
            return word;
        case rv32i::Funct3_LOAD::LBU:
            return ap_uint<8>(shifted.range(7, 0)).to_uint();
        case rv32i::Funct3_LOAD::LHU:
            return ap_uint<16>(shifted.range(15, 0)).to_uint();
        default:
            return 0;
    }
}

// Escritura por el maestro AXI4 Full: para SB/SH hace read-modify-write
// de la palabra completa (no hay senal de WSTRB a este nivel de
// abstraccion en HLS con un puntero simple) -- costo extra de una
// lectura, aceptable para un prototipo, documentado en el README.
static void mem_store(ap_uint<32>* mem, ap_uint<32> addr, ap_uint<32> wdata, uint32_t f3) {
    ap_uint<32> word_addr = addr >> 2;
    ap_uint<5> shift = ap_uint<5>(addr.range(1, 0)) * 8;

    switch (f3) {
        case rv32i::Funct3_STORE::SW:
            mem[word_addr] = wdata;
            break;
        case rv32i::Funct3_STORE::SH: {
            ap_uint<32> word = mem[word_addr];
            ap_uint<32> mask = ap_uint<32>(0xFFFF) << shift;
            word = (word & ~mask) | ((wdata & ap_uint<32>(0xFFFF)) << shift);
            mem[word_addr] = word;
            break;
        }
        case rv32i::Funct3_STORE::SB: {
            ap_uint<32> word = mem[word_addr];
            ap_uint<32> mask = ap_uint<32>(0xFF) << shift;
            word = (word & ~mask) | ((wdata & ap_uint<32>(0xFF)) << shift);
            mem[word_addr] = word;
            break;
        }
    }
}

// Nota de alcance (ver README.md (esta misma carpeta)): esta funcion modela UN ciclo
// del datapath combinacional de la CPU monociclo -- toma el banco de
// registros de ENTRADA (regs_in), calcula el banco de SALIDA (regs_out),
// y hace su propio acceso a memoria de datos via el maestro AXI4 Full
// `mem` dentro del mismo llamado (en RTL real esto implica que la
// latencia de la transaccion AXI se suma al periodo de reloj de esta
// funcion -- HLS lo resuelve generando los estados de handshake AXI
// necesarios "por dentro" de la implementacion, no es una funcion de
// un solo ciclo de reloj en la practica una vez sintetizada).
void rv32_core_step(
    ap_uint<32> instr,
    ap_uint<32> pc,
    ap_uint<32> regs_in[32],
    ap_uint<32> regs_out[32],
    float fregs_in[32],
    float fregs_out[32],
    ap_uint<32>* mem,
    ap_uint<32>& next_pc,
    ap_uint<3>&  instr_size,
    ap_uint<1>&  halted
) {
#pragma HLS INTERFACE ap_none port=instr
#pragma HLS INTERFACE ap_none port=pc
#pragma HLS INTERFACE bram port=regs_in
#pragma HLS INTERFACE bram port=regs_out
#pragma HLS INTERFACE bram port=fregs_in
#pragma HLS INTERFACE bram port=fregs_out
#pragma HLS INTERFACE m_axi port=mem offset=slave bundle=gmem depth=MEM_WORDS
#pragma HLS INTERFACE ap_none port=next_pc
#pragma HLS INTERFACE ap_none port=instr_size
#pragma HLS INTERFACE ap_none port=halted
#pragma HLS INTERFACE s_axilite port=return bundle=control

    copy_regs:
    for (int i = 0; i < 32; ++i) {
#pragma HLS UNROLL
        regs_out[i] = regs_in[i];
    }
    copy_fregs:
    for (int i = 0; i < 32; ++i) {
#pragma HLS UNROLL
        fregs_out[i] = fregs_in[i];
    }

    halted = 0;

    // Extension C, con la simplificacion de alineacion documentada en
    // rv32_core.h: `instr` siempre llega como palabra de 32 bits
    // alineada; si la mitad baja indica comprimida (bits[1:0]!=3), se
    // expande esa mitad baja y se ignoran los 16 bits altos.
    if (instr.range(15, 0) == 0) {
        halted = 1;
        next_pc = pc;
        instr_size = 4;
        return;
    }

    ap_uint<32> work_instr;
    if (instr.range(1, 0) != 3) {
        work_instr = rv32c::expand(instr.range(15, 0).to_uint());
        instr_size = 2;
    } else {
        work_instr = instr;
        instr_size = 4;
    }
    instr = work_instr;

    uint32_t opcode = rv32i::opcode(instr.to_uint());
    uint32_t rd     = rv32i::rd(instr.to_uint());
    uint32_t f3     = rv32i::funct3(instr.to_uint());
    uint32_t rs1i   = rv32i::rs1(instr.to_uint());
    uint32_t rs2i   = rv32i::rs2(instr.to_uint());
    uint32_t f7     = rv32i::funct7(instr.to_uint());

    ap_uint<32> next_pc_local = pc + instr_size;

    int32_t r1 = static_cast<int32_t>(regs_in[rs1i].to_uint());
    int32_t r2 = static_cast<int32_t>(regs_in[rs2i].to_uint());

    switch (opcode) {
        case rv32i::Opcode::OP: {
            ap_uint<32> result = 0;

            if (f7 == rv32i::Funct7::MULDIV) {
                int64_t  r1_64 = static_cast<int64_t>(r1);
                int64_t  r2_64 = static_cast<int64_t>(r2);
                uint64_t u1_64 = static_cast<uint64_t>(regs_in[rs1i].to_uint());
                uint64_t u2_64 = static_cast<uint64_t>(regs_in[rs2i].to_uint());

                switch (f3) {
                    case rv32i::Funct3_MULDIV::MUL:
                        result = static_cast<uint32_t>(regs_in[rs1i].to_uint() * regs_in[rs2i].to_uint());
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
                            result = 0xFFFFFFFF;
                        } else if (regs_in[rs1i].to_uint() == 0x80000000u && r2 == -1) {
                            result = 0x80000000;
                        } else {
                            result = static_cast<uint32_t>(r1 / r2);
                        }
                        break;
                    case rv32i::Funct3_MULDIV::DIVU:
                        result = (regs_in[rs2i].to_uint() == 0) ? 0xFFFFFFFF
                                                                 : (regs_in[rs1i].to_uint() / regs_in[rs2i].to_uint());
                        break;
                    case rv32i::Funct3_MULDIV::REM:
                        if (r2 == 0) {
                            result = regs_in[rs1i];
                        } else if (regs_in[rs1i].to_uint() == 0x80000000u && r2 == -1) {
                            result = 0;
                        } else {
                            result = static_cast<uint32_t>(r1 % r2);
                        }
                        break;
                    case rv32i::Funct3_MULDIV::REMU:
                        result = (regs_in[rs2i].to_uint() == 0) ? regs_in[rs1i]
                                                                 : ap_uint<32>(regs_in[rs1i].to_uint() % regs_in[rs2i].to_uint());
                        break;
                }
            } else {
                switch (f3) {
                    case rv32i::Funct3_ALU::ADD_SUB:
                        result = (f7 == rv32i::Funct7::ALT) ? static_cast<uint32_t>(r1 - r2)
                                                             : static_cast<uint32_t>(r1 + r2);
                        break;
                    case rv32i::Funct3_ALU::SLL:
                        result = static_cast<uint32_t>(r1) << (r2 & 0x1F);
                        break;
                    case rv32i::Funct3_ALU::SLT:
                        result = (r1 < r2) ? 1 : 0;
                        break;
                    case rv32i::Funct3_ALU::SLTU:
                        result = (regs_in[rs1i].to_uint() < regs_in[rs2i].to_uint()) ? 1 : 0;
                        break;
                    case rv32i::Funct3_ALU::XOR:
                        result = regs_in[rs1i].to_uint() ^ regs_in[rs2i].to_uint();
                        break;
                    case rv32i::Funct3_ALU::SRL_SRA:
                        result = (f7 == rv32i::Funct7::ALT)
                                     ? static_cast<uint32_t>(r1 >> (r2 & 0x1F))
                                     : (regs_in[rs1i].to_uint() >> (regs_in[rs2i].to_uint() & 0x1F));
                        break;
                    case rv32i::Funct3_ALU::OR:
                        result = regs_in[rs1i].to_uint() | regs_in[rs2i].to_uint();
                        break;
                    case rv32i::Funct3_ALU::AND:
                        result = regs_in[rs1i].to_uint() & regs_in[rs2i].to_uint();
                        break;
                }
            }
            write_reg(regs_out, rd, result);
            break;
        }

        case rv32i::Opcode::OP_IMM: {
            int32_t imm = rv32_hls::get_imm_I(instr);
            uint32_t shamt = rv32_hls::get_shamt(instr);
            ap_uint<32> result = 0;
            switch (f3) {
                case rv32i::Funct3_ALU::ADD_SUB: result = static_cast<uint32_t>(r1 + imm); break;
                case rv32i::Funct3_ALU::SLL:     result = static_cast<uint32_t>(r1) << shamt; break;
                case rv32i::Funct3_ALU::SLT:     result = (r1 < imm) ? 1 : 0; break;
                case rv32i::Funct3_ALU::SLTU:    result = (regs_in[rs1i].to_uint() < static_cast<uint32_t>(imm)) ? 1 : 0; break;
                case rv32i::Funct3_ALU::XOR:     result = regs_in[rs1i].to_uint() ^ static_cast<uint32_t>(imm); break;
                case rv32i::Funct3_ALU::SRL_SRA:
                    result = (rv32i::funct7(instr.to_uint()) == rv32i::Funct7::ALT)
                                 ? static_cast<uint32_t>(r1 >> shamt)
                                 : (regs_in[rs1i].to_uint() >> shamt);
                    break;
                case rv32i::Funct3_ALU::OR:  result = regs_in[rs1i].to_uint() | static_cast<uint32_t>(imm); break;
                case rv32i::Funct3_ALU::AND: result = regs_in[rs1i].to_uint() & static_cast<uint32_t>(imm); break;
            }
            write_reg(regs_out, rd, result);
            break;
        }

        case rv32i::Opcode::LOAD: {
            int32_t imm = rv32_hls::get_imm_I(instr);
            ap_uint<32> addr = regs_in[rs1i].to_uint() + imm;
            write_reg(regs_out, rd, mem_load(mem, addr, f3));
            break;
        }

        case rv32i::Opcode::STORE: {
            int32_t imm = rv32_hls::get_imm_S(instr);
            ap_uint<32> addr = regs_in[rs1i].to_uint() + imm;
            mem_store(mem, addr, regs_in[rs2i], f3);
            break;
        }

        case rv32i::Opcode::BRANCH: {
            int32_t imm = rv32_hls::get_imm_B(instr);
            bool taken = false;
            switch (f3) {
                case rv32i::Funct3_BRANCH::BEQ:  taken = (r1 == r2); break;
                case rv32i::Funct3_BRANCH::BNE:  taken = (r1 != r2); break;
                case rv32i::Funct3_BRANCH::BLT:  taken = (r1 < r2); break;
                case rv32i::Funct3_BRANCH::BGE:  taken = (r1 >= r2); break;
                case rv32i::Funct3_BRANCH::BLTU: taken = (regs_in[rs1i].to_uint() < regs_in[rs2i].to_uint()); break;
                case rv32i::Funct3_BRANCH::BGEU: taken = (regs_in[rs1i].to_uint() >= regs_in[rs2i].to_uint()); break;
            }
            if (taken) next_pc_local = pc + imm;
            break;
        }

        case rv32i::Opcode::JAL: {
            int32_t imm = rv32_hls::get_imm_J(instr);
            write_reg(regs_out, rd, static_cast<uint32_t>(pc + instr_size));
            next_pc_local = pc + imm;
            break;
        }

        case rv32i::Opcode::JALR: {
            int32_t imm = rv32_hls::get_imm_I(instr);
            ap_uint<32> link = pc + instr_size;
            next_pc_local = (regs_in[rs1i].to_uint() + imm) & ~0x1u;
            write_reg(regs_out, rd, link);
            break;
        }

        case rv32i::Opcode::LUI:
            write_reg(regs_out, rd, static_cast<uint32_t>(rv32_hls::get_imm_U(instr)));
            break;

        case rv32i::Opcode::AUIPC:
            write_reg(regs_out, rd, static_cast<uint32_t>(pc.to_uint() + static_cast<uint32_t>(rv32_hls::get_imm_U(instr))));
            break;

        // --- Extension F ---------------------------------------------
        // FLW/FSW reusan mem_load/mem_store con el f3 de LW/SW (mismo
        // patron de bits, misma anchura de palabra) y convierten los
        // bits crudos a/desde float con fp_ops.h (ver explain.md seccion
        // 3 para por que hace falta esa reinterpretacion en vez de un
        // cast numerico).
        case rv32i::Opcode::LOAD_FP: {
            int32_t imm = rv32_hls::get_imm_I(instr);
            ap_uint<32> addr = regs_in[rs1i].to_uint() + imm;
            ap_uint<32> bits = mem_load(mem, addr, rv32i::Funct3_LOAD::LW);
            fregs_out[rd] = rv32i::bits_to_float(bits.to_uint());
            break;
        }

        case rv32i::Opcode::STORE_FP: {
            int32_t imm = rv32_hls::get_imm_S(instr);
            ap_uint<32> addr = regs_in[rs1i].to_uint() + imm;
            mem_store(mem, addr, rv32i::float_to_bits(fregs_in[rs2i]), rv32i::Funct3_STORE::SW);
            break;
        }

        // FMADD/FMSUB/FNMSUB/FNMADD: R4-type, tercer operando fuente rs3.
        case rv32i::Opcode::FMADD: {
            uint32_t r3 = rv32i::rs3(instr.to_uint());
            fregs_out[rd] = std::fma(fregs_in[rs1i], fregs_in[rs2i], fregs_in[r3]);
            break;
        }
        case rv32i::Opcode::FMSUB: {
            uint32_t r3 = rv32i::rs3(instr.to_uint());
            fregs_out[rd] = std::fma(fregs_in[rs1i], fregs_in[rs2i], -fregs_in[r3]);
            break;
        }
        case rv32i::Opcode::FNMSUB: {
            uint32_t r3 = rv32i::rs3(instr.to_uint());
            fregs_out[rd] = std::fma(-fregs_in[rs1i], fregs_in[rs2i], fregs_in[r3]);
            break;
        }
        case rv32i::Opcode::FNMADD: {
            uint32_t r3 = rv32i::rs3(instr.to_uint());
            fregs_out[rd] = std::fma(-fregs_in[rs1i], fregs_in[rs2i], -fregs_in[r3]);
            break;
        }

        case rv32i::Opcode::OP_FP: {
            switch (f7) {
                case rv32i::Funct7_FP::FADD_S: fregs_out[rd] = fregs_in[rs1i] + fregs_in[rs2i]; break;
                case rv32i::Funct7_FP::FSUB_S: fregs_out[rd] = fregs_in[rs1i] - fregs_in[rs2i]; break;
                case rv32i::Funct7_FP::FMUL_S: fregs_out[rd] = fregs_in[rs1i] * fregs_in[rs2i]; break;
                case rv32i::Funct7_FP::FDIV_S: fregs_out[rd] = fregs_in[rs1i] / fregs_in[rs2i]; break;
                case rv32i::Funct7_FP::FSQRT_S: fregs_out[rd] = std::sqrt(fregs_in[rs1i]); break;

                case rv32i::Funct7_FP::FSGNJ_S: {
                    uint32_t a = rv32i::float_to_bits(fregs_in[rs1i]);
                    uint32_t b = rv32i::float_to_bits(fregs_in[rs2i]);
                    uint32_t sign = 0;
                    switch (f3) {
                        case rv32i::Funct3_FSGNJ::FSGNJ:  sign = b & 0x80000000u; break;
                        case rv32i::Funct3_FSGNJ::FSGNJN: sign = (~b) & 0x80000000u; break;
                        case rv32i::Funct3_FSGNJ::FSGNJX: sign = (a ^ b) & 0x80000000u; break;
                    }
                    fregs_out[rd] = rv32i::bits_to_float((a & 0x7FFFFFFFu) | sign);
                    break;
                }

                case rv32i::Funct7_FP::FMINMAX_S:
                    if (f3 == rv32i::Funct3_FMINMAX::FMIN)
                        fregs_out[rd] = std::fmin(fregs_in[rs1i], fregs_in[rs2i]);
                    else
                        fregs_out[rd] = std::fmax(fregs_in[rs1i], fregs_in[rs2i]);
                    break;

                case rv32i::Funct7_FP::FCMP_S: {
                    uint32_t result = 0;
                    switch (f3) {
                        case rv32i::Funct3_FCMP::FLE: result = (fregs_in[rs1i] <= fregs_in[rs2i]) ? 1 : 0; break;
                        case rv32i::Funct3_FCMP::FLT: result = (fregs_in[rs1i] <  fregs_in[rs2i]) ? 1 : 0; break;
                        case rv32i::Funct3_FCMP::FEQ: result = (fregs_in[rs1i] == fregs_in[rs2i]) ? 1 : 0; break;
                    }
                    write_reg(regs_out, rd, result);
                    break;
                }

                case rv32i::Funct7_FP::FCVT_W_S: {
                    uint32_t r2 = rv32i::rs2(instr.to_uint());
                    uint32_t result = (r2 == rv32i::Rs2_FCVT::WU)
                                          ? rv32i::fcvt_wu_s(fregs_in[rs1i])
                                          : static_cast<uint32_t>(rv32i::fcvt_w_s(fregs_in[rs1i]));
                    write_reg(regs_out, rd, result);
                    break;
                }

                case rv32i::Funct7_FP::FCVT_S_W: {
                    uint32_t r2 = rv32i::rs2(instr.to_uint());
                    fregs_out[rd] = (r2 == rv32i::Rs2_FCVT::WU)
                                        ? static_cast<float>(regs_in[rs1i].to_uint())
                                        : static_cast<float>(static_cast<int32_t>(regs_in[rs1i].to_uint()));
                    break;
                }

                case rv32i::Funct7_FP::FMV_X_W_FCLASS_S:
                    if (f3 == rv32i::Funct3_FMV_FCLASS::FCLASS_S)
                        write_reg(regs_out, rd, rv32i::fclass_s(fregs_in[rs1i]));
                    else
                        write_reg(regs_out, rd, rv32i::float_to_bits(fregs_in[rs1i]));
                    break;

                case rv32i::Funct7_FP::FMV_W_X:
                    fregs_out[rd] = rv32i::bits_to_float(regs_in[rs1i].to_uint());
                    break;
            }
            break;
        }

        default:
            halted = 1;
            break;
    }

    next_pc = next_pc_local;
}
