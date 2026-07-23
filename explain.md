# Explicación del código — RV32I(M)(F) en SystemC/TLM-2.0

Este documento explica, archivo por archivo y línea por línea donde hace
falta, cómo funciona el modelo actual en `RV32IMFC_tlm/src/`. Es el documento de
referencia para retomar el proyecto sin tener que re-explicar todo de
cero. Se actualiza cada vez que se agrega o cambia algo relevante.

Arquitectura actual:

```
Processor (Initiator) ──┐
                         ├──> Bus (Target + Initiator) ──> Memory (Target)
VectorUnit (Initiator) ──┘
```

- `Processor`: CPU RV32I**MF** monociclo (decoder base + extensión M + extensión F).
- `Bus`: decodifica direcciones GLOBALES y rutea hacia el periférico correcto.
- `Memory`: 64KB, recibe direcciones LOCALES, soporta 1/2/4 bytes, LE, desalineado.
- `VectorUnit`: esqueleto de RVV, por ahora solo un método de prueba
  (`vector_load_test`) que valida el camino end-to-end por el Bus.

---

## 1. `rv32i_defs.h` — constantes de codificación

```cpp
#ifndef RV32I_DEFS_H
#define RV32I_DEFS_H
```
Include guard: evita procesar el archivo dos veces si dos `.cpp`/`.h`
distintos lo incluyen (acá lo incluyen `processor.h` y `main.cpp`). Sin
esto, el compilador tiraría error de "redefinición".

```cpp
namespace rv32i {

namespace Opcode {
constexpr uint32_t OP        = 0b0110011; // R-type: registro-registro
constexpr uint32_t OP_IMM    = 0b0010011; // I-type: aritmetica inmediata
constexpr uint32_t LOAD      = 0b0000011;
constexpr uint32_t STORE     = 0b0100011;
constexpr uint32_t BRANCH    = 0b1100011;
constexpr uint32_t JAL       = 0b1101111;
constexpr uint32_t JALR      = 0b1100111;
constexpr uint32_t LUI       = 0b0110111;
constexpr uint32_t AUIPC     = 0b0010111;
}
```
`constexpr` en vez de `#define`: se evalúa en compilación (costo cero en
runtime) y respeta scope/namespace — un `#define OP ...` sería
sustitución de texto ciega, sin scope, que podría chocar con cualquier
variable llamada `OP` en cualquier archivo. Los literales están en
binario a propósito, para que el patrón de bits sea visualmente idéntico
al de la tabla del manual RISC-V.

**No hay opcode para M** — es la primera pista de que la extensión M no
agrega instrucciones "nuevas" a nivel de opcode, sino que reutiliza `OP`.

```cpp
namespace Funct3_ALU {
constexpr uint32_t ADD_SUB = 0b000;
constexpr uint32_t SLL     = 0b001;
constexpr uint32_t SLT     = 0b010;
constexpr uint32_t SLTU    = 0b011;
constexpr uint32_t XOR     = 0b100;
constexpr uint32_t SRL_SRA = 0b101;
constexpr uint32_t OR      = 0b110;
constexpr uint32_t AND     = 0b111;
}
```
8 valores porque `funct3` son 3 bits. Sirve para **dos** opcodes (`OP` y
`OP_IMM`): la ALU hace la misma operación tanto si el segundo operando
viene de un registro como de un inmediato, por eso ambos comparten esta
tabla en vez de tener cada uno la suya.

```cpp
namespace Funct3_LOAD { LB=0b000; LH=0b001; LW=0b010; LBU=0b100; LHU=0b101; }
namespace Funct3_STORE { SB=0b000; SH=0b001; SW=0b010; }
namespace Funct3_BRANCH { BEQ=0b000; BNE=0b001; BLT=0b100; BGE=0b101; BLTU=0b110; BGEU=0b111; }
```
Namespaces separados por familia de opcode (convención del proyecto
original — ver `context.md`). Solo `LOAD` usa 5 de los 8 valores
posibles; el resto está reservado/no usado en RV32I base.

```cpp
namespace Funct3_MULDIV {
constexpr uint32_t MUL    = 0b000;
constexpr uint32_t MULH   = 0b001;
constexpr uint32_t MULHSU = 0b010;
constexpr uint32_t MULHU  = 0b011;
constexpr uint32_t DIV    = 0b100;
constexpr uint32_t DIVU   = 0b101;
constexpr uint32_t REM    = 0b110;
constexpr uint32_t REMU   = 0b111;
}
```
Los 8 valores de `funct3` para la extensión M. Los 4 primeros son
multiplicación, los 4 últimos división; dentro de cada grupo, pares
con/sin signo. **Importante**: numéricamente coinciden con
`Funct3_ALU` (`MUL=000` == `ADD_SUB=000`, etc.) — por eso están en
namespaces separados, y por eso hace falta mirar `funct7` para saber
cuál tabla usar.

```cpp
namespace Funct7 {
constexpr uint32_t NORMAL = 0b0000000;
constexpr uint32_t ALT    = 0b0100000; // SUB, SRA
constexpr uint32_t MULDIV = 0b0000001; // MUL, MULH, MULHSU, MULHU, DIV, DIVU, REM, REMU
}
```
Este es el campo que **realmente distingue M de la ALU base**. Sin
`funct7`, `ADD x1,x2,x3` y `MUL x1,x2,x3` serían indistinguibles (mismo
`opcode`, mismo `funct3`). Tres valores usados de los 128 posibles — el
resto está reservado por el ISA para futuras extensiones del bloque `OP`
(p. ej. Zbb usa otros patrones de `funct7` en el mismo opcode).

### Los opcodes de la extensión F

```cpp
constexpr uint32_t LOAD_FP   = 0b0000111; // I-type: FLW
constexpr uint32_t STORE_FP  = 0b0100111; // S-type: FSW
constexpr uint32_t FMADD     = 0b1000011; // R4-type: rd = (rs1*rs2)+rs3
constexpr uint32_t FMSUB     = 0b1000111; // R4-type: rd = (rs1*rs2)-rs3
constexpr uint32_t FNMSUB    = 0b1001011; // R4-type: rd = -(rs1*rs2)+rs3
constexpr uint32_t FNMADD    = 0b1001111; // R4-type: rd = -(rs1*rs2)-rs3
constexpr uint32_t OP_FP     = 0b1010011; // R-type FP: aritmetica/comparacion/conversion
```
A diferencia de M (que reutiliza el opcode `OP` existente), F **sí**
agrega opcodes nuevos — 7 en total. Tiene sentido: F necesita mover
datos hacia/desde un banco de registros *distinto* (`f0-f31`, no
`x0-x31`), así que no puede simplemente colgarse de `OP`/`OP_IMM`/`LOAD`/
`STORE` como hizo M, porque esos opcodes ya tienen un significado fijo
sobre el banco entero. `LOAD_FP`/`STORE_FP` son el equivalente de
`LOAD`/`STORE` pero apuntando a `fregs[]` en vez de `regs[]`. `OP_FP` es
el equivalente de `OP` para aritmética/comparación/conversión entre
flotantes (y entre flotantes y enteros). `FMADD`/`FMSUB`/`FNMSUB`/
`FNMADD` son 4 opcodes separados —no un solo opcode con un campo que
elija entre las 4— porque *no hay bits libres* en un R-type de 32 bits
para meter un cuarto registro fuente (`rs3`) *y además* un selector de
operación: usar el opcode entero para elegir la operación libera esos
bits para `rs3`.

```cpp
namespace Funct3_FP_MEM {
constexpr uint32_t W = 0b010; // FLW / FSW
}
```
Único valor de `funct3` implementado — el ISA real reserva otros
valores en esta posición para `FLH`/`FLD`/`FLQ` (medias, dobles,
cuádruples), que no aplican si sólo se implementa F (simple precisión).

```cpp
namespace Funct7_FP {
constexpr uint32_t FADD_S    = 0b0000000;
constexpr uint32_t FSUB_S    = 0b0000100;
constexpr uint32_t FMUL_S    = 0b0001000;
constexpr uint32_t FDIV_S    = 0b0001100;
constexpr uint32_t FSQRT_S   = 0b0101100; // rs2 = 00000 (no usado)
constexpr uint32_t FSGNJ_S   = 0b0010000; // funct3: FSGNJ/FSGNJN/FSGNJX
constexpr uint32_t FMINMAX_S = 0b0010100; // funct3: FMIN/FMAX
constexpr uint32_t FCMP_S    = 0b1010000; // funct3: FLE/FLT/FEQ
constexpr uint32_t FCVT_W_S  = 0b1100000; // float->int, rs2: W/WU
constexpr uint32_t FCVT_S_W  = 0b1101000; // int->float, rs2: W/WU
constexpr uint32_t FMV_X_W_FCLASS_S = 0b1110000; // funct3: FMV.X.W/FCLASS.S
constexpr uint32_t FMV_W_X   = 0b1111000;
}
```
Bajo `OP_FP`, `funct7` juega dos roles distintos según la operación —
esto es una particularidad real del ISA F, no una simplificación del
modelo:

- Para `FADD_S`/`FSUB_S`/`FMUL_S`/`FDIV_S`/`FSQRT_S`: `funct7` identifica
  la operación completa, y el campo `funct3` de esa instrucción **no**
  es un selector — es el campo `rm` (*rounding mode*) del ISA real
  (`000`=RNE, `001`=RTZ, ..., `111`=dinámico desde un CSR). Este modelo
  no implementa `frm`/`fflags` (el CSR de modo de redondeo/excepciones),
  así que siempre se codifica `rm=000` y se ignora en el decoder — la
  FPU nativa de C++ ya redondea a RNE por defecto, así que el resultado
  coincide sin tener que leer ese campo.
- Para `FSGNJ_S`/`FMINMAX_S`/`FCMP_S`/`FMV_X_W_FCLASS_S`: `funct7`
  identifica solo el *grupo*, y `funct3` sí selecciona la variante
  puntual dentro del grupo (ver los tres namespaces de abajo).
