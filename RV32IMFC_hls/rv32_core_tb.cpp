#include <cstdio>
#include <cstdint>
#include <cstring>
#include <cmath>
#include "rv32_core.h"
#include "rv32i_defs.h"

// Testbench de C-simulation (vitis_hls csim). Reconstruye, con los mismos
// encoders minimos que main.cpp (version TLM), una porcion del programa
// de prueba ya verificado en la conversacion (bloque aritmetico + bloque
// M + round-trip SW/LW/SB/LBU por el maestro AXI4 + bloque F), y compara
// el resultado de rv32_core_step() contra los valores ya confirmados
// contra Python.
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
uint32_t r4_type(uint32_t opcode, uint32_t rd, uint32_t f3, uint32_t rs1, uint32_t rs2, uint32_t rs3) {
    constexpr uint32_t FMT_SINGLE = 0b00;
    return (rs3 << 27) | (FMT_SINGLE << 25) | (rs2 << 20) | (rs1 << 15) | (f3 << 12) | (rd << 7) | opcode;
}
constexpr uint32_t RM_RNE = 0b000;

uint32_t ADDI(uint32_t rd, uint32_t rs1, int32_t imm) { return i_type(Opcode::OP_IMM, rd, Funct3_ALU::ADD_SUB, rs1, imm); }
uint32_t ADD(uint32_t rd, uint32_t rs1, uint32_t rs2) { return r_type(Opcode::OP, rd, Funct3_ALU::ADD_SUB, rs1, rs2, Funct7::NORMAL); }
uint32_t MUL(uint32_t rd, uint32_t rs1, uint32_t rs2) { return r_type(Opcode::OP, rd, Funct3_MULDIV::MUL, rs1, rs2, Funct7::MULDIV); }
uint32_t DIV(uint32_t rd, uint32_t rs1, uint32_t rs2) { return r_type(Opcode::OP, rd, Funct3_MULDIV::DIV, rs1, rs2, Funct7::MULDIV); }
uint32_t SW(uint32_t rs1, uint32_t rs2, int32_t imm)  { return s_type(Opcode::STORE, Funct3_STORE::SW, rs1, rs2, imm); }
uint32_t LW(uint32_t rd, uint32_t rs1, int32_t imm)   { return i_type(Opcode::LOAD, rd, Funct3_LOAD::LW, rs1, imm); }
uint32_t SB(uint32_t rs1, uint32_t rs2, int32_t imm)  { return s_type(Opcode::STORE, Funct3_STORE::SB, rs1, rs2, imm); }
uint32_t LBU(uint32_t rd, uint32_t rs1, int32_t imm)  { return i_type(Opcode::LOAD, rd, Funct3_LOAD::LBU, rs1, imm); }

uint32_t FLW(uint32_t rd, uint32_t rs1, int32_t imm)  { return i_type(Opcode::LOAD_FP, rd, Funct3_FP_MEM::W, rs1, imm); }
uint32_t FSW(uint32_t rs1, uint32_t rs2, int32_t imm) { return s_type(Opcode::STORE_FP, Funct3_FP_MEM::W, rs1, rs2, imm); }
uint32_t FADD_S(uint32_t rd, uint32_t rs1, uint32_t rs2) { return r_type(Opcode::OP_FP, rd, RM_RNE, rs1, rs2, Funct7_FP::FADD_S); }
uint32_t FMUL_S(uint32_t rd, uint32_t rs1, uint32_t rs2) { return r_type(Opcode::OP_FP, rd, RM_RNE, rs1, rs2, Funct7_FP::FMUL_S); }
uint32_t FSQRT_S(uint32_t rd, uint32_t rs1) { return r_type(Opcode::OP_FP, rd, RM_RNE, rs1, 0, Funct7_FP::FSQRT_S); }
uint32_t FEQ_S(uint32_t rd, uint32_t rs1, uint32_t rs2) { return r_type(Opcode::OP_FP, rd, Funct3_FCMP::FEQ, rs1, rs2, Funct7_FP::FCMP_S); }
uint32_t FCVT_S_W(uint32_t rd, uint32_t rs1) { return r_type(Opcode::OP_FP, rd, RM_RNE, rs1, Rs2_FCVT::W, Funct7_FP::FCVT_S_W); }
uint32_t FMV_X_W(uint32_t rd, uint32_t rs1)  { return r_type(Opcode::OP_FP, rd, Funct3_FMV_FCLASS::FMV_X_W, rs1, 0, Funct7_FP::FMV_X_W_FCLASS_S); }
uint32_t FMADD_S(uint32_t rd, uint32_t rs1, uint32_t rs2, uint32_t rs3) { return r4_type(Opcode::FMADD, rd, RM_RNE, rs1, rs2, rs3); }
} // namespace enc

// Extension C (comprimidas), subset minimo para este testbench. Mismos
// desplazamientos que RV32IMFC_tlm/src/main.cpp::cenc -- ver ese archivo
// para el resto de la familia (aca solo hace falta C.LI/C.ADD, porque
// este testbench alimenta program[] en orden secuencial y no modela un
// fetch real gobernado por pc, asi que no tiene sentido ejercitar
// C.J/C.BEQZ/etc. aca: ver la limitacion de alineacion documentada en
// rv32_core.h).
namespace cenc {
uint32_t C_LI(uint32_t rd, int32_t imm) {
    uint32_t u = static_cast<uint32_t>(imm) & 0x3F;
    return (0b010 << 13) | (((u >> 5) & 0x1) << 12) | (rd << 7) | ((u & 0x1F) << 2) | 0b01;
}
uint32_t C_ADD(uint32_t rd, uint32_t rs2) { return (0b1001 << 12) | (rd << 7) | (rs2 << 2) | 0b10; }
} // namespace cenc

