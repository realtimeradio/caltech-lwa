// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:16:18 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.srcs/sources_1/bd/cont_microblaze/ip/cont_microblaze_axi_slave_wishbone_classic_master_0_0/cont_microblaze_axi_slave_wishbone_classic_master_0_0_sim_netlist.v
// Design      : cont_microblaze_axi_slave_wishbone_classic_master_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cont_microblaze_axi_slave_wishbone_classic_master_0_0,axi_slave_wishbone_classic_master,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "axi_slave_wishbone_classic_master,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module cont_microblaze_axi_slave_wishbone_classic_master_0_0
   (RST_O,
    DAT_O,
    DAT_I,
    ACK_I,
    ADR_O,
    CYC_O,
    SEL_O,
    STB_O,
    WE_O,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWREGION,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARREGION,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY);
  output RST_O;
  output [31:0]DAT_O;
  input [31:0]DAT_I;
  input ACK_I;
  output [19:0]ADR_O;
  output CYC_O;
  output [3:0]SEL_O;
  output STB_O;
  output WE_O;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 S_AXI_signal_clock CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_signal_clock, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN cont_microblaze_Clk, INSERT_VIP 0" *) input S_AXI_ACLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 S_AXI_signal_reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_signal_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input S_AXI_ARESETN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 20, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN cont_microblaze_Clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [0:0]S_AXI_AWID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) input [19:0]S_AXI_AWADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *) input [7:0]S_AXI_AWLEN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *) input [2:0]S_AXI_AWSIZE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *) input [1:0]S_AXI_AWBURST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *) input S_AXI_AWLOCK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *) input [3:0]S_AXI_AWCACHE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *) input [2:0]S_AXI_AWPROT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWQOS" *) input [3:0]S_AXI_AWQOS;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWREGION" *) input [3:0]S_AXI_AWREGION;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWUSER" *) input [0:0]S_AXI_AWUSER;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input S_AXI_AWVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output S_AXI_AWREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]S_AXI_WDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]S_AXI_WSTRB;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *) input S_AXI_WLAST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WUSER" *) input [0:0]S_AXI_WUSER;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input S_AXI_WVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output S_AXI_WREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BID" *) output [0:0]S_AXI_BID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]S_AXI_BRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BUSER" *) output [0:0]S_AXI_BUSER;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output S_AXI_BVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input S_AXI_BREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARID" *) input [0:0]S_AXI_ARID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [19:0]S_AXI_ARADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *) input [7:0]S_AXI_ARLEN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *) input [2:0]S_AXI_ARSIZE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *) input [1:0]S_AXI_ARBURST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *) input S_AXI_ARLOCK;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *) input [3:0]S_AXI_ARCACHE;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *) input [2:0]S_AXI_ARPROT;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARQOS" *) input [3:0]S_AXI_ARQOS;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARREGION" *) input [3:0]S_AXI_ARREGION;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARUSER" *) input [0:0]S_AXI_ARUSER;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input S_AXI_ARVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output S_AXI_ARREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RID" *) output [0:0]S_AXI_RID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]S_AXI_RDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]S_AXI_RRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *) output S_AXI_RLAST;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RUSER" *) output [0:0]S_AXI_RUSER;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output S_AXI_RVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input S_AXI_RREADY;

  wire \<const0> ;
  wire ACK_I;
  wire [19:0]ADR_O;
  wire CYC_O;
  wire [31:0]DAT_I;
  wire [31:0]DAT_O;
  wire RST_O;
  wire [3:0]SEL_O;
  wire STB_O;
  wire S_AXI_ACLK;
  wire [19:0]S_AXI_ARADDR;
  wire S_AXI_ARESETN;
  wire [0:0]S_AXI_ARID;
  wire [7:0]S_AXI_ARLEN;
  wire S_AXI_ARREADY;
  wire S_AXI_ARVALID;
  wire [19:0]S_AXI_AWADDR;
  wire [0:0]S_AXI_AWID;
  wire [7:0]S_AXI_AWLEN;
  wire S_AXI_AWREADY;
  wire S_AXI_AWVALID;
  wire [0:0]S_AXI_BID;
  wire S_AXI_BREADY;
  wire S_AXI_BVALID;
  wire [31:0]S_AXI_RDATA;
  wire [0:0]S_AXI_RID;
  wire S_AXI_RLAST;
  wire S_AXI_RREADY;
  wire S_AXI_RVALID;
  wire [31:0]S_AXI_WDATA;
  wire S_AXI_WREADY;
  wire [3:0]S_AXI_WSTRB;
  wire S_AXI_WVALID;
  wire WE_O;

  assign S_AXI_BRESP[1] = \<const0> ;
  assign S_AXI_BRESP[0] = \<const0> ;
  assign S_AXI_RRESP[1] = \<const0> ;
  assign S_AXI_RRESP[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  cont_microblaze_axi_slave_wishbone_classic_master_0_0_axi_slave_wishbone_classic_master U0
       (.ACK_I(ACK_I),
        .ADR_O(ADR_O),
        .CYC_O(CYC_O),
        .DAT_I(DAT_I),
        .DAT_O(DAT_O),
        .RST_O(RST_O),
        .SEL_O(SEL_O),
        .STB_O(STB_O),
        .S_AXI_ACLK(S_AXI_ACLK),
        .S_AXI_ARADDR(S_AXI_ARADDR),
        .S_AXI_ARESETN(S_AXI_ARESETN),
        .S_AXI_ARID(S_AXI_ARID),
        .S_AXI_ARLEN(S_AXI_ARLEN),
        .S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_ARVALID(S_AXI_ARVALID),
        .S_AXI_AWADDR(S_AXI_AWADDR),
        .S_AXI_AWID(S_AXI_AWID),
        .S_AXI_AWLEN(S_AXI_AWLEN),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_AWVALID(S_AXI_AWVALID),
        .S_AXI_BID(S_AXI_BID),
        .S_AXI_BREADY(S_AXI_BREADY),
        .S_AXI_BVALID(S_AXI_BVALID),
        .S_AXI_RDATA(S_AXI_RDATA),
        .S_AXI_RID(S_AXI_RID),
        .S_AXI_RLAST(S_AXI_RLAST),
        .S_AXI_RREADY(S_AXI_RREADY),
        .S_AXI_RVALID(S_AXI_RVALID),
        .S_AXI_WDATA(S_AXI_WDATA),
        .S_AXI_WREADY(S_AXI_WREADY),
        .S_AXI_WSTRB(S_AXI_WSTRB),
        .S_AXI_WVALID(S_AXI_WVALID),
        .WE_O(WE_O));
endmodule

(* ORIG_REF_NAME = "axi_slave_wishbone_classic_master" *) 
module cont_microblaze_axi_slave_wishbone_classic_master_0_0_axi_slave_wishbone_classic_master
   (S_AXI_RVALID,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    S_AXI_AWREADY,
    S_AXI_BVALID,
    RST_O,
    DAT_O,
    ADR_O,
    SEL_O,
    WE_O,
    S_AXI_RDATA,
    S_AXI_RLAST,
    CYC_O,
    STB_O,
    S_AXI_BID,
    S_AXI_RID,
    S_AXI_RREADY,
    S_AXI_AWVALID,
    S_AXI_WVALID,
    S_AXI_ACLK,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    DAT_I,
    S_AXI_BREADY,
    S_AXI_ARVALID,
    ACK_I,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_ARADDR,
    S_AXI_AWLEN,
    S_AXI_ARLEN,
    S_AXI_AWID,
    S_AXI_ARID);
  output S_AXI_RVALID;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output S_AXI_AWREADY;
  output S_AXI_BVALID;
  output RST_O;
  output [31:0]DAT_O;
  output [19:0]ADR_O;
  output [3:0]SEL_O;
  output WE_O;
  output [31:0]S_AXI_RDATA;
  output S_AXI_RLAST;
  output CYC_O;
  output STB_O;
  output [0:0]S_AXI_BID;
  output [0:0]S_AXI_RID;
  input S_AXI_RREADY;
  input S_AXI_AWVALID;
  input S_AXI_WVALID;
  input S_AXI_ACLK;
  input [31:0]S_AXI_WDATA;
  input [3:0]S_AXI_WSTRB;
  input [31:0]DAT_I;
  input S_AXI_BREADY;
  input S_AXI_ARVALID;
  input ACK_I;
  input S_AXI_ARESETN;
  input [19:0]S_AXI_AWADDR;
  input [19:0]S_AXI_ARADDR;
  input [7:0]S_AXI_AWLEN;
  input [7:0]S_AXI_ARLEN;
  input [0:0]S_AXI_AWID;
  input [0:0]S_AXI_ARID;

  wire ACK_I;
  wire [19:0]ADR_O;
  wire CYC_O;
  wire CYC_O_i_1_n_0;
  wire CYC_O_i_2_n_0;
  wire [31:0]DAT_I;
  wire [31:0]DAT_O;
  wire \FSM_onehot_current_axi_bridge_state[0]_i_1_n_0 ;
  wire \FSM_onehot_current_axi_bridge_state[1]_i_1_n_0 ;
  wire \FSM_onehot_current_axi_bridge_state[1]_i_2_n_0 ;
  wire \FSM_onehot_current_axi_bridge_state[2]_i_1_n_0 ;
  wire \FSM_onehot_current_axi_bridge_state[3]_i_1_n_0 ;
  wire \FSM_onehot_current_axi_bridge_state[4]_i_1_n_0 ;
  wire \FSM_onehot_current_axi_bridge_state[5]_i_1_n_0 ;
  wire \FSM_onehot_current_axi_bridge_state[6]_i_1_n_0 ;
  wire \FSM_onehot_current_axi_bridge_state[7]_i_1_n_0 ;
  wire \FSM_onehot_current_axi_bridge_state[8]_i_1_n_0 ;
  wire \FSM_onehot_current_axi_bridge_state_reg_n_0_[1] ;
  wire \FSM_onehot_current_axi_bridge_state_reg_n_0_[2] ;
  wire \FSM_onehot_current_axi_bridge_state_reg_n_0_[6] ;
  wire RST_O;
  wire [3:0]SEL_O;
  wire SEL_O1;
  wire \SEL_O[3]_i_1_n_0 ;
  wire STB_O;
  wire STB_O_i_1_n_0;
  wire STB_O_i_2_n_0;
  wire STB_O_i_3_n_0;
  wire STB_O_i_4_n_0;
  wire STB_O_i_5_n_0;
  wire S_AXI_ACLK;
  wire [19:0]S_AXI_ARADDR;
  wire S_AXI_ARESETN;
  wire [0:0]S_AXI_ARID;
  wire [7:0]S_AXI_ARLEN;
  wire S_AXI_ARREADY;
  wire S_AXI_ARVALID;
  wire [19:0]S_AXI_AWADDR;
  wire [0:0]S_AXI_AWID;
  wire [7:0]S_AXI_AWLEN;
  wire S_AXI_AWREADY;
  wire S_AXI_AWVALID;
  wire [0:0]S_AXI_BID;
  wire \S_AXI_BID[0]_i_1_n_0 ;
  wire S_AXI_BREADY;
  wire S_AXI_BVALID;
  wire [31:0]S_AXI_RDATA;
  wire S_AXI_RDATA0;
  wire [0:0]S_AXI_RID;
  wire \S_AXI_RID[0]_i_1_n_0 ;
  wire S_AXI_RLAST;
  wire S_AXI_RLAST_INST_0_i_1_n_0;
  wire S_AXI_RLAST_INST_0_i_2_n_0;
  wire S_AXI_RLAST_INST_0_i_3_n_0;
  wire S_AXI_RREADY;
  wire S_AXI_RVALID;
  wire [31:0]S_AXI_WDATA;
  wire S_AXI_WREADY;
  wire [3:0]S_AXI_WSTRB;
  wire S_AXI_WVALID;
  wire WE_O;
  wire \burst_count[5]_i_2_n_0 ;
  wire \burst_count[7]_i_1_n_0 ;
  wire \burst_count[7]_i_2_n_0 ;
  wire [7:0]burst_count_reg;
  wire [7:0]burst_length;
  wire \burst_length[0]_i_1_n_0 ;
  wire \burst_length[1]_i_1_n_0 ;
  wire \burst_length[2]_i_1_n_0 ;
  wire \burst_length[3]_i_1_n_0 ;
  wire \burst_length[4]_i_1_n_0 ;
  wire \burst_length[5]_i_1_n_0 ;
  wire \burst_length[6]_i_1_n_0 ;
  wire \burst_length[7]_i_2_n_0 ;
  wire burst_length_0;
  wire \current_address[0]_i_1_n_0 ;
  wire \current_address[10]_i_1_n_0 ;
  wire \current_address[11]_i_1_n_0 ;
  wire \current_address[12]_i_1_n_0 ;
  wire \current_address[13]_i_1_n_0 ;
  wire \current_address[14]_i_1_n_0 ;
  wire \current_address[15]_i_1_n_0 ;
  wire \current_address[16]_i_1_n_0 ;
  wire \current_address[17]_i_1_n_0 ;
  wire \current_address[18]_i_1_n_0 ;
  wire \current_address[19]_i_1_n_0 ;
  wire \current_address[19]_i_2_n_0 ;
  wire \current_address[1]_i_1_n_0 ;
  wire \current_address[2]_i_1_n_0 ;
  wire \current_address[3]_i_1_n_0 ;
  wire \current_address[4]_i_1_n_0 ;
  wire \current_address[5]_i_1_n_0 ;
  wire \current_address[6]_i_1_n_0 ;
  wire \current_address[7]_i_1_n_0 ;
  wire \current_address[8]_i_1_n_0 ;
  wire \current_address[9]_i_1_n_0 ;
  wire [19:1]in14;
  wire p_0_in;
  wire [6:0]p_0_in__0;
  wire p_1_in;
  wire plusOp_carry__0_n_0;
  wire plusOp_carry__0_n_1;
  wire plusOp_carry__0_n_2;
  wire plusOp_carry__0_n_3;
  wire plusOp_carry__0_n_4;
  wire plusOp_carry__0_n_5;
  wire plusOp_carry__0_n_6;
  wire plusOp_carry__0_n_7;
  wire plusOp_carry__1_n_6;
  wire plusOp_carry__1_n_7;
  wire plusOp_carry_i_1_n_0;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire plusOp_carry_n_4;
  wire plusOp_carry_n_5;
  wire plusOp_carry_n_6;
  wire plusOp_carry_n_7;
  wire [7:2]NLW_plusOp_carry__1_CO_UNCONNECTED;
  wire [7:3]NLW_plusOp_carry__1_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'h0F7FFFFF0F0F0F0F)) 
    CYC_O_i_1
       (.I0(S_AXI_RREADY),
        .I1(S_AXI_RVALID),
        .I2(CYC_O_i_2_n_0),
        .I3(S_AXI_WREADY),
        .I4(S_AXI_RLAST_INST_0_i_1_n_0),
        .I5(CYC_O),
        .O(CYC_O_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h1)) 
    CYC_O_i_2
       (.I0(S_AXI_AWREADY),
        .I1(S_AXI_ARREADY),
        .O(CYC_O_i_2_n_0));
  FDCE CYC_O_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(CYC_O_i_1_n_0),
        .Q(CYC_O));
  FDRE \DAT_O_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[0]),
        .Q(DAT_O[0]),
        .R(1'b0));
  FDRE \DAT_O_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[10]),
        .Q(DAT_O[10]),
        .R(1'b0));
  FDRE \DAT_O_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[11]),
        .Q(DAT_O[11]),
        .R(1'b0));
  FDRE \DAT_O_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[12]),
        .Q(DAT_O[12]),
        .R(1'b0));
  FDRE \DAT_O_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[13]),
        .Q(DAT_O[13]),
        .R(1'b0));
  FDRE \DAT_O_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[14]),
        .Q(DAT_O[14]),
        .R(1'b0));
  FDRE \DAT_O_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[15]),
        .Q(DAT_O[15]),
        .R(1'b0));
  FDRE \DAT_O_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[16]),
        .Q(DAT_O[16]),
        .R(1'b0));
  FDRE \DAT_O_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[17]),
        .Q(DAT_O[17]),
        .R(1'b0));
  FDRE \DAT_O_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[18]),
        .Q(DAT_O[18]),
        .R(1'b0));
  FDRE \DAT_O_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[19]),
        .Q(DAT_O[19]),
        .R(1'b0));
  FDRE \DAT_O_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[1]),
        .Q(DAT_O[1]),
        .R(1'b0));
  FDRE \DAT_O_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[20]),
        .Q(DAT_O[20]),
        .R(1'b0));
  FDRE \DAT_O_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[21]),
        .Q(DAT_O[21]),
        .R(1'b0));
  FDRE \DAT_O_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[22]),
        .Q(DAT_O[22]),
        .R(1'b0));
  FDRE \DAT_O_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[23]),
        .Q(DAT_O[23]),
        .R(1'b0));
  FDRE \DAT_O_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[24]),
        .Q(DAT_O[24]),
        .R(1'b0));
  FDRE \DAT_O_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[25]),
        .Q(DAT_O[25]),
        .R(1'b0));
  FDRE \DAT_O_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[26]),
        .Q(DAT_O[26]),
        .R(1'b0));
  FDRE \DAT_O_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[27]),
        .Q(DAT_O[27]),
        .R(1'b0));
  FDRE \DAT_O_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[28]),
        .Q(DAT_O[28]),
        .R(1'b0));
  FDRE \DAT_O_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[29]),
        .Q(DAT_O[29]),
        .R(1'b0));
  FDRE \DAT_O_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[2]),
        .Q(DAT_O[2]),
        .R(1'b0));
  FDRE \DAT_O_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[30]),
        .Q(DAT_O[30]),
        .R(1'b0));
  FDRE \DAT_O_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[31]),
        .Q(DAT_O[31]),
        .R(1'b0));
  FDRE \DAT_O_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[3]),
        .Q(DAT_O[3]),
        .R(1'b0));
  FDRE \DAT_O_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[4]),
        .Q(DAT_O[4]),
        .R(1'b0));
  FDRE \DAT_O_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[5]),
        .Q(DAT_O[5]),
        .R(1'b0));
  FDRE \DAT_O_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[6]),
        .Q(DAT_O[6]),
        .R(1'b0));
  FDRE \DAT_O_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[7]),
        .Q(DAT_O[7]),
        .R(1'b0));
  FDRE \DAT_O_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[8]),
        .Q(DAT_O[8]),
        .R(1'b0));
  FDRE \DAT_O_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WDATA[9]),
        .Q(DAT_O[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_current_axi_bridge_state[0]_i_1 
       (.I0(\FSM_onehot_current_axi_bridge_state_reg_n_0_[2] ),
        .I1(ACK_I),
        .I2(S_AXI_RREADY),
        .I3(S_AXI_RVALID),
        .O(\FSM_onehot_current_axi_bridge_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF888F888F888FFFF)) 
    \FSM_onehot_current_axi_bridge_state[1]_i_1 
       (.I0(S_AXI_RLAST_INST_0_i_1_n_0),
        .I1(STB_O_i_3_n_0),
        .I2(S_AXI_BREADY),
        .I3(S_AXI_BVALID),
        .I4(S_AXI_ARVALID),
        .I5(\FSM_onehot_current_axi_bridge_state[1]_i_2_n_0 ),
        .O(\FSM_onehot_current_axi_bridge_state[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h8F)) 
    \FSM_onehot_current_axi_bridge_state[1]_i_2 
       (.I0(S_AXI_AWVALID),
        .I1(S_AXI_WVALID),
        .I2(\FSM_onehot_current_axi_bridge_state_reg_n_0_[1] ),
        .O(\FSM_onehot_current_axi_bridge_state[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFF08FFFFFF08FF08)) 
    \FSM_onehot_current_axi_bridge_state[2]_i_1 
       (.I0(S_AXI_RVALID),
        .I1(S_AXI_RREADY),
        .I2(S_AXI_RLAST_INST_0_i_1_n_0),
        .I3(S_AXI_ARREADY),
        .I4(ACK_I),
        .I5(\FSM_onehot_current_axi_bridge_state_reg_n_0_[2] ),
        .O(\FSM_onehot_current_axi_bridge_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0888)) 
    \FSM_onehot_current_axi_bridge_state[3]_i_1 
       (.I0(S_AXI_ARVALID),
        .I1(\FSM_onehot_current_axi_bridge_state_reg_n_0_[1] ),
        .I2(S_AXI_WVALID),
        .I3(S_AXI_AWVALID),
        .O(\FSM_onehot_current_axi_bridge_state[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_current_axi_bridge_state[4]_i_1 
       (.I0(S_AXI_RLAST_INST_0_i_1_n_0),
        .I1(S_AXI_WREADY),
        .I2(S_AXI_BREADY),
        .I3(S_AXI_BVALID),
        .O(\FSM_onehot_current_axi_bridge_state[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_current_axi_bridge_state[5]_i_1 
       (.I0(ACK_I),
        .I1(p_1_in),
        .O(\FSM_onehot_current_axi_bridge_state[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF44F4)) 
    \FSM_onehot_current_axi_bridge_state[6]_i_1 
       (.I0(S_AXI_RLAST_INST_0_i_1_n_0),
        .I1(S_AXI_WREADY),
        .I2(\FSM_onehot_current_axi_bridge_state_reg_n_0_[6] ),
        .I3(S_AXI_WVALID),
        .I4(S_AXI_AWREADY),
        .O(\FSM_onehot_current_axi_bridge_state[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8F88)) 
    \FSM_onehot_current_axi_bridge_state[7]_i_1 
       (.I0(\FSM_onehot_current_axi_bridge_state_reg_n_0_[6] ),
        .I1(S_AXI_WVALID),
        .I2(ACK_I),
        .I3(p_1_in),
        .O(\FSM_onehot_current_axi_bridge_state[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_onehot_current_axi_bridge_state[8]_i_1 
       (.I0(S_AXI_AWVALID),
        .I1(S_AXI_WVALID),
        .I2(\FSM_onehot_current_axi_bridge_state_reg_n_0_[1] ),
        .O(\FSM_onehot_current_axi_bridge_state[8]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_axi_bridge_state_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_axi_bridge_state[0]_i_1_n_0 ),
        .Q(S_AXI_RVALID));
  (* FSM_ENCODED_STATES = "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_current_axi_bridge_state_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\FSM_onehot_current_axi_bridge_state[1]_i_1_n_0 ),
        .PRE(p_0_in),
        .Q(\FSM_onehot_current_axi_bridge_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_axi_bridge_state_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_axi_bridge_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_current_axi_bridge_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_axi_bridge_state_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_axi_bridge_state[3]_i_1_n_0 ),
        .Q(S_AXI_ARREADY));
  (* FSM_ENCODED_STATES = "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_axi_bridge_state_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_axi_bridge_state[4]_i_1_n_0 ),
        .Q(S_AXI_BVALID));
  (* FSM_ENCODED_STATES = "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_axi_bridge_state_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_axi_bridge_state[5]_i_1_n_0 ),
        .Q(S_AXI_WREADY));
  (* FSM_ENCODED_STATES = "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_axi_bridge_state_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_axi_bridge_state[6]_i_1_n_0 ),
        .Q(\FSM_onehot_current_axi_bridge_state_reg_n_0_[6] ));
  (* FSM_ENCODED_STATES = "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_axi_bridge_state_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_axi_bridge_state[7]_i_1_n_0 ),
        .Q(p_1_in));
  (* FSM_ENCODED_STATES = "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_axi_bridge_state_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(\FSM_onehot_current_axi_bridge_state[8]_i_1_n_0 ),
        .Q(S_AXI_AWREADY));
  LUT1 #(
    .INIT(2'h1)) 
    RST_O_i_1
       (.I0(S_AXI_ARESETN),
        .O(p_0_in));
  FDRE RST_O_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(p_0_in),
        .Q(RST_O),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h01)) 
    \SEL_O[3]_i_1 
       (.I0(\FSM_onehot_current_axi_bridge_state_reg_n_0_[6] ),
        .I1(p_1_in),
        .I2(S_AXI_WREADY),
        .O(\SEL_O[3]_i_1_n_0 ));
  FDSE \SEL_O_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WSTRB[0]),
        .Q(SEL_O[0]),
        .S(\SEL_O[3]_i_1_n_0 ));
  FDSE \SEL_O_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WSTRB[1]),
        .Q(SEL_O[1]),
        .S(\SEL_O[3]_i_1_n_0 ));
  FDSE \SEL_O_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WSTRB[2]),
        .Q(SEL_O[2]),
        .S(\SEL_O[3]_i_1_n_0 ));
  FDSE \SEL_O_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(S_AXI_WSTRB[3]),
        .Q(SEL_O[3]),
        .S(\SEL_O[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAFBAAAAAA08)) 
    STB_O_i_1
       (.I0(STB_O_i_2_n_0),
        .I1(STB_O_i_3_n_0),
        .I2(S_AXI_RLAST_INST_0_i_1_n_0),
        .I3(S_AXI_ARREADY),
        .I4(STB_O_i_4_n_0),
        .I5(STB_O),
        .O(STB_O_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFEFFFE)) 
    STB_O_i_2
       (.I0(STB_O_i_5_n_0),
        .I1(S_AXI_ARREADY),
        .I2(S_AXI_BVALID),
        .I3(\FSM_onehot_current_axi_bridge_state_reg_n_0_[1] ),
        .I4(S_AXI_WVALID),
        .I5(\FSM_onehot_current_axi_bridge_state_reg_n_0_[6] ),
        .O(STB_O_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    STB_O_i_3
       (.I0(S_AXI_RREADY),
        .I1(S_AXI_RVALID),
        .O(STB_O_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFC8C8C8)) 
    STB_O_i_4
       (.I0(\FSM_onehot_current_axi_bridge_state_reg_n_0_[2] ),
        .I1(ACK_I),
        .I2(p_1_in),
        .I3(S_AXI_WVALID),
        .I4(\FSM_onehot_current_axi_bridge_state_reg_n_0_[6] ),
        .O(STB_O_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    STB_O_i_5
       (.I0(S_AXI_WREADY),
        .I1(S_AXI_RVALID),
        .I2(S_AXI_RREADY),
        .O(STB_O_i_5_n_0));
  FDCE STB_O_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .CLR(p_0_in),
        .D(STB_O_i_1_n_0),
        .Q(STB_O));
  LUT3 #(
    .INIT(8'hB8)) 
    \S_AXI_BID[0]_i_1 
       (.I0(S_AXI_AWID),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_BID),
        .O(\S_AXI_BID[0]_i_1_n_0 ));
  FDRE \S_AXI_BID_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\S_AXI_BID[0]_i_1_n_0 ),
        .Q(S_AXI_BID),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \S_AXI_RDATA[31]_i_1 
       (.I0(ACK_I),
        .I1(\FSM_onehot_current_axi_bridge_state_reg_n_0_[2] ),
        .O(S_AXI_RDATA0));
  FDRE \S_AXI_RDATA_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[0]),
        .Q(S_AXI_RDATA[0]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[10]),
        .Q(S_AXI_RDATA[10]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[11]),
        .Q(S_AXI_RDATA[11]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[12]),
        .Q(S_AXI_RDATA[12]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[13]),
        .Q(S_AXI_RDATA[13]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[14]),
        .Q(S_AXI_RDATA[14]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[15]),
        .Q(S_AXI_RDATA[15]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[16]),
        .Q(S_AXI_RDATA[16]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[17]),
        .Q(S_AXI_RDATA[17]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[18]),
        .Q(S_AXI_RDATA[18]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[19]),
        .Q(S_AXI_RDATA[19]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[1]),
        .Q(S_AXI_RDATA[1]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[20] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[20]),
        .Q(S_AXI_RDATA[20]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[21] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[21]),
        .Q(S_AXI_RDATA[21]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[22] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[22]),
        .Q(S_AXI_RDATA[22]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[23] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[23]),
        .Q(S_AXI_RDATA[23]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[24] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[24]),
        .Q(S_AXI_RDATA[24]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[25] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[25]),
        .Q(S_AXI_RDATA[25]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[26] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[26]),
        .Q(S_AXI_RDATA[26]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[27] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[27]),
        .Q(S_AXI_RDATA[27]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[28] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[28]),
        .Q(S_AXI_RDATA[28]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[29] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[29]),
        .Q(S_AXI_RDATA[29]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[2]),
        .Q(S_AXI_RDATA[2]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[30] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[30]),
        .Q(S_AXI_RDATA[30]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[31] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[31]),
        .Q(S_AXI_RDATA[31]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[3]),
        .Q(S_AXI_RDATA[3]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[4]),
        .Q(S_AXI_RDATA[4]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[5]),
        .Q(S_AXI_RDATA[5]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[6]),
        .Q(S_AXI_RDATA[6]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[7]),
        .Q(S_AXI_RDATA[7]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[8]),
        .Q(S_AXI_RDATA[8]),
        .R(1'b0));
  FDRE \S_AXI_RDATA_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(S_AXI_RDATA0),
        .D(DAT_I[9]),
        .Q(S_AXI_RDATA[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB8)) 
    \S_AXI_RID[0]_i_1 
       (.I0(S_AXI_ARID),
        .I1(S_AXI_ARREADY),
        .I2(S_AXI_RID),
        .O(\S_AXI_RID[0]_i_1_n_0 ));
  FDRE \S_AXI_RID_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(\S_AXI_RID[0]_i_1_n_0 ),
        .Q(S_AXI_RID),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    S_AXI_RLAST_INST_0
       (.I0(S_AXI_RLAST_INST_0_i_1_n_0),
        .I1(S_AXI_RVALID),
        .I2(\FSM_onehot_current_axi_bridge_state_reg_n_0_[2] ),
        .O(S_AXI_RLAST));
  LUT6 #(
    .INIT(64'h0000000000009009)) 
    S_AXI_RLAST_INST_0_i_1
       (.I0(burst_count_reg[6]),
        .I1(burst_length[6]),
        .I2(burst_count_reg[7]),
        .I3(burst_length[7]),
        .I4(S_AXI_RLAST_INST_0_i_2_n_0),
        .I5(S_AXI_RLAST_INST_0_i_3_n_0),
        .O(S_AXI_RLAST_INST_0_i_1_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    S_AXI_RLAST_INST_0_i_2
       (.I0(burst_length[0]),
        .I1(burst_count_reg[0]),
        .I2(burst_count_reg[2]),
        .I3(burst_length[2]),
        .I4(burst_count_reg[1]),
        .I5(burst_length[1]),
        .O(S_AXI_RLAST_INST_0_i_2_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    S_AXI_RLAST_INST_0_i_3
       (.I0(burst_length[3]),
        .I1(burst_count_reg[3]),
        .I2(burst_count_reg[5]),
        .I3(burst_length[5]),
        .I4(burst_count_reg[4]),
        .I5(burst_length[4]),
        .O(S_AXI_RLAST_INST_0_i_3_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    WE_O_i_1
       (.I0(S_AXI_WREADY),
        .I1(p_1_in),
        .I2(\FSM_onehot_current_axi_bridge_state_reg_n_0_[6] ),
        .O(SEL_O1));
  FDRE WE_O_reg
       (.C(S_AXI_ACLK),
        .CE(1'b1),
        .D(SEL_O1),
        .Q(WE_O),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \burst_count[0]_i_1 
       (.I0(S_AXI_ARREADY),
        .I1(S_AXI_AWREADY),
        .I2(burst_count_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0110)) 
    \burst_count[1]_i_1 
       (.I0(S_AXI_ARREADY),
        .I1(S_AXI_AWREADY),
        .I2(burst_count_reg[1]),
        .I3(burst_count_reg[0]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h01111000)) 
    \burst_count[2]_i_1 
       (.I0(S_AXI_ARREADY),
        .I1(S_AXI_AWREADY),
        .I2(burst_count_reg[0]),
        .I3(burst_count_reg[1]),
        .I4(burst_count_reg[2]),
        .O(p_0_in__0[2]));
  LUT6 #(
    .INIT(64'h0111111110000000)) 
    \burst_count[3]_i_1 
       (.I0(S_AXI_ARREADY),
        .I1(S_AXI_AWREADY),
        .I2(burst_count_reg[1]),
        .I3(burst_count_reg[0]),
        .I4(burst_count_reg[2]),
        .I5(burst_count_reg[3]),
        .O(p_0_in__0[3]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \burst_count[4]_i_1 
       (.I0(CYC_O_i_2_n_0),
        .I1(burst_count_reg[2]),
        .I2(burst_count_reg[0]),
        .I3(burst_count_reg[1]),
        .I4(burst_count_reg[3]),
        .I5(burst_count_reg[4]),
        .O(p_0_in__0[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h1001)) 
    \burst_count[5]_i_1 
       (.I0(S_AXI_ARREADY),
        .I1(S_AXI_AWREADY),
        .I2(\burst_count[5]_i_2_n_0 ),
        .I3(burst_count_reg[5]),
        .O(p_0_in__0[5]));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \burst_count[5]_i_2 
       (.I0(burst_count_reg[3]),
        .I1(burst_count_reg[1]),
        .I2(burst_count_reg[0]),
        .I3(burst_count_reg[2]),
        .I4(burst_count_reg[4]),
        .O(\burst_count[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0110)) 
    \burst_count[6]_i_1 
       (.I0(S_AXI_ARREADY),
        .I1(S_AXI_AWREADY),
        .I2(\burst_count[7]_i_2_n_0 ),
        .I3(burst_count_reg[6]),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000078)) 
    \burst_count[7]_i_1 
       (.I0(\burst_count[7]_i_2_n_0 ),
        .I1(burst_count_reg[6]),
        .I2(burst_count_reg[7]),
        .I3(S_AXI_ARREADY),
        .I4(S_AXI_AWREADY),
        .O(\burst_count[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \burst_count[7]_i_2 
       (.I0(burst_count_reg[5]),
        .I1(burst_count_reg[4]),
        .I2(burst_count_reg[2]),
        .I3(burst_count_reg[0]),
        .I4(burst_count_reg[1]),
        .I5(burst_count_reg[3]),
        .O(\burst_count[7]_i_2_n_0 ));
  FDCE \burst_count_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(p_0_in__0[0]),
        .Q(burst_count_reg[0]));
  FDCE \burst_count_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(p_0_in__0[1]),
        .Q(burst_count_reg[1]));
  FDCE \burst_count_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(p_0_in__0[2]),
        .Q(burst_count_reg[2]));
  FDCE \burst_count_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(p_0_in__0[3]),
        .Q(burst_count_reg[3]));
  FDCE \burst_count_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(p_0_in__0[4]),
        .Q(burst_count_reg[4]));
  FDCE \burst_count_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(p_0_in__0[5]),
        .Q(burst_count_reg[5]));
  FDCE \burst_count_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(p_0_in__0[6]),
        .Q(burst_count_reg[6]));
  FDCE \burst_count_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\burst_count[7]_i_1_n_0 ),
        .Q(burst_count_reg[7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \burst_length[0]_i_1 
       (.I0(S_AXI_AWLEN[0]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARLEN[0]),
        .O(\burst_length[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \burst_length[1]_i_1 
       (.I0(S_AXI_AWLEN[1]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARLEN[1]),
        .O(\burst_length[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \burst_length[2]_i_1 
       (.I0(S_AXI_AWLEN[2]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARLEN[2]),
        .O(\burst_length[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \burst_length[3]_i_1 
       (.I0(S_AXI_AWLEN[3]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARLEN[3]),
        .O(\burst_length[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \burst_length[4]_i_1 
       (.I0(S_AXI_AWLEN[4]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARLEN[4]),
        .O(\burst_length[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \burst_length[5]_i_1 
       (.I0(S_AXI_AWLEN[5]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARLEN[5]),
        .O(\burst_length[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \burst_length[6]_i_1 
       (.I0(S_AXI_AWLEN[6]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARLEN[6]),
        .O(\burst_length[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \burst_length[7]_i_1 
       (.I0(S_AXI_ARREADY),
        .I1(S_AXI_AWREADY),
        .O(burst_length_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \burst_length[7]_i_2 
       (.I0(S_AXI_AWLEN[7]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARLEN[7]),
        .O(\burst_length[7]_i_2_n_0 ));
  FDCE \burst_length_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(burst_length_0),
        .CLR(p_0_in),
        .D(\burst_length[0]_i_1_n_0 ),
        .Q(burst_length[0]));
  FDCE \burst_length_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(burst_length_0),
        .CLR(p_0_in),
        .D(\burst_length[1]_i_1_n_0 ),
        .Q(burst_length[1]));
  FDCE \burst_length_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(burst_length_0),
        .CLR(p_0_in),
        .D(\burst_length[2]_i_1_n_0 ),
        .Q(burst_length[2]));
  FDCE \burst_length_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(burst_length_0),
        .CLR(p_0_in),
        .D(\burst_length[3]_i_1_n_0 ),
        .Q(burst_length[3]));
  FDCE \burst_length_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(burst_length_0),
        .CLR(p_0_in),
        .D(\burst_length[4]_i_1_n_0 ),
        .Q(burst_length[4]));
  FDCE \burst_length_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(burst_length_0),
        .CLR(p_0_in),
        .D(\burst_length[5]_i_1_n_0 ),
        .Q(burst_length[5]));
  FDCE \burst_length_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(burst_length_0),
        .CLR(p_0_in),
        .D(\burst_length[6]_i_1_n_0 ),
        .Q(burst_length[6]));
  FDCE \burst_length_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(burst_length_0),
        .CLR(p_0_in),
        .D(\burst_length[7]_i_2_n_0 ),
        .Q(burst_length[7]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[0]_i_1 
       (.I0(S_AXI_AWADDR[0]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[0]),
        .I3(S_AXI_ARREADY),
        .I4(ADR_O[0]),
        .O(\current_address[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[10]_i_1 
       (.I0(S_AXI_AWADDR[10]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[10]),
        .I3(S_AXI_ARREADY),
        .I4(in14[10]),
        .O(\current_address[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[11]_i_1 
       (.I0(S_AXI_AWADDR[11]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[11]),
        .I3(S_AXI_ARREADY),
        .I4(in14[11]),
        .O(\current_address[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[12]_i_1 
       (.I0(S_AXI_AWADDR[12]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[12]),
        .I3(S_AXI_ARREADY),
        .I4(in14[12]),
        .O(\current_address[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[13]_i_1 
       (.I0(S_AXI_AWADDR[13]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[13]),
        .I3(S_AXI_ARREADY),
        .I4(in14[13]),
        .O(\current_address[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[14]_i_1 
       (.I0(S_AXI_AWADDR[14]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[14]),
        .I3(S_AXI_ARREADY),
        .I4(in14[14]),
        .O(\current_address[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[15]_i_1 
       (.I0(S_AXI_AWADDR[15]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[15]),
        .I3(S_AXI_ARREADY),
        .I4(in14[15]),
        .O(\current_address[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[16]_i_1 
       (.I0(S_AXI_AWADDR[16]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[16]),
        .I3(S_AXI_ARREADY),
        .I4(in14[16]),
        .O(\current_address[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[17]_i_1 
       (.I0(S_AXI_AWADDR[17]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[17]),
        .I3(S_AXI_ARREADY),
        .I4(in14[17]),
        .O(\current_address[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[18]_i_1 
       (.I0(S_AXI_AWADDR[18]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[18]),
        .I3(S_AXI_ARREADY),
        .I4(in14[18]),
        .O(\current_address[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFF8)) 
    \current_address[19]_i_1 
       (.I0(S_AXI_RREADY),
        .I1(S_AXI_RVALID),
        .I2(S_AXI_WREADY),
        .I3(S_AXI_ARREADY),
        .I4(S_AXI_AWREADY),
        .O(\current_address[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[19]_i_2 
       (.I0(S_AXI_AWADDR[19]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[19]),
        .I3(S_AXI_ARREADY),
        .I4(in14[19]),
        .O(\current_address[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[1]_i_1 
       (.I0(S_AXI_AWADDR[1]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[1]),
        .I3(S_AXI_ARREADY),
        .I4(in14[1]),
        .O(\current_address[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[2]_i_1 
       (.I0(S_AXI_AWADDR[2]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[2]),
        .I3(S_AXI_ARREADY),
        .I4(in14[2]),
        .O(\current_address[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[3]_i_1 
       (.I0(S_AXI_AWADDR[3]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[3]),
        .I3(S_AXI_ARREADY),
        .I4(in14[3]),
        .O(\current_address[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[4]_i_1 
       (.I0(S_AXI_AWADDR[4]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[4]),
        .I3(S_AXI_ARREADY),
        .I4(in14[4]),
        .O(\current_address[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[5]_i_1 
       (.I0(S_AXI_AWADDR[5]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[5]),
        .I3(S_AXI_ARREADY),
        .I4(in14[5]),
        .O(\current_address[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[6]_i_1 
       (.I0(S_AXI_AWADDR[6]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[6]),
        .I3(S_AXI_ARREADY),
        .I4(in14[6]),
        .O(\current_address[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[7]_i_1 
       (.I0(S_AXI_AWADDR[7]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[7]),
        .I3(S_AXI_ARREADY),
        .I4(in14[7]),
        .O(\current_address[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[8]_i_1 
       (.I0(S_AXI_AWADDR[8]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[8]),
        .I3(S_AXI_ARREADY),
        .I4(in14[8]),
        .O(\current_address[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \current_address[9]_i_1 
       (.I0(S_AXI_AWADDR[9]),
        .I1(S_AXI_AWREADY),
        .I2(S_AXI_ARADDR[9]),
        .I3(S_AXI_ARREADY),
        .I4(in14[9]),
        .O(\current_address[9]_i_1_n_0 ));
  FDCE \current_address_reg[0] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[0]_i_1_n_0 ),
        .Q(ADR_O[0]));
  FDCE \current_address_reg[10] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[10]_i_1_n_0 ),
        .Q(ADR_O[10]));
  FDCE \current_address_reg[11] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[11]_i_1_n_0 ),
        .Q(ADR_O[11]));
  FDCE \current_address_reg[12] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[12]_i_1_n_0 ),
        .Q(ADR_O[12]));
  FDCE \current_address_reg[13] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[13]_i_1_n_0 ),
        .Q(ADR_O[13]));
  FDCE \current_address_reg[14] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[14]_i_1_n_0 ),
        .Q(ADR_O[14]));
  FDCE \current_address_reg[15] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[15]_i_1_n_0 ),
        .Q(ADR_O[15]));
  FDCE \current_address_reg[16] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[16]_i_1_n_0 ),
        .Q(ADR_O[16]));
  FDCE \current_address_reg[17] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[17]_i_1_n_0 ),
        .Q(ADR_O[17]));
  FDCE \current_address_reg[18] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[18]_i_1_n_0 ),
        .Q(ADR_O[18]));
  FDCE \current_address_reg[19] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[19]_i_2_n_0 ),
        .Q(ADR_O[19]));
  FDCE \current_address_reg[1] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[1]_i_1_n_0 ),
        .Q(ADR_O[1]));
  FDCE \current_address_reg[2] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[2]_i_1_n_0 ),
        .Q(ADR_O[2]));
  FDCE \current_address_reg[3] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[3]_i_1_n_0 ),
        .Q(ADR_O[3]));
  FDCE \current_address_reg[4] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[4]_i_1_n_0 ),
        .Q(ADR_O[4]));
  FDCE \current_address_reg[5] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[5]_i_1_n_0 ),
        .Q(ADR_O[5]));
  FDCE \current_address_reg[6] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[6]_i_1_n_0 ),
        .Q(ADR_O[6]));
  FDCE \current_address_reg[7] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[7]_i_1_n_0 ),
        .Q(ADR_O[7]));
  FDCE \current_address_reg[8] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[8]_i_1_n_0 ),
        .Q(ADR_O[8]));
  FDCE \current_address_reg[9] 
       (.C(S_AXI_ACLK),
        .CE(\current_address[19]_i_1_n_0 ),
        .CLR(p_0_in),
        .D(\current_address[9]_i_1_n_0 ),
        .Q(ADR_O[9]));
  CARRY8 plusOp_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3,plusOp_carry_n_4,plusOp_carry_n_5,plusOp_carry_n_6,plusOp_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ADR_O[2],1'b0}),
        .O(in14[8:1]),
        .S({ADR_O[8:3],plusOp_carry_i_1_n_0,ADR_O[1]}));
  CARRY8 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CI_TOP(1'b0),
        .CO({plusOp_carry__0_n_0,plusOp_carry__0_n_1,plusOp_carry__0_n_2,plusOp_carry__0_n_3,plusOp_carry__0_n_4,plusOp_carry__0_n_5,plusOp_carry__0_n_6,plusOp_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(in14[16:9]),
        .S(ADR_O[16:9]));
  CARRY8 plusOp_carry__1
       (.CI(plusOp_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_plusOp_carry__1_CO_UNCONNECTED[7:2],plusOp_carry__1_n_6,plusOp_carry__1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_plusOp_carry__1_O_UNCONNECTED[7:3],in14[19:17]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,ADR_O[19:17]}));
  LUT1 #(
    .INIT(2'h1)) 
    plusOp_carry_i_1
       (.I0(ADR_O[2]),
        .O(plusOp_carry_i_1_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
