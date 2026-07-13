#ifndef RV32I_DEFS_H
#define RV32I_DEFS_H

#include <cstdint>

// Opcodes (bits [6:0]) y campos funct3/funct7 del ISA base RV32I.
namespace rv32i {

namespace Opcode {
constexpr uint32_t OP        = 0b0110011; // R-type: registro-registro
constexpr uint32_t OP_IMM    = 0b0010011; // I-type: aritmetica inmediata
constexpr uint32_t LOAD      = 0b0000011; // I-type: carga desde memoria
constexpr uint32_t STORE     = 0b0100011; // S-type: almacenamiento en memoria
constexpr uint32_t BRANCH    = 0b1100011; // B-type: saltos condicionales
constexpr uint32_t JAL       = 0b1101111; // J-type: salto incondicional con enlace
constexpr uint32_t JALR      = 0b1100111; // I-type: salto indirecto con enlace
constexpr uint32_t LUI       = 0b0110111; // U-type: carga inmediato en bits altos
constexpr uint32_t AUIPC     = 0b0010111; // U-type: PC + inmediato en bits altos
} // namespace Opcode

// funct3 para OP y OP_IMM (comparten codificacion base).
namespace Funct3 {
constexpr uint32_t ADD_SUB = 0b000;
constexpr uint32_t SLL     = 0b001;
constexpr uint32_t SLT     = 0b010;
constexpr uint32_t SLTU    = 0b011;
constexpr uint32_t XOR     = 0b100;
constexpr uint32_t SRL_SRA = 0b101;
constexpr uint32_t OR      = 0b110;
constexpr uint32_t AND     = 0b111;

// funct3 para LOAD
constexpr uint32_t LB  = 0b000;
constexpr uint32_t LH  = 0b001;
constexpr uint32_t LW  = 0b010;
constexpr uint32_t LBU = 0b100;
constexpr uint32_t LHU = 0b101;

// funct3 para STORE
constexpr uint32_t SB = 0b000;
constexpr uint32_t SH = 0b001;
constexpr uint32_t SW = 0b010;

// funct3 para BRANCH
constexpr uint32_t BEQ  = 0b000;
constexpr uint32_t BNE  = 0b001;
constexpr uint32_t BLT  = 0b100;
constexpr uint32_t BGE  = 0b101;
constexpr uint32_t BLTU = 0b110;
constexpr uint32_t BGEU = 0b111;
} // namespace Funct3

// funct7 para OP: distingue variantes ADD/SUB y SRL/SRA.
namespace Funct7 {
constexpr uint32_t NORMAL = 0b0000000;
constexpr uint32_t ALT    = 0b0100000; // SUB, SRA
} // namespace Funct7

// Extraccion de campos de una instruccion de 32 bits.
inline uint32_t opcode(uint32_t instr) { return instr & 0x7F; }
inline uint32_t rd(uint32_t instr)     { return (instr >> 7) & 0x1F; }
inline uint32_t funct3(uint32_t instr) { return (instr >> 12) & 0x7; }
inline uint32_t rs1(uint32_t instr)    { return (instr >> 15) & 0x1F; }
inline uint32_t rs2(uint32_t instr)    { return (instr >> 20) & 0x1F; }
inline uint32_t funct7(uint32_t instr) { return (instr >> 25) & 0x7F; }

} // namespace rv32i

#endif // RV32I_DEFS_H