static int failures = 0;

static void check(const char* name, uint32_t got, uint32_t expected) {
    if (got != expected) {
        std::printf("FALLO %s: got=0x%08x expected=0x%08x\n", name, got, expected);
        ++failures;
    } else {
        std::printf("OK    %s = 0x%08x\n", name, got);
    }
}

static uint32_t f2bits(float f) {
    uint32_t u;
    std::memcpy(&u, &f, sizeof(u));
    return u;
}

int main() {
    static ap_uint<32> mem[MEM_WORDS];
    for (int i = 0; i < MEM_WORDS; ++i) mem[i] = 0;

    ap_uint<32> regs[32];
    for (int i = 0; i < 32; ++i) regs[i] = 0;
    float fregs[32];
    for (int i = 0; i < 32; ++i) fregs[i] = 0.0f;
    ap_uint<32> pc = 0;

    // x20 = base 0x100 (memoria entera), x21 = base 0x200 (memoria F)
    uint32_t program[] = {
        enc::ADDI(1, 0, 10),      // x1 = 10
        enc::ADDI(2, 0, 20),      // x2 = 20
        enc::ADD(3, 1, 2),        // x3 = 30
        enc::ADDI(4, 0, -100),    // x4 = -100
        enc::ADDI(5, 0, 7),       // x5 = 7
        enc::MUL(6, 4, 5),        // x6 = MUL(-100,7) = -700
        enc::DIV(7, 4, 5),        // x7 = DIV(-100,7) = -14
        enc::ADDI(20, 0, 0x100),  // x20 = 0x100 (base prueba memoria entera)
        enc::SW(20, 1, 0),        // mem[0x100] = x1 (10), palabra alineada
        enc::LW(8, 20, 0),        // x8 = mem[0x100] = 10
        enc::SB(20, 3, 4),        // mem[0x104] byte bajo = x3 (30)
        enc::LBU(9, 20, 4),       // x9 = 30 (round-trip del store de byte)

        // --- Bloque F ---
        enc::FCVT_S_W(1, 1),      // f1 = (float)x1 = 10.0
        enc::FCVT_S_W(2, 5),      // f2 = (float)x5 = 7.0
        enc::FADD_S(3, 1, 2),     // f3 = 17.0
        enc::FMUL_S(4, 1, 2),     // f4 = 70.0
        enc::FSQRT_S(5, 4),       // f5 = sqrt(70.0)
        enc::FMADD_S(6, 1, 2, 3), // f6 = f1*f2+f3 = 70+17 = 87.0
        enc::FEQ_S(10, 1, 1),     // x10 = 1 (f1==f1)
        enc::FMV_X_W(11, 1),      // x11 = bits crudos de f1 (10.0f)
        enc::ADDI(21, 0, 0x200),  // x21 = 0x200 (base prueba memoria F)
        enc::FSW(21, 1, 0),       // mem[0x200] = bits de f1
        enc::FLW(12, 21, 0),      // f12 = 10.0 (leido de vuelta)
        enc::FEQ_S(13, 1, 12),    // x13 = 1 (round-trip FSW/FLW)

        // --- Extension C (subset) ---
        cenc::C_LI(25, 7),        // x25 = 7 (comprimida, instr_size debe salir en 2)
        cenc::C_ADD(25, 1),       // x25 = x25 + x1 = 7 + 10 = 17 (x1 sigue en 10)
    };

    ap_uint<3> last_instr_size = 0;
    for (unsigned i = 0; i < sizeof(program) / sizeof(program[0]); ++i) {
        ap_uint<32> next_pc;
        ap_uint<1> halted;
        ap_uint<3> instr_size;
        ap_uint<32> regs_out[32];
        float fregs_out[32];

        rv32_core_step(program[i], pc, regs, regs_out, fregs, fregs_out, mem, next_pc, instr_size, halted);

        for (int r = 0; r < 32; ++r) regs[r] = regs_out[r];
        for (int r = 0; r < 32; ++r) fregs[r] = fregs_out[r];
        pc = next_pc;
        last_instr_size = instr_size;
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

    check("f1 (FCVT.S.W)", f2bits(fregs[1]), f2bits(10.0f));
    check("f2 (FCVT.S.W)", f2bits(fregs[2]), f2bits(7.0f));
    check("f3 (FADD.S)",   f2bits(fregs[3]), f2bits(17.0f));
    check("f4 (FMUL.S)",   f2bits(fregs[4]), f2bits(70.0f));
    check("f5 (FSQRT.S)",  f2bits(fregs[5]), f2bits(std::sqrt(70.0f)));
    check("f6 (FMADD.S)",  f2bits(fregs[6]), f2bits(87.0f));
    check("x10 (FEQ.S)",   regs[10].to_uint(), 1);
    check("x11 (FMV.X.W)", regs[11].to_uint(), f2bits(10.0f));
    check("f12 (FLW round-trip)", f2bits(fregs[12]), f2bits(10.0f));
    check("x13 (FEQ.S round-trip)", regs[13].to_uint(), 1);

    check("x25 (C.LI + C.ADD)", regs[25].to_uint(), 17);
    check("instr_size (ultima, comprimida)", last_instr_size.to_uint(), 2);

    if (failures == 0) {
        std::printf("\nTodos los checks pasaron.\n");
        return 0;
    }
    std::printf("\n%d check(s) fallaron.\n", failures);
    return 1;
}
