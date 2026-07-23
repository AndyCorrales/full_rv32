//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Wed Jul 22 07:48:32 2026
//Host        : andy-ThinkPad-P53 running 64-bit Ubuntu 24.04.4 LTS
//Command     : generate_target bd_0.bd
//Design      : bd_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "bd_0.hwdef" *) 
module bd_0
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALU0_DONE DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALU0_DONE, LAYERED_METADATA undef" *) output [0:0]alu0_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALU0_TAG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALU0_TAG, LAYERED_METADATA undef" *) output [2:0]alu0_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALU1_DONE DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALU1_DONE, LAYERED_METADATA undef" *) output [0:0]alu1_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ALU1_TAG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ALU1_TAG, LAYERED_METADATA undef" *) output [2:0]alu1_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF s_axi_control, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BR_DONE DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BR_DONE, LAYERED_METADATA undef" *) output [0:0]br_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BR_TAG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BR_TAG, LAYERED_METADATA undef" *) output [2:0]br_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMMIT_IS_FP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMMIT_IS_FP, LAYERED_METADATA undef" *) output [0:0]commit_is_fp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMMIT_RD DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMMIT_RD, LAYERED_METADATA undef" *) output [4:0]commit_rd;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMMIT_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMMIT_VALID, LAYERED_METADATA undef" *) output [0:0]commit_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.COMMIT_VALUE DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.COMMIT_VALUE, LAYERED_METADATA undef" *) output [31:0]commit_value;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DISP_PC DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DISP_PC, LAYERED_METADATA undef" *) output [31:0]disp_pc;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DISP_TAG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DISP_TAG, LAYERED_METADATA undef" *) output [2:0]disp_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DISP_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DISP_VALID, LAYERED_METADATA undef" *) output [0:0]disp_valid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA ADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dmem_PORTA, MASTER_TYPE BRAM_CTRL, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_ECC NONE, MEM_SIZE 256, MEM_WIDTH 32, READ_LATENCY 1" *) output [31:0]dmem_PORTA_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA CLK" *) output dmem_PORTA_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA DIN" *) output [31:0]dmem_PORTA_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA DOUT" *) input [31:0]dmem_PORTA_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA EN" *) output dmem_PORTA_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA RST" *) output dmem_PORTA_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTA WE" *) output [3:0]dmem_PORTA_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB ADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dmem_PORTB, MASTER_TYPE BRAM_CTRL, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_ECC NONE, MEM_SIZE 256, MEM_WIDTH 32, READ_LATENCY 1" *) output [31:0]dmem_PORTB_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB CLK" *) output dmem_PORTB_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB DIN" *) output [31:0]dmem_PORTB_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB DOUT" *) input [31:0]dmem_PORTB_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB EN" *) output dmem_PORTB_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB RST" *) output dmem_PORTB_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 dmem_PORTB WE" *) output [3:0]dmem_PORTB_we;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FPU_DONE DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FPU_DONE, LAYERED_METADATA undef" *) output [0:0]fpu_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.FPU_TAG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.FPU_TAG, LAYERED_METADATA undef" *) output [2:0]fpu_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.HALTED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.HALTED, LAYERED_METADATA undef" *) output [0:0]halted;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA ADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME imem_PORTA, MASTER_TYPE BRAM_CTRL, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_ECC NONE, MEM_SIZE 256, MEM_WIDTH 32, READ_LATENCY 1" *) output [31:0]imem_PORTA_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA CLK" *) output imem_PORTA_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA DIN" *) output [31:0]imem_PORTA_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA DOUT" *) input [31:0]imem_PORTA_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA EN" *) output imem_PORTA_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA RST" *) output imem_PORTA_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTA WE" *) output [3:0]imem_PORTA_we;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB ADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME imem_PORTB, MASTER_TYPE BRAM_CTRL, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_ECC NONE, MEM_SIZE 256, MEM_WIDTH 32, READ_LATENCY 1" *) output [31:0]imem_PORTB_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB CLK" *) output imem_PORTB_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB DIN" *) output [31:0]imem_PORTB_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB DOUT" *) input [31:0]imem_PORTB_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB EN" *) output imem_PORTB_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB RST" *) output imem_PORTB_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 imem_PORTB WE" *) output [3:0]imem_PORTB_we;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.INTERRUPT INTERRUPT" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.INTERRUPT, PortWidth 1, SENSITIVITY LEVEL_HIGH" *) output interrupt;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LSU_DONE DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LSU_DONE, LAYERED_METADATA undef" *) output [0:0]lsu_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LSU_TAG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LSU_TAG, LAYERED_METADATA undef" *) output [2:0]lsu_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.MD_DONE DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.MD_DONE, LAYERED_METADATA undef" *) output [0:0]md_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.MD_TAG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.MD_TAG, LAYERED_METADATA undef" *) output [2:0]md_tag;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESET DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESET, LAYERED_METADATA undef" *) input [0:0]reset;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [3:0]s_axi_control_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *) output s_axi_control_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *) input s_axi_control_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *) input [3:0]s_axi_control_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *) output s_axi_control_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *) input s_axi_control_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *) input s_axi_control_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *) output [1:0]s_axi_control_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *) output s_axi_control_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *) output [31:0]s_axi_control_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *) input s_axi_control_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *) output [1:0]s_axi_control_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *) output s_axi_control_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *) input [31:0]s_axi_control_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *) output s_axi_control_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *) input [3:0]s_axi_control_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *) input s_axi_control_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VEC_DONE DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VEC_DONE, LAYERED_METADATA undef" *) output [0:0]vec_done;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VEC_TAG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VEC_TAG, LAYERED_METADATA undef" *) output [2:0]vec_tag;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA ADDR" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME vregs_out_PORTA, MASTER_TYPE BRAM_CTRL, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_ECC NONE, MEM_SIZE 512, MEM_WIDTH 32, READ_LATENCY 1" *) output [31:0]vregs_out_PORTA_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA CLK" *) output vregs_out_PORTA_clk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA DIN" *) output [31:0]vregs_out_PORTA_din;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA DOUT" *) input [31:0]vregs_out_PORTA_dout;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA EN" *) output vregs_out_PORTA_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA RST" *) output vregs_out_PORTA_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 vregs_out_PORTA WE" *) output [3:0]vregs_out_PORTA_we;

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

  bd_0_hls_inst_0 hls_inst
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
        .dmem_Addr_A(dmem_PORTA_addr),
        .dmem_Addr_B(dmem_PORTB_addr),
        .dmem_Clk_A(dmem_PORTA_clk),
        .dmem_Clk_B(dmem_PORTB_clk),
        .dmem_Din_A(dmem_PORTA_din),
        .dmem_Din_B(dmem_PORTB_din),
        .dmem_Dout_A(dmem_PORTA_dout),
        .dmem_Dout_B(dmem_PORTB_dout),
        .dmem_EN_A(dmem_PORTA_en),
        .dmem_EN_B(dmem_PORTB_en),
        .dmem_Rst_A(dmem_PORTA_rst),
        .dmem_Rst_B(dmem_PORTB_rst),
        .dmem_WEN_A(dmem_PORTA_we),
        .dmem_WEN_B(dmem_PORTB_we),
        .fpu_done(fpu_done),
        .fpu_tag(fpu_tag),
        .halted(halted),
        .imem_Addr_A(imem_PORTA_addr),
        .imem_Addr_B(imem_PORTB_addr),
        .imem_Clk_A(imem_PORTA_clk),
        .imem_Clk_B(imem_PORTB_clk),
        .imem_Din_A(imem_PORTA_din),
        .imem_Din_B(imem_PORTB_din),
        .imem_Dout_A(imem_PORTA_dout),
        .imem_Dout_B(imem_PORTB_dout),
        .imem_EN_A(imem_PORTA_en),
        .imem_EN_B(imem_PORTB_en),
        .imem_Rst_A(imem_PORTA_rst),
        .imem_Rst_B(imem_PORTB_rst),
        .imem_WEN_A(imem_PORTA_we),
        .imem_WEN_B(imem_PORTB_we),
        .interrupt(interrupt),
        .lsu_done(lsu_done),
        .lsu_tag(lsu_tag),
        .md_done(md_done),
        .md_tag(md_tag),
        .reset(reset),
        .s_axi_control_ARADDR(s_axi_control_araddr),
        .s_axi_control_ARREADY(s_axi_control_arready),
        .s_axi_control_ARVALID(s_axi_control_arvalid),
        .s_axi_control_AWADDR(s_axi_control_awaddr),
        .s_axi_control_AWREADY(s_axi_control_awready),
        .s_axi_control_AWVALID(s_axi_control_awvalid),
        .s_axi_control_BREADY(s_axi_control_bready),
        .s_axi_control_BRESP(s_axi_control_bresp),
        .s_axi_control_BVALID(s_axi_control_bvalid),
        .s_axi_control_RDATA(s_axi_control_rdata),
        .s_axi_control_RREADY(s_axi_control_rready),
        .s_axi_control_RRESP(s_axi_control_rresp),
        .s_axi_control_RVALID(s_axi_control_rvalid),
        .s_axi_control_WDATA(s_axi_control_wdata),
        .s_axi_control_WREADY(s_axi_control_wready),
        .s_axi_control_WSTRB(s_axi_control_wstrb),
        .s_axi_control_WVALID(s_axi_control_wvalid),
        .vec_done(vec_done),
        .vec_tag(vec_tag),
        .vregs_out_Addr_A(vregs_out_PORTA_addr),
        .vregs_out_Clk_A(vregs_out_PORTA_clk),
        .vregs_out_Din_A(vregs_out_PORTA_din),
        .vregs_out_Dout_A(vregs_out_PORTA_dout),
        .vregs_out_EN_A(vregs_out_PORTA_en),
        .vregs_out_Rst_A(vregs_out_PORTA_rst),
        .vregs_out_WEN_A(vregs_out_PORTA_we));
endmodule
