#include <systemc.h>
#include <cstring>
#include <cstdio>
#include <vector>

#include "memory_map.h"
#include "memory.h"
#include "bus.h"
#include "processor_ooo.h"
#include "vector_unit.h"
#include "rv32c_defs.h" // encoders r_type/i_type/s_type/b_type/u_type/j_type

// Testbench del ProcessorOOO (RV32IMFC fuera de orden) sobre la MISMA
// topologia TLM del modelo in-order: ProcessorOOO -> Bus -> Memory. El
// programa es el mismo que verifica el core OOO de la pista HLS
// (RV32IMFC_hls/rv32_ooo_tb.cpp): I+M+F+C, incluyendo dependencias RAW
// via CDB, branch tomado, JAL con link, SW/LW y FSW/FLW round-trip,
// FMADD con rs3, FEQ cruzando bancos, y comprimidas con una instruccion
// de 32 bits arrancando en pc%4==2 (straddle). Correr el mismo programa
// en ambas pistas y obtener el mismo estado arquitectonico es la
// verificacion cruzada TLM<->HLS.
//
// La evidencia de reordenamiento sale de ProcessorOOO::complete_cycle[]
// (ciclo de completion por indice de dispatch): d3 (addi) debe completar
// antes que d2 (mul), d12 (sub) antes que d11 (div), y d24 (addi entero)
// antes que d23 (fdiv flotante) -- reordenamiento cruzando bancos.

using namespace rv32c;
namespace F3A = rv32i::Funct3_ALU;
namespace F3M = rv32i::Funct3_MULDIV;
namespace F7F = rv32i::Funct7_FP;

static std::vector<uint16_t> build_test_program() {
    const uint32_t OP     = rv32i::Opcode::OP;
    const uint32_t OP_IMM = rv32i::Opcode::OP_IMM;
    const uint32_t LOAD   = rv32i::Opcode::LOAD;
    const uint32_t STORE  = rv32i::Opcode::STORE;
    const uint32_t MULDIV = rv32i::Funct7::MULDIV;
    const uint32_t OP_FP  = rv32i::Opcode::OP_FP;

    std::vector<uint16_t> prog;
    auto push32 = [&](uint32_t w) { prog.push_back(w & 0xFFFF); prog.push_back(w >> 16); };
    auto push16 = [&](uint16_t h) { prog.push_back(h); };

    // ---- parte I+M (pcs 0..56) ----
    push32(i_type(OP_IMM, 1, F3A::ADD_SUB, 0, 5));            //   0: addi x1,x0,5      d0
    push32(i_type(OP_IMM, 2, F3A::ADD_SUB, 0, 10));           //   4: addi x2,x0,10     d1
    push32(r_type(OP, 3, F3M::MUL, 1, 2, MULDIV));            //   8: mul  x3,x1,x2     d2  (lat 3)
    push32(i_type(OP_IMM, 4, F3A::ADD_SUB, 0, 7));            //  12: addi x4,x0,7      d3  (OOO vs d2)
    push32(r_type(OP, 5, F3A::ADD_SUB, 3, 4, 0));             //  16: add  x5,x3,x4     d4  = 57
    // Direcciones de scratch (256/260) elegidas MUY lejos del programa a
    // proposito: aca instrucciones y datos comparten la misma RAM (a
    // diferencia de la pista HLS, que tiene imem/dmem fisicamente
    // separados) -- usar una direccion dentro del rango del propio
    // programa auto-modificaria el codigo en ejecucion.
    push32(s_type(STORE, rv32i::Funct3_STORE::SW, 0, 5, 256)); //  20: sw   x5,256(x0)   d5
    push32(i_type(LOAD, 6, rv32i::Funct3_LOAD::LW, 0, 256));   //  24: lw   x6,256(x0)   d6
    push32(b_type(rv32i::Funct3_BRANCH::BEQ, 1, 1, 8));       //  28: beq  x1,x1,+8     d7  (tomado)
    push32(i_type(OP_IMM, 7, F3A::ADD_SUB, 0, 99));           //  32: addi x7,x0,99     (saltada)
    push32(i_type(OP_IMM, 7, F3A::ADD_SUB, 0, 1));            //  36: addi x7,x0,1      d8
    push32(j_type(8, 8));                                     //  40: jal  x8,+8        d9  (link 44)
    push32(i_type(OP_IMM, 9, F3A::ADD_SUB, 0, 88));           //  44: addi x9,x0,88     (saltada)
    push32(u_type(rv32i::Opcode::LUI, 10, 0x12345));          //  48: lui  x10,0x12345  d10
    push32(r_type(OP, 11, F3M::DIV, 3, 1, MULDIV));           //  52: div  x11,x3,x1    d11 (lat 8)
    push32(r_type(OP, 12, F3A::ADD_SUB, 2, 1, rv32i::Funct7::ALT)); // 56: sub x12,x2,x1 d12 (OOO vs d11)

    // ---- parte F (pcs 60..104) ----
    push32(i_type(OP_IMM, 20, F3A::ADD_SUB, 0, 3));           //  60: addi x20,x0,3     d13
    push32(r_type(OP_FP, 1, 0, 20, rv32i::Rs2_FCVT::W, F7F::FCVT_S_W)); // 64: fcvt.s.w f1,x20 d14 (3.0)
    push32(i_type(OP_IMM, 21, F3A::ADD_SUB, 0, 4));           //  68: addi x21,x0,4     d15
    push32(r_type(OP_FP, 2, 0, 21, rv32i::Rs2_FCVT::W, F7F::FCVT_S_W)); // 72: fcvt.s.w f2,x21 d16 (4.0)
    push32(r_type(OP_FP, 3, 0, 1, 2, F7F::FMUL_S));           //  76: fmul.s f3,f1,f2   d17 (12.0)
    push32(r_type(rv32i::Opcode::FMADD, 5, 0, 1, 2, (3u << 2))); // 80: fmadd.s f5,f1,f2,f3 d18 (24.0)
    push32(s_type(rv32i::Opcode::STORE_FP, rv32i::Funct3_FP_MEM::W, 0, 5, 260)); // 84: fsw f5,260(x0) d19
    push32(i_type(rv32i::Opcode::LOAD_FP, 6, rv32i::Funct3_FP_MEM::W, 0, 260));  // 88: flw f6,260(x0) d20
    push32(r_type(OP_FP, 22, rv32i::Funct3_FCMP::FEQ, 5, 6, F7F::FCMP_S)); // 92: feq.s x22,f5,f6 d21
    push32(r_type(OP_FP, 23, 0, 3, 0, F7F::FMV_X_W_FCLASS_S)); // 96: fmv.x.w x23,f3    d22
    push32(r_type(OP_FP, 7, 0, 3, 1, F7F::FDIV_S));           // 100: fdiv.s f7,f3,f1   d23 (lat 8)
    push32(i_type(OP_IMM, 24, F3A::ADD_SUB, 0, 2));           // 104: addi x24,x0,2     d24 (OOO vs d23)

    // ---- parte C (pcs 108..114) ----
    push16(0x47A5);                                           // 108: c.li x15,9        d25 (16 bits)
    push32(i_type(OP_IMM, 16, F3A::ADD_SUB, 0, 21));          // 110: addi x16,x0,21    d26 (straddle)
    push16(0x078D);                                           // 114: c.addi x15,3      d27 -> x15=12
    push16(0x0000);                                           // 116: fin de programa

    return prog;
}