- Para `FCVT_W_S`/`FCVT_S_W`: `funct7` identifica la dirección de la
  conversión (float→int o int→float), y el campo `rs2` (que en estas
  instrucciones no es un registro fuente real) selecciona con/sin signo.

```cpp
namespace Funct3_FSGNJ { FSGNJ=0b000; FSGNJN=0b001; FSGNJX=0b010; }
namespace Funct3_FMINMAX { FMIN=0b000; FMAX=0b001; }
namespace Funct3_FCMP { FLE=0b000; FLT=0b001; FEQ=0b010; }
namespace Funct3_FMV_FCLASS { FMV_X_W=0b000; FCLASS_S=0b001; }
namespace Rs2_FCVT { W=0b00000; WU=0b00001; }
```
Estos namespaces resuelven la ambigüedad dentro de cada grupo de
`funct7` de arriba, siguiendo la misma convención que ya usaban
`Funct3_ALU`/`Funct3_LOAD`/etc.

```cpp
inline uint32_t rs3(uint32_t instr) { return (instr >> 27) & 0x1F; }
inline uint32_t fmt(uint32_t instr) { return (instr >> 25) & 0x3; }
```
Dos extractores nuevos, solo para R4-type (`FMADD`/`FMSUB`/`FNMSUB`/
`FNMADD`). En este formato, los 7 bits que en R-type normal serían
`funct7` se reparten distinto: los 5 bits altos (`[31:27]`) son `rs3` (el
tercer operando fuente), y los 2 bits siguientes (`[26:25]`) son `fmt`
(selector de precisión: `00`=simple, `01`=doble, `10`=cuádruple,
`11`=media — este modelo solo implementa `00`). `funct3` en R4-type es,
de nuevo, el campo `rm` (modo de redondeo), no un selector de operación
— la operación (`FMADD` vs `FMSUB` vs `FNMSUB` vs `FNMADD`) ya quedó
fijada por el opcode.

### Los extractores base (sin cambios funcionales)

```cpp
inline uint32_t opcode(uint32_t instr) { return instr & 0x7F; }
inline uint32_t rd(uint32_t instr)     { return (instr >> 7) & 0x1F; }
inline uint32_t funct3(uint32_t instr) { return (instr >> 12) & 0x7; }
inline uint32_t rs1(uint32_t instr)    { return (instr >> 15) & 0x1F; }
inline uint32_t rs2(uint32_t instr)    { return (instr >> 20) & 0x1F; }
inline uint32_t funct7(uint32_t instr) { return (instr >> 25) & 0x7F; }
```
`inline` permite definir estas funciones en un header incluido por
varios `.cpp` sin error de "símbolo duplicado" en el linker.

`instr & 0x7F` — el opcode ya está en la posición más baja, solo hace
falta enmascarar (`0x7F` = 7 unos), sin shift.

`(instr >> 7) & 0x1F` — acá sí hace falta shift **y** máscara: primero
corrés los 5 bits de `rd` (que viven en `instr[11:7]`) hasta la posición
0, y después enmascarás con `0x1F` (5 unos) para tirar la basura que el
shift trajo desde `funct3` para arriba. Sin la máscara, `rd` tendría
basura en los bits 5+ y usarlo como índice de `regs[rd]` sería acceso
fuera de rango. Mismo patrón para `funct3`, `rs1`, `rs2`, `funct7`.

---

## 2. `immediates.h` — extracción de inmediatos por formato

Usa `sc_dt::sc_uint<N>::range()/bit()` en vez de shifts nativos sobre
`uint32_t` — convención del proyecto original, más cercana a cómo el
hardware real particiona el bus de instrucción.

```cpp
inline int32_t sign_extend(sc_dt::sc_uint<32> value, unsigned bits) {
    uint32_t shift = 32 - bits;
    return static_cast<int32_t>(value.to_uint() << shift) >> shift;
}
```
Truco estándar de sign-extend: shiftea el valor hasta que el bit de
signo del campo (por ejemplo el bit 11 de un inmediato de 12 bits) caiga
en el bit 31 de un entero de 32 bits, reinterpreta como `int32_t`, y
shiftea de vuelta a la derecha — como ahora el tipo tiene signo, ese
`>>` es *aritmético* en C++ (rellena con copias del bit de signo, no con
ceros), completando la extensión automáticamente.

**Ejemplo numérico** — `imm=0xFFC` (12 bits, valor decimal esperado -4):
1. `shift = 32-12 = 20`
2. `0xFFC << 20 = 0xFFC00000`
3. reinterpretado como `int32_t`: sigue siendo el mismo patrón de bits,
   pero ahora "negativo" porque el bit 31 es 1.
4. `0xFFC00000 >> 20` (aritmético) `= 0xFFFFFFFC = -4` ✓.

```cpp
inline int32_t get_imm_I(sc_dt::sc_uint<32> instr) {
    return sign_extend(instr.range(31, 20), 12);
}
```
I-type: el campo es un solo bloque contiguo `instr[31:20]`, por eso
`.range(31,20)` alcanza sin necesitar reordenar nada.

```cpp
inline int32_t get_imm_S(sc_dt::sc_uint<32> instr) {
    sc_dt::sc_uint<12> imm;
    imm.range(11, 5) = instr.range(31, 25);
    imm.range(4, 0)  = instr.range(11, 7);
    return sign_extend(imm, 12);
}
```
S-type: el inmediato está partido en dos porque RISC-V mantiene `rs1` y
`rs2` en la misma posición de bits en todos los formatos (R/I/S/B), así
el banco de registros se puede empezar a leer sin decodificar antes qué
tipo de instrucción es. El precio de esa simetría es que el inmediato
queda fragmentado: `imm[11:5]` vive en `instr[31:25]` (donde en R-type
estaría `funct7`), `imm[4:0]` vive en `instr[11:7]` (donde en R-type
estaría `rd` — S-type no tiene `rd` porque no escribe ningún registro).

`imm.range(11,5) = instr.range(31,25)` es una asignación de sub-rango a
sub-rango: literalmente "estos bits de imm son estos otros bits de
instr", la misma frase que usarías para describir el campo en el manual.

```cpp
inline int32_t get_imm_B(sc_dt::sc_uint<32> instr) {
    sc_dt::sc_uint<13> imm;
    imm.bit(12)      = instr.bit(31);
    imm.bit(11)      = instr.bit(7);
    imm.range(10, 5) = instr.range(30, 25);
    imm.range(4, 1)  = instr.range(11, 8);
    imm.bit(0)       = 0;
    return sign_extend(imm, 13);
}
```
B-type: igual que S-type pero **además reordenado**, no solo
fragmentado. El bit de signo de la instrucción (`instr[31]`) no cae en
la posición más alta natural del inmediato, sino en la posición 12; el
bit 7 de la instrucción (que en S-type era parte del campo bajo) acá es
el bit 11 del inmediato. `imm.bit(0)=0` es literal: el bit 0 de un
branch **nunca se guarda**, porque los saltos de branch siempre aterrizan
en direcciones pares — el formato "ahorra" ese bit y el rango efectivo
de salto es el doble de lo que ocuparían 12 bits reales.

**Ejemplo numérico completo** (bit a bit) — instrucción
`BEQ x1,x1,+8` codificada en `main.cpp` como `b_type(BEQ,1,1,8)`:

Encoding (S-type-like, `imm=8=0b0_0000_0000_1000` en 13 bits con signo):
```
imm[12]=0  imm[11]=0  imm[10:5]=000000  imm[4:1]=0100  imm[0]=0 (implícito)
```
Empaquetado en la instrucción:
```
instr[31]    = imm[12] = 0
instr[30:25] = imm[10:5] = 000000
instr[24:20] = rs2 = 1
instr[19:15] = rs1 = 1
instr[14:12] = funct3 = BEQ = 000
instr[11:8]  = imm[4:1] = 0100
instr[7]     = imm[11] = 0
instr[6:0]   = opcode = BRANCH = 1100011
```
Decode (`get_imm_B`) revierte exactamente este empaquetado:
```
imm.bit(12)      = instr.bit(31)      = 0
imm.bit(11)      = instr.bit(7)       = 0
imm.range(10,5)  = instr.range(30,25) = 000000
imm.range(4,1)   = instr.range(11,8)  = 0100
imm.bit(0)       = 0
```
Resultado: `imm = 0b0_0_000000_0100_0 = 8` ✓ — coincide con el `+8` que
se pidió al ensamblar.

```cpp
inline int32_t get_imm_U(sc_dt::sc_uint<32> instr) {
    sc_dt::sc_uint<32> imm = 0;
    imm.range(31, 12) = instr.range(31, 12);
    return static_cast<int32_t>(imm.to_uint());
}
```
U-type: el campo ya ocupa exactamente los 20 bits altos del resultado
final. **No pasa por `sign_extend`** porque no hay nada que extender —
los 12 bits bajos simplemente quedan en 0 por construcción (`imm` arranca
en 0 y solo se pisan los bits 31-12).

```cpp
inline int32_t get_imm_J(sc_dt::sc_uint<32> instr) {
    sc_dt::sc_uint<21> imm;
    imm.bit(20)       = instr.bit(31);
    imm.range(19, 12) = instr.range(19, 12);
    imm.bit(11)       = instr.bit(20);
    imm.range(10, 1)  = instr.range(30, 21);
    imm.bit(0)        = 0;
    return sign_extend(imm, 21);
}
```
Mismo patrón retorcido que B-type pero de 21 bits (rango de salto más
amplio: `JAL` es incondicional y suele necesitar alcanzar más lejos que
un branch). El ISA elige este reordenamiento específico para maximizar
cuántos bits coinciden posicionalmente entre B y J, simplificando el
hardware real de extracción (un multiplexor compartido puede resolver
varios de estos bits con la misma lógica en ambos formatos).

