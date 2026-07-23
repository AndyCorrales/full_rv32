# Contexto del proyecto: RISC-V RV32I en SystemC / TLM-2.0

Este documento resume todo lo construido hasta ahora en una conversación con
Claude (claude.ai), para continuar el trabajo en VS Code / Claude Code sin
perder contexto. Pegar este archivo completo como primer mensaje, o guardarlo
como `CONTEXTO.md` en la raíz del repo y referenciarlo.

---

## 1. Quién soy / para qué es esto

Ingeniero de Verificación VLSI en Intel, trabajo en el proyecto CSME SIP,
enfocado en verificación CDC (Clock Domain Crossing) y flujos VISA sobre
SystemVerilog. Curso en paralelo una Maestría en Ingeniería Electrónica en el
Instituto Tecnológico de Costa Rica (TEC).

Este proyecto es parte de mi trabajo de posgrado: un modelo de procesador
RISC-V en SystemC/TLM-2.0. Es la base de un proyecto de equipo más grande
(con compañeros Daniel Chacón, Andrés Sánchez y Luis Chaves) cuyo objetivo
final es un **RV32IMFC + RVV out-of-order**. Por ahora estoy construyendo el
core escalar RV32I y preparando la arquitectura para poder agregar RVV
(Vector Extension) más adelante sin rehacer todo.

Ya completé por separado (en otro trabajo de la maestría) un modelo RV32I en
SystemC/TLM-2.0 monociclo con topología directa CPU→Memoria, totalmente
funcional y verificado. Ese trabajo es la base de este.

---

## 2. Historial de lo construido en esta conversación (cronológico)

### Etapa 1 — RV32I monociclo, CPU→Memoria directo

Pedí un decoder RV32I completo en SystemC/TLM-2.0, estilo Loosely-Timed (LT),
con:
- `Processor` como Initiator (`simple_initiator_socket<Processor,32>`)
- `Memory` como Target (`simple_target_socket<Memory,32>`)
- Comunicación 100% vía `b_transport` bloqueante con `tlm_generic_payload`
- Sin `sc_signal` en ningún módulo (pureza TLM)

Decoder soporta el ISA RV32I completo:
- R-Type: ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND
- I-Type: ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI
- Load/Store: LW, SW, LB, LH, LBU, LHU, SB, SH (con extensión de signo/cero
  correcta y máscaras de longitud 1/2/4 bytes)
- Branch: BEQ, BNE, BLT, BGE, BLTU, BGEU
- Salto: JAL, JALR
- LUI, AUIPC

Archivos generados: `rv32i_defs.h`, `immediates.h`, `memory.h`, `processor.h`,
`main.cpp`.

**Esto se compiló y ejecutó de verdad** contra SystemC 2.3.4 real
(`libsystemc-dev` en Ubuntu), no es solo código teórico. Comando usado:

```bash
sudo apt-get install libsystemc-dev
g++ -std=c++17 -o riscv_sim src/main.cpp -lsystemc -lpthread
LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu ./riscv_sim
```

Se verificaron manualmente (con cálculo independiente en Python) los
resultados de todas las categorías de instrucciones, incluyendo un caso de
acceso desalineado a memoria (`SW`/`LW` en dirección no múltiplo de 4).

### Etapa 2 — Pregunta conceptual: ¿qué es "Loosely-Timed"?

Expliqué la diferencia entre LT (Loosely-Timed) y AT (Approximately-Timed) en
TLM-2.0:
- **LT**: una transacción = una llamada bloqueante a `b_transport()`. El
  tiempo se anota en `sc_time& delay` (el Target lo suma, el Initiator lo
  consume con `wait(delay)`). Alta velocidad de simulación, bajo detalle
  temporal. Ideal para validar funcionalidad.
- **AT**: transacciones no bloqueantes multi-fase (`nb_transport_fw/bw`,
  fases BEGIN_REQ/END_REQ/BEGIN_RESP/END_RESP). Más lento, pero modela
  pipelining y contención de bus con precisión.

Elegimos LT porque el objetivo era validar el decoder RV32I, no modelar
contención de bus.

### Etapa 3 — Comparación de estilo con un proyecto de ejemplo

Subí un proyecto de ejemplo (de otro contexto/profesor) que implementa un
sistema de conversión de imagen RGB→escala de grises, con esta arquitectura:

```
CPU (initiator) ──┐
                   ├──> Bus (decodificador de direcciones) ──> RAM (target)
Accelerator (DMA)──┘                                       └─> Accelerator (cfg)
                                                             └─> Storage (disco)
```

