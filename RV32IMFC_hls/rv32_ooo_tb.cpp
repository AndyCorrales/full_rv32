#include <cstdio>
#include <cstdint>
#include <vector>
#include "rv32_ooo.h"
#include "rv32i_defs.h"
#include "rv32c_defs.h" // encoders r_type/i_type/s_type/b_type/u_type/j_type

// Testbench del core OOO RV32IMFC. El programa (ensamblado a mano, en
// HALFWORDS para poder intercalar comprimidas de la extension C) ejercita:
//   - I+M: dependencias RAW via CDB, branch tomado, JAL con link, SW/LW
//     round-trip, LUI, MUL/DIV con independientes detras (evidencia OOO)
//   - F: FCVT.S.W (lee banco entero), FMUL, FMADD (TRES operandos rs3),
//     FSW/FLW round-trip por la LSU, FEQ (escribe banco entero),
//     FMV.X.W (bits crudos), FDIV largo con independiente detras
//     (evidencia OOO cruzando bancos)
//   - C: C.LI + C.ADDI comprimidas, con una instruccion de 32 bits
//     arrancando en pc%4==2 (straddle de palabra) entre ambas
//
// El TB reconstruye el estado arquitectonico (x e f) SOLO desde el stream
// de commit (commit_is_fp distingue banco), sin backdoor al DUT.

using namespace rv32c;
namespace F3A = rv32i::Funct3_ALU;
namespace F3M = rv32i::Funct3_MULDIV;
namespace F7F = rv32i::Funct7_FP;

