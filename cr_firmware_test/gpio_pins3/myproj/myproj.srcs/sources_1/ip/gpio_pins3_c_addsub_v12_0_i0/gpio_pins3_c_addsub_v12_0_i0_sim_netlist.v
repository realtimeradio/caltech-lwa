// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:09:05 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.srcs/sources_1/ip/gpio_pins3_c_addsub_v12_0_i0/gpio_pins3_c_addsub_v12_0_i0_sim_netlist.v
// Design      : gpio_pins3_c_addsub_v12_0_i0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gpio_pins3_c_addsub_v12_0_i0,c_addsub_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module gpio_pins3_c_addsub_v12_0_i0
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
  gpio_pins3_c_addsub_v12_0_i0_c_addsub_v12_0_13 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintexu" *) (* ORIG_REF_NAME = "c_addsub_v12_0_13" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module gpio_pins3_c_addsub_v12_0_i0_c_addsub_v12_0_13
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
  gpio_pins3_c_addsub_v12_0_i0_c_addsub_v12_0_13_viv xst_addsub
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
bW50AjAph6CXLwbyut07XvllA+kryl5nYtUxoWis8S2sMCBvstF/j7kYG8fWxEq8DNd9Jo9iSZEa
9HwD9uCkMc/yrrNdbuGuKWUK5TN+KHmTaWy52oYib9jE4LdGMH+3cnw1BXpwHS70cbNIPeq8iN3I
8wiIenNC2mqKhLAJK4gJA11rjdsYcYHRr5jh7xlXF/1XLKxywwJevVYmCXzpgCeXRcn4l2BuZU2O
ZndAh9EZXLxfdu8UDaDDY8CBqMSXTNJ+Io1JdkLMCBaBwEnA1qhsnqgXhInO44SL8tpo21nM6QcI
q7PzZ7wqADBc0NJ26PodfdYwQy1Szs7Egn/htw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qQYrDxlO0cSyjZEjyHn7YYq/xLUvpipRfrlHOdmi++sUqK5ahY/IdhGJhNKLMO2QM5CsElcl775g
QgLxBq8k6ZCgfLpO39nJLAp8xAueoTResE9q/SHAHzvovg+wVfsXU9eQVqligpNd3BDjPDvNbdhU
6Kj/RNgTaQFJ1sjVB17pTE1ljn009bwdZ5A1e8MwkpN18eqfOiPCQ2O1BD3H1URk8jkCTNOMrAS0
bFXvL2OKgtUseffJ6Un8xLuWUorZtjBeeu0TtwLTs7SU63Loc2WzfFJsIfTVli3RtzGfaJtupTMc
URYQIJEhfjYiGeUHU4kHUGCGIBIcL2GCTP3arw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23440)
`pragma protect data_block
aBY6ib/Tq6EUDJMHxq4414J8yGJZDczelLXYZOpu3TSp0lGWp6Gxd27XQ8BDiawwoXKI6JBbbcLi
m9OjaNI/Qz/AXX2cLu4Fs5bWU+a4lbU51cJZBYkffsxFUC/gMrf8aUroBWHI1UeujUIpAS/qr85C
aibofbKSpIwIGZAsQ5GSACG8XDwukGP3FQrPa2W/CV5nSyw6qZsI48UghddbpMj9WtCJ3Jx75sj/
L6F6iuuDJC13HHDKqydEcMrYDKXGV7Kik08dsM8dLSrsTlnwlGm6qBx98YfBcrp/M4NMq4QDHcwP
NH6Zp2NRfsZppVOGxa/2/pfexXgrE4Te9UtXOdFfvRdb9Eeb3xNUn/auX156bWzrs9d7qv9HvWXj
Ml1UB6WT6hU7gJENWG6W5+hYK+p3YcszAskeGqWzqB35SrcaWWm/eQ5qwTMAqvzWkbzpO7qa3RBJ
xj4jWOyXchkmEw189+COX3//nVQZZCaA/4w7uiDlCuiF2BXuIqpf4sHKS5VxwZ3AlRP9Mf6xRrQa
BWhB6ifmhHhfM56g5sCdzSmj9YZGVQqhCgp9+zu5t5Ih4ZL/qlj+kA+lyk5ulzVduFdUsgdAS3kn
BWRT7OYU0I8VaZDX6xMJ8cT8qgItdHlgvB/26idl4rJi93ZHiwUczwVtc4ppIEMf6vFyVCDyZBCI
rpSStYwj8ahjm9vsxVF5xZslBz8IgY9FaDU9SDRHUcYmeh20CSdd43lPk1+fdn5y/pXTutN6Nrxx
E+7/kMZS5imp5Ar16PgYn0vd1x/zumwQwFWZ+7vAiNCKhKTybd2k3nhZeCjj/ueMFE1qX+h0EA+I
rv1cpCs1SEhMsRLJjPP4SS3z+KHyIVmubTUJD89O1EnxU6pLhgOR5WkxbxQs2kKptWYUEFBgDs0j
1/fyjTs8BXChNVhyHSRsZ13X0XvWkTkm1wlGGtSefWbvW6/YuyUbsqzSQPFsEP2CWgE8oweb4/8D
jWe1vQiXqoEK6FqW7Mp0IyabrinQuOMNrdSyIT2sfP4A7cS2HejXwN+BMCBTWTxsf7k0MPMtZxTA
uT4UDoNKaimiutxksrDclweHuIDMcEvHk09DjcIZSMOk8xL9G52ZqP/ib0OMXVyb1OaeUep8TPmG
62AxNdUtX6ZKlarCD62858h/V6K6VTxfc7SIw4rbtSq3VC9ruwySD8cN8NinxcFUktCmO+wwpB/5
HM+UF+0DtXhFN5Q1CJ1LznqsF4UU/Hqvvfqn247Ln1SIMKXFCuMsqwLm2AMQj7CCMpu4N2iuvUzz
UgfeSObgXTXZdzkXwoVdmCiqEvgzYx1Z7dHspyXsXNHh20JIdTs3AjajwpT0xUn1DXupfMqGyfJm
lwgSwmAkzIoXZxAgBI8T5OQK5kytlv5p6GdN2x8VW9MGAiV8COCdxgkzE8mNF9OZD2SOuuKLd8Cf
0wA6dCkoq5DEeiYqy5U9EY2mX7b7XAgNaI0sBQU7FSTqiq5zTfW3qUv9ZtJ9EllW2dyftSP/MNMD
0bagGZ8UO2Cvt882rm5FXnmPfT/6RbcBIgEKbkDQzQc8pcIxuEx6Cuw73AzE9R226ygmv485qB8d
lDwloI6W35eefuG3ohd7Nf/5aSdmzmhiEf2TXQDKZ+z7lPlPRsam3DK0qUkNCUhH7NBrhvzT3mZY
Ux7a/OtyjpPFJMGNW6oweSTCIqEhddnWccFP+JpXHiomG+cDr6l+qVQ87AMvnDT/Yu0rwPcJkwj6
4L/pQiIWYnhhNGv5C00QCUuOsWturn2UVXCKnVeP4B4toxIRwiDdvcuHuwWGvOeN7FzuRC3TBAiz
xjm2CxH826duIP8frXu092sWuY5aczqCC5mTWc977mcdmbVArVB0YRiE6J3pyONQA8AMtbNtxgWf
X0yiD2CXZMyjRXgb+dG+X2izq9jIl8zMyO8tEMl3yblSyqyw06D9GgLCmu/sKJ7A7bE79uKlSgE1
eXV88eS8Iffh8uT/nX0pplFlfR7ga448mdUiEw9giJsf2yUsxIsxATKe9yCw8JOmNCGUrNvrQWkO
6PP3zc4AurexvH2+wjLyxoqbX4TWua3PmpMfnxzCPSByUqYfELbBm7RQo18wq37EWRfTASeNymIY
r0+CZcXja0+aWPbljJ51Czdtcrbln4nemWBXpdUqiBuHlEm9Qz42Ee+m5Uw8qY5kLBN3edIJh1GK
oVIXKAigIrCUT3sRk/1imLizOWvLLqUPqaEoGPwGbQtkHFjhzpGeVSkp0DvvbeRylNPvDjeyPeFB
8sUol5qJrmN1s/IJglxuPcaUinjrwOX+1GL1ne1B4VfVNYvy0NLtUjsxzEmi1dE1eEeNpjumFB0Z
gGQZxYQHLaRRMMmjCpK+EkycNtUZ/IKNU3e3PznUba5WYZVzlOtMDC8Pf5dQjZW5Vl0IMy9PU/sf
wyWfPsoeNqXwvxABmn/4yzsd/lIEKGmcKKX99VCkZh/rDYSMoKrlMEfj9BItZ0cfJTwUwdA35Zeo
0/FY/2YCMU0fCnkkW1ppr3Wtxy3bSdQMQDUOPcty7eSizZXNpnTK7ovUNxOH3y5WUt+xKwFpZnrM
TlE3DBYBKN14hMD0b2WjEi/4e9nxGex+RVO6myVakaRankUTaZkz7BX11bXRN10So1U7YOQx5Air
yKUSVTbjHpZ4VLt4E0vmjLKpkBF9lt2Y0dk4zx3QyyiUTygmvYuBcWet1yOy/ecDZbIY/lU0nUeo
zdlvPRigvbUUiOo0qC7agtSetqLkudZpYXi+jp9c788z2T0TuA/JhbVC+QauX0G1p9SQ7pVayIiH
tAoQO80VcehQ2j+iWbHuNT/r0NKI7++mhZODEMxUhgT1F7A/TQTbRL1PzIG6HsQm2ao9n+Xt0fJ1
rOlcIXSmFwLWVfJiH+sCFAzzSsgJ334JdLG67+OgBpYHhXy2FyvNwfyV0ccSMFp/4i0c6S1eguSD
dtpx8ph05LvdOjAmLW5pmYV+fF3rK87I05LK9LRZzCULvSmWBtJrazoykzyvu9zJzSUJEcFxzQV2
Riq0JjKpA1njGo+EVlXe9JC6Qdx9quxOmz2ZkLCz3x2T63THFnde7oDLl24LcagspPrZPjLi1wxL
+By7E100EA1k/8obgcux4ABXpv3H+q2W36j1dNZBq4gF6k/lmfnEnpF3Uf5i3EQPRnq77d3F/DLE
f8641tHnIYeo8k5gvlcEGfjWN1bT5Cu4olbYHWHQWNvt2NQjsJYAcfC//LIJM9wq91eHSqESA7xK
qjQhTSILVQZFxOVJmgOQ720Rzd7XH6z1DPumqGR8TJonwcstts7ftqxfcnlVA5LeWWk4S3q78VvU
RRW9bx4cQFWeBnorEEsuqZaBgZlElewmTXmqO7TIAu7tIyPTuWFF5BNrWwtkPvYvoOB03Es+m6K0
CvG97GK5V7UzKWuh1prq6aahGgFqYfXYQd9uOBgIUscsIx5kYIYu2ZLSA3RnaLuix+WI813wgYua
93yNR37dz8lc/rcaNMEyivBcU/PcvTycNoqtXuMM15wVpnU9sh1HnddQxyDMwlG+RELxnwNjKPPM
cl+QHAYlB39HPhlIynni9Y4dGS19PX3kdvgq8buDd4eJkjMntqrFdmA2e7uLPm6b6Np8fOM81x3q
6+ZUVG2S9lUOjfL4SXQHUPyTjXARWZTmD1F3gy6gIfpQA32vGh5EGpdY443ibjEMAfJqqi7nEWZi
tyxUmbbj49UHM7a5vhHH+f3dzOWTLqnbYHqrdcw50GYSUvgOGvhHSqYVrKK8EnV/7y2drAT9yjFw
iyQkeVQ9WZEaecCHH28/ao/iKpJqXv6xSk2ABCCBuQl0/3Nu+I8uu6lvy92A34ey4bD5c7hKX5e5
q4EmXLlJiU4ko7kSmVPW8Pboya8yY8WyFwf0Pdwv+Xta6LrWHuCTQPyEQn+6kUYUfPF53yjR/Nv9
dEYv3C7z6e149YnmxOcMJ+sQxN/e2DBAcIXfAL5T/+pgeXpO7dJ2dKf27jfY1hJxnBQfadGhZUc2
lp0voeB/gmlE8ciRcH59kdauDxNTtfnN9s4mU78Wfayrxm866C1KsctU0lKKF5mOpcJPgu/I5MBO
Yp8VhtWvB/BvJVVyOx68R7FXVo3Dov1NLUHB3sYISHJeEH6a+wwQmSIlGfpYt8Zr9IOGeOGK/vOc
EG/Ih14xESLe3XE5iTq72NkrNIXIxuS+FMjylML0o8ntOqaHori6OChO1fJKApuLEkrkSIM+sOo5
vqL5/AMBImnmsZKKcx/aXaAF09w29aUzdXABGg2mBqwQRxPj3cizDYfspEck58a/EobRdsUQArZs
xe8UbBcf/9y6tFY92dRL/YfZ3i7hU9MtRNzAu0VCUn9EdoNd9YDb9qb4adQx+tmrUrmseu7YokUY
JL0dlRzt+5iUvmZS+FeR4cNTl1cplrayaJJ0mhMUYuS3Hwvq+cdOfXbMKeNg46GfKnOexlkc66b4
1HQOG7U+RBJo8Cx28P7g4/nCw9XI5Az+i3vT/U7WEiw49cwahiAmTrd72GPFc+f9FoEiVftSxHfV
Hzce3VfPzCzobXzYiOnEu9Rx4fzw9UZJ7agdRYP5d7gXz9s5VKTWeX/M8mUJJHC1RyGGOMMMGKyH
nMFijoDuKTEZc1UF6OiqqMI9Av+gIwCRKz+w51T3lsU+a25jyNkDWnuK7ZBfJN05JByjaHbpl/Mx
fFt8SKKxuRyLOuEcfjF7bawDwUn81dpaILWd1zkJ6Ty61UFIj7XzEisaKzi/cQdFyLsntxZZDjm9
+ucOm1veSSbiOJo+Jx61EAVAJTr4ATF4rjJuHQVrXgj+1DFPKb5YWApllunkHiKeBzogMjvJyiX7
Tv8NbvDM6caLi+NdzZ1AsJS3FPVcYmJgktPc3ko4Xw4r/MGxQWDbvzTwYjcBfjYVYuEKqQ9tPl4m
C1MGObBNmW4nYfBgD0H3POwI3OKodhndvx1BQLIfcc2iQW3paMvBv3mburJual5HBmmd+dn1ErFV
w15pXm5iLQF07coNpt7HENbHwq+HylrZSgg9p5Eamz79Api65BmJiXLkTlwp/P6VzTVCzuSVYMBw
UayT6fBnMdo3cG6KllCAHbGaPiwFTjkX0KacOFt4oaEXiQUpZy1VKB2NoYfqv7oKNOem1WhFAPEb
xKVS+0z7Eds1SC2Sjm5kWQntbYElEkgokAVOgyX6uqvue4aXA8H0ROjB/eg42x1NSlEjdQkQyHWh
eQTHNC3plSC5ddm9hmkfkKDFPSz8nxcZrKqZz63IDWnGaMtaGQbh9EM0sYP5QPhzx1jpgAhtr2d5
4ot84Nw69foid7D2MhbhGuWJbwEKJSKyp7yBZELGAW529fFcQLRbkhfQw1ueREwYotfDrrF4Vo7h
6/KWS4SYn9P8PmT14CzZEAB48zX6S98pOu4xakuD8b/MntyshBTsingvw+kWYuQMsyVHv0hrjMsx
juJdQAErC6P/np0acJUVaobZS1NXmtd2tBY1UuNDytQFrp0Rxjvjdfa7T6LjEVzdPhKVnAfO7YIX
PfOT9Mfmld41iWHlrT3kzHu5hdd+VI1eGl0sWsp7KUZqNyWGUJH0sUc4EXAWRYstyyPUgAxMCUh9
kQgLyZuXzq2CyNSBjshLE41X0zrbseB82Eo8+YHku7Lqt7bFfSy5RWU6cmsX6YBYxrktDUfcMpQN
6CVriXaawBbeSp2JLea2KXOYj6U121KE3lH4EW+gYyDAvjdL7XYQL2CkGMMJRrKXnZ7w52Kjqfab
hn+oTMkSLSqTfry45xNvfZauf3GZjzgTLvGwolzIpauDTZHswtRhQ/XU0DKirmTJBTkWKJdW1dX1
+wTC/qf1kMGAqPJwoZ4Epdv1j0vWZDqlF/WUTD5ktBUc7XR7S1dxNMwEYH4fwgdogdfq/ASDvCyF
VWER5NIthdfPr3pazk1D/b59bbHyt15uITZ2KryXZLiz4OEgH/H7OiYpdJEP7VSBN+aJhykGBwxo
uA+WANs5UNwJTSWPXAMbHthEj1eMUynw5cd8ZXrigNPQsxfEOobIylJ3o9vyajxJp1J4esnRsMEH
DBKsvbkVzG43IBT2wCBkd/ShVMBMCvfSelg60Hm1tuyNcOZnCZ/F6aFDGg5NZiwGMiUNi+vJHnXK
K4J+NrbJtXSN61I5iDomPB4G9aRGXEAhZwAvXm4ONrL/XyJSDRdC/a58GR0dDps9u72U/AC6YM9W
6O6YIy9j9j0j7yfwoVcnfHgCvQoMpNnREP0IAJzeBMKm8InMufhPSceeaWs2/JCc0kWSDyrPVIv9
NMJiVbsNoSMISwxn6JCnF19mDOWCrudcRWR3Scl9vSEq+W6XiQdpabPqpYuqOhTeX7/Szm0HY4a3
WRlk1anjJ1JQOR2nuPz+Cfj+2stZkOjzEnKVVKUIFadtRuPvkzKueXT/Pq3umO2vWcCttZsiILio
zkSBSqi/mVpFYcPXwtJOOfWckP0T+iJXL8GGqLQD+dE87wRbQeifuqFccvbX2OGMk+vUoQ8ssQr1
Y3bmn7+/OMJBRidjnqoZ7FB3k6mXb/9AfD+BoFgMneELttILg1xJ4kt/rODUuzIhSni8wIsHfPM9
oBhLQoznRvmWk5E3XlWp79TWrJ5z/XFabBjBcEo2Dgmw+MtF+oHkoph1kRjjLmN5BVNN7/XGJYXr
goL/4eEgMr27zjYshY2D77K2tTTd3DH7jWa5wv19v2Z202Ed5mVqslIpRLYNx2VgTu2fbbGxXsgR
ocgO98FC8yz7zedC6lQ+mOWKXG5m6qxRTpmHytiPcKyzWajaZ+XvN/6JamQnAkzwhZ8GjX+CYLCV
zROdmH5edtjhCHMWhgTXxCals5wJsh4J/WGV7I+dP3gAdO/5Sdb6ekcovQlD7s+AlfILRvOjQkBz
SIU9+hKYwua/hhN2xjDwGN+hEbrjlNmQOzNmZp1LveNUSoc+p6ge4Ta2axpyahljUKr9RT5b5D4N
K4eJcgaFhkZgOe707pKKij7gzwlbc81mTnlC/wCglan3tWrljmassLhNovDdpjAuUx9xREgyCcLP
kZ7UcgypkdIn1cfFI44Z1tDQzhcYFPOYl4E9DujBt7HtNlkAN6rDKSVefkGYBbOMEkR02IspRO+p
nUnfRPv2vIe/0D/R5EYQuWMIhjfAZ76YhyBgnLRkWFgkFPS+aZ6GjfoZCEdQrHAD00NeCcbe1kPZ
15x/XHfYFicadNjh8GjTxQDq5sRQyfF2e5GwMYfbcq8p0XDzknY6gbFLWNPb1Tx6j1dkp1YpZgh2
/mDeq2LVAbRtTE88QU5cYycy2jT/qFR3UKvY3M4Bbci+ibSsphpOBEPnwviXpCOOpYZYtqAObhw7
X6qHJhnhdFWRHN8gtBzL1YmSy8b1zLvQWG9mfUq/1VJjCfBwMHWDWIry4JIF6sTrXCdzbfXO+QA8
1gtyDC03faLFYkLQ9NGuYPbmIhUvfRz2H1+0ed65VVpq+yIvhTn0wmmLSMDMb7gTgVuX+MgwIGkn
b1NLnPUqMigQzNAH4rmnA2MTce/i3k4pmxevVENB4dMux4gyS9rxY1KSaSZbsE2IcGXnwiYhv2Bs
iECh6fH8zgKRavg096y+Rf5Les8nLJ8Chq1lIG3pKmFplfFp/NK4wpbic+FZMKkimdc9YGjP/a+3
LGm4HAkDXl+Qe3M9WmKgQLVw3XMcP7/eRXpJUWnharlIhwNhJfzKRL5IvQGX8xZxz4R+mzR73+Bb
ijXVvXiK97uwL9WZrXF4y8D3SCjJEjjrG4M62LDWRdxE4IGQVikWd8mE8dbAcAXBWeZLwhe0ZuaO
tYGrHQVcdXUiidCbtK8CenYj2LdL8vjHrQcBfjdtkzENaGhld670AIx8WpH4+ed6Cs0ZMN8RCARs
RtMQvkO7DoE8zB84rUt1YcF0M7oPHT6Dd8cdsy1pcblmAM9ORVYtM7F7nONj1UP3Fe8rQYZdxrRo
SIQvOy6brnEp1Vb6tgbuBeC2oZJZR2novmgp6WJY6V/Fj77UEK8SI2TJUSbrSs7V/8VdmsG1deEz
dm0DHRYbcvkIVypMhkq7ys3/HMU2OBdV1YQbvuvGqhmqZi0NXpLGEDx5aaMcikikWMIuMx/jrmAf
RmlmbnBZVRjiVXw/rmYDbQ/HCDxOiAhC8Bc6MAmL1UiZ7U7cxrklmgrTnvOzk80P0saTBBVFCRi0
dGxOf6tDcD7hk1Y6nLPjNGS0jQ75Xweg8RUmeoCLMaI8JKlR0CqOjBrwP7k25PKucWYv5Z7q6fAL
aBa0W08aoBWvB7GMBMj7e9XQ3EglKKd8wDUCLmfHThdWLqv4fYrO0uPVXsycKi09veKnVzAvlCME
ekevPBYnlecWxe8LfGxf8+XlhQxuFERa5wvHTaihO1SNZoc32odCzZyO31PjEM3Bl8eH7q+IB/EV
UHamPx7UrV42IKB0qAOMGmCZUqk+V5gokuyCM1LOh/0H84dIuEeTVRv9XuytmJtOw5f3cN6tVfFA
JBbsAAJ+fRtjcOn5kfSeySdcto3HGoYyU9AzikMVS2fm6BzuTRk420VYzkQDcCxQQ8hZq6hd2Spk
W1uiJKPm2egeY8GMHHoav/lVNwQp633SsoAfDtVem3DZYcCyyp01vDENn1EmSkYpo+h/DLznH0/b
as+ys2WxADZBG4U9YfhPKbt580YIJha1VA5WeEjE6aL9aD8GuilWgybjhOouHW+7kxuOsV3BH820
928M2M8fnKkTk9ZPVytDDpcW+bgBnV/T1Xl/ZR4VKXMke8UQtfT6zU7tHHEUfRPy5yeHpo3DfbyL
DyYd4/+WhbeSXHX0pjj/0/eGfswhiiMkXlVQrAgpyvm7vgk0dy1OYSkNEhlAo+nY+wVTRZWKaU+I
RBapJitLmYA2X8qdhBLKevzp62FK6VvYPo6c+UjgjaFyNvirwzLnzyHGi30G44b5Nj9nMl5kUv2w
BA/ra9Xb9GLln4LbvR+eWNS9p6Q8mKaaWmBZGOEXVAsE+m2lw13wC5BuTsVL7jgQYdqmgy7T26dv
LZWkizDqPSxPEDTMM0tuPVp6pp4xTZsx/EulyBDkaDGRmMoSKrCxd8Sct86RDfy/S2Ek7/c3ut0O
7hPVX4JPntk6UZt0asZzYTKABIPH/JPevFFX1mHBYG0QxoaOq28YQtwBG2Ey+5BjkKS9aVZnrdC6
MFDVCwS4OG69sVdzg247955x1aKvCj+4SdwsGktoTiYwNJzfKKB3SVlw99wQ3EPVM6KW1Y74nwyj
C168CJ5PXpBfMxXQBBK275oHSQoxH1/ZU/IsE34SnAXvKiOSEVtmmnn8u63TGtF/om7bEaITG7at
szMQdGyZBRF8PFfP+QvWa0rgQBl3Y3QPa71KF4/PKZWJp57XZMs3o5+1J4pBA1gLXGnWQuzT0AVs
ZUBxYrdehk4rozZIWC21e747g8Dp40gLNtNFqycZ1naTmpaLlJH/gBMe0c4wZrPKa5OFNxBG9IXT
qbtDDa/Xxh7gSfrg5kh9ol9F9MImIxFwrHRMdE4qI9fzAbCPHHIBeMB2fn31GOEyjjsTyN0ePI8v
DU/a/891faTR7jVzliZ1EfksZkGvewP/Tv1EuEkTawUxh8CkKvmiluZ/r61vqw9tBQLZ7N1p/Jwq
HsY4/H05ZJyAq1U1Ma/we76yqRbrHsb1AFc1+vlOEzKbfbRD39KwJNhFZPu+TnLBVyUoIWgus3JT
2PdGVXF9FpVVGB72i+OCjowJiNdmkZ8UhFJzh6lBpXQiCGxXiyRtvKSUIRsMR8xu+jRupGeLxIPS
Z/RZ5KlU76GX2/v/+P8RaKtfVW+e8DW/1bZlgKeSRkMXWBBiHztHHcB4e5k1Mws2UyuVWWz5ucpf
auqRHeav3n1I8jxcLO3b4EnQPOuodbFoY5os4AiJqYmyxSGeMORwn5JJRqat3jwUCSJD9XHPES3C
Z+hCixag3MikBzEC2L4/HgptZ7jwkyH618N2y51JmOlbF99xN0u/+woDjLRbBp4ALdnmvQ5ZfriB
+JYeNThnkGFaTF7FkCS/zoRCPZwK+lwUlSb/XiXuygmgsQz8a0MbIb2Whp3gVNSmoKNc9R0uwYPl
tGQoy2uicjPwksT0N4T3bmWBPy9Iv3/VvmW1vtlSB0zq3I3Ft9Yl5jsvOVHomsks4wVRApHYsgIQ
cBIv3uWUJAcPpt6box+t28sXWQu9azIfDS4NE9c3zzlTAxwYbDpcKc8mt2Foz0/rucBxGUkzOcZq
33oua4aRxv9CyMlmfsedcvJnMMyk01L68sN4W5bCIH03womK4Aq1F7VhqXEe6XS264PbwooFxdkR
XayBx+rNH2Irf4fJ4GhiT4EAkJmMt8XcqhXyHV7o3fQZkgAIbP3CaLU7TFQmZ3RoCL/y4woFaZDx
XfCiDVTzex1VyaOTjeql0wDAh9yFWD4aNejrFflvbhYunXsyZoFDZGPNiTxm1O8IvvvyEFJnB2rf
BYqW4zw0YgdtxXaZBMeVL5FB5Rh1xkUebmr8JfzZnOJ6KDfYhv7qticNfol0HMEGJx0h9ZooTuAq
n/dWSPuOvNjQlnnl+lzuPOffuYqvB30I8mo0H7VJKxyw/Rl2zpY9F1hPtEcNT6XPn0XrvU2/JCS0
qmKcE10cRWmVBrmdsdLfCBiL3e+qd6pKTBI5aoj73m9dktNoeT8+iWmm7ycPb6/y7/bzn+nTPPQt
4TK9DH3pgaYe10GH+kBHhYh17f67XEvSdjnTOPKeB7617qPcnBneAFO0Z9VatS+OeJ+lVSWhQ5aO
yS/eCS+Pu5nopsl3O0+l8VhuE0hZf6g/hIGNkZ3yqXyvNnhY5iiqumsS+YO77+ytVm9N4mwvpCKM
KhdTc2i0EqSOHJOc9wciMR0RtXgd4UX0qkA2J/Fj7jofX5wpHEHvySajgvI+dAbbdtSO92ffJm2b
cKUMTA1AizSLFHUFG7hdJMP+oEQdwManqBCnnpGUsdSzq3Cjcl59BF/xDZUHe3DW8FyCk9nQH9eF
x5o133jDlQFmjnlI0wp980S3j+OYEK/+ITnp0JsQmCl07gkajrQUl3lGeyInwpX7/F1lzI3NHbZo
lFXI2+EW103KgIPWpGvWkfDTl/ghKRAiCtO3jAjtA65hBvQf0Gj7HS74NR6Y/5qDtE9C8zxsdf2K
eO5fJiex+/kzwOB0ufoe7o3VsXqZ5cEzBKdB6y1DpfS50zLjF3kcdHtD58Ji7c4FCVtb5Ar7oxeZ
TWz6aSVeTAA9E4nAU+MbbEfgB0g9mHG65FxzhukBdDhFGq4x6VeL3vvfpCV40mnEwMH9jV52lOQi
Q1JID2OHliEAvJtRtwIsrGwhUS04ueWZJzWDjmXfXgFYtAOdIj6u0mvrYwTA0+D7N+5B9aytsmEd
kF/HLuOiD3U6JJlIHZTXvptW+ljgsgpjz82yprYT1FBiiJ9JzoZFt6mWa1vZKSlE9P/uOl+RJrPc
RW5D+mkeVVSbdQGGhqG703djfT3+/wTw082XDiNQQCmx4QP5Lv6B2rLES4thmr/ZUtzpSSj/HpPt
nNDsZAtSNZwDBE37ZM7Iwgs9b1kYvLlGanjIrZDi57V73jfPD6vDkCZOKSgtHH2zp+BNUamLNYWu
XN4exHk4+FTPD6TBTJbLi9skDUhTupUjcaLCmm3rvjoUP4e4kwu/sTQGsrCAfcZ/GyLDN7Qrdn5U
IY9G+booQOIIT+oBRa3CXcZpgZdwwz9RDEmpFzHdv4FNSltbjAlmABH0xx5uRZqytcFw2A7/EYmD
3GdkuShRBYzOImyeRXSIjmc1NhFpgSJ34Vvl/6mk+Rea2ZapFIl766VYLqnCnVlEb//2HFgBRach
FBI1AUpNj71+gp4VCnJCsd59k87gRJkG+OjMWnElSNPA/EbFACTUKrI2qocEyQqI/OqDVJrpILDD
ejWdIUcaA5iZQvFxwaXD/4ZiiZb7BJbtf8XV907Nid31dRQ0V973wgkZQribh9Ysx6d1YyrrAS6F
S12IjlBw58fDSsDJuArQUvai8Lz+dvbspVIWReHqD9vnicTOaacl70upS5f9Yzyza+qnCYSv6vZ/
vYE6LLJH9fK3AKf+p7NlMNRJ0ENqZe0zN2VOb/PwzBYiHDQvkxSNUwe1PnJqJ8yp0/fHnDyCACea
nSaUViQODuKADWEGSmqzZ7vkY+L2tozdW0fZoBAWSE4ticGAQrmzdDfs9r7OA8Qi1W0j5aBF94W7
1zlbjds4Jit4XVbLj7LxaMbPa7F9qNOjfm6v+Q5YTmdnIb6aDmi6z68+JopCTSnY9yCDW1toaSRD
5KlfKvk7KiOMg5heKxHc+nP9URBi9H8cQcg2o475dUvkJG0aoyrJ2oFc/F0ZQgw8zhGTuKSDTO/Q
wJ94TOsBaRXISSEzcnv0ifIiwRWrXttsLaQ4zVCsxooR21R9OaQ8Fl7k2QGBlDVzXUr7QdLruNvz
oL+K7BuDldZDJ5ZJ8PA30PZOOKZhxDNj9gPl4dACdHn2S0ocT+iV+kQnposTfgt9xFezV/HaAvrv
KZLHMt3rTaepQfHEt8QdwvU2IgQmGDscS+tK9/1Mttk+MyyzHiZLEvmUFskRfCem+nxGC+VakjmR
JqcRcnHNeRXAKDIDvoFsopbhinfb76uIseLrZT0i1o8OcoEHr4egcGsHYIh7Zm7ayY2I+25953VL
OXV2gRP1BSNTK1kvxLMNazmqfrjJbTHzQp2qvaVJZHSBtw5c8zs4AUSTY/2flGvSLLONWmM/rOAH
ShUrAA4WinudwQOnDISg8zYo0H3QoD3ar9njfC32HuQJtvq5VkC9CG0NeAsNRnbHEarofeZa3trt
Nq4JscqaaQPn1l10M+4jzuvt0BhL+/fm9QNFzZMD/+oho1mrSsDNHMAd7LeI4iGdQxSZrz1LMl1h
RSfbOCetA3TcEnrrm2sM7GxPT8nMS/6YhnOUzdyjquR3ZOAgfqlBS55TfKcxsXp2yB8W1MOMZeLq
YLfN0FRNDFsuaDe6tuWKvf16a/SERI9SXcFB0wa+E5jmMBjKnp76BYx5F1QKiQCMcoGpdvoshmo8
KThFan5DQhTkivKIKb+kCify/B1N54tzlr71TSeBdSkq6UYa7pJOFVY7tGi3bhPvOjtSWQq5i2X2
XXU9x9PHnwIJ+D3UiMtomgWfA1lHg6EpTczPuP7QAI1BMUnGtaoNpd3Zz7HhKQctBOWKCv8NLwe9
eg1P1UpG8IJKs4tCqA/ZfQxr+ZXaLtpNnqcDYWNOBdpZ9Jg6eP0+IZ1hC4I7KDmdc4p2unhfu6QY
bOS0oz2C7GfgQSC2d0/kSEZX3KV8oDzZyAa6Q1LI7V4nL3oL5t1zZVAH+BI27dz2QNPreyGfCtMg
L0ErSn+NykxrS1MrGhJdlGyYMQK84Adnii4g0sMsRVnkaK5yz8d1+quYImhQ3lnRanykQO17qhAI
xJyOcxUJ4OzVZGxfTNIB/ZkJRibMhKz2Qwo4O7Vplal6XxrPZ1+5dfWHXbhMHQj5SBGXVYjHfbFN
T+RadeR+Y8XUmaoM5qTKOD5M1RbjXluEQ8zIaQyiB6Xbdq/Eu/uVgmXqFQr/qORtfC8EAwRnYVya
X6jIqD4kVoG48IY5+CRdUVgfU9Ua25JTd8wvIR1le2PihI2AFQ8G4G9jkWtwJhfUSWsgsLRYsQlD
bVxvXsW+6kEeDkzaT2P/GBZ3qHysxjccHuAoAg9uk26v8WNw6oYYcslZyuyO1vYN4frgCw+HPQrd
WCXeHrkpTSzQ/tzlImIE8unxaHHvc+ze7UJf0o1BsN9CwmXPGjz0VMiiEK2cdv/rhgBTOGnta+DT
UTSEBgkhpcf2H2wuiedap37mZv0K087p8t6W7HG9GttqLp5PKUgAo9vLVjKyGeoo5nifp3wBwKoo
3YQHs1rNRHbtkZ/Iv3miSPO8vbBiD2niZwx63AER4VZlrXrsHJSsiiEbPqw77kVubRJKixyKi4rO
ZfGzndRsMbJZEt5waB8JV8dlDiArptqEMtl+EHXG6LQzF7fzWFm4T8WWlu0j3IFYWc+ue9I9PKyQ
UoeZO9dyMD1sfiH0xJ4b3RQD8OcvadAm9EFaPq5pvSfZSG6K+f3ZclI+/qlF33BNqSeljJOiGPSP
xHd+Ezf1r7oWpAX5+yqUceuvE0hx89qcGvbCYhQSs1Wt+STYa6TBz7s5xzMir2l+PFk8alyLJlZV
HqV3pm4sAYs/ZNy0ijAP9QCM/Bdqe5vjOSK6sxbPcGc4A+WHSSgPBVDebYffs5PHZjU7Zky1DFRx
/3Kmee9HpwWEczud6+b2v97sw9q/Ysota3VtRW2ES1rK9DuGznEaISS08oNgL0wWimpQ9XlIM+Gl
t2ZeGHhiPuONNC+jZXVy0e3njr/sbimkxlgX3vaYNA/SYUolD5HnjbF7XV9I+1KmgYGK8WnFeSMb
931oulNL9YlBnQzyOoQd0R2xiIus8p6j5uOXmYtOeanJrcLtvFri7dPEydxoTqV3a9aT4vt6APuA
FldKq0fN2LJpiDnGASlmbi5YMdIlRxVDyQFV8aEn/IPjByOQUMahrqzJ5646wVcUWfKMFgSOb/ps
apk3+lw1qyZASKif+4PiNyFebu6KAzg+n8YzOn7uu3C6sKSG2VVv6doncIq9Vy9eHwI/3YF6qIXL
RrvqUg1db+cgsuJGOSSHzZxBoMb0OnIIVaV9hn77KMpPKTm+LKHwcTxgfSP7Cui344u+h3KYDUfb
GdytbFoP9W1mRe4/B7jB94eOYQ1jRKWrNWuzz7+3n9TR67PT9K7bVN0p4XDk+Y6sZrurIOEnRaV8
ffVwDaSAoPVbaxFHxhfP0GY9gyAvfAVIxst29CaraCjoUpfzLHyn6BUCXmOAXGPCvl8BJSYzBpdh
BMiMcEHLtZsxFm+ccZB9DxAefnCsPsP+8qmMqujIcfx39CLxOKlXZIEkAIoCc6fzpsUPc3xiRavO
71KAU1o6B06e73ed7ahi2pFvBrB0UhrHKVmwQAO1rPkOHfqU99x4s7wyn141DJNFV/r+3ZrJgxZi
KDWkJkGhkax1DsGqHLF/Z72ytuq0D6080DoDGqxDwXbGd1f4m9su3syFqMBUxjh3VpfSbfi+/KGS
dwPLfUjoQcf+HbY/VC7lF7kHSRU+QmTKLAeXbaASLYsn8XSGrhZM0jp8v8QT5frDYqsCAHSFj0Ef
ET897K8ZugINODJgUZRfSwDglIEAzX7t9UWejPDDYNxz4JciIvXiBKEXplBawM1rkRWFXb/2IN5B
Exy+BX4ATCkBgl0gd5Hcr1R7RPvjhwVXPodoIc3+lU1ua6NvKqd/eBpcQSpO2SaFeLKYzeeUD3l3
NmduqzndJ3YcLpzWFtSsLajIVZmJofAa26EgzEF8EcerxHJltQTd18AeCZlPp07G5KYI5V4ley6F
N3I4PLDly/mbd3CEYnqozZIXUmUbwGa6yuS9u66+KkxzfKeoF3MFwT/ESMglAaHH7zgcJkGgEMLU
oPBEpNfd8wImHABRNVUcf8EYz62wvv+fxNYBMyslprjcIDFr52NuvUYPXbHlQebTKvhdT9/RHEhB
IZ7gJa+v1g/OxHxCs0nGntxRl50Xj+j4dY4bDEczAOh9DRl1DVY2wFaJWeINn6QwSa+HLuFwvDxH
U0BRv6gtPtzS+kj5bS3rS69Ak1FbrHmhDr5jkBDt+TtRQOiRcRHJD+bPNxZIV5TkDBYbfYjqj/AC
gFC9D37qPrmspQ4cWa00t3c9xrYnplIhqz2XbWdWs+wliLdIdkW5+RX6yB2fiA9I96LvyovnyuKY
ia7ehVMwClWsOnLwOLVqWWV9/5yw4Ya0ge5JMVCpYcmMyXTUJpGZnGIUO9bItvsxY2Ay7ynAaQx1
9vuyVLHW5CxYcIK09sKk93Q31Sm4JHjBjDF6j5K2TosCZp0GxK4yVHLun06wGEQGKwwueujFEwhj
bygWfk+DKXYCEJwLe7acmDU/zB3BxIqWebU2ZvZ9xI9zM+jsZlbTfxraHnkagQRBIXVIFkZrgjT1
/Y6Yt8/ztoZ9evXbSBlEY+wAR3GbS2Ej/2q77kOSP7JacSF3x2WhZdncfKnP6PmjhZZ66o6cdnYP
+R5XPsWpp6ZWUwpj959Xc5hvHuThEfSY3kqsULTzghFV4whomvjh5cHk/uTsNReVPsrwXOO6C0Aq
ffl+udhhoFDb8qI7aZl1K4b6cvWrOgkaVuibNG5wSqcHtLuMmDDxkgAu/WEOqzcYN9lEAm5qZLzl
220oyWvdV55nxhSUd/zp7vrdPCGkphOQYz15y2KevGssY1gV6AXwqBbLqiK/wno/MVUka1bcGeQS
M4Zi3nr9OHkBqhm0zq4vdWb4EkRQr1oZHT+8NNK/5F6tEF+QJi40vNcsjwihCv2ny/arXmIFz9PW
QEqHDAw+IfT4Ihz6isz/GT/S8js/wIvFtk9XlY9K33UO1D2oHb7nDKVb8xStVaxvaQ5Off7GROUy
VnB9aEkBxbYt9UmaksuvTPL/CE2m6sw1FnETBxaMUeHWUDv+1PAebu7HqDhmsKQiG/7iI8Wjhyw8
WIInbhYKBSAuVpHN/98mojLZ1DWQnMWlaNrunw3StI/qyYA44iod1wvhKUg10rY/wh8KqextlMav
CNXltv32Y/x/VdzIgwivd1yu+nEQCeXphPpggtdb/rxPqeduCuMqcJyQV8GfohZoDTJsLEMa0RWn
t29OyYxO+pY10/JdGCZxbrwKPjL8pUyYHWhLglHOfupe2Qmg11mlQf7piukQD/9mjFKNjQgeLJTV
N9eAtW3dfwOZXxMnVNIR4Fc+MQ4Um/7OcL2IEeyMcuzKTqn739kA2dD16sqm57DhxMk3Nu2leNzg
1WXObO7FYb7mmPOq/xIjStafSRKxVNQVDJF9hq8NAFnjR9F9q2DoEVBWhfb+Hc0RTPEqMrhYfbH0
ojT1fhGPSmYe/tpDqvAcyLnWey0pbnwncC8RzI4V8IrNi9YDiWlnpVGM+tfumCtc0D/uKr/yBM1B
VoquYegpooIwgVB1SLcxagGeMWgX6ux5ISfKiesKBerZYhDoRUXc1fBND5pO6zfEqQRUO1RQUgXM
Uw4yBFLWfmfQMKjI18GzczF6eETGSQmaX3fdsHn5E3XHiQsfkkW8a4zITgVpWoZO9Y5cdr5K3QD1
7rRdNMJ26KU/LeNPM7+jSUjMPT+Ufk1Wh4PQ3NVaq6ZReihQsSbCbRVIE/qMYdAqA7zkd0e8qOBH
LVIpXkCS3L43APobhAsg1v8b5z9QDfZI50hcI1tNBJaW/Jecd1sFTv/9fRnDzh3aOi5hn63tX+8J
OIhEQDNkqv6ZeXmOoB8AyJPyinvtvzyLsAw07iAJQ7MJqsbVH2ADuIJDfnvpA11bV/5U4RCuOmh8
C2kHw2QP5ZK2UdvDn5Ri30dZ3pM+ymgT7ZLq/aZOKHJXlQVHfMsWWNxB2qWVCe+dlq1NswjwumtE
jrJ0hqNhJGnlkjiJBueYb36aFrtgkF04aSq4RhejEZ9EEYFkHuIoVs//07Pmgj7THMNr6zLfIV+d
V4Q8XFzIm8E+vzXTS+aFskrdXP4U0SSByb72gS7UGsIuMqUKQkQ4Eh46iAJF4dZgfShVCsUnmPC0
t0Zalhd6RuFmrVlLVp8w+KQpAfZOwma2Vk8iHBd7kBuFcRwg73s2hvWLO25NABZpY0yprGWl+12r
qx87D90aeRV7a61Qj+Mu4K7/4JGZrf1YmQbTvLk2RpiXkjvIg/wiPXZ6oYU5rzLjMd2p5+zOLdAp
suYbHNq6Tmgas6NSfI0OjDWVJYkS87UjL23R+oRDnPkjq5STZALBK9qMiQLp8hLvWFsZNqIkA7eS
U2F/TqPQ2hmYBlKGHaC1uZKFm/vVR2oBtXiVIP1nPHdutHl3cCJ+xe2zFbbfLkNhXV+hBdoUrM1v
jWYl4/MRzyd9fEqbvTClKpSrS9QKhZ5UvkIBImCn7tYQJaUEuTO20AKb4UqwG9GoKskOGb03ee/0
qWK6BvE9l8BBHLdJS/ETqSKsI075v44kf/fqizTxEGZYhWk0AU0XSx7Fk7O1eVw0yrDdZOxpOK+H
ba3iGlPpzbFq7kF7hrp7IVSshuULg3FzEWwozj3UvzXk3+9F9QhgmQVjyw9SeMEyQh/rKnR8sqfu
BndlLRHNCZLGguf+jzIWvasgH7R0ik/s9iUKsAfGkOOjotbOylgMNPBUQk9JeZF3XZ2DA7xqBffl
L4EnMcACQk+iBlFUXZJylD2ri+wHME2xenL0DseBgNgMLh9CHoI4Tl9Xv1O/uTN3z11Kii8r1gSL
YrNO6fCeul+WF7+0x3H5coQ17F/tsiWByDpImIywXicRCPxII3iQzjWPU4dTNKZnV5pd7U8Er1ge
gUs5hG2WYJz1VoOEwk/j9cuCgl+tccPotBIShAWpi4iyMjoKATMaiHlOYo1+cF678b6x8EayJrJ2
T40dY+537D8tR5j6maP0DGwkfTDqqQ1A73fBAYyNjovFCxtZ6GZr09FlnUrnPdUMwaXkguvVhC3I
cKMU5BfSFroUjoMRCqpcjA6PwOgCNBDWi1eYPU/UmjNCWwpUfc+AndqelHX97+3o3bgQHeIOyP2+
nORqtPlTSQM/l4T5VqO3zpHKFz3HI6we8CrEJSwDsrxtwxostKWaFik8c99rsvUe7LaLxcK1iqlu
YKiY2lUJ1pqbtdaj1ioK97jI2Bo+P73VwDbG7To2IHg1/9rA69QpNhl09hGvFVJBIQtz41ch/EK1
cACc9KUmGKM1c4QgtQCc7rz0b2rKcYqFjwD5NtPVjlN7DYREv3lL9kyBElnS7WyYallprh9z+DVz
A50AMbOwR8NpjIYOzcj3mnuBGCyn9nNcOSkIuBSc70htiumw/u4vQG2jx16RtFvMVw0jWqfTQNEJ
DMrVrVn+Ql4tkF/jj1qtUU5/iEqp6QcNykcosDfoRCRI46YT/9r7tG1N7W6dxC8hZxKUoY/hbdJP
5snr41x5tYJclHkByCvX0+Bp9viwnpSnxko45QO8aMb+lGxKoxzXk9djAWFWFYo6zGvih8FHup/a
3IvnFRws3EGI1YBVd9eabbeeiAVVtIhrr5++G1IZIla9eKCBby1JFzNWCvvcjql2VsByKh0q1Iv3
j/JYbS6T2Eoto2WkFsBVh40A/YidJCSS6oMPfwd/EQf5YQliLdGoP7/0DvhA8drZ7DMLVVSsDLPC
PdRxQBPbagg16yUwb92W8krm43GomgWtgw6NbhuxFGpOJUPaRX8TNl7hVLdarBMBaNb+FdLi8Hya
a8YF8xGJkAo3ap6z0P+0I4g55wUe2ZWaueR0vmw08dQEkuTY8DofNN1n+NZoyf4F8tXXyFy3cPwc
EZ7MJ9iegq1MrbOHRAMdG/2qbsl02EsZeoDuC3T2TKCk7oQmHmx9zIM8ynKS54MfnJsu6um5nF7c
V7cT1rEgiGL/A+SyOyo7GtBkeAbhTH7TNNsRMuRtLQDNqapmQ26MMbzXroI2+1tsxvft2OYONuF0
8DypZ2M7/N+wSf44FNMZ6CnS5Iirs4Il1GYsrnOgtDcBgPa3ApDNcps9szBA6RX0VwEZmMjdGp3+
LfS5Cl4wTlb870NI4aLspIas1pvWLoxhoUCFhIJg2ohpxcwyvhtNVxVWI2W5YXrX0bLzL8DoZbs6
HXmSR2o0HwAunCqM+TbmfCE1opiWVgsQAcoNk3aTvYkdlQe6F/LRrpiLdGJmDCASoGka0WeRHMvq
EjHgQQXOLNh6lr01lNY15GasjwMMbCdcyNOTpSFR9qrq8hLhe5bRauq4lCE0bVeGvWZ6Ed7t+hkg
UVbI5hpax5gaSO69kOOV1C9U/A4FlGhdq1wCZuP1DzdPCKlrusvoo/7f6NovyG+tDWazS5zTtjcl
9DSH2Dz48X9SJPhMa5QvU/6ynggLEOGJrN59II0x7+piGNJp0NI1kAundl0Bn8927HfayinDKJ2r
/O8SSyhoJk1RMPDuTVq0cvfZlrcBpHLMEuLX7e3Wg0mWPdUwkg9VvUQDbbHVUQh5Q9wOLlIxko9Z
Q1hUAfKVy7WyPBUQ2EKYBoAg6eRGi92U5Ld5lsAxRaeHWSv1z4E4eIoDvp0c8n7sOYkfUjxx9mnT
TBSjwiqvawno7TRa9JWDXlHR0qcY/bEQ1PaEyK7X3u9Z2soPfIX+yiVN7XNfdVuOl5mO66g8UQXT
oYQYv2QmRUkhwpspqh5ty/bkqBFHAWjmGYfJAQKf7uxEc3FY+RBD0eBtCnNTBxqJU7g/0Yu2PBnV
d682Tg4ae6zIeXzAnwXhh6R7o08uT6+6I2NOHew5sHQg7QlhSplgByScy8K1cDZhBJ34NEingkKA
ZZ5e6v76WNmgi88T2wllIAlLQ7D3jO1Mt++RtNILR8sPpVY4bk8bb8lM6K6DFJFIHdbdeBboDoxv
x84ISD0QGdG4kzqmO355IQgj8fieDXuEdZDtUbJxVStdFNMln+KE5tLFZxCYylqfqcl484mGDhcH
WMrfrD/AUm4yhRH99uhaGQKikKrFz59DBhTmaTQU4g87ciGak2W/yAr3carrZXova7YLo3bdZA4D
EKN2B/Xjkg4g+kaQ5AK2jkY+n0eH8a1+DTOZ/KXCIezrtMOBgx7i1wplDnqi3SdUavMvee7D9Psy
uPnBUeRvDo0EyTTfY//6ao24HN5wdAaYJ7KNrr/AyWCW10xhKgfNO64tMINWxyYpHbZDs07blU1h
QIGGPXkl8duT3R6dAljJo3SuHY5DIfTAItu9+MuSeAp4vFfC9I3SksGrhGadgmDYhIt5oAPduwpZ
b6B+g20F65o0JTUe4cYjTfSAKJNNUcCW81N04feg7BbYc3IjYavm9rQhsrV+Edd5u6azVCDO/Lrh
2NuP60u/k4g9EgS/gycnq7eRhqFLBHjZJfZlgs4nmrNXcId50ZQqN3C2aS8tUjPpc1OW0V+b1/7d
8XIHTutZiiBK2lsfo9UJF6uNmu5mjaGnzq0RFwVE0a/cmRPa2XhkhGIYskFMQLnNFcFvNMMXXjHs
tIqcMTQF41dipJehPsZQi6kk3lwV5UBjVJuwDadCKtyFaV3SrYGoV48okNAOPPl6ztzNxk0H1R8E
pyuljMgAWCayJARervirokyjzNtORSNO2sVQbAGhyh7KX70jUey1BFn6lcKn5MwjFllF0mGkUkGT
SaEWbheP3Cb3LjjdvtSi9OEWugaXx5+gTGwW0A4Sc7wSge4G9Nv8k6yxR2hD7kNjNoWBxG6U6gYW
JZV8PS/zHJohmSow6eNDSCtz0/7zFJLjvgGHyWlpElf1EpnhhAB/56rfgDa1ffo9GEAbgcFXhOwu
thodVI8gD/hItDoR6V4KJx1l5VNUwmniEWb0CJkgV/YO2ya2yDmQBTZL33zHfAQWjE6QergOmRis
M3IJg4lRoqPl5TBc8zRWeUhyZoRdJlKYJ7U/+A+WAhZNVMP7qVjUpIhEvcul3yfJUQyV7P73DH2K
UPRjVGnFAA3Jguk4SXk12Y6oEo8/FRGHEKc9RgTgJO86pekgRUbr3/eiz6kNjy5c/Sf5otAgsuhb
WUrwul3S6jleqCpf/h9fCCSSlsewAJ2zd/WxejtXzrd0zd+EpI3tGOoFow1En+Cb0SotyTZk/ljw
Dzj0OL2lHjv7U7FathtbcX688sNw4JAsf5rvp3cVmeUEXdw+YtwG/SMYZ9+HU+wT20/AafNQh2ap
IZQioQJ7bmpwbFtoBGDiX638LbVpQQSSteUnNePFlhuXnB+DzufTEL7uQEM0b03rI7Tll/UqeaUr
GQdUsfpPcsUWrVlBm+VpIMXuFh8SfZbHWIvPcwYu++gWSnUxc8LMFnmcXftvCiqJq8FYfSUgdXsh
bOLV/lsCj/BWsLr8PrNqD8diqyOSJ/bJAfx7ofxHvkB21+rHrfgLEayJ+zvZCNzSElDbM3RAYZZe
u8dtUueUeS8adO+jaHMHqxNL7E6hnrlYQ3Gu11jJLom1JyUfgpkSb+y1L44Q2/gbuGG/U+Pzo0XX
qlsifM6O95169/hxFt1JfzEKBNirIGMOws5iCAiXTkG/7+/ia9+rl9JzqlHGayReuLY+TBRYt4F4
gbXOX0vh+u6r5ug+vSsHFb0zxka8jkPDywB5X887a/cgTLljTj3GoIWgtyWg4GwzpZJg4fuGoHxx
3F5+EpWAkCDHiW8tqsAaFNqJVPRAeIeVcTyI0fYM60c3xpl9VX7LYbc/vkVZ8aDmaCEZul4tvyt4
vJGKKJE+hALzhOBKdFlsnNlI22ZsHhNbVzuSQyPwc1SRB6h9wepD5ME79SSOR3iw5jVeQ+HDC1/z
JevuO7JHc7C7XKranwnKpCWa0PklAbdHPXEYj2yLokdf2+R4Va6Hrm/W7ijNXk1WCFzuokEIIgXD
w0EHjDWlKt5VtsD8m7/sjSmVMNmlQMOVdfEDx2IyIottxZtJA0aqk0hiYCkm97zgUF7GY6QTO6n4
x5yNS6LMNCxc9LROYEF4eYa4wR0w2klmPipC7NBNN+sqmC4EAQRDq8id4FlbEVU+jNWauwoUhod6
2Z/UQnfPQhE8BelUHDw9uSCPARh+VOwyKUEJ0JkzTIIkZlyy36jlkQuCxXWoDTVOG9X/XwVloNKg
/U9xAwTV3t/6bzZBkEJzfVfVbv3asPoLzCWpn9GHmgIAIEO/a/hStw1XNQb4WX3WUbmFWoyDxj9B
B055sq7UILSqZvTPKos1EPJqRMRwN3kPHK+cbmquaWcvChcCzprw1JG3xWiAmx2sIv7KmyYUGOS4
+YH0QJD87/1pVg8R4fs8GWy/dMiM9itDYIRv2+3OyW8uuWlZxQnxmGJ+saYOrq3a4+y3jx59SmLc
I8oSrCDAyzrKAhAKea3CEQkNIynoepKKEws+HoHmj/iMa2fHuZ5AoNbBGrxjdYK1SwpzX0iDX2Gn
7UqbpjU6UrcZI4C1JTZXL8b9p24HNYtrUoPV6nPZILqUob2eHzboNIW3oJAdExgpeLcjHUe7U2Rq
aPpkO9v3O7/tZNdAhoUDt8qYehvpZx138NXXDy33V18pIRJ0B2N3zMk+YrGRBwDyINuIixhQbIdQ
1dvKPGTgGezoJJXxXk58KnLFp0PT6vrK8Unuu3dlB8ili90IO6pIKaOYiIgsH4DAAfmxDGzSYdMd
N07W+CNCsCVYs6ZXIgSXBaCEk1N6GsRTfcGCibyisX/Nj+t3PIGJRAGGvw3ljJ6KT1RmEnrbzz/+
rhrUNlp4GhqYoBB+4SKk+i+V+eNDW9/qiw/mw6Rcl93jqS+3Mzfc1L7VvaBtiWSYn/6mQHscpZ+i
wDT2SKZtmwS3iVvX1pT1+stoo9L1E8+6zBvti/B1vgU068cb6FAbLU46JwLsYcjfV7fhZc9fg+Bs
6tJGPkKqTCnew+9IUp7eJolXkkQ7IB8q1sxX6bsy5KVMEUnC4X1EnH2BMoByww4OlhfAeYRTiQGz
ZAGDAMbM7woM12ZfdhtXqT+Zt4/QeJmwLq3LO0UzMPkfTRinqi1Eb0f5zj35pipIEGLUs6bkgQaQ
7+QZtNa4sLi18FwbMQ56+vN2udqQ6WAyDw3FCVjpuPuOoIWec8oEJWJpeA+pKtYseP23gpAv7pNb
VzTpog2KR07S1TxfP81NEFSsTyeGTQrDAKEVh/y/vQqm4GmdQVG3fgEHuFINHW3UFS1Fr905X5fz
ty0lIhwJb5jiepm3O4ENtrEMQKdl+QsNCT3vMmEug/li6YmnPLKQHK09+37K2Fkj3p87Ip1DJDuR
sXixHZSxFiamD4ICakoi2fT/TU2nlI1zujbMt1CCBA3fwOhbQPVw2WY6HP0gCMOY/8GEPlpS6JwG
olRCWkCOZUKwMGSOaF3dyj8ZwBNRl/pRkrn5Zba15YjxiikbsvG3xJNhJJ7LPEIFm7NxNiokuSyU
1Xud275uVs0MFzCW5lVQwqUa8ZiaXTCHFbNalCOAOvraIV+EKaS3kQo00wEeez+0Iisa+DKFQRjH
g6N72Ph6POvB5ffl+YSSyzq7dFMidJwjq4um482t9HL/FHIyx9iTTJcI6NAlMiI3PTjhemQP2thS
patf2jNIYL3qGANctgp9j9tABaJ1Gn4355Hqey7dJNhO2iblsAS6vPqeIYgzQ7jfFUsHaoS7UzRC
Tk+dbLL2pQTtO5/OIiA6pUZMSvRg6AJgM5MqWEcJzfXSzYDcdFsHVSKyBrM+xnaDoN+u11N/DiC0
21KvMbmmjUH7FGIbfiWhQo+kIHIoIwiVaS7Q5mD///XrdiSUDdQpuXEg8CInxfB3yNUYmQTQmXes
keCowcaGvTiFPCDONbjmFStxQBE5erGMKXkmXMessXvw71A4Eak7cytp3TSR7qsmfDLrLPorHOb1
9GKGyPB6d2S/tL5SYRuXEy3fJSWMOq8GMkWxksw9s2eDXxCJ0+fb8Qd3QOQwiZ6JQ8QtQ6URycFh
ZQz3/soiicgnsjHQB4kQXVvC2y81d73+GlMtcvcjNVF19dUjeuDiAYOOZCdbkj36WTNuc6rP4RsJ
qOPFJGR5OgvI5OKXdb6TMMJWG2Clg5H4jMuKPLuxYQ877lNFG1Zbi2dgjUW7bZFWQj2ysnqdrxFA
wuj2DTM4v0sgYezP5gtI/rNQWHjNvoC0P/zQln+6jUSR8Yk5jxU3tyB5zpYLeLe2Uj9o/emqqIyi
zVZ/TGR3QrZ9uzCMqCYw3TNlLFrrY7muZLjuEZ0jw0cVWu7bhgwDf49VPUI0RWXcc0sFetzNm7kK
rEAI40b0rXauPrhbiMJiVM4DunSme7h44CdX/Gq8wZ+9kmpPuuMqJudFC9BVrCit7PEBFy/qFdx5
WDwD7emZKTfBZw3PmMWEDTpum70VGY+5C+mKzx5jwt5ZEpawR86OI0kzK7VgEoXJon8OdZux0Rmt
YLKN6rFH0FlW5eYhLhmrL61PjVIhQSPzdWbi2EClfp/yp5OhMn1RPFt36XQaNBZFCJuqwnEY0/mI
LFwa3x079M+ihQZm44AxItz7zCBu+NirpuCEG+oMIb1dtWK6+rAsOfXR+jeUBB+S5Jx0WYr+zqGQ
v9q6lABfZtTpJTu79b9dN2W+SamtoiDT/HusCuvd2YgkzluNXHmKAQLSuF9jxH+RQOZQvXO1EyIo
uM20knB7j8lTZlKAGRq0fB16qmoeA4sm1ODXpfFVeK7MtAE+Hqp5285bWTbVzfhkneB4/ZuHSCVc
6/al1wCQvgog/R/pD5SO1ahE6UulBqvGSjLmNtVG1v9DZHI6FXWpmYWNyHh0lAYaSoq8ArYtwzYI
sS6N4da8C+AnR2/jaX516bgRwyXy3bQPJPNPNp/Dk8Gh+BX8EVIEsfoNXSnrNfsooX6G9PtGbKql
THxtrygJNy7LBHbW6QCyDwAatpcY6m3I5nfJXxbLGPThmOQv/bP8J8SP8QAGssnxvAHI6ELiKzsx
N2jYn0+e7Hi20J+OmFa6HR3FklfZZ+NK7xxN/9qdHTxBz3MWHsVLrwaoAPdO8yhymRO1mO5qmDj/
2HXwzdOeBdwO70+VNNmw1xvOBnlJB7Z+Y4ubx/EUc4QkQnowHj/MULa1ynN/QrrnYIgt9HzBi637
m/xMqPOxuoFyiRPGeDbQaovXu/plocJTcFEWqjRuZ1btqpRuJPPX14i4ySLR4YrHnDy8Oq166irS
AIv05+gHSKGA4Z0ojsZdRIG4KjR1TCO4QxFDCGN0qmr2lpaZ96BWSO+qPlQy2i5lAi0MrezSQh+m
TJgmyLsAuwA2c4lx+4fQIe4RKhNavljew6DEGvXHKPwANavDhNt30acxfyQ2k/sKz0ajynlhyySi
tPfebAHO57Cvx9Mh9xUH78nrz4GVFvSYemsHlm115PWDNT6/sG2MXalAbcM6eRmgLrlvDFNDmtcu
4sUQM2M4ZZZV6b1MQjQ9evmfhtlMkISZFU9qjU5gV8KeD4To0Plrv+CD0mYVV3l7yxZGxNq0IsHT
4XYV137iVqKHmNN1sJ2C6+FC/7rNwL7GNtsvaCshTuszs4gCEVIzM5tV8kudaPQ7EpnAFSCp3Cc7
k/eVhyxJmlZVSUkN7I/a8HNYem7BrDW+WKd5Abrape3H+h2jhdH+2CDEncsz480wXOOd7TX9lzcV
9EdxoAoNwjVfydZX8iEu9WlYEreZ3K+58P3Ks4LElMe9GKPcEioL8Lo+KYFeVCGDCPsRq/WeKz/O
uFMnz55JzhinjOlj8M4JfACCGYHv7jXUSpbFdjREZPbkq4Lgob6TZRBhmGATfjDrxEQukqvkI7vE
Kzp2G59l7MdwgPuIIBld3FivVVP8dAI5U0CsZKnir0T57q8b6pEeDrOq0yhhe23Qj13KInxXtaZq
gBw5nZKTsoaAWxAi1nUGcI3ESs6nHeAejzYPzOHJqi8RUOdmFiMA+cUgrUArSY1DK5F/cPmKxViy
GFjnvSRY6N3LwyewToigYsXc9GWQGyVE/eGD3a8F6X4iDd/BpwlD513HbiwsA4l9Filg1wzxog3N
efltwtq+kySjQTXXM4PPdY598YsBBK0vqwl6tH+ilnSK1iZ8ENBDUcyzytS01IQrbQgaVEXN+uC8
9JWfw0bL/DTahwmR7QlfUf+USZ09Go8/k4ag6wjfrweycPuW0NC5IHF6M4mmrC8pQ6CcNNyIpf1R
AOrP9L/6A6oNcmvaIkw+UIAmsBIRlaKQ3R5ov5zs3p6A5r5ZSlqczaHZ4Az4OvKXIa/GaGg6TVjG
yepIYIOe+rnYWZOzETzMqtHuKDhWYLoilhPGFwSYVUfeGifmSqX21q0vo8yPiHcJW8OjDSltA3/+
JDLP8TLPDsPKtyq9Rqa7JxE/RMQyr+gfAxq3J//ZcuIVF/PnFoz0+8wBStqKG4LQBYvfFaepZ2yX
5P+CA0kkflBT4S5Udwsq/A2rrM+wRg8i8NncfBP58JxJetP4kvK8A83UVpiIbKM/jslO5BdAzc5l
qBIpo25Oex7nLboTTqgVGgu+dXIAG6Zlz6pbNTJIxxq7X7D8zwzGl+RnYNDMVG6g0x0HZnkq1IuR
QpFnkU16G4Cq8Jj4Y46Imj58wOzpR8ZqONYMgsoKsIvuBjcy7Y4Biewr+G22MUT6rwgTw68SmFny
elchmGoEQmWPk6CzTHNqcEM0UPNhTR+IgP3vLVZxJjAUYE76DzgZWyn7E1QX3qkIbZ+TZdYwbS2Z
IndjvhdoPAqcEm7HDcjdJPCUIubTdbpDK7k0KsLAXfNpkxSa/Qogs+riuP3e+n0G+LgxmcVJN9At
Sh02RSN4+MBbNvYbAB6wY5BF5WOHV1jYDgBAQJzpfAINFDXYuw53829ERa6dF7nHg9FeESJukGFj
HOk2Zz8zO0h0vGsIG/gObZxkyOjObVpnqtY8HMvoJGn4EPvVxJ+YtIGeyIvn8OO2I1ko1jL9iLm/
l4k6uUGxuHhisjn6envrGasfeZPtuxarqI3/w8oWHHIB4cjuyNe9touChyxtPJ/4dSJKdx1g2bDU
3KPQhjDYkyH1cL8rJT3eTUnfy0AYl0vTGkYzXU6hVJU3Brhp+HoZsItSIGQEih9rkMXnEthtt8QZ
uI1y9+pCmhyLECEMcwIk8TPcJZhGo1DnX+NtZ4cW6AGflLVYUMd0uEWdiEqFfjKRxYRpgU6hZoiw
PpNt/8QMXivhPRW3DyKYWAoACcYszSbUKvnlziclchbuXhWWtOHjPYQvZAh7O4j+2iJvcCDEpeuu
ZXzHVQfgMOA5e98xX80yQGiWwuEW1FSwZH4AA9Dn5beNx9iWx+YN0aT49GWYCMQtcCsxODUd8JII
WoAvr/ytf/9Re9fpRE6h+747S5DNGXVOe5YD9T+X7mTO/X/tof1ZFX8xOGAJ24JMdunQqxJnGxhN
C0sfYJcKl8Cp1Wp5uBwTLXGCZNvZ8v2hzD1m2QmF3BbWO0nzsdabSFFJ7SfZy3OCEIdecvmOi4Cp
CzDB+YKcUHzCuGR9kHV12nzEEaVgJgAsEQ5r0WEw0gDTvX5fnutl9UBrQ0NjmngWWct5b/6YLMMp
RalJXwy8TpHgAqP48OxcHrp2eHE/0ENDF+N+IpmybbtTwFYZTsBftYLgTXKAtbqOKPORxxGzWdp4
DW27/e4UjgWZdvEnKtm4w67CBp6YXOD7SI9BhEhYJ4R88l8pzmz/CBp1or7vh/cv/PdCJrvzuFoY
LjLVSJjXVT0M5x59W8M8PtvDp+953Ir15ZswHy+22Vti8QyvSH1OCN0HbvD7yogiLiabENcrCFiy
/ZFA+i3EBeLcvScIqv1MFCI22XdpVYXNqJl2IdFI0mPHkTzea14JDL4sgZfc5YkJ1U4PXeeXZiYd
L+S9XFoFClC7EvEHcKK+Vb5oS4uF8v71x/xRtkzRKorg++PtbL3fvQfWzev8cbKFmUqeaPWt5a7G
OBWAGF+riLKeVrPEb/8XTKJWp68fdtn1Mj8t14+BWPmheKAq6iWvfqga9zo+9t9icUNl1S4DrtWR
3EH1pWgloRRC7/5ACFlXkM7yburulhwoIFMWMSsQEXFyiLsV+ReNCB/+jDQqUr7/jZHSpBqKRe7G
NAWBiMEoiezkW5ffrTsxIVhUGxwQlNy8Vp/NMzup8JSsirC0h+o8boEaxDipexgBpXMZXf1rB9RZ
hv91mBe2llToGl4/Y6R7XLq0RBRDjShxE5Y79frwxNlk0wu9hvqE55DfML35W4ukCpwsgYn09fkm
L/RvayvRnoZS8w/TKwthyH+9/UIc54JixZMpGRfdjYcuMX3RZmtOh7Ugq7yeFdx0U2w8jRHc4xDj
fxfRztpoRaOBlSZNZCf4xKzZdqN8YcLKL3YMuS1MNuyA08NFLYCJqMCsybkpgImYA/WM92m35rAQ
ym9UgEigDCycucs1mTtEVrMhowTToBx3ZOD5SWjAOAlj9wAKYJ22huPNq4JAKzy0VSReKWPrfx0I
FoVjdVSXb8AaoOR/iyXMPRldNXNiLOFJhvT3LxKMqOG+xCLf01lq04no1wx2nsGUEmrVpYsmI2aM
owvbDnapvMOFCtj2762KJzmF19NjmgE+G1cmRJIB9iZpr3whmrhKvE28QWXUdVcRzFg+T5Fj4OuH
ofosOSG2GYWG0cLQGqKkhrvufjjMZ0T6CmfVptvyqnOPgGxK1F8gtkcRuLIfIbCn7rwqpuzBRMfv
GpvNzPiEfM1NsLO25TBzWb34ypu3/aMppyMzOgM+uRSrYMhT1FItw0XVp11C4UckRDmi/z2dTzKS
8wldhpTatZEiKD2eoTb/g+51bSLYbFKssiHl8iJkBA+IT/EFlFtyphE1Gz03KoRwLLoHaLtFfktQ
+daJ20kXfyLIUTmAdtz6WkT1/8Mwo7yfE2X5+PAeeQQLIlhEBCTwzAa/EtN/X1vR+czxjLtvi0Os
BuokspZZNuU8fCAulizvQJUZMAjfQb7yvmEFmc+1Utxk1Hh25OYBqIKPfBPS3pTek17ZJoo/9YHD
1gO/GaBp5vvrp12Zd0bAJUR8d64ZhuSNOelkIzdH00YNO9Uow2Y6oYrGcA4ZircZkjG3hkxDzc27
gJeqxaQOIYz0EQ0voveYg/xkTQyPXxE+j1aSZnTrskGcI3kPPF2qTnPR5a+WnlUnfOhpk6OLT4y6
o1ic8SMur5kUVXDTF6+Yih+QEcVOw2zWCzeNkuLvMJj3ktMKCzIdd/rfSfz73Md/7KYWJ+WnG1jT
IQY9MCneNyf3JP8wkDhIAPa5OEDTtXl0ysFfQHthK9+Rwy1apP0bx9wNQpUx6++NzFalTE9QR8mt
pul+0gWLIePoJ9X57pu2Kd8xJ4wFu4SKRqPX+hNATWSneeLEZxlSki28C9ZS6jVCoS065HV5L/nF
suJoWqtBEZIh4+6eEDcc4hgd9/kM6frSF2lZ9tB/OVI16zko3XnQq5iqUBByFW6ERzjpcj2lUPN3
8y7R5zQOYKrBcOnmNLz1Lqh2YY0Ma+1ZwsaW+SqhLQ3TK3afaHsnOFe8TUk7k/ckbbWcyIaJSvAc
TUx47hNop8BCAG1I26tmptx6NxXqjJX5P5UXeKEugjVS3KgY/lu2gdz9n/imwtZ50HwPKPblZmwe
HdRH4G71bsoUIoClnvRIyMtcU77EwrE6o/nK5zORJhzmgfWh5+0rNO/U4nWNhfauGZ7SqSRLgZHU
Ojz4yqa/BT1VdAUhDNtMydh4GwoguU9qXAM6CnP/VeuAlpEPOj/JihM71fFTT67sj2isO71Peqip
Puviv/k0/lPHk1GmsNgOKc+M7vqsPkXraMc3kbBMQ3fubndiPTYlfsD1OqwCbP4er7PdDq5IsJhF
qfeUtNlBxedl7sFUXGPB+DNS1bcdP5Jv1qMhoYPZR2ftV3NRpHuwi+8s/cxth0glrH+iMDJzLS2J
Xd8SQwnQ7TnmyfoBhiLTGdhun8vEaxFZ7GKzIkLM7+O1RGuxl1GTgHA2kaJrrnN95oV5AQmskF8S
9L7AUMDHmRTR+KVF+8i3eIBevUSnSm8jpib03v4XC7JnDN4ElmkHbz3bVZVyk2QG1B1UuFVbQFKb
68lDhTgarovMv5nkfoQCCz3Cga5G3iCmTwGTRQWSk1dtB6itZvHu4/pK7HG5oJ/2IyUNHhyBY8tF
GXCpeNl8aXiSXxRtKSff/nZjvATUpU/4kxKRt5+pCYT8DpQeGl2GzzD8rlx/dKO/5UHPy7OIVDHx
aaZQTM/mU1bD7TNflqiV/Cnhf9RoQfhYwAmNiUfJ/DCrF3YKGb3JDB2mdNa5jMfZNTLb1cYkpYet
zPcY98nvcvc2158AWtgY0+j66bayBFJjzieU5USk0oN/fC1h/Juz9cSo5hR704vddwc62Hhs93GA
YBPeYSdTOPkOxumS26OjtpaLj48qloAeEcM2+wEC1SiYU1OZycJGc5TEa0WHCLeuIMiD1fV6UCf6
tb/oXR29ZfhhX8cdnjN3zGqBftZJ341kMnf9ER1Q85QMpUjVW2hdXrV4cm2m9Kr0FLZluq4TspZH
TfriyIJ0Ddlm7cWdlDEtSWTivPynwFUDDbbZA23P6kEDktC6up11LJA4l6ih1wFhqCQFzsRa2Gs+
HnEdEOPR40a2XIAMSKMmQoU9SfV3tq+kOXyr2B+PJuX9I5Gb6qGH1VTs7Y/RwifdHv6h721wL1OK
CsyJQ8ylAQx1ZVO+CgRANIW0Ayl5v9MMEhKICY6idiZdC+qMtY7zLs54MUXCxlqt2w9lOsJhq2Pe
zcY5xQFMDdNxPkzOGQ==
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