Archivos del ejemplo: `storage.h`, `ram.h`, `cpu.h`, `common.h`, `bus.h`,
`accelerator.h`, `main.cpp`. Estilo: nombres en español (`ruta_entrada`,
`enviar_transaccion`, `flujo_principal`), `struct` en vez de `SC_MODULE`,
comentarios coloquiales tipo apuntes de estudiante.

**Conclusión clave de la comparación**: la "gramática" TLM-2.0 de fondo es
IDÉNTICA a mi RV32I — mismos 9 pasos para armar una transacción
(`set_command`, `set_address`, `set_data_ptr`, `set_data_length`,
`set_streaming_width`, `set_byte_enable_ptr(nullptr)`, `set_dmi_allowed(false)`,
`set_response_status(TLM_INCOMPLETE_RESPONSE)`, luego `b_transport` + `wait`).
Mismo patrón de Target (`b_transport` con `memcpy` según `cmd`). La única
pieza estructuralmente nueva en el ejemplo era el **Bus**: un módulo que es
Target hacia arriba (recibe de la CPU) e Initiator hacia abajo (le habla a
varios periféricos), decodificando por rango de dirección con un método
`decode()`.

### Etapa 4 — Decisión: agregar Bus al RV32I, pensando en RVV futuro

Razonamiento: RVV (Vector Extension) típicamente se modela como una unidad
separada porque tiene su propio banco de registros vectoriales (v0-v31,
ancho VLEN), su propia latencia, y necesita acceso a memoria independiente
(loads/stores vectoriales tipo `vle32.v`/`vse32.v`). Sin un Bus, agregar RVV
obligaría a que la CPU escalar "preste" su socket a memoria — mal diseño.
Con Bus, la futura VectorUnit sería otro Initiator más entrando al mismo Bus
que la CPU, igual que el `Accelerator` del ejemplo entra al mismo Bus que su
CPU.

**Decisiones tomadas:**
- Arquitectura: `CPU (Initiator) → Bus (Target+Initiator) → Memory (Target)`
- Mapa de memoria extensible: `memory_map.h` centraliza los rangos, con un
  rango YA RESERVADO para una futura unidad RVV (`RVV_BASE = 0x10000000`,
  `RVV_SIZE = 64KB`), aunque todavía no se instancia ningún módulo ahí.
- Estilo de nomenclatura: **inglés**, coherente con el RV32I original (NO se
  adoptó el español del proyecto de ejemplo).

### Etapa 5 — Implementación del Bus (compilada y verificada)

Se generaron/modificaron:

- **`memory_map.h`** (nuevo): namespace `mmap` con `RAM_BASE`, `RAM_SIZE`,
  `RAM_END`, y el rango reservado `RVV_BASE`, `RVV_SIZE`, `RVV_END`, con
  comentarios explicando los 3 pasos para activarlo en el futuro (instanciar
  módulo, agregar socket initiator en Bus, agregar caso en `decode()`).

- **`bus.h`** (nuevo): `SC_MODULE(Bus)` con:
  - `tlm_utils::simple_target_socket<Bus,32> cpu_target` (entrada desde CPU)
  - `tlm_utils::simple_initiator_socket<Bus,32> ram_init` (salida hacia RAM)
  - Comentario explícito marcando dónde iría un futuro `rvv_init` y el
    bloque `if` correspondiente en `decode()`, ya escrito como comentario
    listo para descomentar.
  - `decode(global_addr, port, local_addr)`: recorre los rangos de
    `memory_map.h`, devuelve `false` si la dirección no está mapeada
    (`TLM_ADDRESS_ERROR_RESPONSE`).
  - `b_transport`: traduce dirección global→local, reenvía al puerto
    correcto, restaura la dirección global antes de retornar (para que el
    initiator original no vea la dirección local interna).

- **`memory.h`** (modificado): ahora incluye `memory_map.h`, usa
  `mmap::RAM_SIZE`. Recibe direcciones YA LOCALES (el Bus resta la base
  antes de reenviar). El resto de la lógica (accesos 1/2/4 bytes Little
  Endian, desalineados) quedó igual.

- **`processor.h`**: **sin cambios funcionales**. Solo se actualizó el
  comentario de cabecera para aclarar que ahora se conecta al Bus, no
  directo a Memory — el procesador no necesita saberlo porque TLM-2.0
  desacopla al Initiator del Target real (esto es una demostración práctica
  de por qué TLM es útil: cambiar la topología no tocó una sola línea de
  lógica del decoder).

