#ifndef RV32_OOO_H
#define RV32_OOO_H

#include <ap_int.h>

// Core RV32IMFC con ejecucion fuera de orden (Tomasulo-lite), sintetizable
// con Vitis HLS. Evolucion del mecanismo probado en ooo_demo.cpp,
// generalizado a un procesador real:
//
//   - Fetch real de 16 bits (extension C): la unidad de fetch lee el
//     halfword en pc (cualquier direccion PAR), expande comprimidas con
//     rv32c::expand() y avanza pc en 2 o 4. A diferencia del core escalar
//     rv32_core.cpp (que exige la comprimida en la mitad baja de una
//     palabra alineada), esta pista soporta cualquier alineacion de 2
//     bytes, igual que el modelo TLM.
//   - 32 registros enteros + RAT, y 32 registros flotantes + FRAT
//     (extension F). Ambos RAT apuntan al MISMO ROB unificado de 8
//     entradas: una dependencia float->int (p.ej. FEQ que escribe x-reg)
//     o int->float (FCVT.S.W que lee x-reg) usa exactamente el mismo
//     mecanismo de tags que una dependencia entera.
//   - ROB de 8 entradas, retiro estrictamente en orden.
//   - Unidades funcionales con reservation station propia:
//       2x ALU     (lat. 1)              -- OP/OP_IMM enteras
//       1x MUL/DIV (MUL lat. 3, DIV 8)   -- extension M completa
//       1x FPU     (ADD/SUB/MUL lat. 3, DIV/SQRT 8, FMADD* 4, resto 2)
//                  -- extension F completa, incluida la familia R4
//                  (FMADD/FMSUB/FNMSUB/FNMADD) con TERCER operando rs3
//       1x LSU     (LW/LH/LB/SW/SH/SB + FLW/FSW, memoria en orden)
//       1x BR      (BRANCH/JALR; JAL/LUI/AUIPC resuelven en dispatch)
//   - CDB: al completar, cada unidad difunde (tag, valor) y despierta a
//     cualquier RS que esperara ese tag (los valores F viajan como bits
//     IEEE-754 crudos, igual que en el bus real).
//
// Decisiones de alcance (deliberadas, para acotar verificacion):
//   - SIN especulacion de saltos (fetch se detiene hasta resolver
//     BRANCH/JALR; JAL redirige en el dispatch). Sin squash/recovery.
//   - Memoria EN ORDEN: un acceso en vuelo; un load ejecuta solo en la
//     cabeza del ROB; un store escribe memoria recien al commit.
//   - Sin CSRs de F (frm/fflags): rm=RNE fijo, igual que el resto del
//     proyecto. RVV fuera de alcance.
//   - Convencion de fin de programa: halfword 0x0000 detiene el fetch;
//     `halted` cuando ademas el ROB esta vacio.
//
// Un tick = un ciclo de reloj. El estado persiste en variables static.
// Salidas: eventos de dispatch/completion/commit para que el testbench
// reconstruya el estado arquitectonico SOLO desde el retiro (sin
// backdoor) y verifique el reordenamiento desde afuera del DUT.
// `commit_is_fp` distingue si el retiro escribe el banco entero o el
// flotante (el valor flotante se reporta como bits IEEE-754).

#define OOO_IMEM_WORDS 64
#define OOO_DMEM_WORDS 64

void rv32_ooo_tick(
    ap_uint<1>  reset,
    ap_uint<32> imem[OOO_IMEM_WORDS],
    ap_uint<32> dmem[OOO_DMEM_WORDS],
    // evento de dispatch (para que el TB mapee tag ROB -> instruccion)
    ap_uint<1>&  disp_valid,
    ap_uint<3>&  disp_tag,
    ap_uint<32>& disp_pc,
    // eventos de completion, uno por unidad funcional
    ap_uint<1>& alu0_done, ap_uint<3>& alu0_tag,
    ap_uint<1>& alu1_done, ap_uint<3>& alu1_tag,
    ap_uint<1>& md_done,   ap_uint<3>& md_tag,
    ap_uint<1>& fpu_done,  ap_uint<3>& fpu_tag,
    ap_uint<1>& lsu_done,  ap_uint<3>& lsu_tag,
    ap_uint<1>& br_done,   ap_uint<3>& br_tag,
    // stream de commit (retiro en orden)
    ap_uint<1>&  commit_valid,
    ap_uint<1>&  commit_is_fp, // 1: escribe f[rd]; 0: escribe x[rd] (rd=0 => nada)
    ap_uint<5>&  commit_rd,
    ap_uint<32>& commit_value,
    ap_uint<1>&  halted
);

#endif // RV32_OOO_H
