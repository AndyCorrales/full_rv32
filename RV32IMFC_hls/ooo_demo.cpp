#include "ooo_demo.h"

// ---- parametros del demo (fijos a proposito, ver ooo_demo.h) ----
static const int ALU_LATENCY = 1;
static const int MUL_LATENCY = 4;
static const int PROGRAM_LEN = 3;

enum Unit { UNIT_ALU = 0, UNIT_MUL = 1 };

struct Instr {
    ap_uint<1>  unit;
    ap_uint<2>  dest;
    ap_uint<2>  src1;
    bool        src2_is_imm;
    ap_uint<2>  src2_reg;
    ap_uint<32> imm;
    ap_uint<1>  op; // ALU: 0=ADD, 1=SUB. MUL: sin uso (siempre multiplica).
};

// I0: R1 = R0 + 10 (ALU) | I1: R2 = R1 * R1 (MUL, depende de R1) |
// I2: R3 = R0 - 1 (ALU, independiente) -- ver comentario de cabecera en
// ooo_demo.h para la traza de ciclos esperada.
static const Instr PROGRAM[PROGRAM_LEN] = {
    { UNIT_ALU, 1, 0, true,  0, 10, 0 },
    { UNIT_MUL, 2, 1, false, 1, 0,  0 },
    { UNIT_ALU, 3, 0, true,  0, 1,  1 },
};

struct RatEntry {
    bool       has_tag;
    ap_uint<2> tag;
};

struct RobEntry {
    bool        valid;
    ap_uint<2>  dest;
    ap_uint<32> value;
    bool        ready;
};

struct RsEntry {
    bool        busy;
    bool        executing;
    ap_uint<3>  remaining;
    ap_uint<2>  dest_tag;
    bool        src1_ready;
    ap_uint<32> src1_val;
    ap_uint<2>  src1_tag;
    bool        src2_ready;
    ap_uint<32> src2_val;
    ap_uint<2>  src2_tag;
    ap_uint<1>  op;
};