```cpp
inline uint32_t get_shamt(sc_dt::sc_uint<32> instr) {
    return instr.range(24, 20).to_uint();
}
```
Sin `sign_extend` porque una cantidad de shift nunca es negativa (0-31).
Son los mismos 5 bits que ocuparía la parte baja de un inmediato I-type,
pero para `SLLI/SRLI/SRAI` el ISA solo usa esos 5; los 7 bits de arriba
del campo de 12 se usan en cambio como una extensión de `funct7` (para
elegir entre SRLI y SRAI).

---

## 3. `fp_ops.h` — semántica de la extensión F

A diferencia de `immediates.h` (que extrae *campos de bits* de la
instrucción), este archivo resuelve *qué significan numéricamente* esos
campos una vez extraídos, específico de F: reinterpretación de bits
crudos como `float`, conversión entera↔flotante con saturación, y
clasificación IEEE-754. Separado de `processor.h` para que el `switch`
de decodificación no se llene de detalles de punto flotante que no
tienen que ver con decodificar.

```cpp
inline uint32_t float_to_bits(float f) {
    uint32_t u;
    std::memcpy(&u, &f, sizeof(u));
    return u;
}
inline float bits_to_float(uint32_t u) {
    float f;
    std::memcpy(&f, &u, sizeof(f));
    return f;
}
```
Esto es lo que en C se resolvía con una `union` o con un cast de
puntero (`*(uint32_t*)&f`) — ambas formas son *undefined behavior* en
C++ moderno por la regla de *strict aliasing* (el compilador puede
asumir que un `float*` y un `uint32_t*` nunca apuntan a la misma
memoria, y optimizar en base a esa suposición, rompiendo el programa de
formas sutiles). `std::memcpy` es la única forma **portable y bien
definida** de reinterpretar los mismos bits con otro tipo: copia bytes
crudos sin pasar por ninguna conversión numérica, y el compilador la
reconoce como patrón y la optimiza a "gratis" (normalmente termina
compilando a cero instrucciones extra, no a una copia real).

**Por qué hace falta esto en absoluto**: `FMV.X.W` (mueve un flotante a
un registro entero) y `FMV.W.X` (al revés) son movimientos de **bits
crudos**, no conversiones — `FMV.X.W` de `10.0f` da `0x41200000`, no
`10`. Si en su lugar hicieras `static_cast<uint32_t>(10.0f)`, C++ haría
una conversión *numérica* (truncando a `10`), que es una operación
completamente distinta (esa es la que hace `FCVT.W.S`, no `FMV.X.W`).
Lo mismo pasa al mandar/recibir un flotante por el Bus en `FLW`/`FSW`:
la memoria no sabe de `float`, solo mueve bytes — así que hay que
convertir el `float` a su patrón de bits antes de escribirlo, y
reinterpretar los bits leídos como `float` después.

```cpp
inline int32_t fcvt_w_s(float f) {
    if (std::isnan(f)) return 0x7FFFFFFF;
    if (f >= 2147483648.0f) return 0x7FFFFFFF;
    if (f <= -2147483648.0f) return static_cast<int32_t>(0x80000000);
    return static_cast<int32_t>(std::nearbyint(f));
}
```
`FCVT.W.S` (float → `int32_t`) no es un simple cast por dos motivos: en
C++, convertir un `float` fuera de rango a `int32_t` (por ejemplo
`(int32_t)1e20f`) es **undefined behavior** — el compilador puede hacer
literalmente cualquier cosa, no solo dar un resultado "raro"; y el
manual RISC-V exige un comportamiento específico y determinista para
esos casos: **saturar** al valor representable más cercano
(`INT32_MAX`/`INT32_MIN`) en vez de desbordar, y mapear `NaN` a
`INT32_MAX`. Por eso las tres guardas explícitas van *antes* del cast
real. `std::nearbyint(f)` redondea al entero más cercano usando el modo
de redondeo de punto flotante activo (por defecto, *round-to-nearest-
even* — coincide con el `rm=RNE` que el modelo asume siempre, ver
sección 1); es distinto de un cast directo, que trunca hacia cero en vez
de redondear.

```cpp
inline uint32_t fcvt_wu_s(float f) {
    if (std::isnan(f)) return 0xFFFFFFFF;
    if (f < 0.0f) return 0;
    if (f >= 4294967296.0f) return 0xFFFFFFFF;
    return static_cast<uint32_t>(std::nearbyint(f));
}
```
Mismo patrón para `FCVT.WU.S` (float → `uint32_t`), con sus propios
límites de saturación: no hay "mínimo negativo" (cualquier negativo
satura a `0`), y el máximo es `2^32-1` en vez de `2^31-1`.

```cpp
inline uint32_t fclass_s(float f) {
    uint32_t bits = float_to_bits(f);
    bool sign = (bits >> 31) & 0x1;

    switch (std::fpclassify(f)) {
        case FP_INFINITE:  return sign ? (1u << 0) : (1u << 7);
        case FP_NAN: {
            bool quiet = (bits >> 22) & 0x1;
            return quiet ? (1u << 9) : (1u << 8);
        }
        case FP_ZERO:      return sign ? (1u << 3) : (1u << 4);
        case FP_SUBNORMAL: return sign ? (1u << 2) : (1u << 5);
        case FP_NORMAL:
        default:           return sign ? (1u << 1) : (1u << 6);
    }
}
```
`FCLASS.S` no calcula nada numéricamente — solo *categoriza* el valor en
una de 10 clases IEEE-754 (infinito/normal/subnormal/cero, cada uno con
signo, más NaN señalizante/silencioso) y devuelve una máscara de un
único bit prendido (bit 0 a 9) indicando cuál. `std::fpclassify(f)` hace
la mayor parte del trabajo (distingue infinito/NaN/cero/subnormal/
normal usando los bits de exponente/mantisa internamente); lo único que
agrega esta función es el signo (que `fpclassify` no reporta) y, para el
caso NaN, distinguir señalizante de silencioso mirando a mano el bit más
alto de la mantisa (`bit 22` de un `float` de 32 bits: `1`=silencioso,
`0`=señalizante, por convención IEEE-754).

---

## 4. `rv32c_defs.h` — extensión C (comprimidas)

A diferencia de M (mismo opcode `OP`) y F (opcodes nuevos pero mismo
formato de 32 bits), C introduce instrucciones de **16 bits**. La
estrategia de este archivo es no duplicar nada de la lógica de
ejecución: `expand()` toma una instrucción comprimida y devuelve el
patrón de bits de su **instrucción de 32 bits equivalente**, que el
`switch` de `processor.h` ejecuta exactamente igual que si hubiera
llegado por fetch normal. Es literalmente lo que hacen muchos decoders
RVC reales.

```cpp
inline uint32_t creg(uint32_t r3) { return r3 + 8; }
```
Los campos comprimidos `rd'`/`rs1'`/`rs2'` son de solo 3 bits — la
extensión C limita esas instrucciones a referenciar únicamente
`x8`-`x15` ("los registros populares"), así que el valor crudo de 3
bits siempre necesita `+8` para convertirse en un índice real de
registro.

```cpp
inline uint32_t r_type(...); inline uint32_t i_type(...); // etc.
```
Reimplementación de los mismos encoders que `main.cpp::asmenc` — pero
acá viven en el decoder de verdad (`processor.h` los llama en
runtime), no solo en el ensamblador de prueba. Es la misma lógica
mecánica, solo que invocada por el propio core en vez de por el
testbench.

```cpp
constexpr uint32_t ILLEGAL = 0xFFFFFFFF;
```
Marcador deliberado para "comprimida no reconocida" — **no** es
`0x00000000`, porque esa es la convención de "fin de programa" en
`processor.h`. `0xFFFFFFFF` decodifica a un opcode inválido real
(`0x7F`), así que cae en el `default:` del switch principal e imprime
un error, en vez de confundirse con el halt silencioso de fin de
programa.

```cpp
inline uint32_t expand(uint16_t c) {
    uint32_t quadrant = c & 0x3;
    uint32_t funct3   = (c >> 13) & 0x7;
    if (quadrant == 0b00) { ... }
    if (quadrant == 0b01) { ... }
    if (quadrant == 0b10) { ... }
    return ILLEGAL;
}
```
Los 2 bits bajos (`quadrant`) más los 3 bits altos (`funct3`) son lo
primero que toda instrucción comprimida expone — juntos seleccionan de
cuál de las ~20 formas posibles se trata, igual que `opcode` selecciona
la familia en RV32I normal. Dentro de cada quadrante, cada `case`
extrae los campos con la misma técnica shift+máscara que
`rv32i_defs.h`, pero con un desafío extra: **los formatos comprimidos
reordenan los bits del inmediato** de forma mucho más agresiva que B/J
normales, para maximizar cuántos bits caen en la misma posición entre
instrucciones parecidas y así compartir hardware de extracción. Por
ejemplo, para `C.LW`/`C.SW`:

```cpp
uint32_t uimm = (((c >> 7) & 0x38)) | (((c << 1) & 0x40)) | (((c >> 4) & 0x4));
// uimm[5:3]=c[12:10] uimm[6]=c[5] uimm[2]=c[6]
```
Cada término aísla un pedazo del inmediato y lo reubica: `(c>>7)&0x38`
mueve `c[12:10]` a las posiciones `[5:3]` del resultado; `(c<<1)&0x40`
mueve `c[5]` a la posición `[6]`; `(c>>4)&0x4` mueve `c[6]` a la
posición `[2]`. El caso más retorcido de todos es `C.JAL`/`C.J`
(formato CJ, 11 bits de inmediato repartidos en un orden casi aleatorio
a simple vista) y `C.ADDI16SP` (con un bit de por medio marcando que
`rd` fijo es `x2`) — se verificaron **a mano, bit por bit**, contra el
formato estándar antes de confiar en ellos (y después contra la
ejecución real, ver más abajo).

### Cómo se verificó esto de verdad

