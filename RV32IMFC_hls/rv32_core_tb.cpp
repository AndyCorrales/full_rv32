#include <cstdio>
#include <cstdint>
#include "rv32_core.h"
#include "rv32i_defs.h"

// Testbench de C-simulation (vitis_hls csim). Reconstruye, con los mismos
// encoders minimos que main.cpp, una porcion del programa de prueba ya
// verificado en la conversacion (bloque aritmetico + bloque M + un
// round-trip SW/LW real por el maestro AXI4), y compara el resultado de
// rv32_core_step() contra los valores ya confirmados contra Python.
namespace enc {
using namespace rv32i;
uint32_t r_type(uint32_t opcode, uint32_t rd, uint32_t f3, uint32_t rs1, uint32_t rs2, uint32_t f7) {
    return (f7 << 25) | (rs2 << 20) | (rs1 << 15) | (f3 << 12) | (rd << 7) | opcode;
}
uint32_t i_type(uint32_t opcode, uint32_t rd, uint32_t f3, uint32_t rs1, int32_t imm) {
    return ((static_cast<uint32_t>(imm) & 0xFFF) << 20) | (rs1 << 15) | (f3 << 12) | (rd << 7) | opcode;
}
uint32_t s_type(uint32_t opcode, uint32_t f3, uint32_t rs1, uint32_t rs2, int32_t imm) {
    uint32_t u = static_cast<uint32_t>(imm) & 0xFFF;
    return ((u >> 5) << 25) | (rs2 << 20) | (rs1 << 15) | (f3 << 12) | ((u & 0x1F) << 7) | opcode;
}
uint32_t ADDI(uint32_t rd, uint32_t rs1, int32_t imm) { return i_type(Opcode::OP_IMM, rd, Funct3_ALU::ADD_SUB, rs1, imm); }
uint32_t ADD(uint32_t rd, uint32_t rs1, uint32_t rs2) { return r_type(Opcode::OP, rd, Funct3_ALU::ADD_SUB, rs1, rs2, Funct7::NORMAL); }
uint32_t MUL(uint32_t rd, uint32_t rs1, uint32_t rs2) { return r_type(Opcode::OP, rd, Funct3_MULDIV::MUL, rs1, rs2, Funct7::MULDIV); }
uint32_t DIV(uint32_t rd, uint32_t rs1, uint32_t rs2) { return r_type(Opcode::OP, rd, Funct3_MULDIV::DIV, rs1, rs2, Funct7::MULDIV); }
uint32_t SW(uint32_t rs1, uint32_t rs2, int32_t imm)  { return s_type(Opcode::STORE, Funct3_STORE::SW, rs1, rs2, imm); }
uint32_t LW(uint32_t rd, uint32_t rs1, int32_t imm)   { return i_type(Opcode::LOAD, rd, Funct3_LOAD::LW, rs1, imm); }
uint32_t SB(uint32_t rs1, uint32_t rs2, int32_t imm)  { return s_type(Opcode::STORE, Funct3_STORE::SB, rs1, rs2, imm); }
uint32_t LBU(uint32_t rd, uint32_t rs1, int32_t imm)  { return i_type(Opcode::LOAD, rd, Funct3_LOAD::LBU, rs1, imm); }
} // namespace enc

static int failures = 0;

static void check(const char* name, uint32_t got, uint32_t expected) {
    if (got != expected) {
        std::printf("FALLO %s: got=0x%08x expected=0x%08x\n", name, got, expected);
        ++failures;
    } else {
        std::printf("OK    %s = 0x%08x\n", name, got);
    }
}

int main() {
    static ap_uint<32> mem[MEM_WORDS];
    for (int i = 0; i < MEM_WORDS; ++i) mem[i] = 0;

    ap_uint<32> regs[32];
    for (int i = 0; i < 32; ++i) regs[i] = 0;
    ap_uint<32> pc = 0;

    // x20 = base 0x100 (evita colisionar con las direcciones de prueba de abajo)
    uint32_t program[] = {
        enc::ADDI(1, 0, 10),      // x1 = 10
        enc::ADDI(2, 0, 20),      // x2 = 20
        enc::ADD(3, 1, 2),        // x3 = 30
        enc::ADDI(4, 0, -100),    // x4 = -100
        enc::ADDI(5, 0, 7),       // x5 = 7
        enc::MUL(6, 4, 5),        // x6 = MUL(-100,7) = -700
        enc::DIV(7, 4, 5),        // x7 = DIV(-100,7) = -14
        enc::ADDI(20, 0, 0x100),  // x20 = 0x100 (base de prueba de memoria)
        enc::SW(20, 1, 0),        // mem[0x100] = x1 (10), palabra alineada
        enc::LW(8, 20, 0),        // x8 = mem[0x100] = 10
        enc::SB(20, 3, 4),        // mem[0x104] byte bajo = x3 (30)
        enc::LBU(9, 20, 4),       // x9 = 30 (round-trip del store de byte)
    };

    for (unsigned i = 0; i < sizeof(program) / sizeof(program[0]); ++i) {
        ap_uint<32> next_pc;
        ap_uint<1> halted;
        ap_uint<32> regs_out[32];

        rv32_core_step(program[i], pc, regs, regs_out, mem, next_pc, halted);

        for (int r = 0; r < 32; ++r) regs[r] = regs_out[r];
        pc = next_pc;
    }

    check("x1", regs[1].to_uint(), 10);
    check("x2", regs[2].to_uint(), 20);
    check("x3", regs[3].to_uint(), 30);
    check("x4", regs[4].to_uint(), 0xFFFFFF9C); // -100
    check("x5", regs[5].to_uint(), 7);
    check("x6 (MUL)", regs[6].to_uint(), 0xFFFFFD44); // -700
    check("x7 (DIV)", regs[7].to_uint(), 0xFFFFFFF2); // -14
    check("x8 (LW round-trip)", regs[8].to_uint(), 10);
    check("x9 (SB/LBU round-trip)", regs[9].to_uint(), 30);

    if (failures == 0) {
        std::printf("\nTodos los checks pasaron.\n");
        return 0;
    }
    std::printf("\n%d check(s) fallaron.\n", failures);
    return 1;
}