SC_MODULE(TestbenchOOO) {
    SC_HAS_PROCESS(TestbenchOOO);

    ProcessorOOO& cpu;
    Memory&       mem;
    bool          all_ok = false;

    TestbenchOOO(sc_module_name name, ProcessorOOO& cpu_, Memory& mem_)
        : sc_module(name), cpu(cpu_), mem(mem_) {
        SC_THREAD(run);
    }

    void run() {
        wait(cpu.finished);

        std::cout << "\nHalted en el ciclo " << cpu.cycle
                  << " (" << cpu.n_disp << " dispatches, "
                  << cpu.n_commit << " commits)\n" << std::endl;

        bool ok = true;

        struct XC { int reg; uint32_t expect; const char* what; };
        const XC xchecks[] = {
            {1, 5,           "addi"},
            {2, 10,          "addi"},
            {3, 50,          "mul"},
            {4, 7,           "addi independiente del mul"},
            {5, 57,          "add dependiente del mul (RAW via CDB)"},
            {6, 57,          "lw round-trip del sw"},
            {7, 1,           "beq tomado (99 nunca ejecuto)"},
            {8, 44,          "link del jal"},
            {9, 0,           "instruccion saltada por jal"},
            {10, 0x12345000, "lui"},
            {11, 10,         "div"},
            {12, 5,          "sub independiente del div"},
            {15, 12,         "C.LI + C.ADDI comprimidas"},
            {16, 21,         "addi de 32 bits en pc%4==2 (straddle)"},
            {20, 3,          "addi (fuente de fcvt)"},
            {21, 4,          "addi (fuente de fcvt)"},
            {22, 1,          "feq.s f5==f6 (FP escribe banco entero)"},
            {23, 0x41400000, "fmv.x.w bits de 12.0f"},
            {24, 2,          "addi independiente del fdiv"},
        };
        for (const XC& c : xchecks) {
            if (cpu.regs[c.reg] != c.expect) {
                std::printf("FAIL  x%-2d = 0x%08x, esperado 0x%08x (%s)\n",
                            c.reg, cpu.regs[c.reg], c.expect, c.what);
                ok = false;
            } else {
                std::printf("OK    x%-2d = 0x%08x (%s)\n", c.reg, cpu.regs[c.reg], c.what);
            }
        }

        const XC fchecks[] = {
            {1, 0x40400000, "fcvt.s.w 3 -> 3.0"},
            {2, 0x40800000, "fcvt.s.w 4 -> 4.0"},
            {3, 0x41400000, "fmul.s 3*4 = 12.0"},
            {5, 0x41C00000, "fmadd.s 3*4+12 = 24.0 (rs3)"},
            {6, 0x41C00000, "flw round-trip del fsw"},
            {7, 0x40800000, "fdiv.s 12/3 = 4.0"},
        };
        for (const XC& c : fchecks) {
            uint32_t bits = rv32i::float_to_bits(cpu.fregs[c.reg]);
            if (bits != c.expect) {
                std::printf("FAIL  f%-2d = 0x%08x, esperado 0x%08x (%s)\n",
                            c.reg, bits, c.expect, c.what);
                ok = false;
            } else {
                std::printf("OK    f%-2d = 0x%08x (%s)\n", c.reg, bits, c.what);
            }
        }

        struct OC { int later, earlier; const char* what; };
        const OC ooo[] = {
            {3, 2,   "d3 (addi) antes que d2 (mul)"},
            {12, 11, "d12 (sub) antes que d11 (div)"},
            {24, 23, "d24 (addi) antes que d23 (fdiv) -- OOO cruzando bancos"},
        };
        for (const OC& c : ooo) {
            int cl = cpu.complete_cycle[c.later], ce = cpu.complete_cycle[c.earlier];
            if (cl > 0 && ce > 0 && cl < ce) {
                std::printf("OK    OOO: %s (ciclos %d < %d)\n", c.what, cl, ce);
            } else {
                std::printf("FAIL  OOO: %s NO se cumplio (ciclos %d vs %d)\n", c.what, cl, ce);
                ok = false;
            }
        }

        const int N_EXPECTED = 28;
        if (cpu.n_disp != N_EXPECTED) {
            std::printf("FAIL  dispatches: %d, esperados %d\n", cpu.n_disp, N_EXPECTED);
            ok = false;
        }
        if (cpu.n_commit != N_EXPECTED) {
            std::printf("FAIL  commits: %d, esperados %d\n", cpu.n_commit, N_EXPECTED);
            ok = false;
        }

        // lectura backdoor de la RAM, solo para verificacion del testbench
        uint32_t w64 = 0, w68 = 0;
        std::memcpy(&w64, &mem.data[256], 4);
        std::memcpy(&w68, &mem.data[260], 4);
        if (w64 != 57) {
            std::printf("FAIL  mem[256] = 0x%08x, esperado 57 (sw al commit)\n", w64);
            ok = false;
        } else {
            std::printf("OK    mem[256] = 57 (sw escribio al commit)\n");
        }
        if (w68 != 0x41C00000) {
            std::printf("FAIL  mem[260] = 0x%08x, esperado 0x41C00000 (fsw al commit)\n", w68);
            ok = false;
        } else {
            std::printf("OK    mem[260] = 0x41C00000 (fsw escribio 24.0f al commit)\n");
        }

        std::cout << (ok ? "\nTodos los checks pasaron." : "\nAl menos un check fallo.") << std::endl;
        all_ok = ok;
        sc_stop();
    }
};

int sc_main(int, char*[]) {
    Memory       memory("memory");
    Bus          bus("bus");
    ProcessorOOO cpu("cpu_ooo");
    VectorUnit   vu("vector_unit"); // no se ejercita en este testbench, pero
                                     // bus.vector_target exige un bind valido
                                     // para que la elaboracion de SystemC cierre
    TestbenchOOO tb("testbench_ooo", cpu, memory);

    cpu.init_socket.bind(bus.cpu_target);
    vu.init_socket.bind(bus.vector_target);
    bus.mem_initiator.bind(memory.socket);

    // carga backdoor del programa (halfwords -> bytes LE), igual que main.cpp
    std::vector<uint16_t> program = build_test_program();
    std::memcpy(memory.data.data(), program.data(), program.size() * sizeof(uint16_t));

    sc_start();

    return tb.all_ok ? 0 : 1;
}