No alcanza con "parece correcto" en un formato tan propenso a errores
de transcripción. Se generó un programa de prueba real (`main.cpp`,
sección 10) con instrucciones comprimidas para cada quadrante, se
corrió, y **la primera vez dio mal**: registros esperados como `111`,
`222`, `77`, `55`, `66` salían con valores como `-17`. La causa no era
un bug de bits — era un error de diseño del test: `C.LI`/`C.ADDI` solo
tienen un inmediato con signo de **6 bits** (`-32..31`), y esos
"valores marcadores" grandes se truncaban silenciosamente antes de
llegar siquiera a la lógica de expansión. Una vez corregidos los
valores de prueba a un rango válido, cada registro coincidió
exactamente con lo esperado — incluyendo un call/return real con
`C.JAL`/`C.JR`. La lección concreta: en RVC, antes de dudar del
decoder, hay que confirmar que el *encoder de prueba* respeta los
rangos de cada campo — son mucho más chicos que en RV32I normal.

---

## 5. `memory_map.h` — mapa de direcciones

```cpp
namespace memory_map {
constexpr uint32_t RAM_BASE = 0x00000000;
constexpr uint32_t RAM_SIZE = 64 * 1024; // 64KB

constexpr uint32_t RVV_BASE = 0x10000000;
constexpr uint32_t RVV_SIZE = 64 * 1024; // 64KB reservado, sin implementar
}
```
`64 * 1024` en vez de `65536`: dos formas del mismo número (el
compilador lo resuelve en compilación, costo cero), pero la primera deja
explícito "esto son 64 kibibytes" a simple vista.

`RVV_BASE/RVV_SIZE` — reservado, **nadie responde ahí todavía**: ni
`Bus::decode()` tiene un caso para este rango, ni hay ningún módulo
instanciado en esa dirección en `main.cpp`. Es documentación ejecutable:
cualquiera que vea `0x10000000` en el código sabe para qué está
reservado, sin tener que preguntar.

---

## 6. `memory.h` — el target final

```cpp
SC_MODULE(Memory) {
    tlm_utils::simple_target_socket<Memory, 32> socket;

    SC_CTOR(Memory) : socket("socket"), data(memory_map::RAM_SIZE, 0) {
        socket.register_b_transport(this, &Memory::b_transport);
    }
```
`simple_target_socket<Memory, 32>` — el `32` es el ancho de bus en bits;
`Memory` como parámetro de template le permite al socket guardar
internamente un puntero a método de esa clase específica.

`data(memory_map::RAM_SIZE, 0)` — inicializa `std::vector<uint8_t> data`
en la lista de inicialización con el constructor `(cantidad, valor)`:
65536 bytes, todos en 0, **antes** de que el objeto termine de
construirse (a diferencia de un `data.resize()` dentro del cuerpo, que
dejaría una ventana con `data` vacío).

`socket.register_b_transport(this, &Memory::b_transport)` — "cableado":
le dice al socket que reenvíe cualquier llamada `b_transport()` externa
a este método. `this` porque puede haber múltiples instancias de
`Memory`, cada una con su propio `data`; `&Memory::b_transport` es un
puntero a miembro (apunta al método en abstracto).

```cpp
void b_transport(tlm::tlm_generic_payload& trans, sc_time& delay) {
    tlm::tlm_command cmd = trans.get_command();
    sc_dt::uint64     addr = trans.get_address();
    unsigned char*    ptr  = trans.get_data_ptr();
    unsigned int       len  = trans.get_data_length();

    if (addr + len > data.size()) {
        trans.set_response_status(tlm::TLM_ADDRESS_ERROR_RESPONSE);
        return;
    }

    if (cmd == tlm::TLM_READ_COMMAND) {
        std::memcpy(ptr, &data[addr], len);
    } else if (cmd == tlm::TLM_WRITE_COMMAND) {
        std::memcpy(&data[addr], ptr, len);
    } else {
        trans.set_response_status(tlm::TLM_COMMAND_ERROR_RESPONSE);
        return;
    }

    trans.set_response_status(tlm::TLM_OK_RESPONSE);
    delay += sc_time(10, SC_NS);
}
```
Firma fija que exige TLM-2.0 para *blocking transport*: `trans` por
referencia no-const (se modifica: status de respuesta, y potencialmente
los datos), `delay` por referencia (se **suma** tiempo, no se reemplaza —
quien llama puede haber acumulado tiempo antes de llegar acá).

Chequeo de límites *antes* de tocar el vector: sin esto, un acceso mal
calculado causaría un `memcpy` fuera de los límites del `std::vector`,
comportamiento indefinido en C++.

La dirección del `memcpy` se invierte según el comando: en READ los
datos van *desde* la memoria interna *hacia* el payload (`ptr` es el
destino); en WRITE, al revés. `&data[addr]` es válido para cualquier
`addr` (no necesita estar alineado a 4) porque `std::vector` es
contiguo en memoria — de ahí sale gratis el soporte a accesos
desalineados.

`delay += sc_time(10, SC_NS)` — 10ns de latencia fija, arbitraria,
modelando "acceder a memoria toma tiempo" sin modelar un controlador de
DRAM real. El `+=` (no `=`) es importante: suma a lo que ya traía la
referencia.

---

## 7. `bus.h` — el router de direcciones

```cpp
tlm_utils::simple_target_socket<Bus, 32> cpu_target;
tlm_utils::simple_target_socket<Bus, 32> vector_target;
tlm_utils::simple_initiator_socket<Bus, 32> mem_initiator;
```
Dos roles: `cpu_target`/`vector_target` son *target* (el Bus recibe
llamadas ahí, son la "puerta de entrada" desde cada iniciador del
sistema); `mem_initiator` es *initiator* (el Bus hace la llamada desde
ahí, "puerta de salida" hacia cada periférico). El mismo módulo actúa
como target hacia arriba e initiator hacia abajo — la definición misma
de qué es un bus en TLM-2.0.

```cpp
SC_CTOR(Bus) : cpu_target("cpu_target"),
               vector_target("vector_target"),
               mem_initiator("mem_initiator") {
    cpu_target.register_b_transport(this, &Bus::b_transport);
    vector_target.register_b_transport(this, &Bus::b_transport);
}
```
Los tres sockets se nombran explícitamente (necesario: los sockets
tienen identidad jerárquica dentro de la simulación y necesitan un
nombre único dentro de su módulo padre). Los dos `register_b_transport`
apuntan al **mismo** método — el Bus no necesita ni quiere saber quién
llamó, ambos caminos convergen al mismo punto de entrada.

```cpp
void b_transport(tlm::tlm_generic_payload& trans, sc_time& delay) {
    decode(trans, delay);
}

void decode(tlm::tlm_generic_payload& trans, sc_time& delay) {
    sc_dt::uint64 global_addr = trans.get_address();

    if (global_addr >= memory_map::RAM_BASE &&
        global_addr < memory_map::RAM_BASE + memory_map::RAM_SIZE) {
        trans.set_address(global_addr - memory_map::RAM_BASE);
        mem_initiator->b_transport(trans, delay);
        return;
    }

    trans.set_response_status(tlm::TLM_ADDRESS_ERROR_RESPONSE);
}
```
`b_transport()` existe separado de `decode()` solo porque la firma que
exige `register_b_transport` tiene que ser exactamente esa; separar deja
el nombre `decode` como documentación de la responsabilidad real.

En `decode()`, `trans.get_address()` en este punto es la dirección
**global** tal como la puso el iniciador — el Bus todavía no tocó nada.
La condición de rango es `[BASE, BASE+SIZE)` con `<` estricto (correcto:
`BASE+SIZE` ya es la primera dirección fuera del rango).

`trans.set_address(global_addr - RAM_BASE)` es la traducción
global→local. Como `RAM_BASE=0`, numéricamente no cambia nada acá, pero
conceptualmente sí: si mañana la RAM se moviera a otra base, esta resta
sigue siendo correcta sin tocar `Memory`, que nunca vio ni le importó
`RAM_BASE` — solo recibe índices locales `0..RAM_SIZE-1`.

`mem_initiator->b_transport(...)` — la flecha `->` en un socket de
SystemC es *operator overloading*: el socket se comporta como si fuera
un puntero a la interfaz del otro lado, así que esta llamada termina en
lo que sea que esté *bindeado* ahí (en este sistema, `Memory`), sin que
el Bus sepa ni le importe la clase concreta.

`return;` corta ahí para no caer en el error de dirección de abajo — sin
este `return`, cada transacción válida terminaría también seteando
`TLM_ADDRESS_ERROR_RESPONSE` después de haber sido atendida
correctamente.

**Por qué agregar `vector_target` no tocó `decode()`**: la función nunca
mira *quién* llamó a `b_transport`, solo la dirección del payload — por
eso conectar un segundo initiator fue mecánicamente trivial, comparte la
misma tabla de rutas que ya usaba la CPU.

---

## 8. `processor.h` — la CPU

```cpp
std::array<uint32_t, 32> regs{};
uint32_t pc = 0;
bool halted = false;
sc_event finished;
```
`std::array` (tamaño fijo, en la pila) en vez de `std::vector`: 32 nunca
cambia en runtime, no hay motivo para pagar el costo de un vector
redimensionable. `{}` garantiza que los 32 elementos arrancan en `0`
(sin esto, quedarían con basura de memoria sin inicializar).

```cpp
void bus_access(tlm::tlm_command cmd, uint32_t addr, uint8_t* data, unsigned int len) {
    tlm::tlm_generic_payload trans;
    sc_time delay = SC_ZERO_TIME;

    trans.set_command(cmd);
    trans.set_address(addr);
    trans.set_data_ptr(data);
    trans.set_data_length(len);
    trans.set_streaming_width(len);
    trans.set_byte_enable_ptr(nullptr);
    trans.set_dmi_allowed(false);
    trans.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);

    init_socket->b_transport(trans, delay);
    wait(delay);

    if (trans.get_response_status() != tlm::TLM_OK_RESPONSE) {
        std::cerr << "[Processor] Error de bus en direccion 0x" << std::hex << addr << std::dec << std::endl;
        halted = true;
    }
}
```
Los 9 pasos clásicos de armar una transacción TLM-2.0: comando,
dirección, puntero de datos, longitud, streaming width, byte enable
(`nullptr` = sin máscara parcial, se transfieren los `len` bytes
completos), DMI (`false` = no permitir bypass directo a memoria, para
mantener siempre visible el camino de datos), status inicial
`TLM_INCOMPLETE_RESPONSE` (se sobreescribe abajo con el status real que
devuelva el target).