int main() {
    ap_uint<32> imem[OOO_IMEM_WORDS] = {0};
    ap_uint<32> dmem[OOO_DMEM_WORDS] = {0};

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
    push32(i_type(OP_IMM, 1, F3A::ADD_SUB, 0, 5));         //   0: addi x1,x0,5      d0
    push32(i_type(OP_IMM, 2, F3A::ADD_SUB, 0, 10));        //   4: addi x2,x0,10     d1
    push32(r_type(OP, 3, F3M::MUL, 1, 2, MULDIV));         //   8: mul  x3,x1,x2     d2  (lat 3)
    push32(i_type(OP_IMM, 4, F3A::ADD_SUB, 0, 7));         //  12: addi x4,x0,7      d3  (OOO vs d2)
    push32(r_type(OP, 5, F3A::ADD_SUB, 3, 4, 0));          //  16: add  x5,x3,x4     d4  = 57
    push32(s_type(STORE, rv32i::Funct3_STORE::SW, 0, 5, 64)); // 20: sw x5,64(x0)    d5
    push32(i_type(LOAD, 6, rv32i::Funct3_LOAD::LW, 0, 64));   // 24: lw x6,64(x0)    d6
    push32(b_type(rv32i::Funct3_BRANCH::BEQ, 1, 1, 8));    //  28: beq  x1,x1,+8     d7  (tomado)
    push32(i_type(OP_IMM, 7, F3A::ADD_SUB, 0, 99));        //  32: addi x7,x0,99     (saltada)
    push32(i_type(OP_IMM, 7, F3A::ADD_SUB, 0, 1));         //  36: addi x7,x0,1      d8
    push32(j_type(8, 8));                                  //  40: jal  x8,+8        d9  (link 44)
    push32(i_type(OP_IMM, 9, F3A::ADD_SUB, 0, 88));        //  44: addi x9,x0,88     (saltada)
    push32(u_type(rv32i::Opcode::LUI, 10, 0x12345));       //  48: lui  x10,0x12345  d10
    push32(r_type(OP, 11, F3M::DIV, 3, 1, MULDIV));        //  52: div  x11,x3,x1    d11 (lat 8)
    push32(r_type(OP, 12, F3A::ADD_SUB, 2, 1, rv32i::Funct7::ALT)); // 56: sub x12,x2,x1 d12 (OOO vs d11)

    // ---- parte F (pcs 60..104) ----
    push32(i_type(OP_IMM, 20, F3A::ADD_SUB, 0, 3));        //  60: addi x20,x0,3     d13
    push32(r_type(OP_FP, 1, 0, 20, rv32i::Rs2_FCVT::W, F7F::FCVT_S_W)); // 64: fcvt.s.w f1,x20  d14 (3.0)
    push32(i_type(OP_IMM, 21, F3A::ADD_SUB, 0, 4));        //  68: addi x21,x0,4     d15
    push32(r_type(OP_FP, 2, 0, 21, rv32i::Rs2_FCVT::W, F7F::FCVT_S_W)); // 72: fcvt.s.w f2,x21  d16 (4.0)
    push32(r_type(OP_FP, 3, 0, 1, 2, F7F::FMUL_S));        //  76: fmul.s f3,f1,f2   d17 (12.0)
    push32(r_type(rv32i::Opcode::FMADD, 5, 0, 1, 2, (3u << 2))); // 80: fmadd.s f5,f1,f2,f3 d18 (3*4+12=24.0)
    push32(s_type(rv32i::Opcode::STORE_FP, rv32i::Funct3_FP_MEM::W, 0, 5, 68)); // 84: fsw f5,68(x0) d19
    push32(i_type(rv32i::Opcode::LOAD_FP, 6, rv32i::Funct3_FP_MEM::W, 0, 68));  // 88: flw f6,68(x0) d20
    push32(r_type(OP_FP, 22, rv32i::Funct3_FCMP::FEQ, 5, 6, F7F::FCMP_S)); // 92: feq.s x22,f5,f6 d21 (=1)
    push32(r_type(OP_FP, 23, 0, 3, 0, F7F::FMV_X_W_FCLASS_S)); // 96: fmv.x.w x23,f3 d22 (0x41400000)
    push32(r_type(OP_FP, 7, 0, 3, 1, F7F::FDIV_S));        // 100: fdiv.s f7,f3,f1   d23 (4.0, lat 8)
    push32(i_type(OP_IMM, 24, F3A::ADD_SUB, 0, 2));        // 104: addi x24,x0,2     d24 (OOO vs d23)

    // ---- parte C (pcs 108..114) ----
    push16(0x47A5);                                        // 108: c.li x15,9        d25 (16 bits)
    push32(i_type(OP_IMM, 16, F3A::ADD_SUB, 0, 21));       // 110: addi x16,x0,21    d26 (32 bits, pc%4==2: straddle)
    push16(0x078D);                                        // 114: c.addi x15,3      d27 -> x15=12
    push16(0x0000);                                        // 116: fin de programa

    for (size_t i = 0; i < prog.size(); i++) {
        uint32_t w = imem[i / 2].to_uint();
        if (i % 2 == 0) w = (w & 0xFFFF0000u) | prog[i];
        else            w = (w & 0x0000FFFFu) | (uint32_t(prog[i]) << 16);
        imem[i / 2] = w;
    }

    ap_uint<1> disp_valid; ap_uint<3> disp_tag; ap_uint<32> disp_pc;
    ap_uint<1> alu0_done;  ap_uint<3> alu0_tag;
    ap_uint<1> alu1_done;  ap_uint<3> alu1_tag;
    ap_uint<1> md_done;    ap_uint<3> md_tag;
    ap_uint<1> fpu_done;   ap_uint<3> fpu_tag;
    ap_uint<1> lsu_done;   ap_uint<3> lsu_tag;
    ap_uint<1> br_done;    ap_uint<3> br_tag;
    ap_uint<1> commit_valid; ap_uint<1> commit_is_fp;
    ap_uint<5> commit_rd; ap_uint<32> commit_value;
    ap_uint<1> halted;

    rv32_ooo_tick(1, imem, dmem,
                  disp_valid, disp_tag, disp_pc,
                  alu0_done, alu0_tag, alu1_done, alu1_tag,
                  md_done, md_tag, fpu_done, fpu_tag,
                  lsu_done, lsu_tag, br_done, br_tag,
                  commit_valid, commit_is_fp, commit_rd, commit_value, halted);

    uint32_t regs[32] = {0};   // ambos reconstruidos SOLO desde commits
    uint32_t fregs[32] = {0};
    int tag2disp[8];
    for (int i = 0; i < 8; i++) tag2disp[i] = -1;
    int complete_cycle[32];
    for (int i = 0; i < 32; i++) complete_cycle[i] = -1;
    int n_disp = 0, n_commit = 0;

    printf("ciclo | evento\n");
    printf("------+------------------------------------------------\n");

    int cycle = 0;
    const int MAX_CYCLES = 300;
    while (!halted && cycle < MAX_CYCLES) {
        cycle++;
        rv32_ooo_tick(0, imem, dmem,
                      disp_valid, disp_tag, disp_pc,
                      alu0_done, alu0_tag, alu1_done, alu1_tag,
                      md_done, md_tag, fpu_done, fpu_tag,
                      lsu_done, lsu_tag, br_done, br_tag,
                      commit_valid, commit_is_fp, commit_rd, commit_value, halted);

        if (disp_valid) {
            tag2disp[disp_tag.to_uint()] = n_disp;
            printf("%5d | DISPATCH d%-2d (pc=%3u, tag %d)\n",
                   cycle, n_disp, disp_pc.to_uint(), disp_tag.to_uint());
            n_disp++;
        }
        struct { ap_uint<1>* v; ap_uint<3>* t; const char* name; } evs[] = {
            {&alu0_done, &alu0_tag, "ALU0"}, {&alu1_done, &alu1_tag, "ALU1"},
            {&md_done, &md_tag, "MULDIV"}, {&fpu_done, &fpu_tag, "FPU"},
            {&lsu_done, &lsu_tag, "LSU"}, {&br_done, &br_tag, "BR"},
        };
        for (auto& e : evs) {
            if (*e.v) {
                int d = tag2disp[e.t->to_uint()];
                if (d >= 0 && d < 32) complete_cycle[d] = cycle;
                printf("%5d | %-6s completa d%-2d (tag %d)\n",
                       cycle, e.name, d, e.t->to_uint());
            }
        }
        if (commit_valid) {
            n_commit++;
            if (commit_is_fp) {
                fregs[commit_rd.to_uint()] = commit_value.to_uint();
                printf("%5d | COMMIT  f%-2u = 0x%08x\n",
                       cycle, commit_rd.to_uint(), commit_value.to_uint());
            } else {
                if (commit_rd != 0) regs[commit_rd.to_uint()] = commit_value.to_uint();
                printf("%5d | COMMIT  x%-2u = 0x%08x\n",
                       cycle, commit_rd.to_uint(), commit_value.to_uint());
            }
        }
    }
    printf("------+------------------------------------------------\n");
    printf("Halted en el ciclo %d (%d dispatches, %d commits)\n\n", cycle, n_disp, n_commit);

    bool ok = true;
    struct { int reg; uint32_t expect; const char* what; } xchecks[] = {
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
    for (auto& c : xchecks) {
        if (regs[c.reg] != c.expect) {
            printf("FAIL  x%-2d = 0x%08x, esperado 0x%08x (%s)\n",
                   c.reg, regs[c.reg], c.expect, c.what);
            ok = false;
        } else {
            printf("OK    x%-2d = 0x%08x (%s)\n", c.reg, regs[c.reg], c.what);
        }
    }
    struct { int reg; uint32_t expect; const char* what; } fchecks[] = {
        {1, 0x40400000, "fcvt.s.w 3 -> 3.0"},
        {2, 0x40800000, "fcvt.s.w 4 -> 4.0"},
        {3, 0x41400000, "fmul.s 3*4 = 12.0"},
        {5, 0x41C00000, "fmadd.s 3*4+12 = 24.0 (rs3)"},
        {6, 0x41C00000, "flw round-trip del fsw"},
        {7, 0x40800000, "fdiv.s 12/3 = 4.0"},
    };
    for (auto& c : fchecks) {
        if (fregs[c.reg] != c.expect) {
            printf("FAIL  f%-2d = 0x%08x, esperado 0x%08x (%s)\n",
                   c.reg, fregs[c.reg], c.expect, c.what);
            ok = false;
        } else {
            printf("OK    f%-2d = 0x%08x (%s)\n", c.reg, fregs[c.reg], c.what);
        }
    }

    struct { int later, earlier; const char* what; } ooo[] = {
        {3, 2,   "d3 (addi) antes que d2 (mul)"},
        {12, 11, "d12 (sub) antes que d11 (div)"},
        {24, 23, "d24 (addi) antes que d23 (fdiv) -- OOO cruzando bancos"},
    };
    for (auto& c : ooo) {
        if (complete_cycle[c.later] > 0 && complete_cycle[c.earlier] > 0 &&
            complete_cycle[c.later] < complete_cycle[c.earlier]) {
            printf("OK    OOO: %s (ciclos %d < %d)\n", c.what,
                   complete_cycle[c.later], complete_cycle[c.earlier]);
        } else {
            printf("FAIL  OOO: %s NO se cumplio (ciclos %d vs %d)\n", c.what,
                   complete_cycle[c.later], complete_cycle[c.earlier]);
            ok = false;
        }
    }

    const int N_EXPECTED = 28;
    if (n_disp != N_EXPECTED) {
        printf("FAIL  dispatches: %d, esperados %d\n", n_disp, N_EXPECTED);
        ok = false;
    }
    if (n_commit != N_EXPECTED) {
        printf("FAIL  commits: %d, esperados %d\n", n_commit, N_EXPECTED);
        ok = false;
    }
    if (dmem[16] != 57) {
        printf("FAIL  dmem[16] = 0x%08x, esperado 57 (sw al commit)\n", dmem[16].to_uint());
        ok = false;
    } else {
        printf("OK    dmem[16] = 57 (sw escribio al commit)\n");
    }
    if (dmem[17] != 0x41C00000) {
        printf("FAIL  dmem[17] = 0x%08x, esperado 0x41C00000 (fsw al commit)\n", dmem[17].to_uint());
        ok = false;
    } else {
        printf("OK    dmem[17] = 0x41C00000 (fsw escribio 24.0f al commit)\n");
    }

    if (!ok) { printf("\nAl menos un check fallo.\n"); return 1; }
    printf("\nTodos los checks pasaron.\n");
    return 0;
}
