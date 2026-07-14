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

// Nucleo combinacional RV32IMFC: decode+execute de UN ciclo, sin socket
// TLM. El acceso a memoria de datos es un maestro AXI4 Full real
// (parametro `mem`, ver pragma m_axi en rv32_core.cpp) -- mismo
// protocolo que exige la RAM de Evaluacion Corta 4. Sintetizable con
// Vitis HLS.
//
// Alcance de esta version: RV32I + M + F completos (banco fregs[32],
// FLW/FSW, aritmetica/comparacion/conversion, familia FMADD), mas
// extension C (comprimidas) con una simplificacion de alineacion: `instr`
// siempre entra como una palabra de 32 bits alineada a 4 bytes (fetch
// externo); si es comprimida (bits[1:0] != 3), se usa solo la mitad baja
// de 16 bits y `instr_size` sale en 2; si es normal, se usa la palabra
// completa e `instr_size` sale en 4. Esto significa que **una
// instruccion comprimida siempre debe caer en la mitad baja de un fetch
// alineado a 4 bytes** -- el caso real de C, donde una comprimida puede
// empezar en cualquier direccion par (incluida la mitad alta de una
// palabra), NO esta cubierto por este prototipo. El modelo TLM en
// RV32IMFC_tlm/src/processor.h SI soporta cualquier alineacion de 2
// bytes, porque ahi el fetch es un acceso de bus real de 16 bits, no un
// parametro de entrada fijo de 32 bits. LOAD/STORE de palabra alineada
// (LW/SW/FLW/FSW) mas LB/LH/LBU/LHU con read-modify-write de la palabra
// que los contiene (ver RV32IMFC_hls/README.md para el detalle). RVV
// queda fuera de este prototipo por ahora.
void rv32_core_step(
    ap_uint<32> instr,
    ap_uint<32> pc,
    ap_uint<32> regs_in[32],
    ap_uint<32> regs_out[32],
    float fregs_in[32],
    float fregs_out[32],
    ap_uint<32>* mem,
    ap_uint<32>& next_pc,
    ap_uint<3>&  instr_size,
    ap_uint<1>&  halted
);

#endif // RV32_CORE_H