`wait(delay)` — recién acá el `SC_THREAD` de la CPU consume el tiempo
simulado que se fue acumulando en toda la cadena de llamadas anidadas
(Processor→Bus→Memory), patrón *loosely-timed*: el tiempo se "cobra" de
una sola vez al final, no en cada paso intermedio.

`std::hex`/`std::dec` son manipuladores de stream que **persisten**
después de la línea — por eso hay que volver explícitamente a `std::dec`
al final, si no cualquier otra parte del programa que imprima por
`std::cerr` después saldría también en hexadecimal sin que nadie lo
pidiera.

```cpp
void run() {
    while (!halted) {
        uint16_t half = fetch16(pc);

        if (half == 0) {
            halted = true;
            break;
        }

        uint32_t instr;
        uint32_t instr_size;
        if ((half & 0x3) != 0x3) {
            instr = rv32c::expand(half);
            instr_size = 2;
        } else {
            uint16_t half_hi = fetch16(pc + 2);
            instr = (static_cast<uint32_t>(half_hi) << 16) | half;
            instr_size = 4;
        }

        uint32_t opcode = rv32i::opcode(instr);
        uint32_t rd     = rv32i::rd(instr);
        uint32_t f3     = rv32i::funct3(instr);
        uint32_t rs1i   = rv32i::rs1(instr);
        uint32_t rs2i   = rv32i::rs2(instr);
        uint32_t f7     = rv32i::funct7(instr);

        uint32_t next_pc = pc + instr_size;

        int32_t r1 = static_cast<int32_t>(regs[rs1i]);
        int32_t r2 = static_cast<int32_t>(regs[rs2i]);
```
Este bloque cambió con la extensión C (antes hacía un `fetch()` fijo de
4 bytes). Ahora el fetch **siempre** empieza con un halfword de 16 bits
— sin asumir alineación a 4 bytes, porque una instrucción normal de 32
bits puede empezar en cualquier dirección PAR si la precede una
comprimida. `(half & 0x3) != 0x3` es exactamente el chequeo que exige el
ISA: los 2 bits bajos de *cualquier* instrucción (comprimida o no) dicen
cuál es — `11` siempre significa "instrucción de 32 bits", cualquier
otro valor significa "comprimida de 16 bits". Si es comprimida,
`rv32c::expand()` la traduce a su equivalente de 32 bits y el resto de
esta función ni se entera; si no, se fetchea el segundo halfword y se
arma la palabra completa (little-endian: el halfword bajo, `half`, va
en los bits bajos).

El `while (!halted)` es la salida "normal" (por error de bus). El
`if (half==0)` es la misma convención de siempre ("fin de programa"),
pero ahora se chequea sobre el **halfword crudo fetcheado**, no sobre la
instrucción ya expandida — `rv32c::expand()` nunca devuelve `0` para una
comprimida inválida (devuelve `rv32c::ILLEGAL = 0xFFFFFFFF`, que cae en
el `default:` de más abajo como error real), así que este chequeo sigue
significando exclusivamente "no hay más programa".

`next_pc = pc + instr_size` (antes era siempre `pc + 4`): cualquier
instrucción que no sea de control de flujo no toca `next_pc`, y el
`pc = next_pc` del final del bucle avanza 2 o 4 según corresponda. Los
casos que sí alteran el flujo (`BRANCH` tomado, `JAL`, `JALR`)
sobreescriben `next_pc` explícitamente — y ojo, `JAL`/`JALR` también
tuvieron que cambiar su cálculo de dirección de enlace de `pc + 4` a
`pc + instr_size`: un `C.JAL` comprimido enlaza a `pc + 2`, no `pc + 4`,
porque la instrucción siguiente empieza 2 bytes más adelante, no 4.

`r1`/`r2` se calculan siempre, para todas las instrucciones, aunque
algunas no los usen (p. ej. `LUI` no lee ningún registro fuente) —
simplicidad de código sobre micro-optimización. `static_cast<int32_t>`
no cambia ni un bit físicamente, solo le dice al compilador que
interprete esos bits con aritmética de signo (por eso
`regs[rs1i] < regs[rs2i]` da resultado distinto de `r1 < r2` cuando el
bit más alto está en 1).

### El bloque `OP` — donde vive la extensión M

```cpp
case rv32i::Opcode::OP: {
    uint32_t result = 0;

    if (f7 == rv32i::Funct7::MULDIV) {
        int64_t  r1_64  = static_cast<int64_t>(r1);
        int64_t  r2_64  = static_cast<int64_t>(r2);
        uint64_t u1_64  = static_cast<uint64_t>(regs[rs1i]);
        uint64_t u2_64  = static_cast<uint64_t>(regs[rs2i]);

        switch (f3) {
            case rv32i::Funct3_MULDIV::MUL:
                result = static_cast<uint32_t>(regs[rs1i] * regs[rs2i]);
                break;
            case rv32i::Funct3_MULDIV::MULH:
                result = static_cast<uint32_t>(static_cast<uint64_t>(r1_64 * r2_64) >> 32);
                break;
            case rv32i::Funct3_MULDIV::MULHSU:
                result = static_cast<uint32_t>(static_cast<uint64_t>(r1_64 * static_cast<int64_t>(u2_64)) >> 32);
                break;
            case rv32i::Funct3_MULDIV::MULHU:
                result = static_cast<uint32_t>((u1_64 * u2_64) >> 32);
                break;
            case rv32i::Funct3_MULDIV::DIV:
                if (r2 == 0) {
                    result = 0xFFFFFFFF; // division por cero: -1
                } else if (regs[rs1i] == 0x80000000 && r2 == -1) {
                    result = 0x80000000; // overflow: INT32_MIN / -1
                } else {
                    result = static_cast<uint32_t>(r1 / r2);
                }
                break;
            case rv32i::Funct3_MULDIV::DIVU:
                result = (regs[rs2i] == 0) ? 0xFFFFFFFF : (regs[rs1i] / regs[rs2i]);
                break;
            case rv32i::Funct3_MULDIV::REM:
                if (r2 == 0) {
                    result = regs[rs1i];
                } else if (regs[rs1i] == 0x80000000 && r2 == -1) {
                    result = 0;
                } else {
                    result = static_cast<uint32_t>(r1 % r2);
                }
                break;
            case rv32i::Funct3_MULDIV::REMU:
                result = (regs[rs2i] == 0) ? regs[rs1i] : (regs[rs1i] % regs[rs2i]);
                break;
        }
    } else {
        switch (f3) {
            // ... ALU base (ADD/SUB, SLL, SLT, SLTU, XOR, SRL/SRA, OR, AND) ...
        }
    }

    write_reg(rd, result);
    break;
}
```

El `if (f7 == Funct7::MULDIV)` es exactamente cómo un decodificador real
resuelve la ambigüedad de bits: primero mira `funct7`, y solo después
decide qué tabla de `funct3` aplica.

`r1_64`/`r2_64` (con signo) y `u1_64`/`u2_64` (sin signo) se preparan
**antes** del switch porque las 4 multiplicaciones difieren únicamente
en qué combinación de signo usan, no en la operación en sí.

- **`MUL`**: solo necesita los 32 bits bajos del producto, así que
  multiplica directo en `uint32_t` sin pasar por 64 bits — el resultado
  bajo es idéntico sea signed o unsigned (aritmética de complemento a 2).

- **`MULH`**: `r1_64 * r2_64` en `int64_t` (signed×signed). El
  `static_cast<uint64_t>` **antes** del `>>32` es crítico: shiftear un
  `int64_t` negativo a la derecha es aritmético en C++ (rellena con 1s
  por signo), que no es lo que querés cuando buscás "extraer los bits de
  arriba tal cual están" — reinterpretarlo como `uint64_t` primero hace
  que el shift sea lógico (rellena con 0), el que corresponde para
  extraer un campo de bits.

- **`MULHSU`**: el truco es `static_cast<int64_t>(u2_64)` — `rs2` sin
  signo se extiende primero a 64 bits *sin signo* (cero-extendido,
  siempre no-negativo), y recién ahí se convierte a `int64_t` — sigue
  siendo no-negativo porque cualquier `uint32_t` cabe en la mitad
  positiva de `int64_t`. Así el producto final tiene el signo correcto:
  negativo solo si `rs1` es negativo.

- **`MULHU`**: ambos operandos cero-extendidos a `uint64_t`,
  multiplicación pura sin signo.

- **`DIV`**: dos guardas antes de dividir. `r2==0` (división por cero →
  `0xFFFFFFFF = -1`, así lo exige el ISA, **sin trap**) y el caso de
  overflow `regs[rs1i]==0x80000000 && r2==-1` (`INT32_MIN / -1`
  desbordaría un `int32_t`, y en C++ eso es *undefined behavior* si se
  deja caer en la división real — por eso se intercepta antes y se
  devuelve `INT32_MIN` a mano, tal como especifica el manual RISC-V).

- **`REM`**: mismas dos guardas, pero devuelve el dividendo (división
  por cero) o `0` (overflow) en vez de `-1`/`INT32_MIN`.

- **`DIVU`/`REMU`**: más simples, solo hay un caso borde (`rs2==0`); no
  hay overflow posible porque todo es sin signo.

**Ejemplo numérico completo** — `DIV x8, x2, x3` con `x2=-100 (0xFFFFFF9C)`,
`x3=7`:

1. Encoding (`r_type`, ver sección 8): `opcode=OP=0x33`, `rd=8`,
   `funct3=DIV=0b100`, `rs1=2`, `rs2=3`, `funct7=MULDIV=0b0000001` →
   instrucción ensamblada = `0x02314433`.
2. Decode: `opcode=0x33` (OP), `f3=4` (DIV), `f7=1` (MULDIV) → entra al
   bloque M.
