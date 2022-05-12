// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:12:40 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gpio_pins3_c_counter_binary_v12_0_i2_sim_netlist.v
// Design      : gpio_pins3_c_counter_binary_v12_0_i2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gpio_pins3_c_counter_binary_v12_0_i2,c_counter_binary_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    CE,
    SINIT,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 sinit_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME sinit_intf, LAYERED_METADATA undef" *) input SINIT;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [9:0]Q;

  wire CE;
  wire CLK;
  wire [9:0]Q;
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
  (* C_WIDTH = "10" *) 
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
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
(* C_THRESH0_VALUE = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "10" *) 
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
  input [9:0]L;
  output THRESH0;
  output [9:0]Q;

  wire \<const1> ;
  wire CE;
  wire CLK;
  wire [9:0]Q;
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
  (* C_WIDTH = "10" *) 
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
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
VZaVMjrccXEraHZZUEN0l2YXu4fOtWxI6+ZG+BXekAIfWySDfexbmowpv7HDFBeV1BL+1YPvOyto
hzx8Lh1sbcd+SXVLrbHA+B0ltse57aSSE3bF+7WYIg5zDrgqLWYGKWpN3OmLFzFXYPf6VF5JjWtm
xme5Qmes4T5DGCjLn7MXlzCgYisiKDeu9W+gMVQWv7Gk8nGvfGQSxaktfLMi8pPnv6oF5f9Mu0tz
SRIPt9/pDYIA/xAFxA8Rti3GqREx3rngY/c8Xfr4wr+JQiQn5hPoen3PsJHi3bwGaj/q421iHqZ+
fbaR5gKpFQv2p4o6wOTGbdbYJyWRg+FaTPD3Vw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Jf9LTuSX0t49BL//mrca1iEiiXsXrMnXpi/XSDNgOTytaTSFwHkxUXvo+JhzBImYCPqSGQknYkAe
3bZTyatygYT3+sH2yxA8426fQ7u6IOsf/4y9VnRhc3dILiYA1yChFpDyzGU+DVX887PiSsaPVf0F
M98COVP+llCiJMTs8E0NmFyg+p89dJREFx8VEZFY1IrIiX1TjfHcYyS1dZmNlUMRCMFggwk1K20M
jCssva/L/vflhqXchrUwkLrlU7bbuL51VsJlks3WPzNFvRhAQCprTHheIiTmMl7dRUbwI2Ss7CP/
0hNTSLrXNrE388YqLw8i7YTUIg+B7WjKqIRBvA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8224)
`pragma protect data_block
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
q8RjBxjZ6bjONemVxyEwow==
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
