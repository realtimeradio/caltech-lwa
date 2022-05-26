// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:13:36 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.srcs/sources_1/ip/gpio_pins3_c_counter_binary_v12_0_i0/gpio_pins3_c_counter_binary_v12_0_i0_sim_netlist.v
// Design      : gpio_pins3_c_counter_binary_v12_0_i0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gpio_pins3_c_counter_binary_v12_0_i0,c_counter_binary_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module gpio_pins3_c_counter_binary_v12_0_i0
   (CLK,
    CE,
    SINIT,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 sinit_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME sinit_intf, LAYERED_METADATA undef" *) input SINIT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [31:0]Q;

  wire CE;
  wire CLK;
  wire [31:0]Q;
  wire SINIT;
  wire NLW_U0_THRESH0_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "1" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  gpio_pins3_c_counter_binary_v12_0_i0_c_counter_binary_v12_0_13 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(SINIT),
        .SSET(1'b0),
        .THRESH0(NLW_U0_THRESH0_UNCONNECTED),
        .UP(1'b1));
endmodule

(* C_AINIT_VAL = "0" *) (* C_CE_OVERRIDES_SYNC = "0" *) (* C_COUNT_BY = "1" *) 
(* C_COUNT_MODE = "0" *) (* C_COUNT_TO = "1" *) (* C_FB_LATENCY = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_LOAD = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SINIT = "1" *) (* C_HAS_SSET = "0" *) (* C_HAS_THRESH0 = "0" *) 
(* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) (* C_LOAD_LOW = "0" *) 
(* C_RESTRICT_COUNT = "0" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "32" *) 
(* C_XDEVICEFAMILY = "kintexu" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module gpio_pins3_c_counter_binary_v12_0_i0_c_counter_binary_v12_0_13
   (CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    UP,
    LOAD,
    L,
    THRESH0,
    Q);
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  input UP;
  input LOAD;
  input [31:0]L;
  output THRESH0;
  output [31:0]Q;

  wire \<const1> ;
  wire CE;
  wire CLK;
  wire [31:0]Q;
  wire SINIT;
  wire NLW_i_synth_THRESH0_UNCONNECTED;

  assign THRESH0 = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "1" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "32" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "0" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "0" *) 
  (* c_thresh0_value = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  gpio_pins3_c_counter_binary_v12_0_i0_c_counter_binary_v12_0_13_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(SINIT),
        .SSET(1'b0),
        .THRESH0(NLW_i_synth_THRESH0_UNCONNECTED),
        .UP(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
hkYW+OZm6k9gF5yAUfXGm/n8kfXYD6tjFQYha968Ws0SqrM/NNAjCrrtMG8kIqTbkipnmceefxNr
sB0PtSpUrw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NEPpD4CxNBVJLV3hg1agn83QnqiCz3YuR89MlVuNyQGERKVJ+uGolFDqHFzBKLQArFTiHBWivkzK
A2DQ42XdOxp30NKOgHjrjgmF+fZMjDs24rn3Ue1INLHwTS5RT84Kih7Jx/7R0dl03/COJq+33l9u
7l+ArdY7mLwqqI9iIjU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cfBwEwc95LpKuxDGqpON2gGac620iHNKrm/QNXYg3/OFA5ZQNdpdhRz4vCTQRVbOg7b1nIox6GR8
TD/cf0JW38RU0NuY+TR6CkFT19NCdy67gR6JTDdXifhr/zTKjOL5gvp0XjT9PSLwwPyDirNX4TMa
9y9X5pf4gEnt0dikHNgySZO+Qpr30MP7n6oAjuxowlf45cfmPqZthYPnIjBSCdQGBPfSF+kZ2F1N
XCDEja5xE4CQshPPodH5njadc6kj7/qp9C4PfKcyNtDug+qsws9UK25Z2IFc8vk6/15HlIkQHkXv
Wq0iHaPLidqh3035FinHyPD/FDnfGGa5Oa2qcg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QmjD3HAHcP+h0RsjR0iH8h2N6drNxei50nfQN9RC8HobMEaARq/6rKjZEhHXMSCStQeCMhyVKRmN
HM7ZrqMf3W0s/8U4QMqp3M1VuYXVjEe2PCIpvtRcMY3JngdSWOydG2dH6dDA16ehxinMKgIr0TjA
PXA+lfyX6yTs1FWrne/6ufrl6ZAPpNG7EDKQ2aHqSm8DEXT1BJYMblBfAjAajwaJmPEu1aDlQeNo
onryTiFJkKP92pcZLCCufZL8ZAJ5uMvZZxiZRsiLd0BnCfOe3rl9AON+q53U+iK11EvAkpIBT+Cc
VYb5NqVAVaqXbQrqo3+YHEW5ft3fM9kZnlFDew==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FkHW107swc8fPv4xOTlQJU6PWERObturlywl6rsGCswc/v367bmQ1Maze/8QdmUPjEYwhAcHKVMu
7U4o3CvYhmrDpYiUQdQQ0B7gAbMZbJ8MFY5jRxn7KYDk+Bi9Ov8092IdW1a51FPWEVPmF4Kn6z4E
DSqpQDL58qieEUnrU2Ltb4GLJc3NrWTLvnbvRtHUUuQWTMZTQ7WqX4iH2dZ/EICpbRjlAF50iMAS
YHuuFTRKXcIFQlKYRyeQV4nyaA5JGbb3RC3N/Q2IZjdSXqQ9EOpmdhttpxReCnsdJiD/pPCtf7ZN
d/TheLy1Va2FZR+p4MozZorVui5/FtcCwKy6aw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NgZm/7Jvy0UZQRVxBVxeZ/odxMd59IlnRFHjM+6Bof6o6u4Qy4u9MOoQ3Sr2paPuGq+B+5EhdcD8
a5WGiurBrPW0qF+L2CoUJsDqz0WonRehZECQynibSUlmctvvMyr790pwb+C78gtW47p8uALYdUCJ
NhcDkV8fE3jFdDEYmfQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TxQNdd2WOThZCBZEYNgXxai4jK9AqWD/GRadYnarEfzmLUfcNDUoG7DxVWHCdTVuW8i2qZpouT1H
FUHt76rzZk8vI2tFLfUbKyTaRqik1aYwOCp1ZdqbgqQEDhBRWJjGxcJuxZbSQ2z8IUgiJ0eT148+
nf9UmzvYS1jrIsN/a7K4EjyRNMk0V917y85rxdk7itlisaUw4Cm72z9slByFtALj6/077uPjcK9U
mbWm7PbXk8PT44eQeaJl990wlWvD5/8BZS6AHqjg8520Xs+jftSeB6aNqTiYxfp21FJqmexwo7cG
G3BH/DRHhP7ZIsXHqSaJJFo20Nx9VgpLuF5t2g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FzZMPZjuoMO2o3xAFGyhx60/gwx5V1rLuEFq5haFFZa81mvRgPmPc4j3ZS+aPhGDiZ6sssKv/nSL
Y9or7B5mbmsxLLav6YoDLIrhhiOn5br3o5QnhMqLldboGRqvNwPzElFmCSs/+8ahGpqo6NaHum9H
Z9LbnLg8uAmgzzIqwcsYftOZ6KnCg5BI41hQ//mgoLkbrv73ag1nYOHFhxsGHbxXOyLKZ2VicTPa
xVimQDJsEdCelIYuofuAsZgSi6MFBa24PWsrvyEbJvLlTrlcvuaFV4SNXfAhS96nGWmggOWmuhhB
24nuy8XDB350JwCZFF5+euvPGKYRd8BafXOQMQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qaCAHlpikMgRwVZcYZ3gDZeA7gNOzOguG7wRj3GIj3XzUOUOroooVOhuXATKJ4QBhWmtJBgDsucV
8qqbLzCrwcgbsR9lRSiJqGSpbP2EWM7Xkoga/BotkKGsRi7EzpUmWRWmuLEUwYEBxBr2/AYvan0P
vjn9Y9DOSWRTMlXJAKZfSl10tx6whyebmultv93ASvPQLuPQqHBNor/ZJKVkfe2RsotUgRi3Tne/
x76YXo/4DWcbiWvsemesU+YdrQCxemYPVvG4N1uHAF+JyMiipxIFy/SHnWodx3GzuLCi9gixlm/N
v3ZDXqvHsK+p70dhZ+JtR/g8D1dhvDjcaqIrSQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17072)
`pragma protect data_block
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
3cDm8x/wKG0fu+XKozVRpaZgFYf3PEhmw8Cfpxs=
`pragma protect end_protected
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