3. `r1=-100`, `r2=7`. `r2==0`? no. `regs[2]==0x80000000`? no (es
   `0xFFFFFF9C`). Cae al `else`: `r1/r2` trunca hacia cero:
   `-100/7 = -14.28... → -14`.
4. `static_cast<uint32_t>(-14) = 0xFFFFFFF2`.
5. `write_reg(8, 0xFFFFFFF2)` → `x8 = 0xfffffff2` (verificado contra
   Python: coincide).

**Ejemplo `MULH x5, x2, x3`** (mismos operandos):
1. `r1_64 * r2_64 = -700`. En complemento a 2 de 64 bits:
   `0xFFFFFFFF_FFFFFD44`.
2. `static_cast<uint64_t>(...)` reinterpreta esos mismos bits sin signo
   (no cambia nada físicamente).
3. `>> 32` (ahora lógico, sin signo) descarta los 32 bits bajos y deja
   `0xFFFFFFFF` en la mitad baja del resultado.
4. `static_cast<uint32_t>(...) = 0xFFFFFFFF` → `x5 = 0xffffffff` ✓.

### `JALR` — por qué el orden de las líneas importa

```cpp
case rv32i::Opcode::JALR: {
    int32_t imm = rv32i::get_imm_I(instr);
    uint32_t link = pc + 4;
    next_pc = (regs[rs1i] + imm) & ~static_cast<uint32_t>(1);
    write_reg(rd, link);
    break;
}
```
`link` se calcula en una variable separada **antes** de tocar `next_pc`,
y se escribe en `regs[rd]` recién en la última línea. El orden importa
porque si `rd == rs1i` (p. ej. `jalr x1, x1, 0`, patrón común de "volver
usando el mismo registro que tenía la dirección de retorno"), hace falta
leer `regs[rs1i]` para calcular `next_pc` **antes** de pisar ese mismo
registro con el valor de link. Como `write_reg` está después, este orden
queda garantizado sin importar si `rd` y `rs1i` coinciden.

`& ~static_cast<uint32_t>(1)` apaga el bit 0 del destino calculado
(`~1u = 0xFFFFFFFE`), tal como exige el ISA para `JALR`.

### `dump_regs()`

```cpp
void dump_regs() const {
    for (int i = 0; i < 32; ++i) {
        std::cout << "x" << i << "=0x" << std::hex << regs[i] << std::dec;
        std::cout << ((i == 31) ? "\n" : " ");
    }
}
```
`const` al final: promesa de que este método no modifica el estado del
`Processor` — documenta la intención de "solo lectura/inspección".

### Los 7 opcodes de la extensión F

```cpp
std::array<float, 32> fregs{};
```
Banco de registros separado del entero (`regs[]`) — `f0-f31`, cada uno
un `float` nativo de C++ de 32 bits (misma representación IEEE-754 de
simple precisión que exige el ISA, así que no hace falta ninguna capa de
conversión: la FPU nativa de la máquina que corre la simulación hace el
trabajo). **A diferencia de `x0`, `f0` no está cableado a cero** — el
ISA de punto flotante no reserva ningún registro fijo, así que no hay un
`write_freg()` que descarte escrituras al índice 0 (los flotantes se
escriben directo, `fregs[rd] = ...`).

```cpp
case rv32i::Opcode::LOAD_FP: {
    int32_t imm = rv32i::get_imm_I(instr);
    uint32_t addr = regs[rs1i] + imm;
    fregs[rd] = rv32i::bits_to_float(load(addr, 4));
    break;
}
case rv32i::Opcode::STORE_FP: {
    int32_t imm = rv32i::get_imm_S(instr);
    uint32_t addr = regs[rs1i] + imm;
    store(addr, rv32i::float_to_bits(fregs[rs2i]), 4);
    break;
}
```
`FLW`/`FSW` son mecánicamente idénticos a `LW`/`SW` (mismo `get_imm_I`/
`get_imm_S`, mismo `load()`/`store()` de 4 bytes vía el Bus — la memoria
no distingue "esto es un entero" de "esto es un flotante", son 4 bytes
igual) — la única diferencia es que la dirección de memoria **siempre**
sale de `regs[rs1i]` (un registro entero: `FLW`/`FSW` no tienen manera
de usar un registro flotante como base de dirección, eso no existiría
como concepto), y el dato en sí va hacia/desde `fregs[]` en vez de
`regs[]`, pasando por `bits_to_float`/`float_to_bits` para la
reinterpretación (sección 3).

```cpp
case rv32i::Opcode::FMADD: {
    uint32_t r3 = rv32i::rs3(instr);
    fregs[rd] = std::fma(fregs[rs1i], fregs[rs2i], fregs[r3]);
    break;
}
case rv32i::Opcode::FMSUB: {
    uint32_t r3 = rv32i::rs3(instr);
    fregs[rd] = std::fma(fregs[rs1i], fregs[rs2i], -fregs[r3]);
    break;
}
case rv32i::Opcode::FNMSUB: {
    uint32_t r3 = rv32i::rs3(instr);
    fregs[rd] = std::fma(-fregs[rs1i], fregs[rs2i], fregs[r3]);
    break;
}
case rv32i::Opcode::FNMADD: {
    uint32_t r3 = rv32i::rs3(instr);
    fregs[rd] = std::fma(-fregs[rs1i], fregs[rs2i], -fregs[r3]);
    break;
}
```
`std::fma(a,b,c)` calcula `(a×b)+c` con **un único redondeo final**, en
vez de redondear el producto `a×b` primero y sumar `c` después (que
sería lo que haría escribir `fregs[rs1i]*fregs[rs2i] + fregs[r3]` a
mano). Esa es literalmente la razón de ser de la instrucción `FMADD.S`
en el ISA: "fused" en *fused multiply-add* significa exactamente eso —
menos error de redondeo acumulado que hacer las dos operaciones por
separado, útil en productos punto (dot product), matrices, filtros
digitales. Las otras 3 variantes se obtienen invirtiendo el signo de uno
o ambos operandos antes de pasarlos a la misma `std::fma`: `FMSUB.S` es
`a×b - c`, que es `fma(a, b, -c)`; `FNMSUB.S` es `-(a×b) + c =
fma(-a,b,c)`; `FNMADD.S` es `-(a×b) - c = fma(-a,b,-c)` — cuatro
operaciones del ISA, una sola línea de C++ distinta entre ellas (qué
operando se niega).

```cpp
case rv32i::Opcode::OP_FP: {
    switch (f7) {
        case rv32i::Funct7_FP::FADD_S: fregs[rd] = fregs[rs1i] + fregs[rs2i]; break;
        case rv32i::Funct7_FP::FSUB_S: fregs[rd] = fregs[rs1i] - fregs[rs2i]; break;
        case rv32i::Funct7_FP::FMUL_S: fregs[rd] = fregs[rs1i] * fregs[rs2i]; break;
        case rv32i::Funct7_FP::FDIV_S: fregs[rd] = fregs[rs1i] / fregs[rs2i]; break;
        case rv32i::Funct7_FP::FSQRT_S: fregs[rd] = std::sqrt(fregs[rs1i]); break;
```
Las 5 operaciones aritméticas básicas son un mapeo directo a los
operadores nativos de C++ sobre `float` — no hace falta reimplementar
suma/resta/producto/cociente de punto flotante a mano, la FPU de la
máquina anfitriona ya lo hace correctamente en IEEE-754.

```cpp
        case rv32i::Funct7_FP::FSGNJ_S: {
            uint32_t a = rv32i::float_to_bits(fregs[rs1i]);
            uint32_t b = rv32i::float_to_bits(fregs[rs2i]);
            uint32_t sign = 0;
            switch (f3) {
                case rv32i::Funct3_FSGNJ::FSGNJ:  sign = b & 0x80000000; break;
                case rv32i::Funct3_FSGNJ::FSGNJN: sign = (~b) & 0x80000000; break;
                case rv32i::Funct3_FSGNJ::FSGNJX: sign = (a ^ b) & 0x80000000; break;
            }
            fregs[rd] = rv32i::bits_to_float((a & 0x7FFFFFFF) | sign);
            break;
        }
```
"Sign injection": toma la **magnitud** de `rs1` y el **signo** de una
combinación de `rs1`/`rs2`, operando directo sobre el patrón de bits (no
sobre el valor numérico) — por eso hace falta `float_to_bits` primero.
`a & 0x7FFFFFFF` apaga el bit 31 (el signo) de `rs1`, dejando solo la
magnitud; después se le pega el signo calculado con `|`. Las 3 variantes
solo difieren en de dónde sale ese signo: `FSGNJ` lo copia tal cual de
`rs2`; `FSGNJN` lo copia invertido (`~b`); `FSGNJX` es el XOR de ambos
signos (usado, entre otras cosas, para implementar `fabs`/`fneg`
combinando `rs1==rs2` de formas específicas, y para cambiar de signo
condicionalmente sin una instrucción de salto).

```cpp
        case rv32i::Funct7_FP::FMINMAX_S:
            if (f3 == rv32i::Funct3_FMINMAX::FMIN)
                fregs[rd] = std::fmin(fregs[rs1i], fregs[rs2i]);
            else
                fregs[rd] = std::fmax(fregs[rs1i], fregs[rs2i]);
            break;
```
`std::fmin`/`std::fmax` de `<cmath>`, no `std::min`/`std::max` de
`<algorithm>`: la diferencia importa con `NaN` — `std::min`/`std::max`
(pensados para tipos totalmente ordenables) dan un resultado no
especificado si cualquiera de los dos operandos es NaN, mientras que
`std::fmin`/`std::fmax` siguen la regla IEEE-754 de "si uno de los dos
es NaN, el resultado es el otro operando" (que es exactamente lo que
exige `FMIN.S`/`FMAX.S` del ISA).

