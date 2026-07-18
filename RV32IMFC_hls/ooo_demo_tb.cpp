#include <cstdio>
#include "ooo_demo.h"

// Testbench del demo OOO: corre ciclos hasta halted, imprimiendo una
// traza legible por evento (dispatch implicito via el programa fijo,
// "completa ejecucion" via el CDB, "commit" via el retiro del ROB).
// Ver ooo_demo.h para el programa y el resultado esperado.
//
// Chequeo de exito: I2 (tag 2) debe completar su ejecucion ANTES que I1
// (tag 1) -- esa es la evidencia de "fuera de orden" -- y el commit debe
// respetar el orden del programa (R1, luego R2, luego R3) sin importar
// cuando termino de ejecutar cada uno.
int main() {
    ap_uint<32> r0, r1, r2, r3;
    ap_uint<2>  commit_reg;
    ap_uint<1>  commit_valid;
    ap_uint<2>  alu_tag;
    ap_uint<1>  alu_valid;
    ap_uint<2>  mul_tag;
    ap_uint<1>  mul_valid;
    ap_uint<1>  halted;

    ooo_demo_tick(1, r0, r1, r2, r3, commit_reg, commit_valid,
                  alu_tag, alu_valid, mul_tag, mul_valid, halted);

    printf("ciclo | evento\n");
    printf("------+--------------------------------------------\n");

    int alu_complete_cycle = -1, mul_complete_cycle = -1;
    int commit_order[3]; int commit_count = 0;

    int cycle = 0;
    const int MAX_CYCLES = 30;
    while (!halted && cycle < MAX_CYCLES) {
        cycle++;
        ooo_demo_tick(0, r0, r1, r2, r3, commit_reg, commit_valid,
                      alu_tag, alu_valid, mul_tag, mul_valid, halted);

        if (alu_valid) {
            printf("%5d | ALU completa ejecucion (tag %d)\n", cycle, (int)alu_tag);
            if (alu_tag == 2) alu_complete_cycle = cycle; // tag2 = I2
        }
        if (mul_valid) {
            printf("%5d | MUL completa ejecucion (tag %d)\n", cycle, (int)mul_tag);
            if (mul_tag == 1) mul_complete_cycle = cycle; // tag1 = I1
        }
        if (commit_valid) {
            printf("%5d | COMMIT R%d = 0x%08x\n", cycle, (int)commit_reg,
                   (unsigned)(commit_reg == 1 ? r1 : commit_reg == 2 ? r2 : r3));
            if (commit_count < 3) commit_order[commit_count++] = (int)commit_reg;
        }
    }

    printf("------+--------------------------------------------\n");
    printf("Halted en el ciclo %d. R0=%u R1=%u R2=%u R3=%u\n",
           cycle, (unsigned)r0, (unsigned)r1, (unsigned)r2, (unsigned)r3);

    bool ok = true;

    if (r1 != 15) { printf("FAIL: R1 esperado 15, dio %u\n", (unsigned)r1); ok = false; }
    if (r2 != 225) { printf("FAIL: R2 esperado 225, dio %u\n", (unsigned)r2); ok = false; }
    if (r3 != 4) { printf("FAIL: R3 esperado 4, dio %u\n", (unsigned)r3); ok = false; }

    if (alu_complete_cycle < 0 || mul_complete_cycle < 0) {
        printf("FAIL: no se registraron ambas completions (I1/I2)\n");
        ok = false;
    } else if (alu_complete_cycle >= mul_complete_cycle) {
        printf("FAIL: I2 (ALU, tag2) no completo antes que I1 (MUL, tag1) -- "
               "no se demostro ejecucion fuera de orden (I2 en ciclo %d, I1 en ciclo %d)\n",
               alu_complete_cycle, mul_complete_cycle);
        ok = false;
    } else {
        printf("OK: I2 completo en el ciclo %d, ANTES que I1 (ciclo %d) -- "
               "ejecucion fuera de orden confirmada.\n",
               alu_complete_cycle, mul_complete_cycle);
    }

    if (commit_count != 3 || commit_order[0] != 1 || commit_order[1] != 2 || commit_order[2] != 3) {
        printf("FAIL: el orden de commit no fue R1,R2,R3 en orden de programa\n");
        ok = false;
    } else {
        printf("OK: commit en orden de programa (R1, R2, R3) pese al completion fuera de orden.\n");
    }

    if (!ok) {
        printf("Al menos un check fallo.\n");
        return 1;
    }
    printf("Todos los checks pasaron.\n");
    return 0;
}