- **`main.cpp`** (modificado): instancia `Processor cpu`, `Bus bus`,
  `Memory mem`. Bind:
  ```cpp
  cpu.socket.bind(bus.cpu_target);
  bus.ram_init.bind(mem.socket);
  ```
  El resto del programa de prueba (ensamblador manual en runtime) quedó
  igual — usa direcciones "globales" que, como `RAM_BASE = 0`, coinciden
  numéricamente con las de antes.

**Verificación realizada:** se compiló (`g++ -std=c++17 ... -lsystemc
-lpthread`, sin errores ni warnings) y se ejecutó. El volcado final de
registros dio **exactamente igual, byte por byte**, que la versión sin Bus:

```
x0=0x0 x1=0xa x2=0x3 x3=0xd x4=0x7 x5=0x200 x6=0xb0 x7=0x1 x8=0x9
x9=0xfffffeef x10=0x100 x11=0xb x12=0x2 x13=0x1 x14=0x1 x15=0xf5
x16=0xfa x17=0xa x18=0x28 x19=0x5 x20=0x0 x21=0xfffffff6 x22=0xfffffffb
x23=0xfffffffe x24=0x12345000 x25=0x1058 x26=0xd x27=0xd x28=0xd
x29=0xd x30=0xd x31=0x7
```

Esto confirma que agregar el Bus no rompió nada — el ruteo funciona
correctamente.

### Etapa 6 — Explicación conceptual de extracción de inmediatos (I-type/S-type)

Se explicó en detalle, con ejemplo numérico concreto (`ADDI x5,x1,-8` /
`SW x5,-8(x1)`, bit a bit), cómo funcionan:

```cpp
inline int32_t sign_extend(uint32_t value, int bits);

// I-type: instr[31:20], con signo
inline int32_t imm_i(uint32_t instr) {
    return sign_extend(instr >> 20, 12);
}

// S-type: instr[31:25] | instr[11:7], con signo
inline int32_t imm_s(uint32_t instr) {
    uint32_t imm = ((instr >> 25) << 5) | ((instr >> 7) & 0x1F);
    return sign_extend(imm, 12);
}
```

**Puntos clave a recordar:**
- I-type: el inmediato está en un solo bloque contiguo `[31:20]`, por eso
  `instr >> 20` alcanza sin necesitar máscara adicional (no queda basura
  arriba, es el campo más significativo de la instrucción).
- S-type: el inmediato está partido en dos pedazos (`imm[11:5]` en
  `[31:25]`, `imm[4:0]` en `[11:7]`) PORQUE el ISA de RISC-V mantiene `rs1` y
  `rs2` en la misma posición de bits en todos los formatos (R, I, S, B), así
  el hardware puede empezar a leer el banco de registros sin decodificar
  primero qué tipo de instrucción es. El precio de esa simetría es que el
  inmediato queda fragmentado.
- Por eso en S-type el segundo shift (`instr >> 7`) SÍ necesita `& 0x1F`:
  arrastra basura de los campos superiores (`imm[11:5]`, `rs2`, `rs1`,
  `funct3`) que hay que recortar, cosa que no pasa en I-type porque ahí no
  hay nada por encima del campo que interesa.
- Nota pendiente: **falta explicar B-type con el mismo detalle** (el
  formato más confuso porque además de partirse en pedazos, los reordena:
  `imm[12|10:5|4:1|11]`). Si se retoma este tema, cubrir ese caso con el
  mismo estilo de ejemplo bit-a-bit.

---

## 3. Estado actual de los archivos (versión "con Bus", la más reciente)

Ubicación de referencia: `src/` con estos 7 archivos:

- `rv32i_defs.h` — opcodes, funct3, funct7 como `constexpr` en namespaces
  (`Opcode`, `Funct3_ALU`, `Funct3_LOAD`, `Funct3_STORE`, `Funct3_BRANCH`,
  `Funct7`). Sin cambios desde la Etapa 1.
- `immediates.h` — `sign_extend()` + `get_imm_I/S/B/U/J()` +
  `get_shamt()`, usando `sc_uint<32>::range()/bit()`. Sin cambios desde la
  Etapa 1. (Nota: la Etapa 6 mostró una variante equivalente con
  `uint32_t` + shifts nativos, no reemplaza a esta, es solo explicación
  didáctica de la misma técnica.)
- `memory_map.h` — **nuevo en Etapa 5**. Namespace `mmap`.
- `bus.h` — **nuevo en Etapa 5**.
- `memory.h` — **modificado en Etapa 5** (usa `mmap::RAM_SIZE`, recibe
  direcciones locales).