```cpp
        case rv32i::Funct7_FP::FCMP_S: {
            uint32_t result = 0;
            switch (f3) {
                case rv32i::Funct3_FCMP::FLE: result = (fregs[rs1i] <= fregs[rs2i]) ? 1 : 0; break;
                case rv32i::Funct3_FCMP::FLT: result = (fregs[rs1i] <  fregs[rs2i]) ? 1 : 0; break;
                case rv32i::Funct3_FCMP::FEQ: result = (fregs[rs1i] == fregs[rs2i]) ? 1 : 0; break;
            }
            write_reg(rd, result);
            break;
        }
```
Los comparadores nativos de C++ (`<=`, `<`, `==`) sobre `float` ya
implementan la semántica IEEE-754 correcta con NaN: **cualquier**
comparación que involucre un NaN da `false` (incluso `NaN == NaN` es
`false`) — que es exactamente el comportamiento que exige el ISA para
`FLE.S`/`FLT.S`/`FEQ.S` con NaN, sin necesitar ningún chequeo especial.
Nota importante: `write_reg(rd, result)` (no `fregs[rd] = ...`) — las
comparaciones devuelven un entero (`0`/`1`) a un registro **entero**,
aunque los operandos que comparan sean flotantes.

```cpp
        case rv32i::Funct7_FP::FCVT_W_S: {
            uint32_t r2 = rv32i::rs2(instr); // reusado como selector W/WU
            uint32_t result = (r2 == rv32i::Rs2_FCVT::WU)
                                  ? rv32i::fcvt_wu_s(fregs[rs1i])
                                  : static_cast<uint32_t>(rv32i::fcvt_w_s(fregs[rs1i]));
            write_reg(rd, result);
            break;
        }

        case rv32i::Funct7_FP::FCVT_S_W: {
            uint32_t r2 = rv32i::rs2(instr); // reusado como selector W/WU
            fregs[rd] = (r2 == rv32i::Rs2_FCVT::WU)
                            ? static_cast<float>(regs[rs1i])
                            : static_cast<float>(static_cast<int32_t>(regs[rs1i]));
            break;
        }
```
`rv32i::rs2(instr)` — se llama al extractor genérico de `rs2` (el mismo
que usa cualquier R-type), pero el resultado **no** se usa como índice
de registro: en `FCVT.*`, la posición de bits que normalmente sería
`rs2` se reutiliza como un campo de 5 bits donde solo dos valores están
definidos (`W`/`WU`) — es una convención del ISA para no gastar un
opcode entero nuevo solo para distinguir signed/unsigned. `FCVT_S_W`
usa el cast de C++ directo (sin saturación): convertir un `int32_t`
cualquiera a `float` siempre es representable sin desbordar (el rango
de `float` es mucho más amplio que el de `int32_t`, aunque pierde
precisión para enteros grandes — eso es aceptable, es exactamente lo
que especifica el ISA).

```cpp
        case rv32i::Funct7_FP::FMV_X_W_FCLASS_S:
            if (f3 == rv32i::Funct3_FMV_FCLASS::FCLASS_S)
                write_reg(rd, rv32i::fclass_s(fregs[rs1i]));
            else
                write_reg(rd, rv32i::float_to_bits(fregs[rs1i]));
            break;

        case rv32i::Funct7_FP::FMV_W_X:
            fregs[rd] = rv32i::bits_to_float(regs[rs1i]);
            break;
    }
    break;
}
```
`FMV.X.W`/`FMV.W.X` mueven bits crudos entre bancos, sin conversión
numérica (motivo de ser de `float_to_bits`/`bits_to_float`, ver sección
3). `FCLASS.S` comparte el mismo `funct7` que `FMV.X.W` — ambas escriben
a un registro entero y ninguna toma `rs2` — y se distinguen solo por
`funct3`.

### `dump_fregs()`

```cpp
void dump_fregs() const {
    for (int i = 0; i < 32; ++i) {
        std::cout << "f" << i << "=" << fregs[i]
                   << "(0x" << std::hex << rv32i::float_to_bits(fregs[i]) << std::dec << ")";
        std::cout << ((i == 31) ? "\n" : " ");
    }
}
```
Imprime **ambas** representaciones a propósito: el valor decimal
(`fregs[i]`, formateo por defecto de `std::cout` para `float`) para
verificar el resultado a simple vista, y el patrón de bits en hex
(`float_to_bits`) para poder comparar exactamente contra una
herramienta externa (Python, por ejemplo) sin depender de cuántos
decimales decida imprimir el stream — dos floats pueden "verse iguales"
redondeados a 6 dígitos y tener bits distintos.

---

## 9. `vector_unit.h` — esqueleto RVV

```cpp
using VReg = std::array<uint8_t, VLEN_BYTES>;
std::array<VReg, NUM_VREGS> vregs{};
```
`using` define un alias de tipo (`VReg` en vez de escribir
`std::array<uint8_t,16>` repetidas veces) — puramente legibilidad, son
el mismo tipo para el compilador. `vregs` es un array de arrays: 32
registros de 16 bytes cada uno, 512 bytes de estado total, en el objeto
(sin heap).

```cpp
void vector_load_test(unsigned int vreg_idx, uint32_t addr) {
    bus_access(tlm::TLM_READ_COMMAND, addr, vregs[vreg_idx].data(), VLEN_BYTES);
}
```
`vregs[vreg_idx].data()` devuelve un puntero crudo al primer byte del
array interno — el destino exacto que pide `bus_access`. No hay copia
intermedia: el `memcpy` dentro de `Memory::b_transport` escribe
directamente sobre la memoria del `std::array`.

---

## 10. `main.cpp` — ensamblador de prueba e integración

**Cambio por la extensión C**: `build_test_program()` devolvía
`std::vector<uint32_t>` (un elemento = una instrucción de 32 bits). Con
comprimidas de por medio, eso ya no alcanza — el programa ahora es
`std::vector<uint8_t>`: todos los bloques RV32IMF existentes (probados y
sin tocar) se convierten a bytes little-endian al final, y recién ahí se
agrega el bloque de la extensión C usando `push16()` en vez de `push()`.
Esto también simplificó el cálculo de saltos dentro del bloque C: como
`bytes.size()` ya es una posición en bytes (no en palabras), los
offsets de `C.J`/`C.BEQZ`/`C.JAL` salen directos (`target - origin`),
sin el `*4` que hacía falta cuando todo eran palabras de 32 bits.

```cpp
namespace asmenc {
using namespace rv32i;

uint32_t r_type(uint32_t opcode, uint32_t rd, uint32_t f3, uint32_t rs1, uint32_t rs2, uint32_t f7) {
    return (f7 << 25) | (rs2 << 20) | (rs1 << 15) | (f3 << 12) | (rd << 7) | opcode;
}
```
`using namespace rv32i;` confinado a este namespace (no a nivel global
del archivo) para no arriesgar colisión de nombres en el resto de
`main.cpp`.

`r_type` es el espejo exacto, en dirección opuesta, de los extractores
de `rv32i_defs.h`: en vez de `(instr>>25)&0x7F` para *sacar* `funct7`,
acá es `f7<<25` para *ponerlo*. No valida que `f7` quepa en 7 bits — es
responsabilidad de quien llama, porque este es código de test, no parte
del modelo verificado.

```cpp
uint32_t MUL(uint32_t rd, uint32_t rs1, uint32_t rs2)    { return r_type(Opcode::OP, rd, Funct3_MULDIV::MUL, rs1, rs2, Funct7::MULDIV); }
uint32_t DIV(uint32_t rd, uint32_t rs1, uint32_t rs2)    { return r_type(Opcode::OP, rd, Funct3_MULDIV::DIV, rs1, rs2, Funct7::MULDIV); }
// ... y el resto de MULH/MULHSU/MULHU/DIVU/REM/REMU, mismo patrón
```
No hizo falta un encoder nuevo para M porque es R-type puro (dos
registros fuente, un destino, sin inmediato) — solo cambia qué
`funct3`/`funct7` se le pasan a `r_type`, que ya existía para la ALU
base.

### El "ensamblador de dos pasadas" para `JAL`/`JALR`

```cpp
size_t idx_jal   = p.size(); push(0); // placeholder: JAL x1, <func>
push(ADDI(31, 0, 7));                 // se ejecuta al volver
size_t idx_skip  = p.size(); push(0); // placeholder: JAL x0, <end_func>
size_t idx_func  = p.size(); push(ADDI(30, 0, 66)); // cuerpo de la "funcion"
push(JALR(0, 1, 0));                                 // retorna a x1
size_t idx_end_func = p.size();

p[idx_jal]  = JAL(1, static_cast<int32_t>((idx_func - idx_jal) * 4));
p[idx_skip] = JAL(0, static_cast<int32_t>((idx_end_func - idx_skip) * 4));
```
`p.size()` en el momento de cada `push` es literalmente el índice de
word donde cae esa instrucción (porque `p` es un `std::vector` al que
solo se le hace `push_back` en orden). Se guarda ese índice *antes* de
saber el offset real del salto, se escribe un `0` de relleno, se sigue
construyendo el resto del programa, y al final —cuando ya se conoce el
índice de destino— se vuelve atrás y se sobreescribe con el offset
correcto: `(idx_destino - idx_origen) * 4` (resta de índices de word,
×4 para convertir a offset de bytes).

### El bloque M en el programa de prueba

