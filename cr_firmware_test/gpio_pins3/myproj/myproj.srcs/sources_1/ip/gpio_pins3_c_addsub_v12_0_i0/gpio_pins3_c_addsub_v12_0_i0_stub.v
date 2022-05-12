// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:09:05 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.srcs/sources_1/ip/gpio_pins3_c_addsub_v12_0_i0/gpio_pins3_c_addsub_v12_0_i0_stub.v
// Design      : gpio_pins3_c_addsub_v12_0_i0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_13,Vivado 2019.1" *)
module gpio_pins3_c_addsub_v12_0_i0(A, B, CLK, CE, S)
/* synthesis syn_black_box black_box_pad_pin="A[32:0],B[32:0],CLK,CE,S[32:0]" */;
  input [32:0]A;
  input [32:0]B;
  input CLK;
  input CE;
  output [32:0]S;
endmodule
