// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:rv32_ooo_tick:1.0
// IP Revision: 2114707547

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module bd_0_hls_inst_0 (
  s_axi_control_ARADDR,
  s_axi_control_ARREADY,
  s_axi_control_ARVALID,
  s_axi_control_AWADDR,
  s_axi_control_AWREADY,
  s_axi_control_AWVALID,
  s_axi_control_BREADY,
  s_axi_control_BRESP,
  s_axi_control_BVALID,
  s_axi_control_RDATA,
  s_axi_control_RREADY,
  s_axi_control_RRESP,
  s_axi_control_RVALID,
  s_axi_control_WDATA,
  s_axi_control_WREADY,
  s_axi_control_WSTRB,
  s_axi_control_WVALID,
  ap_clk,
  ap_rst_n,
  interrupt,
  reset,
  imem_Addr_A,
  imem_Clk_A,
  imem_Din_A,
  imem_Dout_A,
  imem_EN_A,
  imem_Rst_A,
  imem_WEN_A,
  imem_Addr_B,
  imem_Clk_B,
  imem_Din_B,
  imem_Dout_B,
  imem_EN_B,
  imem_Rst_B,
  imem_WEN_B,
  dmem_Addr_A,
  dmem_Clk_A,
  dmem_Din_A,
  dmem_Dout_A,
  dmem_EN_A,
  dmem_Rst_A,
  dmem_WEN_A,
  dmem_Addr_B,
  dmem_Clk_B,
  dmem_Din_B,
  dmem_Dout_B,
  dmem_EN_B,
  dmem_Rst_B,
  dmem_WEN_B,
  disp_valid,
  disp_tag,
  disp_pc,
  alu0_done,
  alu0_tag,
  alu1_done,
  alu1_tag,
  md_done,
  md_tag,
  fpu_done,
  fpu_tag,
  lsu_done,
  lsu_tag,
  br_done,
  br_tag,
  vec_done,
  vec_tag,
  commit_valid,
  commit_is_fp,
  commit_rd,
  commit_value,
  vregs_out_Addr_A,
  vregs_out_Clk_A,
  vregs_out_Din_A,
  vregs_out_Dout_A,
  vregs_out_EN_A,
  vregs_out_Rst_A,
  vregs_out_WEN_A,
  halted
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 4, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000.0, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, NUM_READ_THREADS 1, NUM_WRITE_THREAD\
S 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
input wire [3 : 0] s_axi_control_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *)
output wire s_axi_control_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *)
input wire s_axi_control_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *)
input wire [3 : 0] s_axi_control_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *)
output wire s_axi_control_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *)
input wire s_axi_control_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *)
input wire s_axi_control_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *)
output wire [1 : 0] s_axi_control_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *)
output wire s_axi_control_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *)
output wire [31 : 0] s_axi_control_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *)
input wire s_axi_control_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *)
output wire [1 : 0] s_axi_control_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *)
output wire s_axi_control_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *)
input wire [31 : 0] s_axi_control_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *)
output wire s_axi_control_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *)
input wire [3 : 0] s_axi_control_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *)
input wire s_axi_control_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_0_ap_clk_0, INSERT_VIP 0" *)
input wire ap_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
output wire interrupt;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 reset DATA" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, LAYERED_METADATA undef" *)
input wire [0 : 0] reset;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA ADDR" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME imem_PORTA, MASTER_TYPE BRAM_CTRL, MEM_SIZE 256, MEM_WIDTH 32, MEM_ADDRESS_MODE BYTE_ADDRESS, READ_LATENCY 1, MEM_ECC NONE" *)
output wire [31 : 0] imem_Addr_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA CLK" *)
output wire imem_Clk_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA DIN" *)
output wire [31 : 0] imem_Din_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA DOUT" *)
input wire [31 : 0] imem_Dout_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA EN" *)
output wire imem_EN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA RST" *)
output wire imem_Rst_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA WE" *)
output wire [3 : 0] imem_WEN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB ADDR" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME imem_PORTB, MASTER_TYPE BRAM_CTRL, MEM_SIZE 256, MEM_WIDTH 32, MEM_ADDRESS_MODE BYTE_ADDRESS, READ_LATENCY 1, MEM_ECC NONE" *)
output wire [31 : 0] imem_Addr_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB CLK" *)
output wire imem_Clk_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB DIN" *)
output wire [31 : 0] imem_Din_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB DOUT" *)
input wire [31 : 0] imem_Dout_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB EN" *)
output wire imem_EN_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB RST" *)
output wire imem_Rst_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB WE" *)
output wire [3 : 0] imem_WEN_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA ADDR" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dmem_PORTA, MASTER_TYPE BRAM_CTRL, MEM_SIZE 256, MEM_WIDTH 32, MEM_ADDRESS_MODE BYTE_ADDRESS, READ_LATENCY 1, MEM_ECC NONE" *)
output wire [31 : 0] dmem_Addr_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA CLK" *)
output wire dmem_Clk_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA DIN" *)
output wire [31 : 0] dmem_Din_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA DOUT" *)
input wire [31 : 0] dmem_Dout_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA EN" *)
output wire dmem_EN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA RST" *)
output wire dmem_Rst_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA WE" *)
output wire [3 : 0] dmem_WEN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB ADDR" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dmem_PORTB, MASTER_TYPE BRAM_CTRL, MEM_SIZE 256, MEM_WIDTH 32, MEM_ADDRESS_MODE BYTE_ADDRESS, READ_LATENCY 1, MEM_ECC NONE" *)
output wire [31 : 0] dmem_Addr_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB CLK" *)
output wire dmem_Clk_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB DIN" *)
output wire [31 : 0] dmem_Din_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB DOUT" *)
input wire [31 : 0] dmem_Dout_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB EN" *)
output wire dmem_EN_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB RST" *)
output wire dmem_Rst_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB WE" *)
output wire [3 : 0] dmem_WEN_B;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 disp_valid DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME disp_valid, LAYERED_METADATA undef" *)
output wire [0 : 0] disp_valid;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 disp_tag DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME disp_tag, LAYERED_METADATA undef" *)
output wire [2 : 0] disp_tag;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 disp_pc DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME disp_pc, LAYERED_METADATA undef" *)
output wire [31 : 0] disp_pc;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 alu0_done DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME alu0_done, LAYERED_METADATA undef" *)
output wire [0 : 0] alu0_done;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 alu0_tag DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME alu0_tag, LAYERED_METADATA undef" *)
output wire [2 : 0] alu0_tag;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 alu1_done DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME alu1_done, LAYERED_METADATA undef" *)
output wire [0 : 0] alu1_done;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 alu1_tag DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME alu1_tag, LAYERED_METADATA undef" *)
output wire [2 : 0] alu1_tag;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 md_done DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME md_done, LAYERED_METADATA undef" *)
output wire [0 : 0] md_done;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 md_tag DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME md_tag, LAYERED_METADATA undef" *)
output wire [2 : 0] md_tag;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fpu_done DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fpu_done, LAYERED_METADATA undef" *)
output wire [0 : 0] fpu_done;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 fpu_tag DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME fpu_tag, LAYERED_METADATA undef" *)
output wire [2 : 0] fpu_tag;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 lsu_done DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME lsu_done, LAYERED_METADATA undef" *)
output wire [0 : 0] lsu_done;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 lsu_tag DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME lsu_tag, LAYERED_METADATA undef" *)
output wire [2 : 0] lsu_tag;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 br_done DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME br_done, LAYERED_METADATA undef" *)
output wire [0 : 0] br_done;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 br_tag DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME br_tag, LAYERED_METADATA undef" *)
output wire [2 : 0] br_tag;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 vec_done DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vec_done, LAYERED_METADATA undef" *)
output wire [0 : 0] vec_done;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 vec_tag DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vec_tag, LAYERED_METADATA undef" *)
output wire [2 : 0] vec_tag;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 commit_valid DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME commit_valid, LAYERED_METADATA undef" *)
output wire [0 : 0] commit_valid;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 commit_is_fp DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME commit_is_fp, LAYERED_METADATA undef" *)
output wire [0 : 0] commit_is_fp;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 commit_rd DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME commit_rd, LAYERED_METADATA undef" *)
output wire [4 : 0] commit_rd;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 commit_value DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME commit_value, LAYERED_METADATA undef" *)
output wire [31 : 0] commit_value;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA ADDR" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vregs_out_PORTA, MASTER_TYPE BRAM_CTRL, MEM_SIZE 512, MEM_WIDTH 32, MEM_ADDRESS_MODE BYTE_ADDRESS, READ_LATENCY 1, MEM_ECC NONE" *)
output wire [31 : 0] vregs_out_Addr_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA CLK" *)
output wire vregs_out_Clk_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA DIN" *)
output wire [31 : 0] vregs_out_Din_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA DOUT" *)
input wire [31 : 0] vregs_out_Dout_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA EN" *)
output wire vregs_out_EN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA RST" *)
output wire vregs_out_Rst_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA WE" *)
output wire [3 : 0] vregs_out_WEN_A;
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 halted DATA" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME halted, LAYERED_METADATA undef" *)
output wire [0 : 0] halted;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SIM_INST = "" *)
  rv32_ooo_tick #(
    .C_S_AXI_CONTROL_ADDR_WIDTH(4),
    .C_S_AXI_CONTROL_DATA_WIDTH(32)
  ) inst (
    .s_axi_control_ARADDR(s_axi_control_ARADDR),
    .s_axi_control_ARREADY(s_axi_control_ARREADY),
    .s_axi_control_ARVALID(s_axi_control_ARVALID),
    .s_axi_control_AWADDR(s_axi_control_AWADDR),
    .s_axi_control_AWREADY(s_axi_control_AWREADY),
    .s_axi_control_AWVALID(s_axi_control_AWVALID),
    .s_axi_control_BREADY(s_axi_control_BREADY),
    .s_axi_control_BRESP(s_axi_control_BRESP),
    .s_axi_control_BVALID(s_axi_control_BVALID),
    .s_axi_control_RDATA(s_axi_control_RDATA),
    .s_axi_control_RREADY(s_axi_control_RREADY),
    .s_axi_control_RRESP(s_axi_control_RRESP),
    .s_axi_control_RVALID(s_axi_control_RVALID),
    .s_axi_control_WDATA(s_axi_control_WDATA),
    .s_axi_control_WREADY(s_axi_control_WREADY),
    .s_axi_control_WSTRB(s_axi_control_WSTRB),
    .s_axi_control_WVALID(s_axi_control_WVALID),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .interrupt(interrupt),
    .reset(reset),
    .imem_Addr_A(imem_Addr_A),
    .imem_Clk_A(imem_Clk_A),
    .imem_Din_A(imem_Din_A),
    .imem_Dout_A(imem_Dout_A),
    .imem_EN_A(imem_EN_A),
    .imem_Rst_A(imem_Rst_A),
    .imem_WEN_A(imem_WEN_A),
    .imem_Addr_B(imem_Addr_B),
    .imem_Clk_B(imem_Clk_B),
    .imem_Din_B(imem_Din_B),
    .imem_Dout_B(imem_Dout_B),
    .imem_EN_B(imem_EN_B),
    .imem_Rst_B(imem_Rst_B),
    .imem_WEN_B(imem_WEN_B),
    .dmem_Addr_A(dmem_Addr_A),
    .dmem_Clk_A(dmem_Clk_A),
    .dmem_Din_A(dmem_Din_A),
    .dmem_Dout_A(dmem_Dout_A),
    .dmem_EN_A(dmem_EN_A),
    .dmem_Rst_A(dmem_Rst_A),
    .dmem_WEN_A(dmem_WEN_A),
    .dmem_Addr_B(dmem_Addr_B),
    .dmem_Clk_B(dmem_Clk_B),
    .dmem_Din_B(dmem_Din_B),
    .dmem_Dout_B(dmem_Dout_B),
    .dmem_EN_B(dmem_EN_B),
    .dmem_Rst_B(dmem_Rst_B),
    .dmem_WEN_B(dmem_WEN_B),
    .disp_valid(disp_valid),
    .disp_tag(disp_tag),
    .disp_pc(disp_pc),
    .alu0_done(alu0_done),
    .alu0_tag(alu0_tag),
    .alu1_done(alu1_done),
    .alu1_tag(alu1_tag),
    .md_done(md_done),
    .md_tag(md_tag),
    .fpu_done(fpu_done),
    .fpu_tag(fpu_tag),
    .lsu_done(lsu_done),
    .lsu_tag(lsu_tag),
    .br_done(br_done),
    .br_tag(br_tag),
    .vec_done(vec_done),
    .vec_tag(vec_tag),
    .commit_valid(commit_valid),
    .commit_is_fp(commit_is_fp),
    .commit_rd(commit_rd),
    .commit_value(commit_value),
    .vregs_out_Addr_A(vregs_out_Addr_A),
    .vregs_out_Clk_A(vregs_out_Clk_A),
    .vregs_out_Din_A(vregs_out_Din_A),
    .vregs_out_Dout_A(vregs_out_Dout_A),
    .vregs_out_EN_A(vregs_out_EN_A),
    .vregs_out_Rst_A(vregs_out_Rst_A),
    .vregs_out_WEN_A(vregs_out_WEN_A),
    .halted(halted)
  );
endmodule
