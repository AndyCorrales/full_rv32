# Nucleo RV32IMFC sintetizable (Vitis HLS)

Prototipo sintetizable del decode+execute de la CPU, para obtener
métricas reales de hardware (utilización de recursos, frecuencia máxima)
sobre el Kria KV260, como pide el Avance II del curso. **No reemplaza**
al modelo TLM en `RV32IMFC_tlm/src/` — ese sigue siendo la referencia funcional
verificada (RV32IMF completo); esto es una pista aparte, en paralelo.

## Alcance de este prototipo

- ✅ RV32I completo + extensión M (ADD/SUB/SLL/SLT/SLTU/XOR/SRL/SRA/OR/AND,
  Load/Store, Branch, JAL/JALR, LUI/AUIPC, MUL/MULH/MULHSU/MULHU/DIV/DIVU/
  REM/REMU).
- ✅ Extensión F (simple precisión): banco `fregs[32]` (tipo `float`
  nativo, sintetizable directo por Vitis HLS vía su librería de punto
  flotante), FLW/FSW, FADD.S/FSUB.S/FMUL.S/FDIV.S/FSQRT.S, FSGNJ.S/
  FSGNJN.S/FSGNJX.S, FMIN.S/FMAX.S, FEQ.S/FLT.S/FLE.S, FCVT.W.S/FCVT.WU.S/
  FCVT.S.W/FCVT.S.WU, FMV.X.W/FMV.W.X, FCLASS.S, y la familia FMADD.S/
  FMSUB.S/FNMSUB.S/FNMADD.S (vía `std::fma`, un solo redondeo). Mismo
  alcance que el modelo TLM, portado casi mecánicamente.
- ✅ Extensión C (comprimidas): `rv32c_defs.h` (copia literal del TLM,
  ya portable) expande cada instrucción de 16 bits a su equivalente de
  32 bits antes de que corra el mismo switch de decode de siempre.
  `rv32_core_step` gana un puerto de salida `instr_size` (2 o 4) para
  que quien la invoque sepa cuánto avanzar `pc`.
  **Limitación de alineación** (distinta a la del TLM): `instr` siempre
  entra como palabra de 32 bits ya alineada a 4 bytes; si es comprimida,
  se usa solo su mitad baja de 16 bits. Esto significa que **una
  comprimida siempre tiene que caer en la mitad baja** de un fetch
  alineado — el caso real de C (comprimida arrancando en la mitad alta,
  o intercalada en cualquier dirección par) no está cubierto acá. El
  modelo TLM sí soporta cualquier alineación de 2 bytes porque su fetch
  es un acceso de bus real de 16 bits, no un parámetro de entrada fijo.
- ⬜ RVV **no** está en este prototipo todavía — el modelo TLM solo tiene
  el esqueleto (`vector_load_test`), tampoco decodifica instrucciones
  vectoriales reales.
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

## Números post-implementación (Vivado)

Los de arriba son *estimados* de HLS. Para números reales post-síntesis
y post-P&R (más precisos, y lo que de verdad conviene citar en
"Resultados preliminares"), hay un segundo script en
[`vivado/run_vivado.tcl`](vivado/run_vivado.tcl) que toma el RTL que ya
generó `csynth_design` y lo sintetiza/implementa en Vivado, out-of-context
(sin integrarlo todavía a un sistema completo con Zynq PS — eso es el
paso siguiente, para cuando haya que correr en la placa física de
verdad).

Requiere haber corrido `vitis_hls -f run_hls.tcl` primero (deja el RTL
en `rv32_core_proj/solution1/syn/verilog/`). Después, desde
`RV32IMFC_hls/`:

```bash
vivado -mode batch -source vivado/run_vivado.tcl
```

Genera:
```
reports/utilization_synth.rpt   # post-sintesis
reports/timing_synth.rpt
reports/utilization_impl.rpt    # post place & route (los mas precisos)
reports/timing_impl.rpt
```

