// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module bd_0 (
  alu0_done,
  alu0_tag,
  alu1_done,
  alu1_tag,
  ap_clk,
  ap_rst_n,
  br_done,
  br_tag,
  commit_is_fp,
  commit_rd,
  commit_valid,
  commit_value,
  disp_pc,
  disp_tag,
  disp_valid,
  fpu_done,
  fpu_tag,
  halted,
  interrupt,
  lsu_done,
  lsu_tag,
  md_done,
  md_tag,
  reset,
  vec_done,
  vec_tag,
  dmem_PORTA_addr,
  dmem_PORTA_clk,
  dmem_PORTA_din,
  dmem_PORTA_dout,
  dmem_PORTA_en,
  dmem_PORTA_rst,
  dmem_PORTA_we,
  dmem_PORTB_addr,
  dmem_PORTB_clk,
  dmem_PORTB_din,
  dmem_PORTB_dout,
  dmem_PORTB_en,
  dmem_PORTB_rst,
  dmem_PORTB_we,
  imem_PORTA_addr,
  imem_PORTA_clk,
  imem_PORTA_din,
  imem_PORTA_dout,
  imem_PORTA_en,
  imem_PORTA_rst,
  imem_PORTA_we,
  imem_PORTB_addr,
  imem_PORTB_clk,
  imem_PORTB_din,
  imem_PORTB_dout,
  imem_PORTB_en,
  imem_PORTB_rst,
  imem_PORTB_we,
  s_axi_control_araddr,
  s_axi_control_arready,
  s_axi_control_arvalid,
  s_axi_control_awaddr,
  s_axi_control_awready,
  s_axi_control_awvalid,
  s_axi_control_bready,
  s_axi_control_bresp,
  s_axi_control_bvalid,
  s_axi_control_rdata,
  s_axi_control_rready,
  s_axi_control_rresp,
  s_axi_control_rvalid,
  s_axi_control_wdata,
  s_axi_control_wready,
  s_axi_control_wstrb,
  s_axi_control_wvalid,
  vregs_out_PORTA_addr,
  vregs_out_PORTA_clk,
  vregs_out_PORTA_din,
  vregs_out_PORTA_dout,
  vregs_out_PORTA_en,
  vregs_out_PORTA_rst,
  vregs_out_PORTA_we
);

  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALU0_DONE DATA" *)
  (* X_INTERFACE_MODE = "master DATA.ALU0_DONE" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALU0_DONE, LAYERED_METADATA undef" *)
  output [0:0]alu0_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALU0_TAG DATA" *)
  (* X_INTERFACE_MODE = "master DATA.ALU0_TAG" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALU0_TAG, LAYERED_METADATA undef" *)
  output [2:0]alu0_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALU1_DONE DATA" *)
  (* X_INTERFACE_MODE = "master DATA.ALU1_DONE" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALU1_DONE, LAYERED_METADATA undef" *)
  output [0:0]alu1_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALU1_TAG DATA" *)
  (* X_INTERFACE_MODE = "master DATA.ALU1_TAG" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALU1_TAG, LAYERED_METADATA undef" *)
  output [2:0]alu1_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.AP_CLK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, ASSOCIATED_BUSIF s_axi_control, ASSOCIATED_RESET ap_rst_n, INSERT_VIP 0" *)
  input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST" *)
  (* X_INTERFACE_MODE = "slave RST.AP_RST_N" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST_N, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BR_DONE DATA" *)
  (* X_INTERFACE_MODE = "master DATA.BR_DONE" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BR_DONE, LAYERED_METADATA undef" *)
  output [0:0]br_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BR_TAG DATA" *)
  (* X_INTERFACE_MODE = "master DATA.BR_TAG" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BR_TAG, LAYERED_METADATA undef" *)
  output [2:0]br_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMMIT_IS_FP DATA" *)
  (* X_INTERFACE_MODE = "master DATA.COMMIT_IS_FP" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMMIT_IS_FP, LAYERED_METADATA undef" *)
  output [0:0]commit_is_fp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMMIT_RD DATA" *)
  (* X_INTERFACE_MODE = "master DATA.COMMIT_RD" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMMIT_RD, LAYERED_METADATA undef" *)
  output [4:0]commit_rd;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMMIT_VALID DATA" *)
  (* X_INTERFACE_MODE = "master DATA.COMMIT_VALID" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMMIT_VALID, LAYERED_METADATA undef" *)
  output [0:0]commit_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMMIT_VALUE DATA" *)
  (* X_INTERFACE_MODE = "master DATA.COMMIT_VALUE" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMMIT_VALUE, LAYERED_METADATA undef" *)
  output [31:0]commit_value;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DISP_PC DATA" *)
  (* X_INTERFACE_MODE = "master DATA.DISP_PC" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DISP_PC, LAYERED_METADATA undef" *)
  output [31:0]disp_pc;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DISP_TAG DATA" *)
  (* X_INTERFACE_MODE = "master DATA.DISP_TAG" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DISP_TAG, LAYERED_METADATA undef" *)
  output [2:0]disp_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DISP_VALID DATA" *)
  (* X_INTERFACE_MODE = "master DATA.DISP_VALID" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DISP_VALID, LAYERED_METADATA undef" *)
  output [0:0]disp_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FPU_DONE DATA" *)
  (* X_INTERFACE_MODE = "master DATA.FPU_DONE" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FPU_DONE, LAYERED_METADATA undef" *)
  output [0:0]fpu_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FPU_TAG DATA" *)
  (* X_INTERFACE_MODE = "master DATA.FPU_TAG" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FPU_TAG, LAYERED_METADATA undef" *)
  output [2:0]fpu_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.HALTED DATA" *)
  (* X_INTERFACE_MODE = "master DATA.HALTED" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.HALTED, LAYERED_METADATA undef" *)
  output [0:0]halted;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT" *)
  (* X_INTERFACE_MODE = "master INTR.INTERRUPT" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
  output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LSU_DONE DATA" *)
  (* X_INTERFACE_MODE = "master DATA.LSU_DONE" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LSU_DONE, LAYERED_METADATA undef" *)
  output [0:0]lsu_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LSU_TAG DATA" *)
  (* X_INTERFACE_MODE = "master DATA.LSU_TAG" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LSU_TAG, LAYERED_METADATA undef" *)
  output [2:0]lsu_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.MD_DONE DATA" *)
  (* X_INTERFACE_MODE = "master DATA.MD_DONE" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.MD_DONE, LAYERED_METADATA undef" *)
  output [0:0]md_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.MD_TAG DATA" *)
  (* X_INTERFACE_MODE = "master DATA.MD_TAG" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.MD_TAG, LAYERED_METADATA undef" *)
  output [2:0]md_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESET DATA" *)
  (* X_INTERFACE_MODE = "slave DATA.RESET" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESET, LAYERED_METADATA undef" *)
  input [0:0]reset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VEC_DONE DATA" *)
  (* X_INTERFACE_MODE = "master DATA.VEC_DONE" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VEC_DONE, LAYERED_METADATA undef" *)
  output [0:0]vec_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VEC_TAG DATA" *)
  (* X_INTERFACE_MODE = "master DATA.VEC_TAG" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VEC_TAG, LAYERED_METADATA undef" *)
  output [2:0]vec_tag;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA ADDR" *)
  (* X_INTERFACE_MODE = "master dmem_PORTA" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dmem_PORTA, MEM_SIZE 256, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_LATENCY 1, MEM_ADDRESS_MODE BYTE_ADDRESS" *)
  output [31:0]dmem_PORTA_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA CLK" *)
  output dmem_PORTA_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA DIN" *)
  output [31:0]dmem_PORTA_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA DOUT" *)
  input [31:0]dmem_PORTA_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA EN" *)
  output dmem_PORTA_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA RST" *)
  output dmem_PORTA_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA WE" *)
  output [3:0]dmem_PORTA_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB ADDR" *)
  (* X_INTERFACE_MODE = "master dmem_PORTB" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dmem_PORTB, MEM_SIZE 256, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_LATENCY 1, MEM_ADDRESS_MODE BYTE_ADDRESS" *)
  output [31:0]dmem_PORTB_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB CLK" *)
  output dmem_PORTB_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB DIN" *)
  output [31:0]dmem_PORTB_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB DOUT" *)
  input [31:0]dmem_PORTB_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB EN" *)
  output dmem_PORTB_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB RST" *)
  output dmem_PORTB_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB WE" *)
  output [3:0]dmem_PORTB_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA ADDR" *)
  (* X_INTERFACE_MODE = "master imem_PORTA" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME imem_PORTA, MEM_SIZE 256, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_LATENCY 1, MEM_ADDRESS_MODE BYTE_ADDRESS" *)
  output [31:0]imem_PORTA_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA CLK" *)
  output imem_PORTA_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA DIN" *)
  output [31:0]imem_PORTA_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA DOUT" *)
  input [31:0]imem_PORTA_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA EN" *)
  output imem_PORTA_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA RST" *)
  output imem_PORTA_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA WE" *)
  output [3:0]imem_PORTA_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB ADDR" *)
  (* X_INTERFACE_MODE = "master imem_PORTB" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME imem_PORTB, MEM_SIZE 256, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_LATENCY 1, MEM_ADDRESS_MODE BYTE_ADDRESS" *)
  output [31:0]imem_PORTB_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB CLK" *)
  output imem_PORTB_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB DIN" *)
  output [31:0]imem_PORTB_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB DOUT" *)
  input [31:0]imem_PORTB_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB EN" *)
  output imem_PORTB_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB RST" *)
  output imem_PORTB_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB WE" *)
  output [3:0]imem_PORTB_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *)
  (* X_INTERFACE_MODE = "slave s_axi_control" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000.0, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
  input [3:0]s_axi_control_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *)
  output s_axi_control_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *)
  input s_axi_control_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *)
  input [3:0]s_axi_control_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *)
  output s_axi_control_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *)
  input s_axi_control_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *)
  input s_axi_control_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *)
  output [1:0]s_axi_control_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *)
  output s_axi_control_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *)
  output [31:0]s_axi_control_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *)
  input s_axi_control_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *)
  output [1:0]s_axi_control_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *)
  output s_axi_control_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *)
  input [31:0]s_axi_control_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *)
  output s_axi_control_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *)
  input [3:0]s_axi_control_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *)
  input s_axi_control_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA ADDR" *)
  (* X_INTERFACE_MODE = "master vregs_out_PORTA" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vregs_out_PORTA, MEM_SIZE 512, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_LATENCY 1, MEM_ADDRESS_MODE BYTE_ADDRESS" *)
  output [31:0]vregs_out_PORTA_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA CLK" *)
  output vregs_out_PORTA_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA DIN" *)
  output [31:0]vregs_out_PORTA_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA DOUT" *)
  input [31:0]vregs_out_PORTA_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA EN" *)
  output vregs_out_PORTA_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA RST" *)
  output vregs_out_PORTA_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA WE" *)
  output [3:0]vregs_out_PORTA_we;

  // stub module has no contents

endmodule
