// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:13:35 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gpio_pins3_c_counter_binary_v12_0_i0_sim_netlist.v
// Design      : gpio_pins3_c_counter_binary_v12_0_i0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gpio_pins3_c_counter_binary_v12_0_i0,c_counter_binary_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_13 U0
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
(* C_XDEVICEFAMILY = "kintexu" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_13
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_13_viv i_synth
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
Tpu6FCmKgrIJz3ctq1f1X+QcC72CCmxadnMzsdBbNWcri5KoYQVF87yQLdjocQJyiwoPZcYN78rk
+gyWA/kydMB+8Mvw5bL/zFm+Jf70ryKlzKmejwIEah2tYiD6hMIqJsxPLbsEz2HnaAFtt3TDdfg0
/d/0HkI3SreQpDYnu5ocWfIqVGKYVw7PnQ50A55kGZEzGMGzICJk67OSZfaWZ5Tbkz54Lxs1FDV3
IP4jb44zu1Al5daAh1VeQANa3x0MOL83XZA9M9VD5h5XKQPPceSDZOoI+DHdfQfiiyzWWnkksv3X
kHc1gcFAv08myTu7zJ7Y/ds1hdgUJ6ZbLBIpPw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rb/yPPe3KqkmkkW6fY0JwS51eFowJ07HbETt+mBgL/Rg9EpqnoyRKZJafFs4Xke8EV0niXy5BdPL
KKl8W7eUb1FclTDEoqTZ/tzlcr27FoBIE00BaPrq/8s8nyJdfKWuItjZNCCXRFd5Amn8fuRotonb
jz1Kko+Bd898fKAilI961bgqOTuXP9yhGTKJ54k8PknCjXy7g2FeBEEzcDzxOdfr2fuxoA/nONeB
/2bqkxEq90ErucOx6yyuD9USKwiaTQvc1aqWq+aWUbgNquGnhOv2mafkWI8oubq1H3HEmp74LrBy
y1vpfVaeKnQQzyfDPTEMudC1+upzh4KKM1rRwg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 16816)
`pragma protect data_block
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
GA==
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