**Si `create_clock` falla** buscando el puerto `ap_clk`: abrí uno de los
`.v` generados en `rv32_core_proj/solution1/syn/verilog/` y confirmá el
nombre real del puerto de reloj del top (`rv32_core_step`) — Vitis HLS
lo llama `ap_clk` por convención en interfaces `ap_ctrl_hs`, pero puede
variar levemente según versión; ajustá esa línea del script si hace
falta.

Mencionar en el artículo "estimado por HLS" vs "post-implementación
(Vivado)" para cada métrica es honesto y responde directo al criterio
de la rúbrica de la defensa sobre justificar decisiones y limitaciones.

## Demostrador de ejecución fuera de orden (`ooo_demo.cpp`)

Prototipo **aislado y minimo** que demuestra ejecución fuera de orden real
(Tomasulo-lite), separado del core escalar de arriba a propósito — para no
arriesgar el RV32IMFC ya verificado mientras se cumple el requisito de
arquitectura OOO del tema del curso, dado el tiempo disponible.

**Alcance deliberadamente recortado**: 4 registros arquitectónicos, 1
reservation station por unidad funcional (1 ALU, latencia 1 ciclo; 1 MUL,
latencia 4 ciclos), ROB de 4 entradas con retiro en orden, CDB de
broadcast simple. Sin especulación de branches, sin memoria, programa fijo
de 3 instrucciones (no hay decoder — es un microarquitectura pura). Ver
comentarios de cabecera en [`ooo_demo.h`](ooo_demo.h) para el detalle
completo del diseño.

**Programa fijo** (R0=5 al reset):
```
I0 (tag 0): R1 = R0 + 10   -- ALU
I1 (tag 1): R2 = R1 * R1   -- MUL, depende de R1 (resultado de I0)
I2 (tag 2): R3 = R0 - 1    -- ALU, independiente de I0/I1
```

**Evidencia de ejecución fuera de orden** (traza real de `csim_design`,
ver `ooo_demo_proj/solution1/csim/report/ooo_demo_tick_csim.log`):
```
ciclo | evento
    3 | ALU completa ejecucion (tag 0)
    4 | COMMIT R1 = 0x0000000f
    5 | ALU completa ejecucion (tag 2)     <- I2 completa ejecucion...
    6 | MUL completa ejecucion (tag 1)     <- ...ANTES que I1, aunque I1 va antes en el programa
    7 | COMMIT R2 = 0x000000e1
    8 | COMMIT R3 = 0x00000004             <- pero el COMMIT si respeta el orden del programa (R1,R2,R3)
```
I2 (tag 2) termina de ejecutar en el ciclo 5, **antes** que I1 (tag 1) en
el ciclo 6 — pese a que I1 aparece antes en el programa. Esa es la
ejecución fuera de orden. El *commit* (retiro al banco de registros
arquitectónico vía el ROB) sí respeta el orden del programa (R1 → R2 →
R3), que es lo que da estado arquitectónico preciso pese al reordenamiento
interno.

