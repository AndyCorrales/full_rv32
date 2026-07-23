//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Wed Jul 22 07:48:32 2026
//Host        : andy-ThinkPad-P53 running 64-bit Ubuntu 24.04.4 LTS
//Command     : generate_target bd_0_wrapper.bd
//Design      : bd_0_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_0_wrapper
   (alu0_done,
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
    fpu_done,
    fpu_tag,
    halted,
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
    interrupt,
    lsu_done,
    lsu_tag,
    md_done,
    md_tag,
    reset,
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
    vec_done,
    vec_tag,
    vregs_out_PORTA_addr,
    vregs_out_PORTA_clk,
    vregs_out_PORTA_din,
    vregs_out_PORTA_dout,
    vregs_out_PORTA_en,
    vregs_out_PORTA_rst,
    vregs_out_PORTA_we);
  output [0:0]alu0_done;
  output [2:0]alu0_tag;
  output [0:0]alu1_done;
  output [2:0]alu1_tag;
  input ap_clk;
  input ap_rst_n;
  output [0:0]br_done;
  output [2:0]br_tag;
  output [0:0]commit_is_fp;
  output [4:0]commit_rd;
  output [0:0]commit_valid;
  output [31:0]commit_value;
  output [31:0]disp_pc;
  output [2:0]disp_tag;
  output [0:0]disp_valid;
  output [31:0]dmem_PORTA_addr;
  output dmem_PORTA_clk;
  output [31:0]dmem_PORTA_din;
  input [31:0]dmem_PORTA_dout;
  output dmem_PORTA_en;
  output dmem_PORTA_rst;
  output [3:0]dmem_PORTA_we;
  output [31:0]dmem_PORTB_addr;
  output dmem_PORTB_clk;
  output [31:0]dmem_PORTB_din;
  input [31:0]dmem_PORTB_dout;
  output dmem_PORTB_en;
  output dmem_PORTB_rst;
  output [3:0]dmem_PORTB_we;
  output [0:0]fpu_done;
  output [2:0]fpu_tag;
  output [0:0]halted;
  output [31:0]imem_PORTA_addr;
  output imem_PORTA_clk;
  output [31:0]imem_PORTA_din;
  input [31:0]imem_PORTA_dout;
  output imem_PORTA_en;
  output imem_PORTA_rst;
  output [3:0]imem_PORTA_we;
  output [31:0]imem_PORTB_addr;
  output imem_PORTB_clk;
  output [31:0]imem_PORTB_din;
  input [31:0]imem_PORTB_dout;
  output imem_PORTB_en;
  output imem_PORTB_rst;
  output [3:0]imem_PORTB_we;
  output interrupt;
  output [0:0]lsu_done;
  output [2:0]lsu_tag;
  output [0:0]md_done;
  output [2:0]md_tag;
  input [0:0]reset;
  input [3:0]s_axi_control_araddr;
  output s_axi_control_arready;
  input s_axi_control_arvalid;
  input [3:0]s_axi_control_awaddr;
  output s_axi_control_awready;
  input s_axi_control_awvalid;
  input s_axi_control_bready;
  output [1:0]s_axi_control_bresp;
  output s_axi_control_bvalid;
  output [31:0]s_axi_control_rdata;
  input s_axi_control_rready;
  output [1:0]s_axi_control_rresp;
  output s_axi_control_rvalid;
  input [31:0]s_axi_control_wdata;
  output s_axi_control_wready;
  input [3:0]s_axi_control_wstrb;
  input s_axi_control_wvalid;
  output [0:0]vec_done;
  output [2:0]vec_tag;
  output [31:0]vregs_out_PORTA_addr;
  output vregs_out_PORTA_clk;
  output [31:0]vregs_out_PORTA_din;
  input [31:0]vregs_out_PORTA_dout;
  output vregs_out_PORTA_en;
  output vregs_out_PORTA_rst;
  output [3:0]vregs_out_PORTA_we;

  wire [0:0]alu0_done;
  wire [2:0]alu0_tag;
  wire [0:0]alu1_done;
  wire [2:0]alu1_tag;
  wire ap_clk;
  wire ap_rst_n;
  wire [0:0]br_done;
  wire [2:0]br_tag;
  wire [0:0]commit_is_fp;
  wire [4:0]commit_rd;
  wire [0:0]commit_valid;
  wire [31:0]commit_value;
  wire [31:0]disp_pc;
  wire [2:0]disp_tag;
  wire [0:0]disp_valid;
  wire [31:0]dmem_PORTA_addr;
  wire dmem_PORTA_clk;
  wire [31:0]dmem_PORTA_din;
  wire [31:0]dmem_PORTA_dout;
  wire dmem_PORTA_en;
  wire dmem_PORTA_rst;
  wire [3:0]dmem_PORTA_we;
  wire [31:0]dmem_PORTB_addr;
  wire dmem_PORTB_clk;
  wire [31:0]dmem_PORTB_din;
  wire [31:0]dmem_PORTB_dout;
  wire dmem_PORTB_en;
  wire dmem_PORTB_rst;
  wire [3:0]dmem_PORTB_we;
  wire [0:0]fpu_done;
  wire [2:0]fpu_tag;
  wire [0:0]halted;
  wire [31:0]imem_PORTA_addr;
  wire imem_PORTA_clk;
  wire [31:0]imem_PORTA_din;
  wire [31:0]imem_PORTA_dout;
  wire imem_PORTA_en;
  wire imem_PORTA_rst;
  wire [3:0]imem_PORTA_we;
  wire [31:0]imem_PORTB_addr;
  wire imem_PORTB_clk;
  wire [31:0]imem_PORTB_din;
  wire [31:0]imem_PORTB_dout;
  wire imem_PORTB_en;
  wire imem_PORTB_rst;
  wire [3:0]imem_PORTB_we;
  wire interrupt;
  wire [0:0]lsu_done;
  wire [2:0]lsu_tag;
  wire [0:0]md_done;
  wire [2:0]md_tag;
  wire [0:0]reset;
  wire [3:0]s_axi_control_araddr;
  wire s_axi_control_arready;
  wire s_axi_control_arvalid;
  wire [3:0]s_axi_control_awaddr;
  wire s_axi_control_awready;
  wire s_axi_control_awvalid;
  wire s_axi_control_bready;
  wire [1:0]s_axi_control_bresp;
  wire s_axi_control_bvalid;
  wire [31:0]s_axi_control_rdata;
  wire s_axi_control_rready;
  wire [1:0]s_axi_control_rresp;
  wire s_axi_control_rvalid;
  wire [31:0]s_axi_control_wdata;
  wire s_axi_control_wready;
  wire [3:0]s_axi_control_wstrb;
  wire s_axi_control_wvalid;
  wire [0:0]vec_done;
  wire [2:0]vec_tag;
  wire [31:0]vregs_out_PORTA_addr;
  wire vregs_out_PORTA_clk;
  wire [31:0]vregs_out_PORTA_din;
  wire [31:0]vregs_out_PORTA_dout;
  wire vregs_out_PORTA_en;
  wire vregs_out_PORTA_rst;
  wire [3:0]vregs_out_PORTA_we;

  bd_0 bd_0_i
       (.alu0_done(alu0_done),
        .alu0_tag(alu0_tag),
        .alu1_done(alu1_done),
        .alu1_tag(alu1_tag),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .br_done(br_done),
        .br_tag(br_tag),
        .commit_is_fp(commit_is_fp),
        .commit_rd(commit_rd),
        .commit_valid(commit_valid),
        .commit_value(commit_value),
        .disp_pc(disp_pc),
        .disp_tag(disp_tag),
        .disp_valid(disp_valid),
        .dmem_PORTA_addr(dmem_PORTA_addr),
        .dmem_PORTA_clk(dmem_PORTA_clk),
        .dmem_PORTA_din(dmem_PORTA_din),
        .dmem_PORTA_dout(dmem_PORTA_dout),
        .dmem_PORTA_en(dmem_PORTA_en),
        .dmem_PORTA_rst(dmem_PORTA_rst),
        .dmem_PORTA_we(dmem_PORTA_we),
        .dmem_PORTB_addr(dmem_PORTB_addr),
        .dmem_PORTB_clk(dmem_PORTB_clk),
        .dmem_PORTB_din(dmem_PORTB_din),
        .dmem_PORTB_dout(dmem_PORTB_dout),
        .dmem_PORTB_en(dmem_PORTB_en),
        .dmem_PORTB_rst(dmem_PORTB_rst),
        .dmem_PORTB_we(dmem_PORTB_we),
        .fpu_done(fpu_done),
        .fpu_tag(fpu_tag),
        .halted(halted),
        .imem_PORTA_addr(imem_PORTA_addr),
        .imem_PORTA_clk(imem_PORTA_clk),
        .imem_PORTA_din(imem_PORTA_din),
        .imem_PORTA_dout(imem_PORTA_dout),
        .imem_PORTA_en(imem_PORTA_en),
        .imem_PORTA_rst(imem_PORTA_rst),
        .imem_PORTA_we(imem_PORTA_we),
        .imem_PORTB_addr(imem_PORTB_addr),
        .imem_PORTB_clk(imem_PORTB_clk),
        .imem_PORTB_din(imem_PORTB_din),
        .imem_PORTB_dout(imem_PORTB_dout),
        .imem_PORTB_en(imem_PORTB_en),
        .imem_PORTB_rst(imem_PORTB_rst),
        .imem_PORTB_we(imem_PORTB_we),
        .interrupt(interrupt),
        .lsu_done(lsu_done),
        .lsu_tag(lsu_tag),
        .md_done(md_done),
        .md_tag(md_tag),
        .reset(reset),
        .s_axi_control_araddr(s_axi_control_araddr),
        .s_axi_control_arready(s_axi_control_arready),
        .s_axi_control_arvalid(s_axi_control_arvalid),
        .s_axi_control_awaddr(s_axi_control_awaddr),
        .s_axi_control_awready(s_axi_control_awready),
        .s_axi_control_awvalid(s_axi_control_awvalid),
        .s_axi_control_bready(s_axi_control_bready),
        .s_axi_control_bresp(s_axi_control_bresp),
        .s_axi_control_bvalid(s_axi_control_bvalid),
        .s_axi_control_rdata(s_axi_control_rdata),
        .s_axi_control_rready(s_axi_control_rready),
        .s_axi_control_rresp(s_axi_control_rresp),
        .s_axi_control_rvalid(s_axi_control_rvalid),
        .s_axi_control_wdata(s_axi_control_wdata),
        .s_axi_control_wready(s_axi_control_wready),
        .s_axi_control_wstrb(s_axi_control_wstrb),
        .s_axi_control_wvalid(s_axi_control_wvalid),
        .vec_done(vec_done),
        .vec_tag(vec_tag),
        .vregs_out_PORTA_addr(vregs_out_PORTA_addr),
        .vregs_out_PORTA_clk(vregs_out_PORTA_clk),
        .vregs_out_PORTA_din(vregs_out_PORTA_din),
        .vregs_out_PORTA_dout(vregs_out_PORTA_dout),
        .vregs_out_PORTA_en(vregs_out_PORTA_en),
        .vregs_out_PORTA_rst(vregs_out_PORTA_rst),
        .vregs_out_PORTA_we(vregs_out_PORTA_we));
endmodule
