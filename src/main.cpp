#include <systemc.h>
#include <tlm.h>
#include <cstring>
#include <iomanip>
#include <iostream>
#include <vector>

#include "rv32i_defs.h"
#include "memory_map.h"
#include "memory.h"
#include "bus.h"
#include "processor.h"
#include "vector_unit.h"

// ---------------------------------------------------------------------
// Codificadores de instruccion RV32I minimos, solo para construir el
// programa de prueba de este main.cpp (no forman parte del modelo).
// ---------------------------------------------------------------------
namespace asmenc {
using namespace rv32i;

uint32_t r_type(uint32_t opcode, uint32_t rd, uint32_t f3, uint32_t rs1, uint32_t rs2, uint32_t f7) {
    return (f7 << 25) | (rs2 << 20) | (rs1 << 15) | (f3 << 12) | (rd << 7) | opcode;
}
uint32_t i_type(uint32_t opcode, uint32_t rd, uint32_t f3, uint32_t rs1, int32_t imm) {
    return ((static_cast<uint32_t>(imm) & 0xFFF) << 20) | (rs1 << 15) | (f3 << 12) | (rd << 7) | opcode;
}
uint32_t s_type(uint32_t f3, uint32_t rs1, uint32_t rs2, int32_t imm) {
    uint32_t u = static_cast<uint32_t>(imm) & 0xFFF;
    return ((u >> 5) << 25) | (rs2 << 20) | (rs1 << 15) | (f3 << 12) | ((u & 0x1F) << 7) | Opcode::STORE;
}
uint32_t b_type(uint32_t f3, uint32_t rs1, uint32_t rs2, int32_t imm) {
    uint32_t u = static_cast<uint32_t>(imm) & 0x1FFF;
    return (((u >> 12) & 0x1) << 31) | (((u >> 5) & 0x3F) << 25) | (rs2 << 20) | (rs1 << 15) |
           (f3 << 12) | (((u >> 1) & 0xF) << 8) | (((u >> 11) & 0x1) << 7) | Opcode::BRANCH;
}
uint32_t u_type(uint32_t opcode, uint32_t rd, uint32_t imm_upper20) {
    return ((imm_upper20 << 12) & 0xFFFFF000) | (rd << 7) | opcode;
}
uint32_t j_type(uint32_t rd, int32_t imm) {
    uint32_t u = static_cast<uint32_t>(imm) & 0x1FFFFF;
    return (((u >> 20) & 0x1) << 31) | (((u >> 1) & 0x3FF) << 21) | (((u >> 11) & 0x1) << 20) |
           (((u >> 12) & 0xFF) << 12) | (rd << 7) | Opcode::JAL;
}

// Pseudo-instrucciones de conveniencia.
uint32_t ADDI(uint32_t rd, uint32_t rs1, int32_t imm) { return i_type(Opcode::OP_IMM, rd, Funct3::ADD_SUB, rs1, imm); }
uint32_t ADD(uint32_t rd, uint32_t rs1, uint32_t rs2)  { return r_type(Opcode::OP, rd, Funct3::ADD_SUB, rs1, rs2, Funct7::NORMAL); }
uint32_t SUB(uint32_t rd, uint32_t rs1, uint32_t rs2)  { return r_type(Opcode::OP, rd, Funct3::ADD_SUB, rs1, rs2, Funct7::ALT); }
uint32_t AND(uint32_t rd, uint32_t rs1, uint32_t rs2)  { return r_type(Opcode::OP, rd, Funct3::AND, rs1, rs2, Funct7::NORMAL); }
uint32_t OR(uint32_t rd, uint32_t rs1, uint32_t rs2)   { return r_type(Opcode::OP, rd, Funct3::OR, rs1, rs2, Funct7::NORMAL); }
uint32_t XOR(uint32_t rd, uint32_t rs1, uint32_t rs2)  { return r_type(Opcode::OP, rd, Funct3::XOR, rs1, rs2, Funct7::NORMAL); }
uint32_t SLT(uint32_t rd, uint32_t rs1, uint32_t rs2)  { return r_type(Opcode::OP, rd, Funct3::SLT, rs1, rs2, Funct7::NORMAL); }
uint32_t SLTU(uint32_t rd, uint32_t rs1, uint32_t rs2) { return r_type(Opcode::OP, rd, Funct3::SLTU, rs1, rs2, Funct7::NORMAL); }
uint32_t SLL(uint32_t rd, uint32_t rs1, uint32_t rs2)  { return r_type(Opcode::OP, rd, Funct3::SLL, rs1, rs2, Funct7::NORMAL); }
uint32_t SRL(uint32_t rd, uint32_t rs1, uint32_t rs2)  { return r_type(Opcode::OP, rd, Funct3::SRL_SRA, rs1, rs2, Funct7::NORMAL); }
uint32_t SRA(uint32_t rd, uint32_t rs1, uint32_t rs2)  { return r_type(Opcode::OP, rd, Funct3::SRL_SRA, rs1, rs2, Funct7::ALT); }
uint32_t LUI(uint32_t rd, uint32_t imm_upper20)        { return u_type(Opcode::LUI, rd, imm_upper20); }
uint32_t AUIPC(uint32_t rd, uint32_t imm_upper20)      { return u_type(Opcode::AUIPC, rd, imm_upper20); }
uint32_t LW(uint32_t rd, uint32_t rs1, int32_t imm)    { return i_type(Opcode::LOAD, rd, Funct3::LW, rs1, imm); }
uint32_t LBU(uint32_t rd, uint32_t rs1, int32_t imm)   { return i_type(Opcode::LOAD, rd, Funct3::LBU, rs1, imm); }
uint32_t LHU(uint32_t rd, uint32_t rs1, int32_t imm)   { return i_type(Opcode::LOAD, rd, Funct3::LHU, rs1, imm); }
uint32_t SW(uint32_t rs1, uint32_t rs2, int32_t imm)   { return s_type(Funct3::SW, rs1, rs2, imm); }
uint32_t SB(uint32_t rs1, uint32_t rs2, int32_t imm)   { return s_type(Funct3::SB, rs1, rs2, imm); }
uint32_t SH(uint32_t rs1, uint32_t rs2, int32_t imm)   { return s_type(Funct3::SH, rs1, rs2, imm); }
uint32_t BEQ(uint32_t rs1, uint32_t rs2, int32_t imm)  { return b_type(Funct3::BEQ, rs1, rs2, imm); }
uint32_t BNE(uint32_t rs1, uint32_t rs2, int32_t imm)  { return b_type(Funct3::BNE, rs1, rs2, imm); }
uint32_t BLT(uint32_t rs1, uint32_t rs2, int32_t imm)  { return b_type(Funct3::BLT, rs1, rs2, imm); }
uint32_t BGE(uint32_t rs1, uint32_t rs2, int32_t imm)  { return b_type(Funct3::BGE, rs1, rs2, imm); }
uint32_t JAL(uint32_t rd, int32_t imm)                 { return j_type(rd, imm); }
uint32_t JALR(uint32_t rd, uint32_t rs1, int32_t imm)  { return i_type(Opcode::JALR, rd, Funct3::ADD_SUB, rs1, imm); }

} // namespace asmenc

