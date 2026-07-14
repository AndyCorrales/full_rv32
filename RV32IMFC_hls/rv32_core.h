#ifndef RV32_CORE_H
#define RV32_CORE_H

#include <ap_int.h>

// Tamano de la memoria de datos vista por el maestro AXI4 Full, en
// palabras de 32 bits. 16384 palabras = 64KB, igual que memory_map::RAM_SIZE
// en el modelo TLM (RV32IMFC_tlm/src/memory_map.h) -- mismo mapa de memoria en ambas
// pistas (verificacion funcional y prototipo sintetizable).
// #define (no constexpr) a proposito: los pragmas de Vitis HLS parsean
// macros de preprocesador de forma mas confiable que expresiones de C++.
#define MEM_WORDS 16384

// Nucleo combinacional RV32IM: decode+execute de UN ciclo, sin socket TLM.
// El acceso a memoria de datos es un maestro AXI4 Full real (parametro
// `mem`, ver pragma m_axi en rv32_core.cpp) -- mismo protocolo que exige
// la RAM de Evaluacion Corta 4, para que ambas piezas del curso hablen el
// mismo lenguaje de interconexion. Sintetizable con Vitis HLS.
//
// Alcance de esta version: RV32I + M completos, LOAD/STORE de palabra
// alineada (LW/SW) mas LB/LH/LBU/LHU con read-modify-write de la palabra
// que los contiene (ver explain.md, seccion HLS, para el detalle y las
// limitaciones: SB/SH/loads desalineados a mitad de palabra son trabajo
// futuro de esta pista). F y RVV quedan fuera de este prototipo por
// ahora -- el modelo TLM en RV32IMFC_tlm/src/ SI los implementa y verifica.
void rv32_core_step(
    ap_uint<32> instr,
    ap_uint<32> pc,
    ap_uint<32> regs_in[32],
    ap_uint<32> regs_out[32],
    ap_uint<32>* mem,
    ap_uint<32>& next_pc,
    ap_uint<1>&  halted
);

#endif // RV32_CORE_H