```cpp
push(ADDI(2, 0, -100));    // x2 = -100 (operando A)
push(ADDI(3, 0, 7));       // x3 = 7    (operando B)
push(MUL(4, 2, 3));        // x4  = MUL(-100,7)    = -700
push(MULH(5, 2, 3));       // x5  = MULH(-100,7)   = -1
push(MULHSU(6, 2, 3));     // x6  = MULHSU(-100,7) = -1
push(MULHU(7, 2, 3));      // x7  = MULHU(-100,7)  = 0x6
push(DIV(8, 2, 3));        // x8  = DIV(-100,7)    = -14
push(DIVU(9, 2, 3));       // x9  = DIVU(-100,7)   = 0x24924916
push(REM(10, 2, 3));       // x10 = REM(-100,7)    = -2
push(REMU(11, 2, 3));      // x11 = REMU(-100,7)   = 0x2

push(ADDI(12, 0, 0));      // x12 = 0 (divisor nulo, casos borde)
push(DIV(13, 2, 12));      // x13 = DIV(-100,0) = -1
push(REM(14, 2, 12));      // x14 = REM(-100,0) = -100

push(LUI(15, 0x80000));    // x15 = INT32_MIN
push(ADDI(16, 0, -1));     // x16 = -1
push(DIV(17, 15, 16));     // x17 = DIV(INT32_MIN,-1) = INT32_MIN (overflow, sin trap)
push(REM(18, 15, 16));     // x18 = REM(INT32_MIN,-1) = 0
```
Colocado **al final** del programa a propósito: así puede reutilizar
libremente registros de bloques anteriores (`x2..x18`) sin arriesgar que
un bloque posterior los pise y tape el resultado en el volcado final —
como es el último bloque, lo que queda en esos registros al terminar la
simulación es exactamente lo que escribió M.

### El bloque F en el programa de prueba

Va **después** del bloque M (ahora es el último), así que también puede
reutilizar libremente `x2..x13` — de hecho lo hace: `x5`, `x6`, `x7`,
`x8`, `x9` ya habían sido usados por M (`MULH`, `MULHSU`, `MULHU`,
`DIV`, `DIVU`) y quedan pisados con los resultados de las comparaciones/
conversiones de F, que es lo que se ve en el volcado final.

```cpp
push(ADDI(2, 0, 10));       // x2 = 10
push(FCVT_S_W(1, 2));       // f1 = 10.0
push(ADDI(3, 0, 3));        // x3 = 3
push(FCVT_S_W(2, 3));       // f2 = 3.0

push(FADD_S(3, 1, 2));      // f3 = 13.0
push(FSUB_S(4, 1, 2));      // f4 = 7.0
push(FMUL_S(5, 1, 2));      // f5 = 30.0
push(FDIV_S(6, 1, 2));      // f6 = 3.33333325 (10/3 en simple precision)
push(FSQRT_S(7, 5));        // f7 = sqrt(30) = 5.4772258
```
No hay forma de escribir un literal `float` directo en una instrucción
RV32 (no hay opcode "carga esta constante de 32 bits en un registro
flotante" — ni siquiera `LUI`/`ADDI` sirven, esos solo llenan registros
*enteros*). El único camino es: meter el valor en un registro entero con
`ADDI` y convertirlo con `FCVT.S.W` — el mismo camino que tomaría un
compilador real para materializar una constante de punto flotante que no
está ya precargada en `.rodata`.

```cpp
push(ADDI(4, 0, -1));       // x4 = -1
push(FCVT_S_W(11, 4));      // f11 = -1.0
push(FSGNJ_S(10, 1, 2));    // f10 = |f1| con signo de f2(+)  = +10.0
push(FSGNJN_S(12, 1, 11));  // f12 = |f1| con signo de -f11(-,invertido=+) = +10.0
push(FSGNJX_S(13, 1, 11));  // f13 = |f1| con signo(f1)^signo(f11) = +^- = -10.0
```
Se genera `f11=-1.0` específicamente para tener un operando negativo a
mano — todo lo demás en el bloque (`f1=10.0`, `f2=3.0`, etc.) es
positivo, y las 3 variantes de `FSGNJ` solo se diferencian quando el
signo de `rs2` efectivamente varía.

```cpp
push(LUI(12, 1));            // x12 = 0x1000
push(ADDI(12, 12, 0x10));    // x12 = 0x1010 (base test FLW/FSW)
push(FSW(12, 1, 0));         // mem[0x1010..13] = bits de f1 (10.0)
push(FLW(19, 12, 0));        // f19 = 10.0 (leido de vuelta desde RAM)
push(FEQ_S(13, 1, 19));      // x13 = 1 (round-trip por memoria preserva el bit pattern)
```
El test de round-trip por memoria (`FSW` seguido de `FLW` desde la misma
dirección, comparando con `FEQ.S` contra el original) es la prueba de
que `FLW`/`FSW` viajan por el Bus real (Processor→Bus→Memory) igual que
cualquier `LW`/`SW` — ver la traza de la sección siguiente, es
literalmente el mismo camino.

### El viaje completo de una transacción — `LW x21, 0(x19)`

Trazado end-to-end para ver el TLM real en acción (con
`regs[19]=0x1000`, y `mem[0x1000..0x1003]` ya con el valor `10`):

1. **Decode** en `processor.h`: `opcode=LOAD`, `f3=LW`, `rs1i=19`,
   `rd=21`, `imm=0` → `addr = regs[19] + 0 = 0x1000`.
2. `load(addr,4)` → `bus_access(TLM_READ_COMMAND, 0x1000, &value, 4)`.
3. Se arma el `tlm_generic_payload`: `address=0x1000` (**global**, la
   CPU no sabe nada de `RAM_BASE`), `data_length=4`.
4. `init_socket->b_transport(...)` — invoca `Bus::b_transport()` porque
   el socket de la CPU está *bindeado* a `bus.cpu_target` en `main.cpp`.
5. **`Bus::decode()`**: `0x1000` cae en `[RAM_BASE, RAM_BASE+RAM_SIZE)`
   → `trans.set_address(0x1000 - 0x0)` (sigue siendo `0x1000` porque
   `RAM_BASE=0`) → `mem_initiator->b_transport(...)`.
6. **`Memory::b_transport()`**: `addr=0x1000`, `len=4`,
   `0x1000+4 <= 65536` OK → `memcpy(ptr, &data[0x1000], 4)` →
   `TLM_OK_RESPONSE` → `delay += 10ns`.
7. Vuelve en cascada a `Processor::bus_access()`. Status OK, sin error.
8. `wait(delay)` — recién acá la CPU consume los 10ns.
9. `value = 0x0000000A`. `write_reg(21, 0x0000000A)` → `x21 = 0xa` ✓.

Esta misma cadena (pasos 3-7) es **idéntica** si en vez de la CPU fuera
la `VectorUnit` la que llamara `b_transport` desde `vector_target` — es
la prueba práctica de por qué agregar un segundo initiator al Bus no
requirió tocar `decode()`.

```cpp
std::memcpy(memory.data.data(), program.data(), program.size() * sizeof(uint32_t));
```
Precarga "backdoor" del programa en RAM, antes de `sc_start()` — la
única excepción documentada a "todo pasa por el Bus". Dos `.data()`
distintos: `memory.data` es `std::vector<uint8_t>` (`.data()` da
`uint8_t*`), `program` es `std::vector<uint32_t>` (`.data()` da
`uint32_t*`); `memcpy` no le importa el tipo, solo copia bytes crudos —
por eso se multiplica por `sizeof(uint32_t)` para pasar de "cantidad de
elementos" a "cantidad de bytes".

---

## Pendiente

- Explicación de por qué el orden de bits de B-type y J-type comparten
  tantas posiciones (mencionado brevemente arriba, se puede profundizar
  con una tabla lado a lado si hace falta).
- Extensión C — completa en `RV32IMFC_tlm` (ver sección 4), y también en
  `RV32IMFC_hls` con la limitación de alineación documentada en
  `RV32IMFC_hls/README.md`. El core es **RV32IMFC** en ambas pistas.
- No implementado dentro de F: `frm`/`fflags` (CSR de modo de redondeo y
  banderas de excepción — siempre se asume `rm=RNE`, sin trap ni flags
  de overflow/inexact/etc.), y las variantes de doble precisión (D)
  quedan fuera de alcance por ahora.
- Decoder de instrucciones RVV reales (`vadd.vv`, `vle32.v`, etc.) —
  `vector_unit.h` solo tiene el método de prueba `vector_load_test`.
- **Bare-metal**: para correr binarios reales compilados con un
  toolchain (`riscv32-unknown-elf-gcc`) faltan: loader de ELF (hoy el
  programa entra por un `memcpy` backdoor de un array armado a mano),
  `ECALL`/`EBREAK` (opcode `SYSTEM=0b1110011`, no implementado —
  necesario para syscalls/exit de cualquier runtime bare-metal),
  `FENCE` (no implementado), banco de CSRs (`mstatus`/`mtvec`/`mepc`/
  `mcause` — necesario si el `crt0` del toolchain configura el vector de
  trap), y al menos un periférico mapeado en memoria tipo UART (el Bus
  hoy solo rutea a RAM, no hay dónde escribir un `printf`).

## Pista de síntesis (`RV32IMFC_hls/`) — para Avance II

Aparte del modelo TLM (verificación funcional), hay un prototipo
sintetizable de **RV32IMFC** en `RV32IMFC_hls/` (Vitis HLS, maestro AXI4
Full, apuntando al Kria KV260) para obtener métricas reales de hardware
(utilización de recursos, frecuencia máxima) — requisito del Avance II
del curso. F se agregó el 2026-07-13 (banco `fregs[32]` como `float`
nativo de C++, sintetizable directo vía la librería de punto flotante de
Vitis HLS; `fp_ops.h` se copió tal cual desde el TLM porque ya era
portable). C se agregó el mismo día (`rv32c_defs.h` copiado tal cual —
ya era portable — y `rv32_core_step` ganó un puerto de salida
`instr_size`), con una limitación de alineación propia de esta pista
(distinta a la del TLM): acá una comprimida solo se reconoce si cae en
la mitad baja de un fetch de 32 bits ya alineado — el TLM sí soporta
cualquier alineación de 2 bytes porque su fetch es un acceso de bus real
de 16 bits. Solo RVV queda fuera de esta pista. Ver
`RV32IMFC_hls/README.md` para el detalle completo (alcance, limitaciones
conocidas, cómo correrlo, qué reportar). Pendiente: explicación
línea-por-línea de `RV32IMFC_hls/rv32_core.cpp` con el mismo nivel de
detalle que el resto de este documento — se hizo bajo presión de tiempo
(Avance II movido al 19/Julio) y quedó documentado solo a nivel de
comentarios en el código y el README de esa carpeta.