// Direccion GLOBAL donde la CPU escribe el bloque de 16 bytes (128 bits)
// que luego lee la VectorUnit para el test end-to-end.
constexpr uint32_t VECTOR_TEST_ADDR = 0x2000;

// Ensambla el programa de prueba RV32I: ejercita R-type, I-type, LOAD,
// STORE, BRANCH, JAL, JALR, LUI y AUIPC, y ademas deja escrito en RAM el
// bloque de datos que usara la VectorUnit.
std::vector<uint32_t> build_test_program() {
    using namespace asmenc;
    std::vector<uint32_t> p;
    auto push = [&](uint32_t w) { p.push_back(w); };

    // --- Bloque 1: inmediatos y aritmetica registro-registro ---
    push(ADDI(1, 0, 10));      // x1 = 10
    push(ADDI(2, 0, 20));      // x2 = 20
    push(ADDI(3, 0, -5));      // x3 = -5
    push(ADDI(4, 0, 100));     // x4 = 100
    push(ADD(5, 1, 2));        // x5 = 30
    push(SUB(6, 2, 1));        // x6 = 10
    push(AND(7, 1, 2));        // x7 = 0
    push(OR(8, 1, 2));         // x8 = 30
    push(XOR(9, 1, 2));        // x9 = 30
    push(SLT(10, 1, 2));       // x10 = 1
    push(SLTU(11, 2, 1));      // x11 = 0
    push(ADDI(13, 0, 2));      // x13 = 2 (cantidad de shift)
    push(SLL(12, 1, 13));      // x12 = 40
    push(SRL(14, 2, 13));      // x14 = 5
    push(ADDI(15, 0, -16));    // x15 = -16
    push(SRA(16, 15, 13));     // x16 = -4

    // --- Bloque 2: LUI / AUIPC ---
    push(LUI(17, 0x12345));    // x17 = 0x12345000
    push(AUIPC(18, 0));        // x18 = pc actual

    // --- Bloque 3: STORE / LOAD sobre RAM (base en x19) ---
    push(LUI(19, 1));          // x19 = 0x1000
    push(SW(19, 1, 0));        // mem[0x1000] = x1 (10)
    push(SW(19, 2, 4));        // mem[0x1004] = x2 (20)
    push(LW(21, 19, 0));       // x21 = 10
    push(LW(22, 19, 4));       // x22 = 20
    push(SB(19, 1, 8));        // mem[0x1008] = byte bajo de x1
    push(LBU(23, 19, 8));      // x23 = 10
    push(SH(19, 2, 10));       // mem[0x100A..0x100B] = half bajo de x2
    push(LHU(24, 19, 10));     // x24 = 20

    // --- Bloque 4: branches (todas las condiciones) ---
    push(BEQ(1, 1, 8));        // taken -> salta la siguiente
    push(ADDI(25, 0, 999));    // (saltada)
    push(ADDI(25, 0, 111));    // x25 = 111
    push(BNE(1, 2, 8));        // taken -> salta la siguiente
    push(ADDI(26, 0, 999));    // (saltada)
    push(ADDI(26, 0, 222));    // x26 = 222
    push(BLT(2, 1, 8));        // no taken (20<10 falso)
    push(ADDI(27, 0, 55));     // x27 = 55 (se ejecuta)
    push(BGE(2, 1, 8));        // taken (20>=10)
    push(ADDI(28, 0, 999));    // (saltada)
    push(ADDI(28, 0, 88));     // x28 = 88

    // --- Bloque 5: JAL / JALR (llamada y retorno a "funcion") ---
    size_t idx_jal   = p.size(); push(0); // placeholder: JAL x1, <func>
    push(ADDI(31, 0, 7));                 // se ejecuta al volver (link = pc de aqui)
    size_t idx_skip  = p.size(); push(0); // placeholder: JAL x0, <end_func>
    size_t idx_func      = p.size(); push(ADDI(30, 0, 66)); // cuerpo de la "funcion"
    push(JALR(0, 1, 0));                                     // retorna a x1
    size_t idx_end_func   = p.size();

    p[idx_jal]  = JAL(1, static_cast<int32_t>((idx_func - idx_jal) * 4));
    p[idx_skip] = JAL(0, static_cast<int32_t>((idx_end_func - idx_skip) * 4));

    // --- Bloque 6: bloque de 128 bits para el test de VectorUnit ---
    push(LUI(9, VECTOR_TEST_ADDR >> 12)); // x9 = 0x2000 (base test vectorial)
    push(LUI(11, 0xAAAA0));               // x11 = 0xAAAA0000
    push(ADDI(12, 11, 1)); push(SW(9, 12, 0));  // mem[0x2000] = 0xAAAA0001
    push(ADDI(12, 11, 2)); push(SW(9, 12, 4));  // mem[0x2004] = 0xAAAA0002
    push(ADDI(12, 11, 3)); push(SW(9, 12, 8));  // mem[0x2008] = 0xAAAA0003
    push(ADDI(12, 11, 4)); push(SW(9, 12, 12)); // mem[0x200C] = 0xAAAA0004

    // --- Fin de programa: palabra nula detiene la CPU (ver processor.h) ---
    push(0x00000000);

    return p;
}