- `processor.h` — decoder RV32I completo, sin cambios funcionales desde
  Etapa 1 (solo comentario de cabecera actualizado en Etapa 5).
- `main.cpp` — **modificado en Etapa 5** (topología CPU→Bus→Memory,
  ensamblador manual RV32I + programa de prueba que ejercita todas las
  categorías de instrucción).

**Compilación de referencia (para verificar que el entorno de VS Code
reproduce lo mismo):**

```bash
sudo apt-get update && sudo apt-get install -y libsystemc-dev
g++ -std=c++17 -o riscv_sim src/main.cpp -lsystemc -lpthread
LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu ./riscv_sim
```

Debe imprimir el mismo volcado de registros listado en la Etapa 5.

---

## 4. Qué falta / próximos pasos posibles

Ideas discutidas pero NO implementadas todavía (para continuar en VS Code):

1. **VectorUnit (RVV) — etapa preparatoria**: agregar un módulo
   `vector_unit.h` como Initiator TLM-2.0 independiente, con un banco de
   registros vectoriales simple (propuesta: 32 registros de VLEN=128 bits,
   `std::array<std::array<uint8_t,16>,32>` o similar), un socket propio
   hacia el Bus, y UN método de prueba (`vector_load_test`) que haga un
   load de 128 bits desde una dirección dada — solo para validar que el
   socket y el ruteo por el Bus funcionan end-to-end. Esto es un paso
   PREVIO al decoder de instrucciones RVV real (no implementar el decoder
   vectorial todavía, ir por etapas).

2. Para eso, `bus.h` necesitaría un segundo `simple_target_socket` (uno
   para CPU, otro para VectorUnit), ambos ruteando hacia la misma Memory
   vía `decode()` (que ya rutea por rango de dirección, no por quién inició
   la transacción, así que probablemente no necesite cambios).

3. `main.cpp` necesitaría instanciar `VectorUnit`, conectarla al Bus, y
   correr un test mínimo: la CPU escribe un bloque de datos en RAM, la
   VectorUnit lo lee por su propio socket, y se verifica que el dato
   coincide.

4. **Explicación pendiente**: extracción de inmediato B-Type con ejemplo
   numérico bit-a-bit (formato más complejo, con reordenamiento de bits,
   no solo fragmentación).

5. Eventualmente: decoder de instrucciones RVV real (loads/stores
   vectoriales con stride e indexados, operaciones aritméticas vectoriales,
   registro de máscara), que es el objetivo final del proyecto de equipo
   (RV32IMFC + RVV out-of-order) — esto es trabajo grande, para más
   adelante.

---

## 5. Convenciones y estilo a mantener

- **Idioma de comentarios**: español, técnico y conciso (nivel ingeniero,
  no tutorial). Nombres de variables/funciones/tipos: **inglés**.
- **Sin `sc_signal`** en ningún módulo (pureza TLM-2.0, todo transaccional
  vía `b_transport` + `tlm_generic_payload`).
- **Sin números mágicos**: opcodes/funct3/funct7 siempre como `constexpr`
  en namespaces, siguiendo el patrón de `rv32i_defs.h`.
- **Loosely-Timed (LT)**: transacciones bloqueantes vía `b_transport`,
  latencia anotada en `sc_time& delay` (el Target suma, el Initiator
  consume con `wait(delay)`). No usar `nb_transport_fw/bw` (eso sería AT).
- **Documentar puntos de extensión directamente en el código** (como ya
  está hecho en `bus.h` y `memory_map.h` para el futuro RVV) — dejar
  comentarios tipo "mapa de ruta" para cuando se retome el trabajo.
- **Verificar siempre compilando y ejecutando de verdad**, no entregar
  código sin probar. Si algo falla, iterar hasta que compile y corra.
- Todo cambio de topología (por ejemplo agregar el Bus) debe confirmarse
  comparando el volcado de registros contra la salida de referencia de la
  Etapa 5, para asegurar que no se rompió el decoder RV32I existente.

---

## 6. Pedido para esta sesión de VS Code

(Completar según lo que se necesite en el momento — por ejemplo:)

- [ ] Implementar `VectorUnit` como se describe en la sección 4, punto 1-3.
- [ ] Explicar B-Type con el mismo detalle bit-a-bit que I-type/S-type.
- [ ] Otro objetivo: ___________

Instrucción general para Claude Code: usar los archivos ya existentes en
`src/` como base, NO reescribir desde cero. Cualquier cambio debe compilarse
y ejecutarse para confirmar que el programa de prueba RV32I actual sigue
dando la salida de referencia de la sección 3 antes de considerar el cambio
terminado.