// Resuelve el operando fuente `reg` en el momento del dispatch: si el RAT
// no tiene tag pendiente, el valor sale directo del regfile arquitectonico;
// si tiene tag, se hace bypass desde el ROB si ya esta listo (broadcast de
// este mismo ciclo o de uno anterior que nadie habia leido todavia), o se
// deja marcado como "esperando ese tag" si el ROB aun no lo calculo.
static void read_operand(
    ap_uint<2> reg, RatEntry rat[4], RobEntry rob[4], ap_uint<32> regfile[4],
    bool& ready, ap_uint<32>& val, ap_uint<2>& tag)
{
    if (!rat[reg].has_tag) {
        ready = true;
        val = regfile[reg];
        tag = 0;
        return;
    }
    ap_uint<2> t = rat[reg].tag;
    if (rob[t].ready) {
        ready = true;
        val = rob[t].value;
        tag = 0;
    } else {
        ready = false;
        val = 0;
        tag = t;
    }
}

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
    ap_uint<1>&  halted)
{
#pragma HLS INTERFACE ap_none port=reset
#pragma HLS INTERFACE ap_none port=r0_out
#pragma HLS INTERFACE ap_none port=r1_out
#pragma HLS INTERFACE ap_none port=r2_out
#pragma HLS INTERFACE ap_none port=r3_out
#pragma HLS INTERFACE ap_none port=commit_reg
#pragma HLS INTERFACE ap_none port=commit_valid
#pragma HLS INTERFACE ap_none port=alu_complete_tag
#pragma HLS INTERFACE ap_none port=alu_complete_valid
#pragma HLS INTERFACE ap_none port=mul_complete_tag
#pragma HLS INTERFACE ap_none port=mul_complete_valid
#pragma HLS INTERFACE ap_none port=halted
#pragma HLS INTERFACE s_axilite port=return bundle=control

    static ap_uint<32> regfile[4];
    static RatEntry     rat[4];
    static RobEntry     rob[4];
    static ap_uint<2>   rob_head, rob_tail;
    static ap_uint<3>   rob_count;
    static RsEntry      alu, mul;
    static ap_uint<2>   fetch_pc;

    if (reset) {
        for (int i = 0; i < 4; i++) {
            regfile[i] = 0;
            rat[i].has_tag = false;
            rat[i].tag = 0;
            rob[i].valid = false;
            rob[i].ready = false;
            rob[i].value = 0;
            rob[i].dest = 0;
        }
        regfile[0] = 5; // valor inicial de R0, unico registro "precargado"
        rob_head = 0; rob_tail = 0; rob_count = 0;
        alu.busy = false; alu.executing = false; alu.remaining = 0;
        mul.busy = false; mul.executing = false; mul.remaining = 0;
        fetch_pc = 0;

        r0_out = regfile[0]; r1_out = 0; r2_out = 0; r3_out = 0;
        commit_valid = 0; commit_reg = 0;
        alu_complete_valid = 0; alu_complete_tag = 0;
        mul_complete_valid = 0; mul_complete_tag = 0;
        halted = 0;
        return;
    }

    commit_valid = 0; commit_reg = 0;
    alu_complete_valid = 0; alu_complete_tag = 0;
    mul_complete_valid = 0; mul_complete_tag = 0;

    // ---- Etapa 1: commit (retiro en orden desde el head del ROB) ----
    if (rob_count > 0 && rob[rob_head].valid && rob[rob_head].ready) {
        ap_uint<2> dest = rob[rob_head].dest;
        regfile[dest] = rob[rob_head].value;
        // limpiar el RAT solo si sigue apuntando a esta entrada (no pisar
        // un renombrado mas nuevo hacia el mismo registro arquitectonico)
        if (rat[dest].has_tag && rat[dest].tag == rob_head) {
            rat[dest].has_tag = false;
        }
        rob[rob_head].valid = false;
        commit_valid = 1;
        commit_reg = dest;
        rob_head = rob_head + 1;
        rob_count = rob_count - 1;
    }

    // ---- Etapa 2: avance de ejecucion + broadcast por el CDB ----
    if (alu.busy && alu.executing) {
        if (alu.remaining > 0) alu.remaining = alu.remaining - 1;
        if (alu.remaining == 0) {
            ap_uint<32> result = (alu.op == 0)
                ? (ap_uint<32>)(alu.src1_val + alu.src2_val)
                : (ap_uint<32>)(alu.src1_val - alu.src2_val);
            rob[alu.dest_tag].value = result;
            rob[alu.dest_tag].ready = true;
            if (mul.busy && !mul.src1_ready && mul.src1_tag == alu.dest_tag) {
                mul.src1_ready = true; mul.src1_val = result;
            }
            if (mul.busy && !mul.src2_ready && mul.src2_tag == alu.dest_tag) {
                mul.src2_ready = true; mul.src2_val = result;
            }
            alu_complete_valid = 1;
            alu_complete_tag = alu.dest_tag;
            alu.busy = false;
            alu.executing = false;
        }
    }
    if (mul.busy && mul.executing) {
        if (mul.remaining > 0) mul.remaining = mul.remaining - 1;
        if (mul.remaining == 0) {
            ap_uint<32> result = (ap_uint<32>)(mul.src1_val * mul.src2_val);
            rob[mul.dest_tag].value = result;
            rob[mul.dest_tag].ready = true;
            if (alu.busy && !alu.src1_ready && alu.src1_tag == mul.dest_tag) {
                alu.src1_ready = true; alu.src1_val = result;
            }
            if (alu.busy && !alu.src2_ready && alu.src2_tag == mul.dest_tag) {
                alu.src2_ready = true; alu.src2_val = result;
            }
            mul_complete_valid = 1;
            mul_complete_tag = mul.dest_tag;
            mul.busy = false;
            mul.executing = false;
        }
    }

    // activar ejecucion en cuanto ambos operandos esten listos (puede ser
    // en el mismo ciclo del dispatch, o via el broadcast de arriba)
    if (alu.busy && !alu.executing && alu.src1_ready && alu.src2_ready) {
        alu.executing = true;
        alu.remaining = ALU_LATENCY - 1;
    }
    if (mul.busy && !mul.executing && mul.src1_ready && mul.src2_ready) {
        mul.executing = true;
        mul.remaining = MUL_LATENCY - 1;
    }

    // ---- Etapa 3: dispatch (1 instruccion por ciclo, en orden) ----
    if (fetch_pc < PROGRAM_LEN && rob_count < 4) {
        Instr ins = PROGRAM[fetch_pc];
        bool unit_free = (ins.unit == UNIT_ALU) ? !alu.busy : !mul.busy;
        if (unit_free) {
            ap_uint<2> new_tag = rob_tail;
            rob[new_tag].valid = true;
            rob[new_tag].dest = ins.dest;
            rob[new_tag].ready = false;
            rat[ins.dest].has_tag = true;
            rat[ins.dest].tag = new_tag;

            bool s1_ready; ap_uint<32> s1_val; ap_uint<2> s1_tag;
            read_operand(ins.src1, rat, rob, regfile, s1_ready, s1_val, s1_tag);

            bool s2_ready; ap_uint<32> s2_val; ap_uint<2> s2_tag;
            if (ins.src2_is_imm) {
                s2_ready = true; s2_val = ins.imm; s2_tag = 0;
            } else {
                read_operand(ins.src2_reg, rat, rob, regfile, s2_ready, s2_val, s2_tag);
            }

            RsEntry* rs = (ins.unit == UNIT_ALU) ? &alu : &mul;
            rs->busy = true;
            rs->executing = false;
            rs->dest_tag = new_tag;
            rs->src1_ready = s1_ready; rs->src1_val = s1_val; rs->src1_tag = s1_tag;
            rs->src2_ready = s2_ready; rs->src2_val = s2_val; rs->src2_tag = s2_tag;
            rs->op = ins.op;

            rob_tail = rob_tail + 1;
            rob_count = rob_count + 1;
            fetch_pc = fetch_pc + 1;
        }
    }

    halted = (fetch_pc >= PROGRAM_LEN && rob_count == 0) ? ap_uint<1>(1) : ap_uint<1>(0);

    r0_out = regfile[0];
    r1_out = regfile[1];
    r2_out = regfile[2];
    r3_out = regfile[3];
}
