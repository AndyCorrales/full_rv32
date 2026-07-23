// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Wed Jul 22 07:51:09 2026
// Host        : andy-ThinkPad-P53 running 64-bit Ubuntu 24.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xck26-sfvc784-2LV-c
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "bd_0_hls_inst_0,rv32_ooo_tick,{}" *) (* CORE_GENERATION_INFO = "bd_0_hls_inst_0,rv32_ooo_tick,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=rv32_ooo_tick,x_ipVersion=1.0,x_ipCoreRevision=2114707547,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_S_AXI_CONTROL_ADDR_WIDTH=4,C_S_AXI_CONTROL_DATA_WIDTH=32}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "HLS" *) (* X_CORE_INFO = "rv32_ooo_tick,Vivado 2024.2" *) (* hls_module = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_control_ARADDR, 
  s_axi_control_ARREADY, s_axi_control_ARVALID, s_axi_control_AWADDR, 
  s_axi_control_AWREADY, s_axi_control_AWVALID, s_axi_control_BREADY, 
  s_axi_control_BRESP, s_axi_control_BVALID, s_axi_control_RDATA, s_axi_control_RREADY, 
  s_axi_control_RRESP, s_axi_control_RVALID, s_axi_control_WDATA, s_axi_control_WREADY, 
  s_axi_control_WSTRB, s_axi_control_WVALID, ap_clk, ap_rst_n, interrupt, reset, imem_Addr_A, 
  imem_Clk_A, imem_Din_A, imem_Dout_A, imem_EN_A, imem_Rst_A, imem_WEN_A, imem_Addr_B, 
  imem_Clk_B, imem_Din_B, imem_Dout_B, imem_EN_B, imem_Rst_B, imem_WEN_B, dmem_Addr_A, 
  dmem_Clk_A, dmem_Din_A, dmem_Dout_A, dmem_EN_A, dmem_Rst_A, dmem_WEN_A, dmem_Addr_B, 
  dmem_Clk_B, dmem_Din_B, dmem_Dout_B, dmem_EN_B, dmem_Rst_B, dmem_WEN_B, disp_valid, disp_tag, 
  disp_pc, alu0_done, alu0_tag, alu1_done, alu1_tag, md_done, md_tag, fpu_done, fpu_tag, lsu_done, 
  lsu_tag, br_done, br_tag, vec_done, vec_tag, commit_valid, commit_is_fp, commit_rd, commit_value, 
  vregs_out_Addr_A, vregs_out_Clk_A, vregs_out_Din_A, vregs_out_Dout_A, vregs_out_EN_A, 
  vregs_out_Rst_A, vregs_out_WEN_A, halted)
