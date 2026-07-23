// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of mem
//        bit 31~0 - mem[31:0] (Read/Write)
// 0x14 : Data signal of mem
//        bit 31~0 - mem[63:32] (Read/Write)
// 0x18 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_R_ADDR_MEM_DATA 0x10
#define CONTROL_R_BITS_MEM_DATA 64
