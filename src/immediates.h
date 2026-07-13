#ifndef IMMEDIATES_H
#define IMMEDIATES_H

#include <cstdint>

// Extraccion y extension de signo de los inmediatos de cada formato RV32I.
namespace rv32i {

// Extiende el signo de un valor de 'bits' bits contenido en un uint32_t.
inline int32_t sign_extend(uint32_t value, unsigned bits) {
    uint32_t shift = 32 - bits;
    return static_cast<int32_t>(value << shift) >> shift;
}

// I-type: usado por OP_IMM, LOAD, JALR. instr[31:20] con signo.
inline int32_t imm_i(uint32_t instr) {
    return sign_extend(instr >> 20, 12);
}

// S-type: usado por STORE. instr[31:25] | instr[11:7], con signo.
inline int32_t imm_s(uint32_t instr) {
    uint32_t imm = ((instr >> 25) << 5) | ((instr >> 7) & 0x1F);
    return sign_extend(imm, 12);
}

// B-type: usado por BRANCH. Bit 0 siempre implicito en 0.
inline int32_t imm_b(uint32_t instr) {
    uint32_t imm =
        (((instr >> 31) & 0x1) << 12) |
        (((instr >> 7)  & 0x1) << 11) |
        (((instr >> 25) & 0x3F) << 5) |
        (((instr >> 8)  & 0xF) << 1);
    return sign_extend(imm, 13);
}

// U-type: usado por LUI y AUIPC. instr[31:12] en los 20 bits altos.
inline int32_t imm_u(uint32_t instr) {
    return static_cast<int32_t>(instr & 0xFFFFF000);
}

// J-type: usado por JAL. Bit 0 siempre implicito en 0.
inline int32_t imm_j(uint32_t instr) {
    uint32_t imm =
        (((instr >> 31) & 0x1) << 20) |
        (((instr >> 12) & 0xFF) << 12) |
        (((instr >> 20) & 0x1) << 11) |
        (((instr >> 21) & 0x3FF) << 1);
    return sign_extend(imm, 21);
}

} // namespace rv32i

#endif // IMMEDIATES_H
