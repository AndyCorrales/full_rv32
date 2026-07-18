#ifndef OOO_DEMO_H
#define OOO_DEMO_H

#include <ap_int.h>

// Demostrador minimo de ejecucion fuera de orden (Tomasulo-lite: 1
// reservation station por unidad funcional + ROB de 4 entradas, retiro en
// orden). NO reemplaza al core RV32IMFC de rv32_core.cpp -- es un
// prototipo aislado y sintetizable por separado, que demuestra
// "completion fuera de orden, commit en orden" sobre un programa fijo de 3
// instrucciones ALU/MUL. Alcance deliberadamente minimo (ver README de
// esta carpeta): sin especulacion de branches, sin memoria, 4 registros
// arquitectonicos, 1 unidad ALU (latencia 1 ciclo) + 1 unidad MUL
// (latencia 4 ciclos).
//
// Programa fijo (R0=5 al reset):
//   I0 (tag 0): R1 = R0 + 10   -- ALU
//   I1 (tag 1): R2 = R1 * R1   -- MUL, depende de R1 (resultado de I0)
//   I2 (tag 2): R3 = R0 - 1    -- ALU, independiente de I0/I1
//
// Evidencia esperada en la traza (ver ooo_demo_tb.cpp): I2 (tag 2)
// completa su ejecucion ANTES que I1 (tag 1), aunque I1 va antes en el
// programa -- esa es la ejecucion fuera de orden. El commit sigue
// estrictamente el orden del programa (I0, I1, I2) via el ROB, aunque I2
// ya tenia su valor listo desde antes -- eso da estado arquitectonico
// preciso.
//
// Un tick = un ciclo de reloj. Todo el estado (RAT, ROB, reservation
// stations, regfile) vive en variables `static` dentro de
// ooo_demo_tick() -- como un modulo de hardware real, sin puertos de
// estado, solo entradas de control (reset) y salidas de
// observabilidad/traza.
void ooo_demo_tick(
    ap_uint<1> reset,
    ap_uint<32>& r0_out,
    ap_uint<32>& r1_out,
    ap_uint<32>& r2_out,
    ap_uint<32>& r3_out,
    ap_uint<2>&  commit_reg,
    ap_uint<1>&  commit_valid,
    ap_uint<2>&  alu_complete_tag,
    ap_uint<1>&  alu_complete_valid,
    ap_uint<2>&  mul_complete_tag,
    ap_uint<1>&  mul_complete_valid,
    ap_uint<1>&  halted
);

#endif // OOO_DEMO_H
