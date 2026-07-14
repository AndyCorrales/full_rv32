# RV32IMFC-RVV-out-of-order

Base de un proyecto de maestría hacia un core **RV32IMFC + RVV
out-of-order**. El repo tiene dos versiones **independientes y
autocontenidas** (cada una copia lo que necesita de la otra, sin rutas
relativas cruzadas):

- **[`RV32IMFC_tlm/`](RV32IMFC_tlm/)**: modelo de verificación funcional
  en SystemC/TLM-2.0 — el que se explica en detalle más abajo y en
  `explain.md`.
- **[`RV32IMFC_hls/`](RV32IMFC_hls/)**: prototipo sintetizable (Vitis
  HLS) de RV32IM con maestro AXI4 Full, para obtener métricas reales de
  hardware (Kria KV260).

> Cycle-accurate-ish RV32IMF RISC-V core in SystemC/TLM-2.0 (Loosely-Timed),
> with a shared Bus, integer/M/F extensions verified end-to-end, and an
> early RVV (Vector) skeleton — plus a separate, synthesizable RV32IM
> HLS prototype targeting a Kria KV260.

## Estado actual

- ✅ **RV32I** completo: R-type, I-type, Load/Store (1/2/4 bytes, LE,
  desalineado), Branch, JAL/JALR, LUI/AUIPC.
- ✅ **Extensión M**: MUL, MULH, MULHSU, MULHU, DIV, DIVU, REM, REMU —
  incluye los casos borde de división por cero y overflow (`INT32_MIN /
  -1`) según el manual RISC-V.
- ✅ **Extensión F** (simple precisión): FLW/FSW, FADD.S/FSUB.S/FMUL.S/
  FDIV.S/FSQRT.S, FSGNJ.S/FSGNJN.S/FSGNJX.S, FMIN.S/FMAX.S, FEQ.S/FLT.S/
  FLE.S, FCVT.W.S/FCVT.WU.S/FCVT.S.W/FCVT.S.WU, FMV.X.W/FMV.W.X,
  FCLASS.S, y la familia FMADD.S/FMSUB.S/FNMSUB.S/FNMADD.S.
- 🚧 **RVV**: `VectorUnit` conectada al Bus como initiator independiente,
  con un banco de 32 registros vectoriales (VLEN=128 bits) y un test
  end-to-end (CPU → Bus → Memory → VectorUnit). Todavía sin decoder de
  instrucciones vectoriales reales.
- ⬜ Extensión C (comprimidas), CSRs, ECALL/EBREAK, loader de ELF,
  periféricos — no empezado (ver `explain.md` para el detalle de qué
  falta para correr binarios bare-metal reales).

Todo lo anterior está compilado, ejecutado y verificado (a mano, contra
Python) — no es solo código teórico.

## Arquitectura

```
Processor (Initiator) ──┐
                         ├──> Bus (Target + Initiator) ──> Memory (Target)
VectorUnit (Initiator) ──┘
```

- **`Processor`**: CPU RV32IMF monociclo, `simple_initiator_socket`,
  comunicación 100% vía `b_transport` bloqueante (estilo Loosely-Timed).
- **`Bus`**: decodifica direcciones globales y rutea hacia el
  periférico correcto; expone un `target_socket` por cada iniciador del
  sistema (CPU, VectorUnit).
- **`Memory`**: 64KB, recibe direcciones locales, soporta accesos de
  1/2/4 bytes en Little Endian, incluyendo desalineados.
- **`VectorUnit`**: esqueleto de RVV — banco de registros vectoriales +
  socket propio hacia el Bus.

Sin `sc_signal` en ningún módulo (pureza TLM-2.0).

## Síntesis a FPGA (Kria KV260)

`RV32IMFC_tlm/` es un modelo de **verificación funcional**, no es
sintetizable tal cual (usa sockets, `tlm_generic_payload`, I/O de C++,
etc.). Para obtener métricas reales de hardware (utilización de
recursos, frecuencia máxima) está `RV32IMFC_hls/`: el decode+execute de
RV32IM reescrito para Vitis HLS, con maestro AXI4 Full, apuntando al
Kria KV260. Ver [`RV32IMFC_hls/README.md`](RV32IMFC_hls/README.md) para
cómo correrlo y qué números extraer del reporte de síntesis.

**Nota de independencia**: las dos carpetas son autocontenidas — no hay
`#include`s cruzados entre ellas. `RV32IMFC_hls/rv32i_defs.h` es una
*copia* de `RV32IMFC_tlm/src/rv32i_defs.h` (mismo contenido, mantenerlas
sincronizadas a mano si una cambia).

## Compilar y correr (RV32IMFC_tlm)

Requiere SystemC 2.3.4 (con TLM-2.0 incluido) — en Ubuntu/Debian:

```bash
sudo apt-get update && sudo apt-get install -y libsystemc-dev
```

```bash
g++ -std=c++17 -o riscv_sim RV32IMFC_tlm/src/main.cpp -lsystemc -lpthread
LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu ./riscv_sim
```

Esto corre el programa de prueba embebido en `main.cpp` (ejercita las
tres extensiones) e imprime el volcado de registros enteros y de punto
flotante, más el resultado del test end-to-end de la VectorUnit.

## Estructura del código

```
RV32IMFC_tlm/src/
├── rv32i_defs.h    # Opcodes, funct3/funct7 (base + M + F)
├── immediates.h    # Extraccion de inmediatos por formato (I/S/B/U/J)
├── fp_ops.h        # Semantica de F: bits<->float, FCVT saturado, FCLASS
├── memory_map.h    # Mapa de direcciones (RAM, rango reservado RVV)
├── memory.h        # Memoria TLM-2.0 (target)
├── bus.h           # Bus TLM-2.0 (target + initiator, decodifica direcciones)
├── processor.h      # CPU: decoder + banco de registros enteros y flotantes
├── vector_unit.h   # Esqueleto RVV (initiator independiente)
└── main.cpp        # Ensamblador de prueba + integracion + testbench

RV32IMFC_hls/
├── rv32i_defs.h         # Copia de RV32IMFC_tlm/src/rv32i_defs.h (autocontenido)
├── rv32_core.h/.cpp     # Decode+execute RV32IM sintetizable (Vitis HLS, AXI4 Full)
├── immediates_hls.h     # Espejo de immediates.h usando ap_uint en vez de sc_uint
├── rv32_core_tb.cpp     # Testbench de C-simulation
├── run_hls.tcl          # Script de Vitis HLS (csim + csynth)
└── README.md            # Como correrlo y que reportar
```

## Documentación

- **`context.md`**: historial de decisiones de diseño (por qué Bus, por
  qué VLEN=128, convenciones de estilo, etc.).
- **`explain.md`**: explicación línea por línea de cada archivo, con
  ejemplos numéricos y trazas end-to-end — el lugar para entender *cómo*
  funciona el código, no solo *qué* hace.

## Contexto

Proyecto de trabajo de posgrado (Maestría en Ingeniería Electrónica,
TEC), y base de un proyecto de equipo mayor cuyo objetivo final es un
core **RV32IMFC + RVV out-of-order**.
