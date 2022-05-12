// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:16:18 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.srcs/sources_1/bd/cont_microblaze/ip/cont_microblaze_axi_slave_wishbone_classic_master_0_0/cont_microblaze_axi_slave_wishbone_classic_master_0_0_stub.v
// Design      : cont_microblaze_axi_slave_wishbone_classic_master_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "axi_slave_wishbone_classic_master,Vivado 2019.1" *)
module cont_microblaze_axi_slave_wishbone_classic_master_0_0(RST_O, DAT_O, DAT_I, ACK_I, ADR_O, CYC_O, SEL_O, STB_O, 
  WE_O, S_AXI_ACLK, S_AXI_ARESETN, S_AXI_AWID, S_AXI_AWADDR, S_AXI_AWLEN, S_AXI_AWSIZE, 
  S_AXI_AWBURST, S_AXI_AWLOCK, S_AXI_AWCACHE, S_AXI_AWPROT, S_AXI_AWQOS, S_AXI_AWREGION, 
  S_AXI_AWUSER, S_AXI_AWVALID, S_AXI_AWREADY, S_AXI_WDATA, S_AXI_WSTRB, S_AXI_WLAST, 
  S_AXI_WUSER, S_AXI_WVALID, S_AXI_WREADY, S_AXI_BID, S_AXI_BRESP, S_AXI_BUSER, S_AXI_BVALID, 
  S_AXI_BREADY, S_AXI_ARID, S_AXI_ARADDR, S_AXI_ARLEN, S_AXI_ARSIZE, S_AXI_ARBURST, 
  S_AXI_ARLOCK, S_AXI_ARCACHE, S_AXI_ARPROT, S_AXI_ARQOS, S_AXI_ARREGION, S_AXI_ARUSER, 
  S_AXI_ARVALID, S_AXI_ARREADY, S_AXI_RID, S_AXI_RDATA, S_AXI_RRESP, S_AXI_RLAST, S_AXI_RUSER, 
  S_AXI_RVALID, S_AXI_RREADY)
/* synthesis syn_black_box black_box_pad_pin="RST_O,DAT_O[31:0],DAT_I[31:0],ACK_I,ADR_O[19:0],CYC_O,SEL_O[3:0],STB_O,WE_O,S_AXI_ACLK,S_AXI_ARESETN,S_AXI_AWID[0:0],S_AXI_AWADDR[19:0],S_AXI_AWLEN[7:0],S_AXI_AWSIZE[2:0],S_AXI_AWBURST[1:0],S_AXI_AWLOCK,S_AXI_AWCACHE[3:0],S_AXI_AWPROT[2:0],S_AXI_AWQOS[3:0],S_AXI_AWREGION[3:0],S_AXI_AWUSER[0:0],S_AXI_AWVALID,S_AXI_AWREADY,S_AXI_WDATA[31:0],S_AXI_WSTRB[3:0],S_AXI_WLAST,S_AXI_WUSER[0:0],S_AXI_WVALID,S_AXI_WREADY,S_AXI_BID[0:0],S_AXI_BRESP[1:0],S_AXI_BUSER[0:0],S_AXI_BVALID,S_AXI_BREADY,S_AXI_ARID[0:0],S_AXI_ARADDR[19:0],S_AXI_ARLEN[7:0],S_AXI_ARSIZE[2:0],S_AXI_ARBURST[1:0],S_AXI_ARLOCK,S_AXI_ARCACHE[3:0],S_AXI_ARPROT[2:0],S_AXI_ARQOS[3:0],S_AXI_ARREGION[3:0],S_AXI_ARUSER[0:0],S_AXI_ARVALID,S_AXI_ARREADY,S_AXI_RID[0:0],S_AXI_RDATA[31:0],S_AXI_RRESP[1:0],S_AXI_RLAST,S_AXI_RUSER[0:0],S_AXI_RVALID,S_AXI_RREADY" */;
  output RST_O;
  output [31:0]DAT_O;
  input [31:0]DAT_I;
  input ACK_I;
  output [19:0]ADR_O;
  output CYC_O;
  output [3:0]SEL_O;
  output STB_O;
  output WE_O;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [0:0]S_AXI_AWID;
  input [19:0]S_AXI_AWADDR;
  input [7:0]S_AXI_AWLEN;
  input [2:0]S_AXI_AWSIZE;
  input [1:0]S_AXI_AWBURST;
  input S_AXI_AWLOCK;
  input [3:0]S_AXI_AWCACHE;
  input [2:0]S_AXI_AWPROT;
  input [3:0]S_AXI_AWQOS;
  input [3:0]S_AXI_AWREGION;
  input [0:0]S_AXI_AWUSER;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0]S_AXI_WDATA;
  input [3:0]S_AXI_WSTRB;
  input S_AXI_WLAST;
  input [0:0]S_AXI_WUSER;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [0:0]S_AXI_BID;
  output [1:0]S_AXI_BRESP;
  output [0:0]S_AXI_BUSER;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [0:0]S_AXI_ARID;
  input [19:0]S_AXI_ARADDR;
  input [7:0]S_AXI_ARLEN;
  input [2:0]S_AXI_ARSIZE;
  input [1:0]S_AXI_ARBURST;
  input S_AXI_ARLOCK;
  input [3:0]S_AXI_ARCACHE;
  input [2:0]S_AXI_ARPROT;
  input [3:0]S_AXI_ARQOS;
  input [3:0]S_AXI_ARREGION;
  input [0:0]S_AXI_ARUSER;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [0:0]S_AXI_RID;
  output [31:0]S_AXI_RDATA;
  output [1:0]S_AXI_RRESP;
  output S_AXI_RLAST;
  output [0:0]S_AXI_RUSER;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
endmodule
