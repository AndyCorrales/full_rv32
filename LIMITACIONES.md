# Limitaciones conocidas

Este documento centraliza las limitaciones de alcance de las dos pistas
del proyecto (`RV32IMFC_hls/` y `RV32IMFC_tlm/`), separadas por pista y
por core (in-order / fuera de orden). La mayoría son decisiones de
diseño deliberadas para acotar el trabajo dentro del tiempo del curso,
no bugs — donde aplica, se indica la justificación técnica y qué haría
falta para levantarlas.

---

## `RV32IMFC_hls/` — pista de síntesis (Vitis HLS)

### Core escalar in-order (`rv32_core.cpp`)

- **Acceso a memoria de datos que cruza el límite de una palabra AXI no
  se resuelve correctamente** (p. ej. `LW` en una dirección que no es
  múltiplo de 4 y cuyos 4 bytes caen en dos palabras distintas). La
  memoria es un maestro AXI4 Full direccionado por palabra de 32 bits
  (`mem_load`/`mem_store`), no un arreglo de bytes — un acceso de un
  solo `mem[word_addr]` no alcanza a leer/escribir el byte que cae en
  la palabra siguiente.
  - *Justificación*: el ISA de RISC-V no exige soporte de hardware para
    accesos desalineados (es *implementation-defined*); muchos cores
    embebidos reales tampoco lo soportan y dependen del compilador o de
    un trap por software.
  - *Cómo se arreglaría*: detectar `(addr & 3) + len > 4`, leer/escribir
    las dos palabras AXI involucradas y combinar/enmascarar los bytes
    de cada una — la misma técnica que ya se usó para resolver el
    straddle de instrucciones comprimidas en `rv32_ooo.cpp` (ver abajo).
- **`SB`/`SH` hacen *read-modify-write* de la palabra completa** (no hay
  señal de byte-enable a este nivel de abstracción con un puntero HLS
  simple) — un ciclo extra de lectura por cada store parcial.
- **Limitación de alineación de comprimidas (extensión C)**: `instr`
  siempre entra como una palabra de 32 bits ya alineada a 4 bytes; si es
  comprimida, se usa solo su mitad baja de 16 bits. Una instrucción
  comprimida que caiga en la mitad **alta** de una palabra (o
  intercalada en cualquier dirección par) no está cubierta. El modelo
  TLM sí soporta cualquier alineación de 2 bytes porque su fetch es un
  acceso de bus real de 16 bits, no un parámetro de entrada fijo.
  - *Ya resuelto en el core OOO de esta misma pista* (ver abajo) — el
    fetch de `rv32_ooo.cpp` lee dos palabras y selecciona por `pc[1]`,
    soportando cualquier alineación par.
- **Es una función de un solo paso** (decode+execute de una instrucción
  por llamada, sin loop de fetch interno). Para correr un programa
  completo en hardware real hace falta un wrapper externo que invoque
  la función repetidamente, alimentando `pc`/`instr` y realimentando
  `next_pc`/`regs_out` — no existe todavía (ver también la sección de
  "próximo paso" en `RV32IMFC_hls/README.md` sobre integración con el
  Zynq PS del Kria).

### Core fuera de orden (`rv32_ooo.cpp`)

Documentadas también como comentario de cabecera en `rv32_ooo.h`.