/* synthesis syn_black_box black_box_pad_pin="s_axi_control_ARADDR[3:0],s_axi_control_ARREADY,s_axi_control_ARVALID,s_axi_control_AWADDR[3:0],s_axi_control_AWREADY,s_axi_control_AWVALID,s_axi_control_BREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_RDATA[31:0],s_axi_control_RREADY,s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_WDATA[31:0],s_axi_control_WREADY,s_axi_control_WSTRB[3:0],s_axi_control_WVALID,ap_rst_n,interrupt,reset[0:0],imem_Addr_A[31:0],imem_Din_A[31:0],imem_Dout_A[31:0],imem_EN_A,imem_Rst_A,imem_WEN_A[3:0],imem_Addr_B[31:0],imem_Din_B[31:0],imem_Dout_B[31:0],imem_EN_B,imem_Rst_B,imem_WEN_B[3:0],dmem_Addr_A[31:0],dmem_Din_A[31:0],dmem_Dout_A[31:0],dmem_EN_A,dmem_Rst_A,dmem_WEN_A[3:0],dmem_Addr_B[31:0],dmem_Din_B[31:0],dmem_Dout_B[31:0],dmem_EN_B,dmem_Rst_B,dmem_WEN_B[3:0],disp_valid[0:0],disp_tag[2:0],disp_pc[31:0],alu0_done[0:0],alu0_tag[2:0],alu1_done[0:0],alu1_tag[2:0],md_done[0:0],md_tag[2:0],fpu_done[0:0],fpu_tag[2:0],lsu_done[0:0],lsu_tag[2:0],br_done[0:0],br_tag[2:0],vec_done[0:0],vec_tag[2:0],commit_valid[0:0],commit_is_fp[0:0],commit_rd[4:0],commit_value[31:0],vregs_out_Addr_A[31:0],vregs_out_Din_A[31:0],vregs_out_Dout_A[31:0],vregs_out_EN_A,vregs_out_Rst_A,vregs_out_WEN_A[3:0],halted[0:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */
/* synthesis syn_force_seq_prim="imem_Clk_A" */
/* synthesis syn_force_seq_prim="imem_Clk_B" */
/* synthesis syn_force_seq_prim="dmem_Clk_A" */
/* synthesis syn_force_seq_prim="dmem_Clk_B" */
/* synthesis syn_force_seq_prim="vregs_out_Clk_A" */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 4, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000.0, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [3:0]s_axi_control_ARADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *) output s_axi_control_ARREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *) input s_axi_control_ARVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *) input [3:0]s_axi_control_AWADDR;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *) output s_axi_control_AWREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *) input s_axi_control_AWVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *) input s_axi_control_BREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *) output [1:0]s_axi_control_BRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *) output s_axi_control_BVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *) output [31:0]s_axi_control_RDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *) input s_axi_control_RREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *) output [1:0]s_axi_control_RRESP;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *) output s_axi_control_RVALID;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *) input [31:0]s_axi_control_WDATA;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *) output s_axi_control_WREADY;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *) input [3:0]s_axi_control_WSTRB;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *) input s_axi_control_WVALID;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *) input ap_clk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 reset DATA" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, LAYERED_METADATA undef" *) input [0:0]reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA ADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME imem_PORTA, MASTER_TYPE BRAM_CTRL, MEM_SIZE 256, MEM_WIDTH 32, MEM_ADDRESS_MODE BYTE_ADDRESS, READ_LATENCY 1, MEM_ECC NONE" *) output [31:0]imem_Addr_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA CLK" *) output imem_Clk_A /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA DIN" *) output [31:0]imem_Din_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA DOUT" *) input [31:0]imem_Dout_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA EN" *) output imem_EN_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA RST" *) output imem_Rst_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA WE" *) output [3:0]imem_WEN_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB ADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME imem_PORTB, MASTER_TYPE BRAM_CTRL, MEM_SIZE 256, MEM_WIDTH 32, MEM_ADDRESS_MODE BYTE_ADDRESS, READ_LATENCY 1, MEM_ECC NONE" *) output [31:0]imem_Addr_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB CLK" *) output imem_Clk_B /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB DIN" *) output [31:0]imem_Din_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB DOUT" *) input [31:0]imem_Dout_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB EN" *) output imem_EN_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB RST" *) output imem_Rst_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB WE" *) output [3:0]imem_WEN_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA ADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dmem_PORTA, MASTER_TYPE BRAM_CTRL, MEM_SIZE 256, MEM_WIDTH 32, MEM_ADDRESS_MODE BYTE_ADDRESS, READ_LATENCY 1, MEM_ECC NONE" *) output [31:0]dmem_Addr_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA CLK" *) output dmem_Clk_A /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA DIN" *) output [31:0]dmem_Din_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA DOUT" *) input [31:0]dmem_Dout_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA EN" *) output dmem_EN_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA RST" *) output dmem_Rst_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA WE" *) output [3:0]dmem_WEN_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB ADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dmem_PORTB, MASTER_TYPE BRAM_CTRL, MEM_SIZE 256, MEM_WIDTH 32, MEM_ADDRESS_MODE BYTE_ADDRESS, READ_LATENCY 1, MEM_ECC NONE" *) output [31:0]dmem_Addr_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB CLK" *) output dmem_Clk_B /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB DIN" *) output [31:0]dmem_Din_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB DOUT" *) input [31:0]dmem_Dout_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB EN" *) output dmem_EN_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB RST" *) output dmem_Rst_B;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB WE" *) output [3:0]dmem_WEN_B;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 disp_valid DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME disp_valid, LAYERED_METADATA undef" *) output [0:0]disp_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 disp_tag DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME disp_tag, LAYERED_METADATA undef" *) output [2:0]disp_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 disp_pc DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME disp_pc, LAYERED_METADATA undef" *) output [31:0]disp_pc;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 alu0_done DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME alu0_done, LAYERED_METADATA undef" *) output [0:0]alu0_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 alu0_tag DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME alu0_tag, LAYERED_METADATA undef" *) output [2:0]alu0_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 alu1_done DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME alu1_done, LAYERED_METADATA undef" *) output [0:0]alu1_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 alu1_tag DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME alu1_tag, LAYERED_METADATA undef" *) output [2:0]alu1_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 md_done DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME md_done, LAYERED_METADATA undef" *) output [0:0]md_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 md_tag DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME md_tag, LAYERED_METADATA undef" *) output [2:0]md_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fpu_done DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fpu_done, LAYERED_METADATA undef" *) output [0:0]fpu_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fpu_tag DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fpu_tag, LAYERED_METADATA undef" *) output [2:0]fpu_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 lsu_done DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME lsu_done, LAYERED_METADATA undef" *) output [0:0]lsu_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 lsu_tag DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME lsu_tag, LAYERED_METADATA undef" *) output [2:0]lsu_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 br_done DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME br_done, LAYERED_METADATA undef" *) output [0:0]br_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 br_tag DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME br_tag, LAYERED_METADATA undef" *) output [2:0]br_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 vec_done DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vec_done, LAYERED_METADATA undef" *) output [0:0]vec_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 vec_tag DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vec_tag, LAYERED_METADATA undef" *) output [2:0]vec_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 commit_valid DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME commit_valid, LAYERED_METADATA undef" *) output [0:0]commit_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 commit_is_fp DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME commit_is_fp, LAYERED_METADATA undef" *) output [0:0]commit_is_fp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 commit_rd DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME commit_rd, LAYERED_METADATA undef" *) output [4:0]commit_rd;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 commit_value DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME commit_value, LAYERED_METADATA undef" *) output [31:0]commit_value;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA ADDR" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vregs_out_PORTA, MASTER_TYPE BRAM_CTRL, MEM_SIZE 512, MEM_WIDTH 32, MEM_ADDRESS_MODE BYTE_ADDRESS, READ_LATENCY 1, MEM_ECC NONE" *) output [31:0]vregs_out_Addr_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA CLK" *) output vregs_out_Clk_A /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA DIN" *) output [31:0]vregs_out_Din_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA DOUT" *) input [31:0]vregs_out_Dout_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA EN" *) output vregs_out_EN_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA RST" *) output vregs_out_Rst_A;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA WE" *) output [3:0]vregs_out_WEN_A;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 halted DATA" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME halted, LAYERED_METADATA undef" *) output [0:0]halted;
endmodule