**Cómo correrlo**:
```bash
cd RV32IMFC_hls
vitis_hls -f run_hls_ooo.tcl
```
Corre csim (debe imprimir la traza de arriba y "Todos los checks
pasaron.") y csynth, dejando el reporte en
`ooo_demo_proj/solution1/syn/report/ooo_demo_tick_csynth.rpt`.

**Resultados de síntesis** (Vitis HLS 2024.2, `xck26-sfvc784-2LV-c`):

| Métrica | Valor |
|---|---|
| Fmax estimado | 175.38 MHz |
| LUT | 2811 (2.4 %) |
| FF | 706 (0.3 %) |
| DSP | 3 (0.2 %) |
| BRAM | 0 |

**Trabajo futuro** (fuera de alcance de este demo, ver `explain.md`):
integrar esta lógica de RS/ROB/CDB con el decoder RV32IMFC real de
`rv32_core.cpp` (hoy son dos prototipos separados), agregar más
reservation stations por unidad, especulación de branches, y memoria
fuera de orden con desambiguación.

## Core RV32IMFC fuera de orden (`rv32_ooo.cpp`)

Evolución del mecanismo anterior a un **procesador RV32IMFC real**: el
motor RS/ROB/CDB del demo, generalizado e integrado con fetch de 16
bits, decode I+M+F+C, branches y memoria. Sigue siendo un módulo
separado de `rv32_core.cpp` — el core escalar verificado no se tocó.

**Microarquitectura**:
- **Fetch de 16 bits (extensión C)**: lee el halfword en `pc` (cualquier
  dirección PAR), expande comprimidas con `rv32c::expand()` y avanza
  `pc` en 2 o 4. Soporta una instrucción de 32 bits arrancando en la
  mitad alta de una palabra (straddle) — **mejor** que la limitación de
  alineación del core escalar de esta misma carpeta.
- **Dos bancos arquitectónicos**: 32 registros enteros + RAT, y 32
  flotantes + FRAT (extensión F). Ambos RAT apuntan al **mismo ROB
  unificado** de 8 entradas: una dependencia float→int (FEQ que escribe
  x-reg) o int→float (FCVT.S.W que lee x-reg) usa el mismo mecanismo de
  tags que una entera — es la ventaja estructural de unificar el ROB.
- Unidades funcionales con reservation station propia: 2× ALU (lat. 1),
  1× MUL/DIV (lat. 3/8, M completa con casos borde), 1× **FPU** (F
  completa: aritmética, FSGNJ, FMIN/FMAX, FCMP, FCVT saturado, FMV,
  FCLASS, y la familia **FMADD con tercer operando rs3**; lat. 3/8/4/2
  según op), 1× LSU (incluye FLW/FSW), 1× branch. LUI/AUIPC/JAL
  resuelven en el dispatch (un C.JAL expandido enlaza a `pc+2`).
- CDB: cada unidad difunde `(tag, valor)` al completar; los valores F
  viajan como bits IEEE-754 crudos, igual que en un bus real.

**Decisiones de alcance** (documentadas también en `rv32_ooo.h`): sin
especulación de saltos (fetch se detiene hasta resolver BRANCH/JALR —
nunca hay instrucciones por el camino equivocado, no hace falta
squash/recovery); memoria en orden y conservadora (un load solo ejecuta
al llegar a la cabeza del ROB; un store escribe memoria recién al
commit); sin CSRs de F (`frm`/`fflags` — rm=RNE fijo, igual que todo el
proyecto); RVV fuera de alcance.

**Verificación**: el testbench (`rv32_ooo_tb.cpp`) ensambla un programa
de 30 instrucciones en halfwords (I+M+F+C: dependencias RAW vía CDB,
branch tomado, JAL con link, SW/LW y FSW/FLW round-trip, FMADD con rs3,
FEQ cruzando bancos, comprimidas con straddle) y reconstruye **ambos
bancos solo desde el stream de commit** (`commit_is_fp` distingue el
banco), sin backdoor al DUT. Evidencia de reordenamiento por partida
triple: `addi` completa antes que el `mul` (ciclo 6 < 7), `sub` antes
que el `div` (17 < 23), y un `addi` entero antes que el `fdiv` flotante
(42 < 48) — reordenamiento **cruzando bancos de registros**. Los 28
retiros salen en orden de programa.

**Cómo correrlo**:
```bash
cd RV32IMFC_hls
vitis_hls -f run_hls_ooo_core.tcl
```

**Resultados de síntesis** (Vitis HLS 2024.2, `xck26-sfvc784-2LV-c`):

| Métrica | RV32IM OOO (previo) | RV32IMFC OOO |
|---|---|---|
| Fmax estimado | 240.49 MHz | 135.86 MHz |
| LUT | 9224 (7.8 %) | 15174 (12.9 %) |
| FF | 3321 (1.4 %) | 4659 (2.0 %) |
| DSP | 15 | 20 |
| BRAM | 2 | 4 |

La caída de Fmax al agregar F (240→136 MHz) viene del camino crítico de
los operadores de punto flotante — es el mismo 135.86 MHz que estima el
core escalar RV32IMFC, que paga el mismo camino. Dato útil para la
sección de análisis del artículo: la extensión F domina el timing en
ambas microarquitecturas, el costo del mecanismo OOO en sí es marginal.