- **Sin especulación de saltos**: el fetch se detiene al despachar
  `BRANCH`/`JALR` hasta que la unidad de branch resuelve destino real
  (`JAL` redirige en el propio dispatch, con destino conocido
  estáticamente). Nunca hay instrucciones en vuelo por un camino
  equivocado, así que no hace falta lógica de *squash*/*recovery* — pero
  tampoco hay ganancia de ILP a través de saltos no resueltos.
- **Memoria en orden y conservadora**: una sola reservation station de
  LSU (un acceso en vuelo a la vez); un *load* solo ejecuta cuando su
  entrada llega a la cabeza del ROB (garantiza que todo *store* anterior
  ya escribió memoria); un *store* calcula dirección/dato en cuanto
  puede pero solo escribe memoria al retirarse (commit). No hay
  desambiguación de memoria (*memory disambiguation*) — sería necesaria
  para permitir loads/stores independientes fuera de orden entre sí.
- **Hereda la limitación de acceso a memoria que cruza palabra AXI** del
  core escalar (mismo `dmem_load`/`dmem_store`, mismo alcance).
- **CDB modelado como un bus de resultado por unidad, no un único CDB
  arbitrado**: cada unidad funcional difunde su propio `(tag, valor)` de
  forma independiente en el ciclo que completa. Simplificación
  documentada — un CDB único requeriría arbitraje explícito si dos
  unidades completan el mismo ciclo (acá no puede pasar porque cada una
  tiene su propia línea de broadcast).
- **Tamaños fijos y pequeños**: ROB de 8 entradas, 2 reservation
  stations de ALU, 1 de MUL/DIV, 1 de FPU, 1 de LSU, 1 de branch — no
  configurable en tiempo de síntesis, elegido para acotar el trabajo de
  verificación dentro del tiempo disponible.
- **Solo RV32IMFC entero/flotante de simple precisión**: sin `frm`/
  `fflags` (CSR de modo de redondeo/excepciones — `rm=RNE` fijo, igual
  que el resto del proyecto), sin doble precisión (D), sin RVV.
- **Opcodes no soportados** (`SYSTEM`/`FENCE`/CSRs) se retiran como
  *no-op* silencioso en vez de disparar una excepción real — no hay
  infraestructura de traps.
- Mismo requisito de wrapper externo que el core escalar para correr en
  hardware real (acá además el "tick" representa un ciclo de la
  microarquitectura, no un paso completo de instrucción).

### Comunes a toda la pista HLS

- **No hay integración física con el Kria KV260 todavía**: lo que existe
  es síntesis *out-of-context* (`run_hls.tcl`/`run_hls_ooo_core.tcl`/
  `run_hls_ooo.tcl`) — métricas reales de recursos/Fmax del bloque
  aislado, pero sin Block Design con el Zynq PS, sin bitstream cargado
  en la placa. El flujo completo (IP export → Block Design → bitstream →
  prueba en hardware) está documentado como próximo paso pero no
  ejecutado.
- `RV32IMFC_hls/vivado/run_vivado.tcl` (síntesis + implementación
  post-P&R, out-of-context) todavía no se corrió — los números de Fmax/
  utilización citados en los README son *estimados de HLS*
  (`csynth_design`), no post-implementación de Vivado.
- Sin CSRs, `ECALL`/`EBREAK`, `FENCE`, loader de ELF, ni periférico
  UART — no se pueden correr binarios reales compilados con un
  toolchain (`riscv32-unknown-elf-gcc`), solo los programas de prueba
  ensamblados a mano en los testbenches.

---

## `RV32IMFC_tlm/` — pista de verificación funcional (SystemC/TLM-2.0)

### Core in-order (`Processor`, `processor.h`)

- Sin CSRs, `ECALL`/`EBREAK`, `FENCE`, loader de ELF, ni periférico
  UART — el programa entra por un `memcpy` "backdoor" a la RAM antes de
  `sc_start()`, no por un binario real.
- Sin `frm`/`fflags` de la extensión F (`rm=RNE` fijo), sin doble
  precisión (D).
- No es sintetizable tal cual (usa sockets TLM, `tlm_generic_payload`,
  I/O de C++) — es exclusivamente un modelo de verificación funcional;
  para métricas de hardware está la pista HLS, en paralelo.

### Core fuera de orden (`ProcessorOOO`, `processor_ooo.h`)

Mismas decisiones de alcance que `rv32_ooo.cpp` (documentadas también
como comentario de cabecera en `processor_ooo.h`), portadas 1:1 para
que ambas pistas sean comparables:

- Sin especulación de saltos (fetch detenido hasta resolver
  `BRANCH`/`JALR`).
- Memoria en orden: un acceso en vuelo, *load* solo en la cabeza del
  ROB, *store* escribe por el Bus recién al commit. Sin desambiguación
  de memoria.
- ROB de 8 entradas, 2×ALU, 1×MUL/DIV, 1×FPU, 1×LSU, 1×branch — mismos
  tamaños fijos que la pista HLS (a propósito, para que el mismo
  programa de prueba dé el mismo resultado ciclo a ciclo en ambas
  pistas, como efectivamente se verificó).
- Sin `frm`/`fflags`, sin D, sin RVV integrado al pipeline OOO (aparte
  existe el esqueleto independiente `VectorUnit`, ver abajo).
- Opcodes no soportados se retiran como *no-op*, sin traps reales.

**Ventaja sobre la pista HLS** (vale la pena tenerlo presente, no es
simétrico en todo): la memoria TLM es un `std::vector<uint8_t>` real, así
que `LB`/`LH`/`LW`/`SB`/`SH`/`SW` desalineados **y que cruzan el límite
de una palabra** funcionan correctamente de forma nativa, tanto en el
core in-order como en el OOO — a diferencia de la pista HLS (ver
arriba), donde esa limitación sigue abierta en ambos cores.

**Nota de diseño verificada en la práctica**: instrucciones y datos
comparten la misma RAM (no hay `imem`/`dmem` separados como en HLS) — el
testbench de `ProcessorOOO` (`main_ooo.cpp`) tuvo que elegir direcciones
de *scratch* lejos del código a propósito para no auto-modificar el
programa en ejecución (un bug real que apareció y se corrigió durante el
desarrollo, documentado en el comentario de esa sección del archivo).

### Comunes a toda la pista TLM

- **RVV**: `VectorUnit` (`vector_unit.h`) es solo un esqueleto —
  banco de 32 registros vectoriales (VLEN=128 bits) y un método de
  prueba (`vector_load_test`) que valida el camino CPU → Bus → Memory →
  VectorUnit end-to-end. No hay decoder de instrucciones vectoriales
  reales (`vadd.vv`, `vle32.v`, etc.), y no está conectado al pipeline
  de `Processor` ni de `ProcessorOOO`.
- Sin CSRs, `ECALL`/`EBREAK`, `FENCE`, loader de ELF, ni UART (igual que
  arriba) — necesarios para correr binarios *bare-metal* reales.

---

## Comunes a todo el proyecto (ambas pistas, ambos cores)

- **RVV real**: en ninguna de las cuatro combinaciones (HLS/TLM ×
  in-order/OOO) hay un decoder de instrucciones vectoriales funcionando
  — es el trabajo más grande que queda pendiente hacia el objetivo final
  del equipo (RV32IMFC + RVV out-of-order).
- **Bare-metal real**: falta en las cuatro combinaciones: loader de ELF,
  `ECALL`/`EBREAK` (`SYSTEM`), `FENCE`, banco de CSRs
  (`mstatus`/`mtvec`/`mepc`/`mcause`), y al menos un periférico UART
  mapeado en memoria.
- **Doble precisión (D)** y **CSRs de F** (`frm`/`fflags`) fuera de
  alcance en las cuatro combinaciones — siempre se asume `rm=RNE`.