// Testbench auxiliar: coordina el test de la VectorUnit una vez que la CPU
// termina de ejecutar (espera Processor::finished), dispara el load vectorial
// y compara el resultado contra lo que escribio la CPU en RAM.
SC_MODULE(Testbench) {
    SC_HAS_PROCESS(Testbench);

    Processor&   cpu;
    VectorUnit&  vu;
    Memory&      mem;

    Testbench(sc_module_name name, Processor& cpu_, VectorUnit& vu_, Memory& mem_)
        : sc_module(name), cpu(cpu_), vu(vu_), mem(mem_) {
        SC_THREAD(run);
    }

    void run() {
        wait(cpu.finished);

        std::cout << "\n=== Volcado de registros RV32I ===" << std::endl;
        cpu.dump_regs();

        // Dato escrito por la CPU, leido directamente de la memoria (backdoor,
        // solo para el print de verificacion del testbench).
        uint8_t cpu_bytes[VectorUnit::VLEN_BYTES];
        std::memcpy(cpu_bytes, &mem.data[VECTOR_TEST_ADDR - memory_map::RAM_BASE], VectorUnit::VLEN_BYTES);

        vu.vector_load_test(0, VECTOR_TEST_ADDR);

        std::cout << "\n=== Test end-to-end VectorUnit (CPU -> Bus -> Memory -> VectorUnit) ===" << std::endl;
        std::cout << "Dato escrito por la CPU en 0x" << std::hex << VECTOR_TEST_ADDR << std::dec << ": ";
        for (unsigned i = 0; i < VectorUnit::VLEN_BYTES; ++i)
            std::cout << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(cpu_bytes[i]) << " ";
        std::cout << std::dec << std::endl;

        std::cout << "Dato leido por la VectorUnit (v0):          ";
        vu.dump_vreg(0);

        bool match = std::memcmp(cpu_bytes, vu.vregs[0].data(), VectorUnit::VLEN_BYTES) == 0;
        std::cout << "Resultado: " << (match ? "COINCIDEN (OK)" : "NO COINCIDEN (FALLO)") << std::endl;

        sc_stop();
    }
};

int sc_main(int, char*[]) {
    Memory     memory("memory");
    Bus        bus("bus");
    Processor  cpu("cpu");
    VectorUnit vu("vector_unit");
    Testbench  tb("testbench", cpu, vu, memory);

    cpu.init_socket.bind(bus.cpu_target);
    vu.init_socket.bind(bus.vector_target);
    bus.mem_initiator.bind(memory.socket);

    // Carga del programa de prueba en RAM (acceso "backdoor" previo a
    // sc_start(), habitual para inicializar memoria de programa en un
    // testbench TLM-2.0; en ejecucion, todo acceso de la CPU pasa por Bus).
    std::vector<uint32_t> program = build_test_program();
    std::memcpy(memory.data.data(), program.data(), program.size() * sizeof(uint32_t));

    sc_start();

    return 0;
}
