// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:09:04 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gpio_pins3_c_addsub_v12_0_i0_sim_netlist.v
// Design      : gpio_pins3_c_addsub_v12_0_i0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gpio_pins3_c_addsub_v12_0_i0,c_addsub_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [32:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [32:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [32:0]S;

  wire [32:0]A;
  wire [32:0]B;
  wire CE;
  wire CLK;
  wire [32:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* c_a_type = "1" *) 
  (* c_a_width = "33" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "000000000000000000000000000000000" *) 
  (* c_b_width = "33" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "33" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_13 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "1" *) 
(* C_A_WIDTH = "33" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "1" *) (* C_B_VALUE = "000000000000000000000000000000000" *) 
(* C_B_WIDTH = "33" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "33" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintexu" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_13
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [32:0]A;
  input [32:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [32:0]S;

  wire \<const0> ;
  wire [32:0]A;
  wire [32:0]B;
  wire CE;
  wire CLK;
  wire [32:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* c_a_type = "1" *) 
  (* c_a_width = "33" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "1" *) 
  (* c_b_value = "000000000000000000000000000000000" *) 
  (* c_b_width = "33" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "33" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_13_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
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
n7Mz68jSoPT9xJgNptJuqlvX1j98T6Tr5ZXf3nUDI7wwyJqVChnnYgEvuzxWw3FS7cmJsVw/7YrU
Hn8m7ZuNbnrZzQAWGRjoljl499xtqii2hBqxnxyQWj7vH5RxDRngdokcPrAsXLjOZRTKpvj5KfYh
iavMmMcVEcxcT0JEzuQHmcU6wT/+owNVW6vu2SXerP7NlrY2ByIaL/3X8wuvEA9K39ujBmKOXXMa
yWgO4rm19/gXUwSaE5FL3rsnZutm2A3TVkyWbAD5XldH+flmGPUCjGmd8+AUKpttWZei1r3uYjjQ
VEpdDQ7NDVejS9vuPD5ip+s07V7/NElrefy/+w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T24k3y6ZW5OAORZtxO4pm1kaRr6ws32w4HwcHFFH3cfuiGhE0VM0skaHWwidsI8S4I1MuWGVL7HS
l4ovw+UxvPG8F3gpoedTtVPFXXyfpKlFxCmJklcVNy64w+/Ow7WTEGkMdG1Q7mYPqaI9QNkSYNGR
EHx64XIrvHRSTIZEOBUX3OyoBHxtJ+DfgOBq1l2LfC1aNl5T6kCAOOQhz+oa38TBPzD9DLBqU1lZ
xrsgbAKxSKc+8BPaWf9OwPE6CFIo5yZ5XRzJCJMjyVADwh+z1D/HFEBaxJq34/OMwWR8dt4hzCiJ
T+67n9w6FwDj34As68qhtiZ9EllSdmLHaPU5ZA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23296)
`pragma protect data_block
LXasGpJ/7hk0cJ4MwMUiu7JpsGsgMTF4n9TOnc2o0MgU5GNc7vNjcT2iYFHVxBymlq3Go67TAWD1
SUAUbMzyC4j7BlY6nja4ZZLvAje8BOFYNa0sHp1Vm5ATaYmJNkSRYLaQZUFp2zPTvP+dSFhFpBjP
+vRZLPAf+kimjeRGH8w27jVWz0v8GBNSdjf5ERTQuRtVWN5E+erASwYCGpC8/pw4ku5FrPLQiddG
NV0OojQ7THHXraNgx5yLiOiiMBoT4DjNcJO9VIF8JM5ILTQi7gGRTsEC9D5LL6aLsuWXtOTSbpw0
L98N9vdzIaofEoqGcPLzerjjYFyNAL8/P9sLyVly4Bi/dcBpD3ssvWMFKGv4Y6rBMCSO49h4KGq+
1202eYelInmQMl6LD0GFzWWKwsoxZtco16Qcpmsl1NvzGOnEGpeMjBaTtfgiiO5M/NYiS7D2+jUw
sJG66aozQNFMVo/Z+BV6UiC/7r4CYJQzFu6qy/V06w1FrELUTPUy1rxuWOzeZUiXlY+IN7aE3qUc
Ezrp43niUe9zUxp6PRXIZsWKou5uKBRCay9da/RhENmW2VduAyU1QVHYGq7VE10zytG0fGIqhqL7
E6OVLjDeDQrrQlZhk5fNW7+fYHBVrvvkQrwDoRJk5YcmKbm6HETv2sJRQuNVX7aCLVBTOckYZt/C
WGgMxxKRNhxzIerRhQihQ0DS/3KXKfP79tohgbu/en9QSuJTIKMXTYWgUHkDffTrfP/YqH3FUj65
gPGE0rPWCfXGDUQpt1Q+USJ7n8J0Vof3UNLOx1OeawXLCXK7ViLsWnJE+jtOUG5uRQywegUnHlQK
JevcwekOYIqJiC6P+z37O8Zx9vfS7opDCVmT+yw9enJISY9OaavVrBvUkRHJNfmzU6/TKum112+k
UCd1SIdX5ru2XleG345FpQhoChUMRKpQiPLxIwIkeIVcFS8+HaFN3A/IAfbqqT2AVdkVhhIwPF+P
wx3lP5S/wxpUYZjoej+4XoH3/cU4MGKj9YhkzOPjLSA5O/K9YtA4C/QLanbybUJU4ZGxZ48FMaa4
IORKi12Tno9KG7HewC2tblvi9QU27RpZUFuQpZd7lfzXZbf860rPF+Ucrs0QT4eKpj6W9KAhXW4l
ID8AnloOb0qV4ccSSdjPMqe8C+ea0TZgT7gRZ84liYohDfeV/4UeAWocBPM8CQalpyHQ3vqr9fH9
XT0c8zAA1qE3sxNd9aaDMvPGvXVNEYZne0TZPpOp8wkQIEtYNag1spTk5PPVjIk2UjyAL6CFKPZC
dKW3OFQ0Jw+eqjZxcBCMIWNJFLmn2ZX86k4zRtLK1ZCXU3bKTJAp/KvYTZ5aDc1JCXlGNGupx+JU
SMqYuWN+ezPf7VtHDq8shNhZ2s8MdqeMmcYBoR0oGEIHa8qQjNn4pCErnzvZwN7tHG0yeE78pInf
pP0KiEPnINBriW5LeehFGUhYPO1TQjayctrgNIe4mXSMVpIt1cXTicpJmviiIVBPCV5HTto0SjBX
6I8/rrt9HGie0rr1aCDVzvfUcGzGazqiI7qryXecRS82kQjQ8HrEnvckzYUYMV6zP8wtQEI852Qe
wWl9P35rdOsNnjth4FkKlrCmTNVLp7iwf/bNGZwI9Jawj9G9/fbcBLYlC6a0scb/6buoinYxUFZl
sjG+JUqOyoOPpthbpfXILe5f4DMYNWWQ/DyWzQOa1K9q443eKT7qxFt/nXvBb0YQk8DU0npZIVs9
jZiyjPcFEr4BDH+8gLeI6nV2P0jKYMj10Ipm6Q2ZyCb58+pgO4Aap4YHXRXSsjFmrmaE3v4AgyjM
pD3Ixwl58gNwLvyS7RiK20ALjUb62WGgl5CMszsq6DdFDN3DOlolmubX9h15Brf5R3+vaP2qpOr9
Zj1M+zMOzgCfuEWs94Q+vtqL80I3bzCS7LPHkThjkg+/cPwQ0wuT/rIsTv2Kbho0bhu/bD23XWUY
74FJaAXMfzme/8P7lg1KBmI1F1ocz7QC3EndvTc8gMQuDndlxAx5tVBw4puFDPG5osS4g7WB1Irb
ICQSoZyY/7h4trNPYfAdiBgdnWoUZPI7g3yx+F/QPMs46ERHdxF8igSeANi7+XUh8vb2YJiu923P
7FlTWva7Jt9w7h55tbnEYsQQrib6ibffaquOwzgC4O8BZBf69/KHmLUflF6XLq0b4NVR2lGKMFC0
OpN0q+8PrOr5M3HshQl7QlU0ASN84wOKkRNtGm7MEWxOZjDO3ZNzZTbzDxhfO+01E5ktJmzJG07I
tN+Zp8fZqc7CLTBrbOQ8R0mKaRebjWnMzZdNdmkvOkiJEZEf8/z8bDAjbbke5CMBS+uMekJuF5c4
GQvH+scDDsFUoPlXkOWNpPObOlDh5uyrTFMgh8zUxfyrc/a82bArzRl8yBKi1TWiOFVy/Vzn/QPF
r8TT/UNSzag0FdRnoeX0UgXxBTlI/FEknQ7cMvhzMgsvXPd3URK5Hbtvfbquhda+xrlELX3fCR0a
ioV32PgbwmjLFfMJ6LokwNBpFjmT72dVVpyklarR2H73lErTwBcGC3dfI9cm2iLfZwx6ooSYBBiT
hqZFFtgG4XqEGDBI4jKfE6ej9w3IlVTha2L+h5quPeYR6SPqoMqsnw8R0ESWbM1vWzBjdZiOsIOv
K3mP7/xhqe0hQXWL4nhsxyZuxevaR8ownoXxqWEyLCjH2S4AeR8UBHDsxsmkF4cjBALYZOLHQQZB
7LpzhVoyfcOSe5m0o3eIOycQQyNRdAByQVlklaQzlLjiwEdlYemNKy0nsBiG/Q47RuEqlcVgieYY
n2T3Sq10x05g8poFUiogSOiYpZSKnJMx8KPcAei+qPZ+OicJMRd5MJOy3MYBVTcRqjTxoxIW3mYG
PAb+0ILs8Au5bQRaZILEUv5sTo+2uBgZAY4WBqOR/QgqfoJQQlwfxSujFhG0E97+JIJY5+gL+lYb
L5WpHi0xO2f4r2emhYLXByZO2VL8Pvb1w8u5erOgpVYIl5y37QoBREcv2lx2Y2KTYTzFpTesz89X
X3JqqR8F+j4iJ4bohSdZ7+N7L+aOAP3g8A8OCupTWNMiKKp+U37TKvx3N8KuISe9o+x317IJuLvw
f3WA8h+WvZzj2Vr04r2tkevPJTXC/v4NOc9wSo5OjCxwgBfH1Yi5yAwUIsu02cc/+kFSyogusFKb
EL7K8OKua8mnlNOQwWXalrbsJLyswnlRgBYOLVQqjaju5gBNisnUDj6b25/9phn6bujaC2Vaa3CP
BgRr7iEFhQz/3UHHaZhn3M3IZWXUPt3ctJBDqEQzmIv035Ni7RNvhoRdQvK00yKqggh/i1DMIb3R
2NI0/N11vZHtuz4/3SLrsmOTAisCqqAAbOzfniSZWN65Irtj/iTroXdz76CwC+rV89F0slFyK7hl
2htZi9nhkKX63PFq0lXcSZJOhTbW+azQZwvvtJiTab8ji1bZG5eDGvpjAJB5WMNoyuGjNcBvpUJ5
SoNQkBLQevcd8xIrSO4oPnCaqaNWUxUN71qP5s1gL6+/54sYQxguljZVeKSiqB+E3jEL/YkiXeJR
fnZ0xptbLaErJP3YA/QnJj9Wxo8jZVO9ovj9/5OqiGHmkH4mMcjMxjO6JH0IDhxbES8TQ+tA4L2K
baEzLtAX3oDZZINsButffbGwvk6pHgZ8mg6c3AgO6C7XLegjbi9BhU5L53cYnVBbwSonIVEiXWIh
B0z3oxYHNQBfevfBleg+qWUzHvFujdjqdt0C+qUZfxP7gj5soqg5sybuOE38Jfj9VSGzMYjcxH5h
kI+3kguu2fVMrVufH6wH9fhTS1BCm5/FUgUogXhrqCHoW/3pax+kUevaN6OUBIxC6du85zmqMAHW
sPT7eAocYVEJ9UX07B4TU0RDk44jK8+Zmrb9FewHCm/HapbQy4G8QMV4zridE1TIYsHT3mE7/FPE
eB8I9hWtUWSNb6GexKcxqmu7fMs5R3jJIh974Vb4ljy2S8UmXo2yNUDaqv7p0qahgNHdNB94ExIV
H9p/evlX+RolVmsYyMCSi1cXE/8dHxfrWoAJUGbd2vlZWcKp4K+sBK3Kh2DIMAeOSyMFyEN0VBic
KF6nauAljxgbuNAA61Chfq8eNayVb0HgBDj50DnyJ8wjHDyhACfPimKbPZsyZkwTlZPt39Tgzh9K
eFh/EBsiroSlpw8h2Gb7V3deCq32aJPsQjcKJFs01uWnWIPp5MZOog1D4nMgqrRGzAljD3EqAKjj
/RGjclshFY/R91i4Lz4SDD36xAm58ywej7XCFEgHrnKDzV1wvHg4t8Kh7zJsG+cEck9vmYsu8YOf
ieKazPr+P3Zclqr3A3ucoOy8KUdUJ2O/WEjZZ+wE55OfZ+SQ7qweyW4yak9qYSWLvER9PCwlvXFQ
rQXJzt899i2wX7kA+lEbkIJOftvYU51Xmg9ljxglVtqmfZl2nwNLvZch9gV7/3+HcScLvQNqPGFP
87DCXXYBJnlvn0XEmrPGkn7s6Cr2il5bfcPjeUwHVAmiMERw2Fm+omJkYpfwDq8lZ+H9uL+Ljo00
1hhIB7xUJjhy4WNFw6CZknQk1df/ici/TEHcpwrmUh3lCk1cMntMo81z/prEleXp4lXVQwh++m0K
20+1S3FGthoqevsR6BcgDi1ai/FR5Wc0quG/SKSFVD76yvqyjGkbTxLFxu+fw5b8jiNpkaVMtWeu
j0ZW3LRr41SN85ZozPYwqGlJxB7o5Mhelv2vr8GRmjNoUk5TmEXbPeGhdbbPNrcotiJ8xX8MJuOw
duVFPR4ucvZNNVzYx2xXJRgRyLZ7AKN1eSysuWAu3IHM+d8Cv89kkN3Jqsv4uA1RUFiE5Lc6KrcP
2Gxtf1rwEn23K381tQdZpRU48r6FWIFY0IlYgSpYvtVMy78yix1wh1aN9em+gcysukzVKdYNqEe+
c+hiqdjePZ4wrZQPQlqg5DAm6HCULYq/FhjRyiFPC30dip6yGrQzliS4HzXEPsJeKNQSyyaKDzew
DH2p+HOuqFi1FskfBsX45t0w5HQ9m1ORuOyFBMnbQkP37m0NCa3655VZX9iREeTl+PHtEt4Wk2tn
PZ9IGBYOwmV3hy89F2nyvnVR+i2STdd4oPaiTu9j8wE2VOzt/QomvgNBwUfCJpVst1D5R0MMfnPJ
VaB+Taf/2XydOILd3iGyqrP8MxnuzTbn9iPGvF3GyESpgepGGENhh5RyrRkr1HapsLjy5MMWcZN1
aN2ifd0lZHrx2f6eZG4DzaWu+BKoIuaROBmuZFTxdZZ+/t053HNfcNh8EiE3CsCQY+VNayuXzIuM
gGsQj09rQGa364c8dbsUVifrD2kNfsgqXyIfmTAB6u0E8HMbGqHslyJw2JKNDrb73V8ODCbgxQvD
wm4Xx30F3UIJ41Vje1vVrslLV9ojP4bn20NIyFA9eZb1IxQCYQjCArPN7ZstYNQoGuFU0KEtv3jQ
G9WENNWycHRwWZGl2KLYfeahIp0s1VyBH6DISjIQwhk2ahUK00U1jH4eQQMSOLL1VVdAG49zjyne
aOhcOoBjP4wpWZGvIdrF8aUR5uOMsur/ktpVDereVLct7c91iTZjPlLWp1UogiN5JUNZYU5uFnhA
DVFSYwwNnxRDWyTdzoIdJEnUlAvP2Z3Rn8wv449u2pn4k8oHxt/B1H369SeZQNTlcMMS6xvmWEev
Agy9msHUk+QEmMTQp0ce0TeTw0QQdcULdUH8T3S6dYrxvaJa8tqSV/EoaKGglfMnr0SLD8zP22Om
bOSzHdN/cOqKY3P2yIaGJwqOJ0LjqcCb8A84ye8Zz3wrpdr2dRzDZ2BTrgyyeRuR6WTgNcKwYnxc
p1uIWMT8XD/Ee/I9DCalLMTN61bGNs4pnXNQ2Y2nabjTZQtTU1w02w19wDDINMmGZ3JG+4p1OrrU
Pk2SBgvWZgV6pMS35WxLKtgq5/rEXbF9OLDgvCc34KvI4WADdEY4TRmWRWcTwj3Iob7duua/5oph
Xu3c/W9G9oW5xVNFy1ap7kg+suyK19ijrAyszOxg+07ypSlYfO0sp//9ji/0KqRlMnV+3V7+BgGL
wkD2kq0dcmlqB97Q5sC7E4sauz9gRk0eNTu3BbTsol37yZsMNy76IwBwfSATOzOTt1dmtX3GZUGl
8K9DPeSzmVO7FwderGTS51imtjdV5qUuGJcWrKBHNloJERf32pbY9fY+kKsQGYaMl84goc5+aUH+
WrHD80X6JW6D/i8KbGtaPMQyuGTEHpr/QCDGOe7GRQcHchxElOg69gyT/couZu11p9X1lKhfJGQG
20iLDe/iM52lBfP3Ua3hnZYEJOevToumfbpkyaJw7zsI29qFU3Fn/AvgLnNeEVmcq/3aYwsJACYi
EcjytsVtoIyriAWsqSvYolM0Ry/XjqdJHmNvDF1CNHmChm6KZKLVqKgiJg+Os7OmzqJaHqH/S1xl
Z2+Petkq/JirV5VicAvXRUJ+qKZBk9VWdbILWOhUcgI9AT7MS29NlM6opbJiQVqMO16j1bbjkNgb
DHfMLpnULFEDHWqyY++0yWsf5MTG4CE0rx/iMaYCknWQ5roOjTbQ8GW6+5mb2CXtK2UhlVx2MYO3
Una6XkMgTuLVEJcwCEbk+9uVfabwn6Ts2B887VTU8NaYaKjfcn06fkT/Snw60B8f+6uAA202qVpO
t/V/gmWD/Uq0SfMwFf3IiB63dZIRA99B2xqmQLgUjuI7LRuPk/PaD3FxTNJPQZE+lFo7gAhAmKJi
1SgMqEatjL0GrRWEylxQUa+PwX0X6pPd0hFi+3rCAEzqL4ATvC8Fm1sH3DM3Xsz6VG8xYj8WOt0c
Zn/ieyEgiepgn+qTcP681X/6FsBi2GVAuxnuP2CkFT14ScP2GdZs1uGauuwMBHrk4hzWRrk3+7xB
LcyXoDhkx9TN8P5QRk7e4uQvsEda9pbDe3p6vXLR8wG9+7AxE9MBLhbGrohNloGt9o98zEl+oscF
ZKp4kjbDQwoRd7604PJtvWsqB9BHVLdxGXnK07Uc2p5szh4Z6Rvrn9huVM7Ww8XIQRJ5chlb2SEW
9Xttg5+faV6Ci1EOfTh5Q85gaIDV2pmEBW6Swiurds4//PaGbCwRipyE/mM+uyJAcyCgoGbXjl0a
DsovjOslzkKcqPAEnvAzLpjYmpbY0mAUu1LLHIUe8pNc89hcN3vm6UfMH7ZOysDcW0Zo5Hlaczsa
5XwB2EE0jmAQsqYQm1ygwo0IT5Y8JEAXNeYRBObBQtRIZA1AlBKfdxG5zLSAEX/E70hpCsou1HBH
9+2XW0xf27XsHoYU/k+/4FKlgX0sDTnKN32YqVpeWpumml38dchBWK11QUkcgPNAUH4EpZJb3yia
JBal2mn7REp2PcraXeJDqTRMFY6sfB2ZpvOIL3n9iy5fKrU+sA8bqVqe9YDIdRIS/qbSVmyJdKj4
F+u+iliigcHLnc6f4yo8aOliwlCP6OScTiIOmVNThGUYd2Ro9eRWU3VWY4fM1RMrfqCXjSUIDyyr
vH7O5zYEb4kfO4CgmxKADP/AcCt6RVKpIzVnpZaXNsQu9QIVo+HE29hQRA6QRoIKNVCIZfvjpRnA
sfSYpyGFRBOwypkNV6uHa6aTeYW5mK7LVZiia++NTLn8v7OgO8cijMS+qV/V5j7b4Dc7pbXrXx/g
DBqwlt4Z7f8lRgNWoLfbs7y148GRZFRHL+41zwtHjCwTVwVLWJ1NLQxnuDfex6qYtl4mIobzFQs3
cezs+IWE4Xx2zNI5rgXdQIFAPuLKepSQAw+o765KAERlgM+8GiGfjbUzAonBE6F2xcTDvTtkXDzf
p8nnD2hmHaZ7psg1ZgKyPExDWhidq2bBDeICL+NxYelM8DywvmGFnzILxNP+2oP1kt/vMUNrVb+e
yEJAKUigtuLVwD2BFtQk+m0lDwrEozR43D0BJLTUE7Za9I96E9OsuI7+xMs1NPlC6EptKMajsMpF
H2Q8UNqSXVLqdy4E+qwR/7j1Rcxoga/xkMtSbWSKp9XDAeQc/WZrbVdfrQ1BaYJTl1/Q61sOIWrV
b5X26AtDPBvXauJ/7G4my8F7PW80O2UpmOlzPinlWzBT7iYXZr7X89azPZr+2jt7MoHepX0qtKlH
G2Hg0kzYQyqPVqeXqy2CZ06cnaLn1Oc65BwS2jDZPRqn6v9mmSDYqPZWnmMgIT/vONlwGxnLcm4R
pGUozBD9OcZse8CzhAvWq35vxPnKx1UrdmAnav728qv+DJ6pR49zJh+mAqmdhzWYsWyYjJk1ydWi
2ZkOoWEZ3Jfir3AUdIfAWcqzsFbQ8NGPYv5jPC3qh5STarvVxynNkPufpDPspLVmuGUOQpECHPV0
jzlS1io9lCW+Zw8H1pRLlN0War+/bF6l0QCHh5AFxsA/CEb9ecQYfZCbWr3u0bErQ+xj1ruSjNDZ
wGASBz6yPLIbQldfDCo9Tg2Alm7Fs6GC2M/P7xVE5pZy9IWVIqYmxoC3rJZGO2u8iGTUBF2DQqNQ
Xy8u9d2064aYU8TqgYGu0yu6CvtBZ5zbytpRV9H/hx0RUB7G2LcO7dty5c6ECT3gYTCDs9TsMpII
uYhO6/bunBRBJx2dLwv+euwWpcFKO7e08q4V4EG26dFyMgQlpyDE4E6vlOzeqK/wDNrMINoNlst0
0MryQik7O4wNlmfN34eE8wVftiC8jy41VWSz08nAxCdIqf2/biS+7dL0UduePPMnwAJrC/9VHD1z
0YjLl4BeFqAYLyKS6AB0NCE3uH+EsnekKtnXZq12CXG+ZaZ/Wdg/AAvYhbjwcpiAV4IsTlJfNOYG
ZYsPV+aXb5Ie3YY09IbGman+F2zkEoVqHQxIX8XEavEM8eTCpllFkTDLmVPETxMFdE66wRLNR3GD
ChgUKWVOL9dnAgEWmzDQtDUUgYEKubh+sJdmHQg5T6xyV1RLIgBSmfxedQk7qhNowZZcBeOUi0TO
z79rAXA6sKhMQ9NAqy0K4iaqkMe/V538D175T/dKH1FM9m97dMtQ+CUOwWZiHnu8Hp0/Ckiuc/fj
5hDnRoZk0XAn9wVzheyxS6TyTZoRo0Z+X9DS6KX6JnCL7i28YvIhg8UFQPseI1n2+PksZolXM2mn
aLm87LS9TaLhYJcmBg7tHtPncXY2LFiyilgJSJr8UXrlH62J5Z55mmCwFu76T2eVImtPbrT0Nl3Z
wyNYfEWZrdzc2QIOC2FpCardHOaq5Qo8tsRToCyDrGVORKERmi+/1g7qahibRA3PSJpRPvCIKbkz
uFd5hx1bbCy6h7x2EuwCPXow4kgM3cC1Zs6lWvC304fwCbzuqO8hJiOjmDdL/EDN7Knxt1zMHCDL
+rMhYl12muwmZBGNaEkYqbO8BK+nMh1SMi0LINzbXWNNT9ZGlCoNYat3sgyWDYYftS2VqnAe1m1h
GYNX3FySCYdnaKEx5trgxtM67mm5LonKiue9HYnwGx8ihDt4l8DihRdTR7Gqujhf5abquNnzR24E
a/iWGkb5MPwaXQYyhpnWjoUNGkPTnzgLUrui0qDihzUa3EcmqXp6tPyZKABXdR2wdbKyU28gSCYD
k2j3i8gl2fctc09CC5YFU4zZXnvfkgkbSolPQksccMl7KlXZEsKzp7wgSU9xWOoLEP78qZHxjrrO
CuFSUQDLttXnQwykwYCcCy8It9+xE79Pb41k5tLPooTsswDdRH5qg/CGpCHJScQzTGXkNpviURD2
TAPSzml1W/MEBTfB1SC5UPOdak7D42StgFVRnjgnBiuEXB/YKuS5272UWb+vKr4sW3O/LWWNGqMp
WJbwD5rrz0xgWIX+UbFv23ODdD9WRQhOvy/kfHAX7BcHBlwsGIiEzeq4s85CztLjg8JcFPcfgl11
lKHIU/asAZE72etvj4yvYvpHR00ckqAU80UVzCMUpC7Oy4Cq9KKhs3+nFCFYqKqjlrtV8+w+fspP
nf9f9e8xY1mpCpmRYF15iH1mk0eDn8g7+pvHNyOE3CYpwPUI2AtPzwlk98bAiP/oL+uvX3QhlLtc
kjDeyaAen+pxoOjRjh4h1cYFBUP3+uEtJ0I3dX4lbU2/il2bbsZs/0qulJWRh4kmqeTMW7KU8uzG
Mle16JLrpxix4tNw3Vp9k+t73AjDWx9K+VhbXmpOolNiLIm18hOVRddRmRbPYTA6DhDT7rKomTxe
1tMfcyoxewQkYE7S54MZYyoTnCjSAYjfEqRmQNiLoWAP7bVzv7ALlUDt8ln0fueiArFcghINyCsm
+jY1a08+UCwyOxeQcZYBnw0jN0cBTF6/kcXOpehKaQeRO3XWHnlEzj67zMDVvrYVx0IxfbxD651d
qSGaeqjFdfN8hr2HvXVcI5N2nu+i887YZEMs72GkhwE08gj2DdCR0R5sGR9ZiwVfHbVoMVRQ3z7f
NWmS/jHgtqVWXRqMcK4BMv8DCMoTyEcugV9NsvpHRgEuu1vQnIlH0WIPqWWnbQsroDXdz+/Hapal
vFkGj9/Tt2I6WmPeRynDN4pA9M2qQ9aAfja/NDI6yJNEiFVy0yWoJBFrbhy66o/c6XKGMdS1tulo
JaRhgvOjGAPVdIllEa+Ks2QGEiAmHuftROm8NRP3pPmnVCNrGRMjH/likcAEHC5GzbZ2EJZbQSXm
BzOgfDrS6aL5MzrKasrcGeJj9Z5yL0VYWvIvhT29Ray39yUy5czu1Oc7XFcq01kMY4ezlzHGkhxG
n+Ptam9q43s34WcfomS/EKsDTgVEh10JJ//A97IeTIlhqFe/ozM2euMmCdeVdsuQ6td22cSoXeki
faTrUpAsF2kuxj9uwRrDDQtZqNvOLGJ1+hU6dptJ38Bw0q2/iyMkNz62tRP9Lxsx+01QXVn15QBX
c4Myd5BmXcbK3nMdH2AH0g+n+ynYUrUam4a4spZCUGsIVjr9+0mt0jiXtU+Ljv1eHpId5/ch6GCb
jSSH92x72Ah82Twp6C64UnHbAr5lqN8rb758XIGosIijAZuGTWP1Tis+d//Ck/JR9OH4O/ve1NWU
+112KNIpGN4m+/Yen5vxdXcdx8eVGZnZ4HXzNXHRfs3c4NFEZ7p04qhucP6nhn2xmRC4A20M7sao
OGBdXDkLXTztos+Q1y7HSnqlz/NjTj0KL5x8iOss/57l/xHoVy6UqMiampsgEilXM9JoVXIjgRk/
aLNs71SYDcg2bZdYQOg3IvI5YUqKlsUe3jOTswVZmZ18izJOVDxmmDxraN1kufhoExvIknoZtG4g
hSxrkhxzTCblz71Q7YTx5JOyNbV5of9TB3GMHHgHZomYH+EyBs/8IRtQeW00IPKpsSFVK13FuH/U
DmOA8IBnqM3/a63UOHxECfyBz7odwdoJLFqdssyetc+vJl4oZs0VHoNSKh1D0xAisj4sEM/qx1Kv
fqp1sqcBc5wJPefMYXH+x/fXucT4nXt2eOV7ZER0bt+PymqeTeTRUo78XKJlgrRsohV9MGaC3Es+
TNhREEviNHvsjNTJjjHC4nu3AgrwXUS7gIJbrfFLnBPZ8Qc3sxi140xMY7pvaBWA7WVQT3U/pzio
NUAXed7lYRSRTnqBIK65LqFOdU2IMlULo6s1WEeILDvd73Xu1z4lGf9uIrFyJqFo71UZki5msfiS
2SalJLb1NqvElw9EB+/q3IKJ8Ete5yuUP12oBEEjHfgdhQUYl3K0fAHRnpQ4b6ZyOZk66ZnLfVao
zC2nfKHsWVkK0PyJg0PYNC7yqdh5FS43U6engsdv4yD5/w5E7xOGlgSy90iTzskiXGJ8S5zzgKCV
LsrZqFwp5LJ+RZ4AGFcgFnJFmRCpEBSwMnVV/HXZsgRlBJM//qFxt1KQRLoJ+tAQF7FIBpI20pGc
+0969fpF9FzLnvO3FRbBAVfHqKDou5qKBS3eOH2piiya83gH0lx7K76ZsSNqfjPGHDgZG/k+eewE
WWk2KD+PiDhaTBA1hAbY/rDjPo6Xs4Sx3kI9+GHUR/+9gWScLaGPJfwSMa2RN4Skcic4rcAZOd5C
RHAR1np71M1zxE4QtzjMNsH/EfyfpvqNiC/aRzr5Wj4L032S7fSoNRIx+JdZdYKU14vj2h4V1oU0
rbDTokOTeE1FfE1NR+ZaGE/RIp7JWr0hI464I0uxWLW2r2mMlsR8FchX9nGCtSgDUdHoWjjKd39f
kh92clpri2iXP/tG7StoVCx/Bm0p6MDoKaBymn9R7YGJTiPimN/oSxlJTmDxwri9WfVu5pgVrmz8
YEJL+s7IWVHxetB6mdfSbcmz39uzgALHO7QfExRO3vA1tyW2fY54a8UYI9RlOrSXSbQ88YTnQAXv
qMmjiuWIJATZ0JIf4Qaq4licNE7INh/1Dizzk4oJ+rDex5T4y1lCw37qTXRe2Riwqg4ka4ExajG+
qirMZLYTigXUhP4KcOs9kpCGKVkyrXRGPWtKWWTRHpgfzJOlOwETFB4e/JSS86P527bOPlb0LF5G
ChF2Pj1sb/8jtGrjSNN3nKhMAiyxkWjLuFGAVAnaZS+i+VMIV1e+LWVqPRdXLO0HR+J3QdGnD0Zd
Dt/LLKhHgJXKulPs2DTxxnZnJyL2BFKobDc+bTGWCC+RhV5k87+BpEG2asgc4LaN+7D+ThoHUXmy
Ieik5rRtfRUe1yKhfAfyZUjFmv4XC45KF/WBiZqi1TgMEPhHjHaRFv4aZvWDpGc4sq+rLqwuDkjm
ztvvSRQRxOUCybzSpZiLjPGXPMiyGC/iIHAsH/BT/58e4uSxjAFh01Yy7lr9SHcuPeBIv6gwKx8D
Mu56+PSMqLTPZKB1soTy7Hd5NUWrV/QFt3/9I0YhImal5dczWqB8ij3fk20JrIrfS0rbzIz/bQZ6
Z7b7wiwzTe6bIDTDrEpanfvJRZuYJEm/CI/iMeStzDOLVWwyaNmvDOmD2H77ondcLDaPNL9Flh/w
8gN2+QXalB1h4n0ZY5xID6iJX0AO3Ag3T7jE39F/RlV32ewbDYxxORiTvNcikaYXdIj5aqrOb0s7
yWw2IOSgb2EMLIQQXbJDID3/3moSSgmDVrTnAKn/Z/qrrLJdILe/1CPOZhfy3R0zxvwlZxGXbWFr
cfkzu4XU19Rh+6IxicwQ+oK61d1Uczlwp0szFeoIcKgIPs6i33dgI6eQh0OBbNjeDkr8/BOIXm+i
nog7vQfYCoQ68LarCphE/BwYxj2pUKrHXpSF41oZNu2/jnN2QIRvII6WbOIBtpukjwNUn6Ja15/f
8ZOGRqor6Q2mcYkDj+M/+vxQMFmDze6Sj+kO4GmTHdVuJGuxNlFXoD0dXKML+rKKHPXsZip8KWj1
FgWVM30gn7j0RzETVw1/gn90ZZFQ2fAsPNQ9HVe/jrEd6OehVeS/KS1FyVNwpcD8jz8T+iP2101T
qMiTpGL+n3o7VhYZZUXAMGaUV8KjrRFwQr5F+y5+ljkRYgywuRGtobuhB6C+d5hZOpKlIMOyPMLt
DeaiCLMwXPK+zLf/+FvvobUcZBK9sXs95VCzM9U2j4Z1mO4EElYdH6VnT33zAJxpv/mJ1BNBRuH1
Kh9j0kprK7uJVDmTt4dFuA/cNYWmZB5B8fKRI58JekwWfs//ztKupDDFOU5xxIa9IUFtWCxLVjQk
b/Dss7LuFGqKbXpLm13Fq1Gm/uEnf3dDMH0HkR9hNszBh1MMlcCd9hzd8+a9vvmj2gpJaH+wb++4
oh9JdQTBDA1dr1UJQM7Q4x9bMjZRhzIP45c2xatElsduDVN7Tgd6BB9RPAuL6hhIloVjIgK9/qob
U0CxguKMrTlCR0kbRNvE0MaM5JHGpRJE6OEtH0zc8bPmEFThWflh+57KwDnLncg51IV6/ezVMjI8
S1bL896yOs+DdtWxPDx/rz4FO4MPJsCsikD/UsgpqRJgV4Pit7VlhB1V43IyWzfAWPUA3bWNTOxK
MQ/b3bdJXdIE7YsY8DDf6k2ZUy0EGngTGmNkunWXvX0TybHuOsKijjGVhs35hAgEyxzJGDD4VRSL
3/7rk+SBK4kV6BkxZrYPSdxz9mixYCAP5Yb4CsdYmHokanvuTE/XFPdPjgSujAMh5g1eQVlhjjSg
lR9r91/nGcgryNfRNs7Y63ZYadSigbn4/YY6A917Z2Yw0+fcRMBaoya4w2sg8xvl3OpP54+vbqRY
5Kx8WvU9dlGnmQ0jKgoA0hGvXnJbTR1vIh5MWVY0YlaFqUPyI9MvbeBb0F1dFi/c+Uxszi5DlB7f
Wkgr8UaGwBF0yi3wM6PqQOPKQ8+yBX5TqCM2PVnXF2Xw5DIYoP5CcmfqVUFEAHbEHrmC3M4KufRO
Mtvx4vTWN44yutR4m0nHMURP49vgW+mYj14pce+UdRUA2NxSYZ/qAvOi1LHSCZHeI9PZP4eOJ8xs
H14nT6Qwhej928JoS27mu1OecyIDylVoLxoOLsDF1c+HAopomDZp73U90Ikeu5gg+sZLht540CYl
cyzgoD9FrSkHrZTCffp4PZ+/12g+Vj8GoIFSQoeKh4SNfYLQC+TgpukFxEDUUzrz4ErnLUHh2dou
6N2wcjXif6rOHbHHfUM0LiACvzaUgoWSko/vkLI/jPqP3TawrRteUGB6PZPYfMkN1OCGMSBJB0yu
q9iqx3U9cwtPmLVGicL7xvfMU3mJ3zFQgYJ9v29conpkLsu/EoLG+dkQUiPMiw/Fsj7lkeRXjisX
PVtO5Q8fwGaiJy+AenaFEzjmUn3gwVG0ZV6qKdnXgB4MHBde1fHdMu+8W2HwXxXEFRmDHCTUDxTR
FwBAgPgEmcYT9KMu3VKzJwhAPX9Di16wIskumklyUtMUGkAOYFnUbO2ukw3FSijrIoTOMbuS50e9
GeJFsTJ+YKAmsvGPzVBqp4P46c2ANyHRMrXsxCRJNip3nbDPGv9F1/BXePusampSyFa3iMQ9mQK3
1+FclchSYqg2x+8hRV4AM0LT2c4KI7N/ncBU66uZOW/ou/PhfUT3Ae5KKOu5uj8cnsfxqN2YmJrv
Wf5UXIUgHX81qXFYAPipohjSVSi2UTsl8CqNZ1jFXNvHSZGmsLTR1oT12HMLSofy59xq2OQyN5Nj
yRjLJEZjNjj153MCnDOiE+uzSCMgxxryIeiueQ5EMr+BAHY8OfQW6qRgzyDSPxh6fLDcvdfaodZl
tFzouXbc0ZWPKjPYemJhpagyL7lOggCgiJz+qykSFRzLC/CG/CSg/Y7AZPN0VYf9kYs9GW1BBNnN
OUeQnBjf7pa3kD30D0mFRLSP4nZb2uXSNkfWxQdXF0sZYFYxbdV7puxapYxM4kuz7L498cmI51wb
NidNwyj8wKvLvaeH/RB0TzhPYp9zTcsX/Hc0RY2TA0uRVoxZkpe/bXv5AeUFjMerJDd6bBfJR5vd
3gWkGDUe2OQJ9G2VKAdltNE5v2SEANq2WlhycGj8TagfEK6DmoFYGe5WPSb6V6IxyMC5bKtwzJO9
mcxFdcnJSmUc6D53U2H5rdJ/aNUKB6CW2W5RLGVNgwTrqk6hfYJ60aUC9x3muCYsgyNwKSsG+f3L
bbQBJ/C+NnjkB1cpkGmhUzHNzFx+zyRLqAQwGuYDLdF+9hswjm3h+34iRAU14Ay7xIBfzbiNS3F0
XdyPkagNwJU1eFafkHTpNtKcpZNEK3BThtyxfFoO8IHevhvkevmjebZNDBbFE5ZFuFThoiSnZqND
3JYH4wTC+40Y8h+ZmCzmnZjikOxCGi9/B4FRNTGh6HX8RguYpC1K2YFu3WzC5M8GOMJ+7mUeBI9T
ACyELH7iJM+46fNQ+jXmXJxEfPr2R9ZuPhJgs6uoA6vWURrLVqr9rtxKHQPamBLlliIAn87whopw
apy1IKi4rCjjiZggM8VnIWxOFlGjQTvF3B1hScQ1AKBooDsWlhaHndE5SyfNplGFkN/i3Q9LSpIT
LQjhCD0hN0433WkwvoRk8yaZOvjn8dWooZiLfBXwlJDT63IvPLfBVu6wKXCiIB+gqjkpgQzXH2RZ
ohPWbYutVjV1DblBhEnUQCEmNY5Avw/7MXQyNXgL8nSnHftxPav256S0xIZG6Q9u9bCVV8IXsyAf
rBRGzXnBDoYqoog+vfSWdSnAP4uT0pirEQ06yXrUmI/AVdbDRCp7YeWvD4hKDXuK+M3YA3FaZFaP
gocDggdpEU5ZPC/mwgaNjHLT5HtHe0uJ43iF6jvRkuXqDQ9l7YhuCOCvnyvKVec0JZ6sDBxF1SEr
RfIaJVmn0VUKrdcDh87YDYnp0FVs3ijtrhsGeGlNoAFLI4Kt65oPbD37YFjbcrPKCqLaJddITtoG
4v9Ga7zAyHjUVycwWBBH1ivh3weshmXfzhTEb7RsT2MLGWltw5plANIzKkd068nntxPICRzrm26M
ej/8pS46kAO2d0yHA8vUz382PfwN0qoz/4T3AsvvrOYfB0jd5/F28sge4sTraUg795HCcSKP/RyL
JpLf+YTCs87PPJRmjaF2sK8pEKz/0/bm4SsRhFIdB4zXMdXdwVC1rr2KkHhUnlErvBdCgfxRTemj
zLmtpcbwEaYKWq+nhFgDExcJGfMTGp37yu5rSMn/UqwelBxg+51KvFbWP4oPsqAhdE07Exo0YAGV
vM9y6+etyR2hxapbHIsWtsK8fhZ5bSNpEp9j7qqQRd7wfMyTSY8YLgqrMMfOZEhdSODrnBt5UF2n
V2kSSDNpa4SsKw5OAj7LiQ77RI7cWVouYdtngm6g6FE8oGa0dhjBeG5OTJkW5+ewvdD2oaqv5hJz
4lanSqN9YK7oL+CR2J9eFPwg9X8qtzIg8atF+D5r4G3/ER7D2SmDBy7nbFNFaZJByWejE+oFXYQN
HjWR1F0dv2y4y22tSJAulTe4uUJhLd2HAtm6b/4wS4hlvXny/tUDIefvW03JqB2MngkryTXlZZSB
cDbasDylwVYsApW5/xlmKLSeAArAz9CJnZzUpVFW0V8fBOFnFNNtk7tQYSxSLAW1q/X9B28ucCha
5uKWs4pgcB4nW8Zo6Rux53fNv+SWkoXYD+Xl30rU+z232hZg9/lhyTepcTjZUD6tLBnHEQsHL8+e
YN68tFELlIXY9+ZEisE+FNg1giRamKg13ttZ77BJj16jjfpU+rFaKVdRDgo8RGc7tIswH0v3JPPi
QODx5eDIeHc5u8cT9PBrawfIdl0o5EJR++83H8xmEtGOnIlHP/61Z/oL7NTG0Ds/uLuqfxPGn18Y
yyp9k7S7DOxUbj2b1j6MXBMsDdgDDMUe+Wh4Li+PeFvMVp696RPfoOt/d4DBpU+XkdZ31paWyjee
SR3P3gkj+0OD+War+RmbspyN1ktcKy6eFsZdC5+1bx69TYqc361hhdS1Lneg/cr38ILV1cqzGysj
Bouy9I+rYoEbesnMQaWT0s663MWXxs4RBgpVUraISvtrCS3vdq7+zHsxvTINcEp+vPIueak/w9cA
tzsmNOfYpmBiAKYhQLT+maBSrdUzecGNc7Guh0ao2duGkcKlbBwQUIM1KhJdqa1BrpJrkRQJ+RO5
tYMPo3riViYsxbmPjIx+ngf587nAkXayupgUPilcaDMqJNAQEPJzVEMNNMbHNfkXZdEawBijEhUw
YK5DeMP+SRb3zfOgkNlCtSVNIoO1CXaWArV1xTYdjxTVtzG3NXLXnVANfq2RtmSRENUR7wyolGbi
nmt0cfE3uHwWQ2y/vabTePLzrujBZMvhhqxwjH+vqLhYLPeHFuhMxhSRS9VmadHiIWCM9dimtVB0
8LUw/l7uooXoON2Qbpo2vegCK/ZAjCelZo3bpoPX6dybv3h98RtggfDXCqUKKLTrH8Of/S0zwgvy
KJ1GeqEtiDRm9FhuALLOs5Ay19Vz/0oTdvBtKGBd2FbWzppUJtcPFlDkYCaxzob3x6XpSWiqnvU7
hmzXHVHYGhHj/wQTeAYrdVUqT2hWsJXtCrfpszZKrfQU2m9XW3vDkl113wKQMy7FQmBwPlqjAias
FahVzgLrbZ8nmDxVa6fP+o9+VpnzGtDbCGyQAGMpubXJS/Y4J6wSVmsWeGzJkCyhkskszlVlxcVQ
BEsm7BrFl/V/5PikyAm/83xxagVZDkH/SQgYZBverN9Y9XX7hHdObDX++ULoUuD8lv6FwB1w2eDo
Uj26bFE8pqRO7pfQDA3avUR7Vq8hWLmT01dfX4+eGmGw4e5pIB0w6wR4Mnu2PPLEIH2v34AAzob5
anY8coh0KFLEvhNrrYkxlRtv4Ujzgt/Ro9d2s3KbebSfN5Tn/hu/bKHzmSs4AXzGtMIq1feZOjpN
cQVtbd157Q9DOBg0EkxAMaWQjwgdbexkt3M4eWPQZvBSh308iP1HHrUWP/32lc99+If2QQYflXS0
KG06DoAVaEf0WEDOFBcXQiXnW1R3CP/iZhi69O+EAjsh0fo5lOnXbKMfQClytaX6kf5Z8hkLxbCD
ckg+SbJ5TnyUfooAfQeEeyQ8LT6uSDtC55fQA77O0KtawmCvl/j6Q5zRkro7yNXaQeF/1O7nXD3F
6DttpcVzgCNWAGlTNTjvGZn5Es8WlSSlVbEDej3ZREgYiumx5r1MUsV0At8c/eY4IryLD235KFiJ
n01F9xs1VkpkRm6woj6X6dVv/b6C/BPSpiNPLERA1NFFK3hor4jjes0j6shAZFsnp1/s78LRTdA2
3/Acrs1I0toT1JPvY1iFS2Vv19Qb5tr4l2ObrPLx19F66wsKxyJ39vhMNZrUwkU0O4NhKK5pRdMG
TXcg4WDsv7G//XD65gizlzxP1EQp/TMV890hgL5G4c1p13QD7k1hqD8PcweiHjoxS9KTBUFA8Xcf
BwYtYTVSYKxeXwtZCJOUEpf/B6VqN+d11FOd54BryMHJdimLdy1HJRlVqGui2+tFhRWQhWiSsr2P
+4Uvs6rfYs1wv6euZZI8SoZHcg/6bpvnnUINrRT4iJ6W9r18kKUlxJHFBv/pB3EUHbPoPqlxiy2N
OT63xMZY3ZP3k6mo21HJhfzFCXCSrXCY0Oj/fmsUYKsTBiA6M/SyzHpm4DNxBxeg5dCtNvsNr748
bzTNSma/VHhYSfPcXNtaojCJ/5KpiULsRP/wjG7fiECYj6Pdi1ZzE6eUK+W2I5tQeKzK4TktA29N
OPfYki1zDWEOGaRM/6bbFMeXrHBT9lmnl5vCXe4+14PzU8nMkDSTemru+BUBkRiCQtuVa/ky4Y47
cMbdbVbHxkuKWic0RD7YQqEn48/v0yLiRe9aBiw7W4LPx96dVG3uXlsVEVlZ9b/m2YhEepoLQNGs
9gV6xppeeeDZeugQX06wiafbxl2R0Tgtop66rTjFbZNQ0Nw1NaWno1KqP3Kk+dw5cyxOfsSE+uQu
RMQlL7vJ8thH3mGc+FpymfYuZFjeTrRH7evmUjcEOXUHQQo9gl+du4Rid7vpJ97u4hgSs9lCfOm1
ZHBXWOcRwO/n6Ra7zNWx04GIKLLLVwlGbz9zMpHMAH/DwAEVocUcGCZtoAuamIFU+++HdJVIsRKr
HVpyujskdDwZQJSWJdKLzhrgrDY4XmlC4rb4NlGWfCNSIkPizoR8IJCGlrCJ5a5YcNo+vqfXofpD
f1htFPTzhilfnHbIIOtXijUmu6vzr2JfK3DbPGeV9gNusxJSwmQFNzhNb54PBU1aL03W2liIkOTG
kVm9gNiuke0WBXnA6cAcpuMn9xGbmMUqCuo72ZJf3e5zyEUeG2ZwUwZYrBIyCgr5/7ApupPsUE/I
IcGSENxVLYQzLJPv+8SOYvMkwPEFp312qgG681KssSo9tBgbMq2orh9VRGHmwYz7PYO3DxtCrH3V
oIEjAEWNCoCCeEJESt1gOMvMIbPoVhoXtEEKzec7tm3FauRCVNJFOJF4hftMMjoaR4Vp2DFdKp2w
x5XIywgiCnOjQE305gmhYmdlC6pcnIRmanKmIg1pOTafArVPsVqS/nBlQuQcFunaq53lq6jag7Qx
nHq9xEWjEuacX6ttx9F96CnFeEp5ImK/VNqYkkqJO09gEuGY9U4Jtc/5mQVhN1LCTnhPqJOLPYKX
X5cRv1jMqj1s6PCmsGn/F2zYhFFyHlfs12tNU8eJrR4cM2u+T/zeDrd9egXpZO2a79n/rTD5+6cQ
QLNkPZllRF0KYgGdxol/4/eSnF2W5oyAnau7TVy/O9tMfBd7h77xE7Csol1UD+QEm78Wn53QbS8N
iGDh9IsrLMRSbBEMiGD5eb4iSMuKtnW8BUsZ8szmlmTRxW/3r1/twpI122ht/L0WSjb5vhVGI8Kb
46/KOQSHLnGkrYSqL3honfVoONdxNGzl5972HARrfT4XYmhLDQvmZd4nRbo6L1jgQqNQzhaGQ2DV
1WkUidk7NMViW+czZxOAXAnF0yPXS1TqeLa0zMfDh1iGYv1ScIEbNGoxea/n1J9F13bwUGib/raD
9tFUOttEiCmdCrST6TxAh8jvqgmcdfrzlanSrP/YVg2Vhx5crj6PNrQ/wajxAXj71J2YJ0s9peox
rmWiwsIp/Amw4mlcF1u/bIFig2kIQoKXp3/eOSW2stM3iuo2L2mRmQiLlBoF/VnPyMc3z6niRXa2
ZxU3ol+svGYi0a9O23pCKqRMxwfbQDufhkwn4Ef/Bx6CzsUN9EVlN65bG2LYMND69r3R/ZFQX/4p
JfTAXp6rE5sMBab8sxfY4Fyr0CqccsFC3zokWXCv7RIa7mLr917TaldB0rLb1RU3KfuQ00WrFmKu
m2T5lY+ZTXI2z9qhXB8NykAwwEb61h6WLbxo7C3xx0mItgUO1XUELY9nOcL85/ZMG1ofq5a2c9M3
gUtewtwIbMWtXEqYj/UEJiWqgh8OLGWfFA3kVEfa5m6+wItRf0ljVrpD++T4tIfz+kXz+XAgfHsg
c79yolN6mc0u1wgrrSIlFrVaEDh3BZy8KAo0EIy/SnwEgfTQThnGAXl3CMW2U0YHFat7Y1RLMf+o
embXQCnI9rw5coqOsxtmiBE5xGT9Q9Vb4PsUa6QY2Fxecaq48cLJTqjDQmtCZcWwpmtEOknaiTcr
vcC5xCnFikwopsT7vBJDE2U6k3hf7BPMAEsTeoR7NvGc3SRs3IdtlQKl1F7UXXSe0yQ8+kJFn6e/
PjLOyTyQjjNcxzRb0LmR2Dwf+YMOsDdcNbV/RWFovPWlYdfzBNR7oHI33kWFTJUJhL1L1KbVPbb3
CCyUxCBHBj66O31hbw07UpAnZ+cjsEK/DzpXVF4dmG036BsGv8DTFjUwZnc4aQJJQzWx5+6BbJD5
Tzwa+uV3z0YOzT+Ytl6uia9TfQDOj3TmeKbRqCa3InNXkETX8Z1SXbIcmc3sojy5GbqBxEQshs/U
1NNKB86zU/WQ5P2AvLxXlsnsWVS1qBXnWjTiYOEuhbFmI0VRSzytbnXskQS2VwFIe04FMeQQeIqz
JbFa7h76P2Bi+NEC0+PV6x7JA+VHs5ef+w+Hy2Q60g1fswlGC/PAVFDEkoq0ns4aR5IyXCvUt/9v
r8h1rxbEH/qOODUE6GakRSjaYn3oqtGfrIK48gLv2/Z4HVB/vC7b5rFGKs2V1QKzmlafU/XDWbaG
3hu2zkJZb/ZEMNv0vZ9lRWEdnbqjEhcS/iiFM0PtKwLlZD5utjdpEaTKktQ88bsGKqA4r8alKLwm
ahaewCkO0V8Hagrus6bGawToU+vwCQ6I3m9/MYRJuyXAF55DGPPhO7Zj8GbsBF6l0VApJcjfiovk
bEEY+yngAmHTX6dCA18y8Lm/J37xWgKJzZ5o4gW+lstJmuPIP2d0fL8i4qe6xWGAhKzmMEbxsy6+
0B9B9gBCBNXN2G3iC4RQDuLlU2Km1hHzEu9opcdpS3S4qCGue/zLohiHqer0PH6SSmaB7OEygKat
ll6nKqciQ0pLkx9/ZZ038ydI9qPBowTRfpeu6fg5aDfhkMKv3x6JaURff+IDVz4HMDs7Q+/e2Zmh
X3rZopj1vT0RHeS8ESJhYXgVVzcs++SEG8w6AJuLBvspnYlJJvXZVTABveviQkFRV3zmq/udkv8d
+BOFPEGeKVbDRoV40bUMaMrUsiXESfx2LmmH1Bl2ORFzWRSEIUO7fJ9cizRJ88O3RRpVy3h00810
2rbbHnrzfDcj7GS3PnIPsZuW0lrnsRshNnhbhVTMA0ML9A6ZjOeVl4JsR7Xn0f4hUzMDwjxSQFox
I2Wbe3ZeT9ufO5OphUUjGhmHzAjM18gRjJiU1kUqvR5Qji3IjHKAPNdXyIM9wEGnPUUJUAP5feJ+
VPc1Q6C2trWpRRjCLmGICuUguvRhvU7MQicsGDnRYh5lz4f/Br3qeyzPI7CfV0HGczJ7jiNr+Q2e
GWJugPd5ieUdOo5XxL7XH6ZMnBHKu8qNJS2tjAbOMyMnxFSY4Ya8bLS7/KbFs/3412UAbNNpe+o8
bHFHpxt5cJ0P51dT8eMZqXD1T0Rv9K0vMqeKf5gGxwtpOV3a4aM6vWvAOoAkH+6psnxnZYcZMhDm
EUyjR+GPMJ5W+FsUaaW5S3LjNPS8rvSZzJvLr15BRLgtaZnylJc2v3X1Z7LA+ywBpZeHXV8sGJnY
c38MuJ91uWL1Q77vBQ3Aq1+BNNjLilujIMsHH78lU8sQ8rxblYpuGWvr+a+e8EnuKhO1VQLohIFi
jzjr5ulJhcxU6aJdZqPPYUWig59fQzEzLCUQvry/0uv4+ybbQukL6B6cGgt0i0aH3sPmrDo4v5iL
UXVy6qjnIHJpO7wKLLBy98DBaCpJLJFXpc97qzapRS2pDdMr7DdjRzMbZk76/QoXrffD0tfv+x40
tgCNwnmfmQuTl+t6fOuWtp6LxYTex119dfAOzGWgNhvXFlQTgiCHAPD8ij753swW1Ys61J+MOukd
a+02JmW/i7RgTWCm9nsY/iWzbWl1GiJog/WTZKHX+PCaj0TJUkERe4ff2zYJgyW3UbUF+w+bNQzx
ocpzlbnL7UT1vZOJXl6FtQ/XdP+gzbRNOI7U+Ex9SxKcQ7q2xyfS6uPVZEwtPYgUhE/IfU+08vAS
xahsZcBi2rZqXbLoWu0ucZAcOJDu6Bcx6u9+bwShvlOF7PSiXNm82g9YgHVTIKGEAzoajj5arHiP
2FLxI91CLJK9lPm/kSyYNZewbTWaZQ6pMD/xG1dt+sIcgnK/W2M4UkayMbDFvKIOUbJFwSAa5dSM
vm5I3pTHSUtun04G5eXUD5HITeJa5LU+2uSyNNigYTnXewMIBjXSGOKXH7qd2n0962BMqYBqiWPu
Fk1k08fLr8lQSJKHK2C+/sp37aCyS+oIYEOrBNnDXYVzmqRYo2c+8XokyTWS107wRVckUBCs/1Vj
hmcqJVPS+GCkFaZuSepxMp8+w7KMsDgb7UHSRnMtkWdkByoa/AETa3vlk3pOHF8HQeETjtrzPKnx
era5tFpJGxS0g5EUm7zKfM0TSTi+wlfmwZ1gDgyXAbaQXCKC4Hl8Ji+f8BwL1Me2lmebvgRV/iGS
PvJrovfcTqq7v0v3NpV7nY79CS74RmhVyHhhf25esSwspsyYNInxK7tOyFjLX04A11Utfq4GPO5k
t2TyBGqA9sGMYMNiOLwCkMaQh39oe/ufdFeGJ4WurpM8uQvvlAxNHc4lVvIjurn6Xab2s35zzJMd
G/ghvN8NxWyMqDToNQZQ8TGBKV6vkjVWsPsI2W+n9SDEBG6BgNmEGIqP2v+dJBN4sywcTEfKFCYR
YCamCW3ngx58IWxkNAlb6tSbpyE0ELZmUgpPnvVgjDnvQ3y+FIyUDx9rqZoK4n4S27s/uEPG0Ww5
2emC6P3uQ3pVWsiRZtksGMmfswqsolFWhO9efpoPDMDSMB3dozHKKYl3Nj+icUXajW5BHAWltPjs
ur/1HJQ5zUYuSmoxAdUOzZ+xa9Vqf3SV7GiwT4rrQbi6I5BPsWrI4DIzrX96uaV9yomMBwprmW7B
78qAkjdxEYelk1Kv2fabIdBZlxa30GgwYQNdmsn7tDb7RHxgRsTe7M9C9DdSegtETo5SXCL0hp3U
KLm6WWmTD4cJrO62VO+2RIywhy4c8wBl1wQH52yIP5EJBN0ryxPwM/0Bzrbq7U9uvStdU5v0fnrw
+9vagp83QXgH2pmukAia7Y4arm2IVXMZi1KjxCDM5ClSa0+liYND0qVdzO5GtwGt62Wu9IA3M+4K
m6Lw5d9dLYlf09Ah0BfVATRzLN9e3SO3pnyx9vMMJN7VEBWvTOlP0EbEaF2VfYmiZrn4o88oc0vo
ztX9sHLxWZz1wgbK14ajbUNWk4OY+eyEp/k4PdBXCBT/AHga3n13539eCgJCBs0pnGfWlSTC1uZt
t0077qYPcmhXsxrUe4JrOrn0EhTlmyxbCixK6BcSyDVRtHDVe5u300qDeehWWyepJ5iLxPvz/6Xu
wS1y+xExPZX4C8kymASoekqXxSCiMbT4TXFh/Fuf66ztqtFr6H6KKEZAMx8+VDw2SzfKOHsyXvfJ
GYLTEaEb33tPECRlzX0HYqbv1S++UVs7c42nKNIcwzTYuNYcIi5YvWxLsFDXlq4gvdGJ30tr3PkX
YhpdjTu4jIvVTZp0o68JDaI2KPfB1JZIN2i1+81fDXiS5qxnC0zccAFemf1hCC2ksAM2SA3OsvoT
bNXpKHZwc/FQqLfxOZtjq20l29eW1TgXly+16CB1EFYIdyx4I1X12PY9kBDOiF27Kl+FfM587HyP
J985LOEFiCmM/yWhJFrY+dVZ02mSZWYuXhUDlaEMMKHFW1I2YyAlKeavafdYrPTkPM+Tyh4KiSMD
O5lJT6c/cjfvFKhLTM92xjcU96kgeSpLMNw/zJPuiWUXYdstfFYOxW1w/iSAYBScUZ79l1zjxtpP
adb8zz8FBPvkghGeuvbPvsch+/MsVutfnfdW4iZcP2T9MSJT5RcrC6+mN7Fq7L91BIa8H8u7y3ro
L8f+Xl2As9Z5oal82oWM/56So4EK+jjUXOo/XNCx0h8IzMFQBOjlMtDtLEtI1rrRIJPR++xlpUdv
SCazAHl1GZ0Dt2Ny4NNkcEAM+JnfVXohNcSoopdxLT2+q+lUy43rkEJasGAN2xIJXzDfjazJeAcx
pLTMCg27Hn2GS7NEzKt3g6lQhP3JPEG2pABsxcyJ8WWKCvfpr21siKD0QAbVpRPo9r6W51xnacim
+tFchb822NQSZC7rPXISETtfbNoeppA+9wHQYH4GdkhmFv+ck1QgQcTNyksgXTxmptG4NETHbcqf
4BzLB5gEGo78gEQcn+U7ENTJxAzxZSu7viYkCGmo0um1yHrkUJvDd1JHvwD3+DuIHCi3d2afXWIg
lUsludEAOccURgPfkK7UnqkA03o9PARlV0aDqDBxEY3IyHm+bifd/6JJ9B6udq9bNLtmW5SvNcZe
7mSO3DobYTZLnEUEhmMgajiRe4Q6LaTTForQ6D28+f5ITwSNK84TAak1AUXHDQaXY0qtkmYnX0ii
Ha9RyZZqJTwwzToQb7mSrrFHDulqiK5wdlDg1Cyic7t7wgUVtrWsOufrw4KMBUMSoM0knBNSzlad
3yLowR3NqOk1P+NINZ4J2Sw3kKJDz+rR26T53GCbca2Tw0raui9nDyWCFlbFzzofBcj4b3DkNQe4
DqS7EaqrjZwcGYrEsqcFQMSGIvgV3jDMj/YWzE50RYcbPyEU+YVDl7LOTnA46QK2F/jRFhAWXSZG
1YEc3i7/oOe9IbyzIpamxnSQq0XzaSut8+ZV7Bj3ijxj2DAGm//aR8V0A0t5SRxh6D9NkyFpZ/ZS
CznY7eFqdJzpJX5c9nhNeDaADYn+TULLcRh/cvZBZWI6OgviQhvq/Kx3P6MMVeFxBUntbzbx5b9w
9zsUod6PpY12Qtd7Dwj+1U5LPTZvBmC0CdxVcBAltjL2d4q3KvJP7AwKddktiRJd15ePIettFyeR
Tqt/1NEwsN5NgjJ+65P/zE73BEsmIxk9PKH8pI4TmMq4UZUZIVLvOAuG/Naa82BGcP0M0cBJCl2E
yDxixlYO36FUfWi7H2hibHdYgOJBr5ebLH4YAbgtca+25stl2dRa2Fykdq5eS+tw3FlXJBD5uYrw
/+oI+1elIhudSfaCkD4W34JZpBlK11gNLyTD96+a0QYji/INei+A2vE96/qKLGFPZp7VqDUTBYaZ
rsTn/gwtoLcOZMBFpluHHnVkaa9KGICeTgFUHWY4JE3tUa/bSra0khODdkGl5lsUzspw9ifulxfb
iduiAOSr0JGqP60E/OUKAD3Ios01RV3dXry9uZwudxl6RqHhQkybm0Uv2gkVmZvxlZEec6wlMawF
q8XoTHqH2AwQUHbK31NJ05wZo+bVfPx6ZMRzEe4X/eOciI/GD9BqFKTSSJKL85/edNYWxOAvCd1y
9dqmJAQm+1U9NiCXJZZ1TYEYSuZIRy/RdCaBDRBzH9OR2aT2rYAeXGoFhVIV3rmhVim8xr90WhDP
tll/u0ojeapjAI/B2vjPtkO8VL9XWuQPZsWXNLSAWtdkMEOS71wUYJWhHpaYkWVZdEnIW033xtAl
N+xzuC7JlKecHg4/MlCBcVr1kDIAAvwEgGPsnqakH2oVQz4/l45U0rfsTGoZDSCL83iFW4e7oB4G
n1GJ1ei3TyT2H/sXuNvqkiJaHozoUit6yGTfgkvhBsg9tTyjMlbK3YwZwVjBVolqhcrVYX0IMWix
VcCwpGwbG9lURVTySPFwlAqbEzOo/qGqZB4Ririv9CR6Jw8QDGaEyztvXj2mVg2nNh/v/1tkmHic
QJrKLAwglzHmofT9J1eCV84Ih2BanBo4Z/NNJLG2qqX3K3xnaSZDhW4qEYl/6Rjutp9NXNiuDR+G
ziKJmqFi/LTeJYSu9BzdMG/Ken6jgL9wAFllIhX7aQqMlnlntJV+fBgqQRku2J+N4kIedou8EQ34
/K9vQ/p6q082lAr87T7WqVcd3aTEdivrtu9GhKqGi9TX7/j+kf90nSJI4mHEuk5spq3ClLU38jYh
j8dxsL5o+BDhR16QRl9q9i7SuJVrOBnUWd08UYRYuYkMrAoSmdMt0zX162j/1WeLNKMNJdPF7h8R
Y0IJaUJNSvTxqoTVhSsJwHfSCsfSR6xB/ZSJ7UfewsAtgp9dPcTnI4AzGfDt73hBU+2d7O5Pmsyv
+yQScl8KNwyiDnJM97Ss5kxcd57kR6SdOahHjqa68U2wH/flELXbDJ+kYuIwevatGSNWUO/cs6nB
+lzF1kw3YQXpW3JL9n/ng6Pn1RFyOYTtmNxexG2yCfBQusUaD/xkHxT9g4ufG+31Xs0lF4GpWwlb
HsgmdpiSnUOyIR7gYp12GBGNW6XFNgfIMHBi5TQw5Eep4gwQn//vOEvNNQO7ZkO4KzesdD47t9eJ
4Ay1nA6Jjs3N4ejEbzOJdW24ISqekPQN24qOET74/ZApENKlSXONOb0diT+MhLWTCbfWD/xw6hmL
Y5Rxow/n6oc/UiQ4c3tsOSMYUB2FJ0qzFMkZWsxlwQGXLrlu2CHYiyJTJAqN6UohAyzfsPnUBHpQ
Oi5eUByssi+902B69g5IdX2x83uoDa8v52Pt80F9khFpY8w9LTSKqG3HrdZYUAJQPU24jbeZ0k6D
KOPxc8sl3EIx4FTSQWfr+oWTRWRNYQkhEqz3DIuitsgq35Yj2aXa++izEyd3/guKmNkMCjwlVkg8
vDbvWiAISY1erabjqeazNwXBQ4pRnvrenY63fbdi3zreAdTKi4fBhjh+ZIaAGPze2ce5r9TXBzJR
1Cn/DAi1n5tyxBITEbsw/0otVarSVt4ksQlA1o5hudZxRDtoRTlndOAeEhOkjwUFly5L5/Rs+Yw6
+6heawUdids7Amlx0J8sK+ksZdEPUpPDi7MT+tW7KITR5pqgFram/cta9s63l4e/9GiF/A7Vf6Fm
/OSC9RX+srGV7QEw+iMFYCrT7C3F/jF2iTsFV/3x2dWtSHub/sARSw8aD6V/L1tJHBtqW2Pp6MSK
SZe3XVmMJMc8FKTjY/ah5pLzT4yC/u9cidBK6QY5bwBHoSHj+VZ9KV2k8uJnEGReJHqnbg2Q1y6w
CRi4NSORFCG5dOtv+JapM6bvMtcKZ3kS4jMM1G2rmQCMDihxPIKjV7Z6yNZSUKDfxWz+IIFdssMV
JB/JVOrqRayw8H20AUZokmomMufxybeSt+to3Eni437QI3JrRrsibtswJ51/GTO40/9fhElAI5/H
bNp0eP0j/qlB25kGz0leMPAwRddBeTa80LuGkvcGi/DaTbyHii459IRNt8GGk3JEFYfmlTZcsETd
6a4lIT0IeZjlgMZCLD7Dua/KzIlA1Y7Rfqy0q0im1WCErpRVa24q3CoJ3XfUbcN/oMKsOtH8cnQp
cKwpQHwMOKqCe6+AXBdsbNwwhaQCwkr2B/QsiGJYIFrzbD6GhEhDS80xT0l0VmqTog/ZqpAd7ShS
T2gdNted97/A7viukHsHDnk4yMEPSQA4wDD09xN1oezmbo+OQM9fm503BDRfizYwla+ML+gRWhAV
rQ8p2nwTDifDUUwCVSN+fDauSDZCFaVCtc8+UZsePWsVl007Tq/k6ef/SzikBjc98t9NtZ3/CKxM
W80gqGfqdjOR19qrlP6auTtWsD9w1XYyVcSCJvS9GdYq6M18Pzbwy/Fo+7VeXumuIhWleHROLHXg
A54uiuvGttn+zV1hJtIML5Ojn0W138zp06BQffsp0SkBNszpsdG4HHe7n1qeeKs2vlMyA0mDHfyj
+W/1GmMG2CaDd9YzqyRsojmFvMldrJug2vPzn0ebHfY7rT2AWlFjiQF+/csDtkaevvZe69zJTYF6
ghcswvzgWCBFMK/LTgzqzZelpMLmIeilvr+BM26ZLUGvUuLAAFoLld/huEDqo8xVkKxJGxAl9m5E
uHwPfsNB97KQdcIO2s7Lb/lNV5CIx+EgaEfL2x+Q9yHEy0eikRKy6nMwv+gNTyjsm0LOCZWDY2gK
6g3yVz9CMeT8UC6L9J0itejPrNbb5ihbaTbs2s05qZge+XgVzMk5iSFro7lHksONCzxq4jhbz/0z
6p/m2hfNFzlbl3JOdNXp+yL2ItOOCURaLJ5qB7NusGXWMPmIHNsHC7ZXydhOkrqfTTS4DH0eDeHk
465h5Oyzp1mabLcpiKIh2iSlb3CEQ+xcQuM6FZKoy0oppqLxbnAkRyi3m1CDEXwNHqN779AS1w3j
faqes2jU8t+GutBPjijlNySuimIdRpgUHJgxku9ZnPY+RVwr6QWdMBvIXgXddlq83zOr2sxZ+24H
tkK4mCxgus2gpFmg2Vo3NnpPuq/syQ9wp4QZW1xfVqJ1YykH4CtAWDk9MwGhSCVH94Hu32qfaeiI
gJS5IONrV8kyv4K6XUKnxAbIIHaGQC0Jk3LE2GlMyIhYunFg8cAjaUj8/7Jqoz2FWKaQWoX+2TLq
+Mr5IPOEtO+S9sn+FWC13EwYJUTsVXN47Quest/3NDgC5In+IAZBQehHMTHnq/CcDNxqZqEGhoyu
HxTWhnzpSOudfyJrGJToQLVp4dY7GRXSr91SamejCsaFL3mtNBk9uNEZ8jaU1PcIUOTABBi57E0z
A841MPsYw5Vw2rBcOsDbc/Dzmu6s6L6bCTQmAxCUWYLUvMit/2fVA0llfU+iudY5dPl5GNtXgyPc
0yT83bZ1mHPPEsUZtUmVEc+n8lxMOJ2LNPWarI70lSZbr6ealV1y+xqHr3W2ET87DmjxvnDU5FqD
nP1GEiC26cm5z172wdknMPXAa2k69znjY9v42oNTxzpNyIqBUT/ogAZwWdUqia/IYGus6UcHABNy
88ifrYzJ6siMM/IGQTtabOh7UPu8Bq/tzpqdi26TPSWRgmUUR2+BY8akfo92yzClzKl59XeKx+6I
tp3+36rbu/ghIbOBiWtldZzTsdF6a/HSk+6kstTb0wnyo+bCXQiVUMMyqa/cnOUOhvn9cFDRjbGQ
67Rt+pzebq2HoRdOCDrU7uYrne3by8F6Kgk3IsEvg2Mjs9LZ22dJ/+C7DeQ5JSTulJriR1MDEj0C
EwS8BihgaRFefXsKaJ4Elb6qsrcsxF1RUk9lfQ6h9vigimuco/araYivnHCRV6d3xR6Y5+Q0CwGB
9B/YrL6XeecMasEQUVBepyACy8B9FtUURCsP48D8sUvNWp/bFAHP6zJvtDxQvycCpd6Txl8gqlg5
cprrzBIrPB6Fu4Hq+c/G3NwwfE/3rD7NO7Xnl7IwUJ3j68EJY3xnZ4x1Tbr6V8OCRC7HxE2lNFTG
7fo4NPW0kidULgVvKHkjv9kCFQkgxaFQfSyTjZrk70zKTeM0i1p0a1DFJjVj3wAvFhl6ddy4Rt1y
Ezicv25zXc/Rpft9HrH6UhwAdubo9W2sQyl7YSfZ008B0ihL5ehsxWxDIsd2ix6Zi5x30gMn72LV
E2hE7MDuT1gPS3dEVBFeogZzJ5qxnhgQ2IHFLiuV+DevCHz/H/j29YkmOADca3jg7lB/4jvkwaZS
PzFRoXzSgFD7OshKKPg8ROvuAvaaFZZB+jz1IjJKPm5m4jiwp9N6uqoU1ybOFu4dLxIiHNefguQr
eQMW0Qpd5METw2xBDTRYvRFCnIimmP8S7P/pDLn4AG6OnRX9491DNkO6UX/10ddedQq51AEdvuAN
OZ01gXCq006pSKxnmAZ6aTZ4XSnOOyKuzgEbnumXfkC1/evhBSGGZo20F1EMgJ0eq5n8+vkLe3II
LAthHvox/B1JGIfTXm623ApyjyxZmWwvUpysPJqKx9PsFe9hI3rmjOq0xnmHoRq9WZcD+bbywFlP
chhtdkhuWK+W5ZbiFYkR1c37HzmwQc3AgEibPWOt9hsf0Q7OuxM4frPes4bYqEVaxVJ8IyLtf4wI
iVUb+UVtJO3fKIQu7OW507TjBnxrYfs3rf1CVeok/wGq5N7xfwexsfL/NlfQwGl+1VS5RE5rlyHz
PD2X7XMNxieprh6Qz/TFhtWWJPJftODZFieLCD9rgyHnZ0T9rBsTJhWYNHBYecvpIz3xFhk1EvSa
is9YKOgJ1nwnUQHNUP368Hkod4cHTooCJcDS+q/klL9SuRar4RQvbHCsLbISqdWI/EhFet8kf1lt
hDSk3Cl7G6vSUix3dUGRRCVuNW7/vRc+nQfECig8suGtExe3jZN+iQ==
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
