// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:12:41 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.srcs/sources_1/ip/gpio_pins3_c_counter_binary_v12_0_i2/gpio_pins3_c_counter_binary_v12_0_i2_sim_netlist.v
// Design      : gpio_pins3_c_counter_binary_v12_0_i2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gpio_pins3_c_counter_binary_v12_0_i2,c_counter_binary_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module gpio_pins3_c_counter_binary_v12_0_i2
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
  gpio_pins3_c_counter_binary_v12_0_i2_c_counter_binary_v12_0_13 U0
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
(* C_XDEVICEFAMILY = "kintexu" *) (* ORIG_REF_NAME = "c_counter_binary_v12_0_13" *) (* downgradeipidentifiedwarnings = "yes" *) 
module gpio_pins3_c_counter_binary_v12_0_i2_c_counter_binary_v12_0_13
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
  gpio_pins3_c_counter_binary_v12_0_i2_c_counter_binary_v12_0_13_viv i_synth
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
XV2WJu5W5DkonQ65K179+xlTFHEhVz1/yW4BxP4iTt/e4QQNDwx6jGeiJ4ixs5hNVXcV1H4RYxBG
bK8Db05jnlkqBPz8GW1AVH/SelCRaov7Z4pYjthtOFpLq067gDgJiGMUl432vn7y4liahqrpqUSx
8QkRnLqleBnzAh53fK9QL+UNFJ3/cAQQv9gUT/53HpUu4wIPdcWrcKk/C53AebOpqmgllXn/VHy/
Jh2a5sVb06nLcOuxfrDoE7qGlTjZJYfMYTKXNDiGy6EVst22A1j6sIxNB6OuoclX+JSFL9CSSzDs
6kLZPJGaPP9Diip5XOfLO2RNBclt/i7Q2M8Twg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YK/zgMoVZ3g0byxZMsGRIuBN0FyVYvMh0NNccxFrosHNSBupME0ztxcNHVvNJzMW9ZOBgRAYvANa
vXCFZyoc9vvqxUSVO5ro7bDa2/v7GOT8CUpoq8pfXAdx4OQNDX5eTuvsN7b+65lgMU958ja2TgeK
kNh0ZJMESgGOwLUVOtasTGbayKNHA+Pa8lpGycEV8gIyP4qkUb9Nvt+5XlA/5gbTRbrO7FiM9tVw
cZMRISOvKXOgax4EUuddzdrcibMkRMED13UBoSU1OTtShpsC6rSAnTfDjjCgs8xeAJf9N5jFkRQ3
d4MO6uUkSnYw8wZewFwoZfVqOOEWzhgcQ7FI8Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8496)
`pragma protect data_block
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
Odi6
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
