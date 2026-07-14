# Nucleo RV32IM sintetizable (Vitis HLS)

Prototipo sintetizable del decode+execute de la CPU, para obtener
métricas reales de hardware (utilización de recursos, frecuencia máxima)
sobre el Kria KV260, como pide el Avance II del curso. **No reemplaza**
al modelo TLM en `RV32IMFC_tlm/src/` — ese sigue siendo la referencia funcional
verificada (RV32IMF completo); esto es una pista aparte, en paralelo.

## Alcance de este prototipo

- ✅ RV32I completo + extensión M (ADD/SUB/SLL/SLT/SLTU/XOR/SRL/SRA/OR/AND,
  Load/Store, Branch, JAL/JALR, LUI/AUIPC, MUL/MULH/MULHSU/MULHU/DIV/DIVU/
  REM/REMU).
- ⬜ F (punto flotante) y RVV **no** están en este prototipo todavía —
  quedan como siguiente paso de esta misma pista de síntesis (el modelo
  TLM sí los tiene, ver `explain.md`).
- **Memoria de datos: maestro AXI4 Full** (`#pragma HLS INTERFACE m_axi`
  sobre el parámetro `mem`) — mismo protocolo que la RAM de Evaluación
  Corta 4, así ambas piezas del curso hablan el mismo lenguaje de
  interconexión. `mem` es un arreglo de palabras de 32 bits (`MEM_WORDS`
  = 16384 = 64KB, igual mapa que `memory_map::RAM_SIZE` en `RV32IMFC_tlm/src/`).
- **Limitaciones conocidas de esta primera versión**:
  - Un acceso que **cruce el límite de una palabra** (p. ej. `LW` en una
    dirección que no es múltiplo de 4) no se resuelve correctamente —
    `mem_load`/`mem_store` leen/escriben una sola palabra de 32 bits. El
    modelo TLM en `RV32IMFC_tlm/src/memory.h` sí soporta cualquier desalineado, porque
    ahí la memoria es un arreglo de bytes, no de palabras AXI.
  - `SB`/`SH` hacen *read-modify-write* de la palabra completa (no hay
    señal de byte-enable a este nivel de abstracción con un puntero HLS
    simple) — un ciclo extra de lectura por cada store parcial.
  - La función hace su propio acceso a memoria *dentro* del mismo
    llamado; en el RTL generado, la latencia de la transacción AXI queda
    absorbida en los estados internos que HLS arma automáticamente — no
    es literalmente "un ciclo de reloj" una vez sintetizado, aunque a
    nivel de C sea una sola llamada.

## Cómo correr

Requiere Vitis HLS instalado y en el `PATH`:

```bash
cd RV32IMFC_hls
vitis_hls -f run_hls.tcl
```

Esto corre, en orden:
1. **C-simulation** (`csim_design`): compila `rv32_core_tb.cpp` con g++ y
   corre el testbench en software puro — debe imprimir `OK` para cada
   registro chequeado y terminar con "Todos los checks pasaron.". Si
   falla acá, el error es de lógica C++, no de síntesis.
2. **C-synthesis** (`csynth_design`): genera el RTL y el reporte de
   recursos/timing, apuntando a la parte del Kria KV260
   (`xck26-sfvc784-2LV-c`).

## Qué reportar en "Resultados preliminares"

Del archivo `rv32_core_proj/solution1/syn/report/rv32_core_step_csynth.rpt`:

- **Utilización de recursos**: sección "Utilization Estimates" — LUT,
  FF, DSP, BRAM (como % del total disponible en el XCK26).
- **Frecuencia máxima estimada**: sección "Timing" — `Estimated` vs
  `Target` clock period (el reporte da el *slack*; si es negativo, el
  diseño no cierra a la frecuencia pedida en `create_clock`, hay que
  bajar la frecuencia objetivo o revisar el critical path).
- **Latencia**: sección "Performance Estimates" — ciclos por invocación
  de `rv32_core_step` (debería ser 1, al ser combinacional puro; si HLS
  decide pipelinear/registrar internamente puede variar).

Si además corrés la implementación completa en Vivado (`export_design`
con `-flow impl`, o exportando el IP y armando un proyecto de Vivado a
mano), vas a tener números post-P&R más precisos que los estimados de
HLS — mencionarlo como "estimado por HLS" vs "post-implementación" en el
artículo es honesto y además responde directamente al criterio de la
rúbrica de la defensa sobre justificar decisiones y limitaciones.
