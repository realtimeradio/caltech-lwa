// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Feb  7 22:12:31 2021
// Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ gpio_pins3_c_counter_binary_v12_0_i1_sim_netlist.v
// Design      : gpio_pins3_c_counter_binary_v12_0_i1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "gpio_pins3_c_counter_binary_v12_0_i1,c_counter_binary_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_13 U0
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_13_viv i_synth
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
Sr/e8buYcj0TSAcE+eR+KckFAXQbzIXzK3S2FSXXRp2K9vE6bgzJ+It9hLRli+QYa2cxH0/qFIo+
p7EqU2lOYAueMbVLRAF8MkeXARL8sREoLTJO8c8UOwyoMGJEMQ7OTogh+TDW/g2CsbMVoaZsp8mr
TtewDYlg8hniZtL+W31LanEN3qMi2uOzJis6HsjWYzS//zMQvtGNwY6pC29jE9pmHW14DvDcOsm8
03456jdyh8GcVWEErVv3sqlGsKt8MiaJAVSxpcnYdf9YzHXx1Z5HM6r9NYX/8XCDdaNlifPwj83z
8uwzPMV6yS7dj6Rzi2foZ8svGqRPqoMdcDplKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TSR9YW+WrcpEv0EXew7TrW7JkO4OrD2uhTbZllUyBLV+Mr/Efh9d/Xikg0E+jaUbIhwh+nly8J3E
NTQwYZ1oWcNLVsWUV3Iw0SWTEB9XZiNwpn38QK6fByq3Jxep/5YQkHA/lFyu+HqKB2coLS/8mt7V
KJH+OHFNo/lfHFuzb0J3LZaSYkSnIdITge3D4suw3PMsM0doiMAHySgxRplraf0bXJFtkxBdFmdV
CjsJTz7j34bLWiAlf3PvstZ1Y4BmFzCbzqovS3HOdliMzlxVvkGpXGWQyJGZQp8/t0xGiTE87QoC
sx4QM1Rplp66d9K9Y50b7iB1LvkOrZmCVRK6DA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 30144)
`pragma protect data_block
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
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
