// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:12:32 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.srcs/sources_1/ip/gpio_pins3_c_counter_binary_v12_0_i1/gpio_pins3_c_counter_binary_v12_0_i1_sim_netlist.v
// Design      : gpio_pins3_c_counter_binary_v12_0_i1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gpio_pins3_c_counter_binary_v12_0_i1,c_counter_binary_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module gpio_pins3_c_counter_binary_v12_0_i1
   (CLK,
    CE,
    SINIT,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 sinit_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME sinit_intf, LAYERED_METADATA undef" *) input SINIT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [63:0]Q;

  wire CE;
  wire CLK;
  wire [63:0]Q;
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
  (* C_WIDTH = "64" *) 
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
  gpio_pins3_c_counter_binary_v12_0_i1_c_counter_binary_v12_0_13 U0
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "64" *) 
(* C_XDEVICEFAMILY = "kintexu" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module gpio_pins3_c_counter_binary_v12_0_i1_c_counter_binary_v12_0_13
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
  input [63:0]L;
  output THRESH0;
  output [63:0]Q;

  wire \<const1> ;
  wire CE;
  wire CLK;
  wire [63:0]Q;
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
  (* C_WIDTH = "64" *) 
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
  gpio_pins3_c_counter_binary_v12_0_i1_c_counter_binary_v12_0_13_viv i_synth
       (.CE(CE),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
cZKlfdONXvH5+f0m5hXCX7Kqm/AbCpVfNv2jcjnxrfH3uJVBII4lRt05niBGCvGrYk9TMDjrAPhh
mwzQSDpScPaq34w9V/hgKP4ODqLkj8pKcre7Ag+oyZBglxZWJ5ibZCcEAcQlCc7S4uhahjE7IT7H
+hrcxrzQlNKCt21RUaenpQ8KUY7nketXCxH0AcpweQ8Q+vDp8Ac8GMJ9zZYHbxLlzPvXHrAbHuTH
UjHlNpj7RrI1V34uAAMcqFMWJeVa4EBDC/hq0g593Xk251cMsyu39Oexb2Y1YH0kkH3uEE5aV7yi
ewI82b7qrOFBgM8ViFPgJnYlo3MgtRdJqNDGGQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PuWx2ZIqffbasW7tKDeNWU/0/xTP3d5dlmY9QiVxODPfIig+KxO4fMhoSwozmbdBlChDghUDvY11
xh4CJQyg3Bss4znUvBOGGSyOra4fxoJqgNazEYGdQPMvxkk/rjla8vhZkvfraVjIeKwvW73fwj9S
UCsE7tzQnaQazuQt5kn8Ia9pxx2J3OPGVUb5lIxdcs7TrvznJ/vpmnIDZigTSKJc65RlyTPwkjUJ
P6/dtBdCyqOEW1bQH2Il4wcRq+RArEPUUY0jSzxfk3zkt64QriwZ8MYV8Z5QhHwNSVpK8N/hvcEl
berFkuRO1wrPPnCjZLl2Z1vtB7cy/l9OPbxiHA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 30400)
`pragma protect data_block
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
krw+xSB53d7WAMGydgcnMY5kBg==
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
