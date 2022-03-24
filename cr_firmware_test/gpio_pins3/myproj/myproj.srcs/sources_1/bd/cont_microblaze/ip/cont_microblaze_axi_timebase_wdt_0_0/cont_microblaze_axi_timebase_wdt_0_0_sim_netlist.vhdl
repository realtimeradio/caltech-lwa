-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Sun Feb  7 22:16:27 2021
-- Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.srcs/sources_1/bd/cont_microblaze/ip/cont_microblaze_axi_timebase_wdt_0_0/cont_microblaze_axi_timebase_wdt_0_0_sim_netlist.vhdl
-- Design      : cont_microblaze_axi_timebase_wdt_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku115-flvf1924-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_timebase_wdt_0_0_cdc_sync is
  port (
    \p_0_in__0\ : out STD_LOGIC;
    freeze : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of cont_microblaze_axi_timebase_wdt_0_0_cdc_sync : entity is "cdc_sync";
end cont_microblaze_axi_timebase_wdt_0_0_cdc_sync;

architecture STRUCTURE of cont_microblaze_axi_timebase_wdt_0_0_cdc_sync is
  signal Freeze_int : STD_LOGIC;
  signal s_level_out_d1_cdc_to : STD_LOGIC;
  signal s_level_out_d2 : STD_LOGIC;
  signal s_level_out_d3 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\ : label is std.standard.true;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\ : label is "FDR";
  attribute box_type : string;
  attribute box_type of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\ : label is std.standard.true;
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\ : label is "FDR";
  attribute box_type of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\ : label is std.standard.true;
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\ : label is "FDR";
  attribute box_type of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\ : label is std.standard.true;
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\ : label is "FDR";
  attribute box_type of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\ : label is "PRIMITIVE";
begin
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => freeze,
      Q => s_level_out_d1_cdc_to,
      R => '0'
    );
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_level_out_d1_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_level_out_d3,
      Q => Freeze_int,
      R => '0'
    );
\iTimebase_count[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Freeze_int,
      O => \p_0_in__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_timebase_wdt_0_0_pselect_f is
  port (
    ce_expnd_i_3 : out STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of cont_microblaze_axi_timebase_wdt_0_0_pselect_f : entity is "pselect_f";
end cont_microblaze_axi_timebase_wdt_0_0_pselect_f;

architecture STRUCTURE of cont_microblaze_axi_timebase_wdt_0_0_pselect_f is
begin
CS: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\(0),
      I1 => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\(1),
      O => ce_expnd_i_3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \cont_microblaze_axi_timebase_wdt_0_0_pselect_f__parameterized1\ is
  port (
    ce_expnd_i_1 : out STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \cont_microblaze_axi_timebase_wdt_0_0_pselect_f__parameterized1\ : entity is "pselect_f";
end \cont_microblaze_axi_timebase_wdt_0_0_pselect_f__parameterized1\;

architecture STRUCTURE of \cont_microblaze_axi_timebase_wdt_0_0_pselect_f__parameterized1\ is
begin
CS: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]\(0),
      O => ce_expnd_i_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_timebase_wdt_0_0_address_decoder is
  port (
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ : out STD_LOGIC;
    bus2ip_cs : out STD_LOGIC;
    Bus_RNW_reg_reg_0 : out STD_LOGIC;
    is_write_reg : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_onehot_state_reg[1]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1\ : out STD_LOGIC;
    bus2ip_wrce : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_wdata_0_sp_1 : out STD_LOGIC;
    s_axi_wdata_1_sp_1 : out STD_LOGIC;
    s_axi_rready_0 : out STD_LOGIC;
    s_axi_bready_0 : out STD_LOGIC;
    \FSM_onehot_state_reg[2]\ : out STD_LOGIC;
    Q : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_rvalid_i_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    \state_reg[0]\ : in STD_LOGIC;
    \FSM_onehot_state_reg[3]\ : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wready : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \s_axi_rdata_i_reg[4]\ : in STD_LOGIC_VECTOR ( 4 downto 0 );
    iTimebase_count_reg : in STD_LOGIC_VECTOR ( 30 downto 0 );
    read_Mux_In : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \s_axi_rdata_i_reg[2]\ : in STD_LOGIC;
    wdt_Reset_Status_Reg : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    \state_reg[1]\ : in STD_LOGIC;
    \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ : in STD_LOGIC;
    s_axi_wready_0 : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_rready : in STD_LOGIC;
    s_axi_rvalid_i_reg_0 : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bvalid_i_reg : in STD_LOGIC;
    ip2bus_error : in STD_LOGIC;
    s_axi_bresp : in STD_LOGIC_VECTOR ( 0 to 0 );
    Bus_RNW_reg_reg_1 : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of cont_microblaze_axi_timebase_wdt_0_0_address_decoder : entity is "address_decoder";
end cont_microblaze_axi_timebase_wdt_0_0_address_decoder;

architecture STRUCTURE of cont_microblaze_axi_timebase_wdt_0_0_address_decoder is
  signal Bus_RNW_reg_i_1_n_0 : STD_LOGIC;
  signal \^bus_rnw_reg_reg_0\ : STD_LOGIC;
  signal \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\ : STD_LOGIC;
  signal \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ : STD_LOGIC;
  signal \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\ : STD_LOGIC;
  signal \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\ : STD_LOGIC;
  signal \MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \^bus2ip_cs\ : STD_LOGIC;
  signal ce_expnd_i_0 : STD_LOGIC;
  signal ce_expnd_i_1 : STD_LOGIC;
  signal ce_expnd_i_2 : STD_LOGIC;
  signal ce_expnd_i_3 : STD_LOGIC;
  signal cs_ce_clr : STD_LOGIC;
  signal \^is_write_reg\ : STD_LOGIC;
  signal s_axi_arready_INST_0_i_1_n_0 : STD_LOGIC;
  signal s_axi_arready_INST_0_i_2_n_0 : STD_LOGIC;
  signal \s_axi_rdata_i[0]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata_i[1]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata_i[2]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata_i[3]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata_i[4]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata_i[4]_i_3_n_0\ : STD_LOGIC;
  signal s_axi_wdata_0_sn_1 : STD_LOGIC;
  signal s_axi_wdata_1_sn_1 : STD_LOGIC;
  signal s_axi_wready_INST_0_i_1_n_0 : STD_LOGIC;
  signal s_axi_wready_INST_0_i_2_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[1].ce_out_i[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \MEM_DECODE_GEN[0].cs_out_i[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of eWDT1_Reg_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of eWDT2_Reg_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \iTimebase_count[0]_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of s_axi_arready_INST_0 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of s_axi_arready_INST_0_i_2 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[4]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[4]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of s_axi_wready_INST_0_i_2 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \timer_width[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of wdt_State_Reg_i_2 : label is "soft_lutpair1";
begin
  Bus_RNW_reg_reg_0 <= \^bus_rnw_reg_reg_0\;
  \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ <= \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\;
  bus2ip_cs <= \^bus2ip_cs\;
  is_write_reg <= \^is_write_reg\;
  s_axi_wdata_0_sp_1 <= s_axi_wdata_0_sn_1;
  s_axi_wdata_1_sp_1 <= s_axi_wdata_1_sn_1;
Bus_RNW_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => Bus_RNW_reg_reg_1,
      I1 => Q,
      I2 => \^bus_rnw_reg_reg_0\,
      O => Bus_RNW_reg_i_1_n_0
    );
Bus_RNW_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Bus_RNW_reg_i_1_n_0,
      Q => \^bus_rnw_reg_reg_0\,
      R => '0'
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \FSM_onehot_state_reg[3]\(0),
      I1 => s_axi_arvalid,
      I2 => s_axi_arready_INST_0_i_1_n_0,
      I3 => \FSM_onehot_state_reg[3]\(1),
      O => \FSM_onehot_state_reg[1]\(0)
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4000FFFF40004000"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => \FSM_onehot_state_reg[3]\(0),
      I2 => s_axi_wvalid,
      I3 => s_axi_awvalid,
      I4 => \^is_write_reg\,
      I5 => \FSM_onehot_state_reg[3]\(2),
      O => \FSM_onehot_state_reg[1]\(1)
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF444F444F444"
    )
        port map (
      I0 => s_axi_arready_INST_0_i_1_n_0,
      I1 => \FSM_onehot_state_reg[3]\(1),
      I2 => \FSM_onehot_state_reg[3]\(2),
      I3 => \^is_write_reg\,
      I4 => \FSM_onehot_state_reg[3]\(3),
      I5 => \state_reg[0]\,
      O => \FSM_onehot_state_reg[1]\(2)
    );
\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_3,
      Q => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[1].ce_out_i[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0\(0),
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0\(1),
      O => ce_expnd_i_2
    );
\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_2,
      Q => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_1,
      Q => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => \^is_write_reg\,
      I1 => s_axi_arready_INST_0_i_1_n_0,
      I2 => s_axi_aresetn,
      O => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0\(1),
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0\(0),
      O => ce_expnd_i_0
    );
\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => Q,
      D => ce_expnd_i_0,
      Q => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      R => cs_ce_clr
    );
\MEM_DECODE_GEN[0].PER_CE_GEN[0].MULTIPLE_CES_THIS_CS_GEN.CE_I\: entity work.cont_microblaze_axi_timebase_wdt_0_0_pselect_f
     port map (
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\(1 downto 0) => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0\(1 downto 0),
      ce_expnd_i_3 => ce_expnd_i_3
    );
\MEM_DECODE_GEN[0].PER_CE_GEN[2].MULTIPLE_CES_THIS_CS_GEN.CE_I\: entity work.\cont_microblaze_axi_timebase_wdt_0_0_pselect_f__parameterized1\
     port map (
      \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]\(1 downto 0) => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0\(1 downto 0),
      ce_expnd_i_1 => ce_expnd_i_1
    );
\MEM_DECODE_GEN[0].cs_out_i[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40404000"
    )
        port map (
      I0 => \^is_write_reg\,
      I1 => s_axi_arready_INST_0_i_1_n_0,
      I2 => s_axi_aresetn,
      I3 => \^bus2ip_cs\,
      I4 => Q,
      O => \MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0\
    );
\MEM_DECODE_GEN[0].cs_out_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \MEM_DECODE_GEN[0].cs_out_i[0]_i_1_n_0\,
      Q => \^bus2ip_cs\,
      R => '0'
    );
eWDT1_Reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => s_axi_wdata(1),
      I1 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => read_Mux_In(1),
      O => s_axi_wdata_1_sn_1
    );
eWDT2_Reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF08"
    )
        port map (
      I0 => s_axi_wdata(0),
      I1 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => read_Mux_In(0),
      O => s_axi_wdata_0_sn_1
    );
\iTimebase_count[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF07FF77"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => s_axi_wdata(1),
      I2 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I3 => \^bus_rnw_reg_reg_0\,
      I4 => s_axi_wdata(0),
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1\
    );
s_axi_arready_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_arready_INST_0_i_1_n_0,
      O => s_axi_arready
    );
s_axi_arready_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000BBBBB"
    )
        port map (
      I0 => s_axi_wready_INST_0_i_1_n_0,
      I1 => \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\,
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I4 => \^bus_rnw_reg_reg_0\,
      I5 => s_axi_arready_INST_0_i_2_n_0,
      O => s_axi_arready_INST_0_i_1_n_0
    );
s_axi_arready_INST_0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E0"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I1 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I2 => \^bus_rnw_reg_reg_0\,
      O => s_axi_arready_INST_0_i_2_n_0
    );
\s_axi_bresp_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ip2bus_error,
      I1 => \FSM_onehot_state_reg[3]\(2),
      I2 => s_axi_bresp(0),
      O => \FSM_onehot_state_reg[2]\
    );
s_axi_bvalid_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"75553000"
    )
        port map (
      I0 => s_axi_bready,
      I1 => s_axi_rvalid_i_reg(0),
      I2 => s_axi_rvalid_i_reg(1),
      I3 => \^is_write_reg\,
      I4 => s_axi_bvalid_i_reg,
      O => s_axi_bready_0
    );
\s_axi_rdata_i[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"70FF7070"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I2 => \s_axi_rdata_i[0]_i_2_n_0\,
      I3 => \s_axi_rdata_i[4]_i_2_n_0\,
      I4 => \s_axi_rdata_i_reg[4]\(0),
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(0)
    );
\s_axi_rdata_i[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020300000200000"
    )
        port map (
      I0 => iTimebase_count_reg(0),
      I1 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I4 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I5 => read_Mux_In(0),
      O => \s_axi_rdata_i[0]_i_2_n_0\
    );
\s_axi_rdata_i[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(10),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(10)
    );
\s_axi_rdata_i[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(11),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(11)
    );
\s_axi_rdata_i[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(12),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(12)
    );
\s_axi_rdata_i[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(13),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(13)
    );
\s_axi_rdata_i[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(14),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(14)
    );
\s_axi_rdata_i[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(15),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(15)
    );
\s_axi_rdata_i[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(16),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(16)
    );
\s_axi_rdata_i[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(17),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(17)
    );
\s_axi_rdata_i[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(18),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(18)
    );
\s_axi_rdata_i[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(19),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(19)
    );
\s_axi_rdata_i[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"70FF7070"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I2 => \s_axi_rdata_i[1]_i_2_n_0\,
      I3 => \s_axi_rdata_i[4]_i_2_n_0\,
      I4 => \s_axi_rdata_i_reg[4]\(1),
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(1)
    );
\s_axi_rdata_i[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020300000200000"
    )
        port map (
      I0 => iTimebase_count_reg(1),
      I1 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I4 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I5 => read_Mux_In(1),
      O => \s_axi_rdata_i[1]_i_2_n_0\
    );
\s_axi_rdata_i[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(20),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(20)
    );
\s_axi_rdata_i[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(21),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(21)
    );
\s_axi_rdata_i[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(22),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(22)
    );
\s_axi_rdata_i[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(23),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(23)
    );
\s_axi_rdata_i[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(24),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(24)
    );
\s_axi_rdata_i[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(25),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(25)
    );
\s_axi_rdata_i[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(26),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(26)
    );
\s_axi_rdata_i[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(27),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(27)
    );
\s_axi_rdata_i[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(28),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(28)
    );
\s_axi_rdata_i[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(29),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(29)
    );
\s_axi_rdata_i[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"70FF7070"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I2 => \s_axi_rdata_i[2]_i_2_n_0\,
      I3 => \s_axi_rdata_i[4]_i_2_n_0\,
      I4 => \s_axi_rdata_i_reg[4]\(2),
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(2)
    );
\s_axi_rdata_i[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020300000200000"
    )
        port map (
      I0 => \s_axi_rdata_i_reg[2]\,
      I1 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I4 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I5 => iTimebase_count_reg(2),
      O => \s_axi_rdata_i[2]_i_2_n_0\
    );
\s_axi_rdata_i[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(30),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(30)
    );
\s_axi_rdata_i[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => p_0_in,
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(31)
    );
\s_axi_rdata_i[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"70FF7070"
    )
        port map (
      I0 => \^bus_rnw_reg_reg_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I2 => \s_axi_rdata_i[3]_i_2_n_0\,
      I3 => \s_axi_rdata_i[4]_i_2_n_0\,
      I4 => \s_axi_rdata_i_reg[4]\(3),
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(3)
    );
\s_axi_rdata_i[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020300000200000"
    )
        port map (
      I0 => iTimebase_count_reg(3),
      I1 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I2 => \^bus_rnw_reg_reg_0\,
      I3 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I4 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I5 => wdt_Reset_Status_Reg,
      O => \s_axi_rdata_i[3]_i_2_n_0\
    );
\s_axi_rdata_i[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4F444444"
    )
        port map (
      I0 => \s_axi_rdata_i[4]_i_2_n_0\,
      I1 => \s_axi_rdata_i_reg[4]\(4),
      I2 => s_axi_arready_INST_0_i_2_n_0,
      I3 => iTimebase_count_reg(4),
      I4 => \s_axi_rdata_i[4]_i_3_n_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(4)
    );
\s_axi_rdata_i[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFFFF"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I3 => \^bus_rnw_reg_reg_0\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      O => \s_axi_rdata_i[4]_i_2_n_0\
    );
\s_axi_rdata_i[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I1 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I2 => \^bus_rnw_reg_reg_0\,
      O => \s_axi_rdata_i[4]_i_3_n_0\
    );
\s_axi_rdata_i[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(5),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(5)
    );
\s_axi_rdata_i[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(6),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(6)
    );
\s_axi_rdata_i[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(7),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(7)
    );
\s_axi_rdata_i[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(8),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(8)
    );
\s_axi_rdata_i[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000006000000000"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => iTimebase_count_reg(9),
      I3 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I4 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I5 => \^bus_rnw_reg_reg_0\,
      O => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(9)
    );
s_axi_rvalid_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55750030"
    )
        port map (
      I0 => s_axi_rready,
      I1 => s_axi_arready_INST_0_i_1_n_0,
      I2 => s_axi_rvalid_i_reg(0),
      I3 => s_axi_rvalid_i_reg(1),
      I4 => s_axi_rvalid_i_reg_0,
      O => s_axi_rready_0
    );
s_axi_wready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F4"
    )
        port map (
      I0 => s_axi_wready_INST_0_i_1_n_0,
      I1 => s_axi_wready,
      I2 => s_axi_wready_INST_0_i_2_n_0,
      O => \^is_write_reg\
    );
s_axi_wready_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => s_axi_wready_0(1),
      I1 => s_axi_wready_0(0),
      I2 => s_axi_wready_0(2),
      I3 => s_axi_wready_0(5),
      I4 => s_axi_wready_0(3),
      I5 => s_axi_wready_0(4),
      O => s_axi_wready_INST_0_i_1_n_0
    );
s_axi_wready_INST_0_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF00FE"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I1 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I2 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I3 => \^bus_rnw_reg_reg_0\,
      I4 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      O => s_axi_wready_INST_0_i_2_n_0
    );
\state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBF83B38"
    )
        port map (
      I0 => \^is_write_reg\,
      I1 => s_axi_rvalid_i_reg(1),
      I2 => s_axi_rvalid_i_reg(0),
      I3 => s_axi_arvalid,
      I4 => \state_reg[0]\,
      O => D(0)
    );
\state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DDCFDDCC11CF11CC"
    )
        port map (
      I0 => s_axi_arready_INST_0_i_1_n_0,
      I1 => s_axi_rvalid_i_reg(1),
      I2 => s_axi_arvalid,
      I3 => s_axi_rvalid_i_reg(0),
      I4 => \state_reg[1]\,
      I5 => \state_reg[0]\,
      O => D(1)
    );
\timer_width[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I1 => \^bus_rnw_reg_reg_0\,
      O => bus2ip_wrce(0)
    );
wdt_State_Reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^gen_bkend_ce_registers[0].ce_out_i_reg[0]_0\,
      I1 => \^bus_rnw_reg_reg_0\,
      O => bus2ip_wrce(1)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_timebase_wdt_0_0_timebase_wdt_core is
  port (
    bus2ip_reset : out STD_LOGIC;
    wdt_reset : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    timebase_interrupt : out STD_LOGIC;
    iTimebase_count_reg : out STD_LOGIC_VECTOR ( 30 downto 0 );
    read_Mux_In : out STD_LOGIC_VECTOR ( 1 downto 0 );
    wdt_State_Reg_reg_0 : out STD_LOGIC;
    wdt_Reset_Status_Reg : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    eWDT2_Reg_reg_0 : in STD_LOGIC;
    eWDT1_Reg_reg_0 : in STD_LOGIC;
    \iTimebase_count_reg[0]_0\ : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 4 downto 0 );
    bus2ip_wrce : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    freeze : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of cont_microblaze_axi_timebase_wdt_0_0_timebase_wdt_core : entity is "timebase_wdt_core";
end cont_microblaze_axi_timebase_wdt_0_0_timebase_wdt_core;

architecture STRUCTURE of cont_microblaze_axi_timebase_wdt_0_0_timebase_wdt_core is
  signal Current_State : STD_LOGIC;
  signal Current_State_i_1_n_0 : STD_LOGIC;
  signal Current_State_i_2_n_0 : STD_LOGIC;
  signal \FSM_onehot_WDT_Current_State[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_WDT_Current_State[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_WDT_Current_State[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_WDT_Current_State_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_WDT_Current_State_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_WDT_Current_State_reg_n_0_[2]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal Timebase_Interrupt0 : STD_LOGIC;
  signal \^bus2ip_reset\ : STD_LOGIC;
  signal count_MSB_Reg : STD_LOGIC;
  signal g0_b0_n_0 : STD_LOGIC;
  signal g0_b1_n_0 : STD_LOGIC;
  signal \g0_b2__0_n_0\ : STD_LOGIC;
  signal \g0_b2__1_n_0\ : STD_LOGIC;
  signal \g0_b2__2_n_0\ : STD_LOGIC;
  signal g0_b2_n_0 : STD_LOGIC;
  signal g0_b3_i_1_n_0 : STD_LOGIC;
  signal g0_b3_i_2_n_0 : STD_LOGIC;
  signal g0_b3_i_3_n_0 : STD_LOGIC;
  signal g0_b3_i_4_n_0 : STD_LOGIC;
  signal g0_b3_i_5_n_0 : STD_LOGIC;
  signal g0_b3_i_6_n_0 : STD_LOGIC;
  signal g0_b3_i_7_n_0 : STD_LOGIC;
  signal g0_b3_i_8_n_0 : STD_LOGIC;
  signal g0_b3_i_9_n_0 : STD_LOGIC;
  signal g0_b3_n_0 : STD_LOGIC;
  signal \iTimebase_count[0]_i_5_n_0\ : STD_LOGIC;
  signal \^itimebase_count_reg\ : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \iTimebase_count_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_1\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_10\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_11\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_12\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_13\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_14\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_15\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_2\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_3\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_4\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_5\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_6\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_7\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_8\ : STD_LOGIC;
  signal \iTimebase_count_reg[0]_i_3_n_9\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_10\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_11\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_12\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_13\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_14\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_15\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_8\ : STD_LOGIC;
  signal \iTimebase_count_reg[16]_i_1_n_9\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_10\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_11\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_12\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_13\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_14\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_15\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_8\ : STD_LOGIC;
  signal \iTimebase_count_reg[24]_i_1_n_9\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_10\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_11\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_12\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_13\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_14\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_15\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_8\ : STD_LOGIC;
  signal \iTimebase_count_reg[8]_i_1_n_9\ : STD_LOGIC;
  signal iWDT_Reset : STD_LOGIC;
  signal \^p_0_in\ : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal \^read_mux_in\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal timebase_Reg_Reset : STD_LOGIC;
  signal wdt_Bitin_1d : STD_LOGIC;
  signal wdt_Bitin_1d_i_1_n_0 : STD_LOGIC;
  signal wdt_Bitin_1d_i_2_n_0 : STD_LOGIC;
  signal \^wdt_reset_status_reg\ : STD_LOGIC;
  signal wdt_Reset_Status_Reg_i_1_n_0 : STD_LOGIC;
  signal wdt_State_Preset : STD_LOGIC;
  signal wdt_State_Preset_i_10_n_0 : STD_LOGIC;
  signal wdt_State_Preset_i_11_n_0 : STD_LOGIC;
  signal wdt_State_Preset_i_12_n_0 : STD_LOGIC;
  signal wdt_State_Preset_i_3_n_0 : STD_LOGIC;
  signal wdt_State_Preset_i_4_n_0 : STD_LOGIC;
  signal wdt_State_Preset_i_5_n_0 : STD_LOGIC;
  signal wdt_State_Preset_i_6_n_0 : STD_LOGIC;
  signal wdt_State_Preset_i_7_n_0 : STD_LOGIC;
  signal wdt_State_Preset_i_8_n_0 : STD_LOGIC;
  signal wdt_State_Preset_i_9_n_0 : STD_LOGIC;
  signal wdt_State_Preset_reg_i_2_n_0 : STD_LOGIC;
  signal wdt_State_Reg_i_1_n_0 : STD_LOGIC;
  signal \^wdt_state_reg_reg_0\ : STD_LOGIC;
  signal \NLW_iTimebase_count_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Current_State_i_1 : label is "soft_lutpair13";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_WDT_Current_State_reg[0]\ : label is "expiredonce:0010,expiredoncedelayed:0100,resetstate:0001,expiredtwice:1000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_WDT_Current_State_reg[1]\ : label is "expiredonce:0010,expiredoncedelayed:0100,resetstate:0001,expiredtwice:1000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_WDT_Current_State_reg[2]\ : label is "expiredonce:0010,expiredoncedelayed:0100,resetstate:0001,expiredtwice:1000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_WDT_Current_State_reg[3]\ : label is "expiredonce:0010,expiredoncedelayed:0100,resetstate:0001,expiredtwice:1000";
  attribute SOFT_HLUTNM of g0_b0 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of g0_b1 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \g0_b2__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \g0_b2__1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of wdt_Bitin_1d_i_2 : label is "soft_lutpair13";
begin
  Q(4 downto 0) <= \^q\(4 downto 0);
  bus2ip_reset <= \^bus2ip_reset\;
  iTimebase_count_reg(30 downto 0) <= \^itimebase_count_reg\(30 downto 0);
  p_0_in <= \^p_0_in\;
  read_Mux_In(1 downto 0) <= \^read_mux_in\(1 downto 0);
  wdt_Reset_Status_Reg <= \^wdt_reset_status_reg\;
  wdt_State_Reg_reg_0 <= \^wdt_state_reg_reg_0\;
Current_State_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000A022"
    )
        port map (
      I0 => Current_State_i_2_n_0,
      I1 => g0_b3_n_0,
      I2 => Current_State,
      I3 => wdt_State_Preset_reg_i_2_n_0,
      I4 => iWDT_Reset,
      O => Current_State_i_1_n_0
    );
Current_State_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => \iTimebase_count_reg[0]_0\,
      I2 => \^read_mux_in\(1),
      I3 => \^read_mux_in\(0),
      O => Current_State_i_2_n_0
    );
Current_State_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Current_State_i_1_n_0,
      Q => Current_State,
      R => '0'
    );
\FSM_onehot_WDT_Current_State[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_WDT_Current_State_reg_n_0_[2]\,
      I1 => \^wdt_state_reg_reg_0\,
      O => \FSM_onehot_WDT_Current_State[0]_i_1_n_0\
    );
\FSM_onehot_WDT_Current_State[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFC8F8"
    )
        port map (
      I0 => \FSM_onehot_WDT_Current_State_reg_n_0_[0]\,
      I1 => p_2_in,
      I2 => \FSM_onehot_WDT_Current_State_reg_n_0_[2]\,
      I3 => \^wdt_state_reg_reg_0\,
      I4 => \FSM_onehot_WDT_Current_State_reg_n_0_[1]\,
      O => \FSM_onehot_WDT_Current_State[3]_i_1_n_0\
    );
\FSM_onehot_WDT_Current_State[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^wdt_state_reg_reg_0\,
      I1 => \FSM_onehot_WDT_Current_State_reg_n_0_[2]\,
      O => \FSM_onehot_WDT_Current_State[3]_i_2_n_0\
    );
\FSM_onehot_WDT_Current_State_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => \FSM_onehot_WDT_Current_State[3]_i_1_n_0\,
      D => \FSM_onehot_WDT_Current_State[0]_i_1_n_0\,
      Q => \FSM_onehot_WDT_Current_State_reg_n_0_[0]\,
      S => \^bus2ip_reset\
    );
\FSM_onehot_WDT_Current_State_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \FSM_onehot_WDT_Current_State[3]_i_1_n_0\,
      D => \FSM_onehot_WDT_Current_State_reg_n_0_[0]\,
      Q => \FSM_onehot_WDT_Current_State_reg_n_0_[1]\,
      R => \^bus2ip_reset\
    );
\FSM_onehot_WDT_Current_State_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \FSM_onehot_WDT_Current_State[3]_i_1_n_0\,
      D => \FSM_onehot_WDT_Current_State_reg_n_0_[1]\,
      Q => \FSM_onehot_WDT_Current_State_reg_n_0_[2]\,
      R => \^bus2ip_reset\
    );
\FSM_onehot_WDT_Current_State_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => \FSM_onehot_WDT_Current_State[3]_i_1_n_0\,
      D => \FSM_onehot_WDT_Current_State[3]_i_2_n_0\,
      Q => iWDT_Reset,
      R => \^bus2ip_reset\
    );
INPUT_DOUBLE_REGS3: entity work.cont_microblaze_axi_timebase_wdt_0_0_cdc_sync
     port map (
      freeze => freeze,
      \p_0_in__0\ => \p_0_in__0\,
      s_axi_aclk => s_axi_aclk
    );
Timebase_Interrupt_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => \^bus2ip_reset\
    );
Timebase_Interrupt_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => count_MSB_Reg,
      I1 => \^p_0_in\,
      O => Timebase_Interrupt0
    );
Timebase_Interrupt_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Timebase_Interrupt0,
      Q => timebase_interrupt,
      R => \^bus2ip_reset\
    );
WDT_Reset_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => iWDT_Reset,
      Q => wdt_reset,
      R => '0'
    );
count_MSB_Reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \^p_0_in\,
      Q => count_MSB_Reg,
      R => \^bus2ip_reset\
    );
eWDT1_Reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => eWDT1_Reg_reg_0,
      Q => \^read_mux_in\(1),
      R => \^bus2ip_reset\
    );
eWDT2_Reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => eWDT2_Reg_reg_0,
      Q => \^read_mux_in\(0),
      R => \^bus2ip_reset\
    );
g0_b0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(3),
      I2 => \^q\(4),
      O => g0_b0_n_0
    );
g0_b1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(3),
      I2 => \^q\(4),
      O => g0_b1_n_0
    );
g0_b2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => \^q\(4),
      O => g0_b2_n_0
    );
\g0_b2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"575757A8"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(3),
      I2 => \^q\(4),
      I3 => g0_b1_n_0,
      I4 => g0_b0_n_0,
      O => \g0_b2__0_n_0\
    );
\g0_b2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBBBBA4"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(4),
      I2 => \^q\(2),
      I3 => g0_b0_n_0,
      I4 => g0_b1_n_0,
      O => \g0_b2__1_n_0\
    );
\g0_b2__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCCCC8"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(4),
      I2 => \^q\(2),
      I3 => g0_b1_n_0,
      I4 => g0_b0_n_0,
      O => \g0_b2__2_n_0\
    );
g0_b3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"084C3B7F"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(4),
      I2 => g0_b3_i_1_n_0,
      I3 => g0_b3_i_2_n_0,
      I4 => g0_b3_i_3_n_0,
      O => g0_b3_n_0
    );
g0_b3_i_1: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b3_i_4_n_0,
      I1 => g0_b3_i_5_n_0,
      O => g0_b3_i_1_n_0,
      S => g0_b2_n_0
    );
g0_b3_i_2: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b3_i_6_n_0,
      I1 => g0_b3_i_7_n_0,
      O => g0_b3_i_2_n_0,
      S => g0_b2_n_0
    );
g0_b3_i_3: unisim.vcomponents.MUXF7
     port map (
      I0 => g0_b3_i_8_n_0,
      I1 => g0_b3_i_9_n_0,
      O => g0_b3_i_3_n_0,
      S => g0_b2_n_0
    );
g0_b3_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^itimebase_count_reg\(27),
      I1 => \^itimebase_count_reg\(26),
      I2 => g0_b1_n_0,
      I3 => \^itimebase_count_reg\(25),
      I4 => g0_b0_n_0,
      I5 => \^itimebase_count_reg\(24),
      O => g0_b3_i_4_n_0
    );
g0_b3_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^p_0_in\,
      I1 => \^itimebase_count_reg\(30),
      I2 => g0_b1_n_0,
      I3 => \^itimebase_count_reg\(29),
      I4 => g0_b0_n_0,
      I5 => \^itimebase_count_reg\(28),
      O => g0_b3_i_5_n_0
    );
g0_b3_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^itimebase_count_reg\(19),
      I1 => \^itimebase_count_reg\(18),
      I2 => g0_b1_n_0,
      I3 => \^itimebase_count_reg\(17),
      I4 => g0_b0_n_0,
      I5 => \^itimebase_count_reg\(16),
      O => g0_b3_i_6_n_0
    );
g0_b3_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^itimebase_count_reg\(23),
      I1 => \^itimebase_count_reg\(22),
      I2 => g0_b1_n_0,
      I3 => \^itimebase_count_reg\(21),
      I4 => g0_b0_n_0,
      I5 => \^itimebase_count_reg\(20),
      O => g0_b3_i_7_n_0
    );
g0_b3_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^itimebase_count_reg\(11),
      I1 => \^itimebase_count_reg\(10),
      I2 => g0_b1_n_0,
      I3 => \^itimebase_count_reg\(9),
      I4 => g0_b0_n_0,
      I5 => \^itimebase_count_reg\(8),
      O => g0_b3_i_8_n_0
    );
g0_b3_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \^itimebase_count_reg\(15),
      I1 => \^itimebase_count_reg\(14),
      I2 => g0_b1_n_0,
      I3 => \^itimebase_count_reg\(13),
      I4 => g0_b0_n_0,
      I5 => \^itimebase_count_reg\(12),
      O => g0_b3_i_9_n_0
    );
\iTimebase_count[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"01FF"
    )
        port map (
      I0 => \^read_mux_in\(0),
      I1 => \^read_mux_in\(1),
      I2 => \iTimebase_count_reg[0]_0\,
      I3 => s_axi_aresetn,
      O => timebase_Reg_Reset
    );
\iTimebase_count[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^itimebase_count_reg\(0),
      O => \iTimebase_count[0]_i_5_n_0\
    );
\iTimebase_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[0]_i_3_n_15\,
      Q => \^itimebase_count_reg\(0),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[0]_i_3\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \iTimebase_count_reg[0]_i_3_n_0\,
      CO(6) => \iTimebase_count_reg[0]_i_3_n_1\,
      CO(5) => \iTimebase_count_reg[0]_i_3_n_2\,
      CO(4) => \iTimebase_count_reg[0]_i_3_n_3\,
      CO(3) => \iTimebase_count_reg[0]_i_3_n_4\,
      CO(2) => \iTimebase_count_reg[0]_i_3_n_5\,
      CO(1) => \iTimebase_count_reg[0]_i_3_n_6\,
      CO(0) => \iTimebase_count_reg[0]_i_3_n_7\,
      DI(7 downto 0) => B"00000001",
      O(7) => \iTimebase_count_reg[0]_i_3_n_8\,
      O(6) => \iTimebase_count_reg[0]_i_3_n_9\,
      O(5) => \iTimebase_count_reg[0]_i_3_n_10\,
      O(4) => \iTimebase_count_reg[0]_i_3_n_11\,
      O(3) => \iTimebase_count_reg[0]_i_3_n_12\,
      O(2) => \iTimebase_count_reg[0]_i_3_n_13\,
      O(1) => \iTimebase_count_reg[0]_i_3_n_14\,
      O(0) => \iTimebase_count_reg[0]_i_3_n_15\,
      S(7 downto 1) => \^itimebase_count_reg\(7 downto 1),
      S(0) => \iTimebase_count[0]_i_5_n_0\
    );
\iTimebase_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[8]_i_1_n_13\,
      Q => \^itimebase_count_reg\(10),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[8]_i_1_n_12\,
      Q => \^itimebase_count_reg\(11),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[8]_i_1_n_11\,
      Q => \^itimebase_count_reg\(12),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[8]_i_1_n_10\,
      Q => \^itimebase_count_reg\(13),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[8]_i_1_n_9\,
      Q => \^itimebase_count_reg\(14),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[8]_i_1_n_8\,
      Q => \^itimebase_count_reg\(15),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[16]_i_1_n_15\,
      Q => \^itimebase_count_reg\(16),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[16]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \iTimebase_count_reg[8]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \iTimebase_count_reg[16]_i_1_n_0\,
      CO(6) => \iTimebase_count_reg[16]_i_1_n_1\,
      CO(5) => \iTimebase_count_reg[16]_i_1_n_2\,
      CO(4) => \iTimebase_count_reg[16]_i_1_n_3\,
      CO(3) => \iTimebase_count_reg[16]_i_1_n_4\,
      CO(2) => \iTimebase_count_reg[16]_i_1_n_5\,
      CO(1) => \iTimebase_count_reg[16]_i_1_n_6\,
      CO(0) => \iTimebase_count_reg[16]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \iTimebase_count_reg[16]_i_1_n_8\,
      O(6) => \iTimebase_count_reg[16]_i_1_n_9\,
      O(5) => \iTimebase_count_reg[16]_i_1_n_10\,
      O(4) => \iTimebase_count_reg[16]_i_1_n_11\,
      O(3) => \iTimebase_count_reg[16]_i_1_n_12\,
      O(2) => \iTimebase_count_reg[16]_i_1_n_13\,
      O(1) => \iTimebase_count_reg[16]_i_1_n_14\,
      O(0) => \iTimebase_count_reg[16]_i_1_n_15\,
      S(7 downto 0) => \^itimebase_count_reg\(23 downto 16)
    );
\iTimebase_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[16]_i_1_n_14\,
      Q => \^itimebase_count_reg\(17),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[16]_i_1_n_13\,
      Q => \^itimebase_count_reg\(18),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[16]_i_1_n_12\,
      Q => \^itimebase_count_reg\(19),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[0]_i_3_n_14\,
      Q => \^itimebase_count_reg\(1),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[16]_i_1_n_11\,
      Q => \^itimebase_count_reg\(20),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[16]_i_1_n_10\,
      Q => \^itimebase_count_reg\(21),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[16]_i_1_n_9\,
      Q => \^itimebase_count_reg\(22),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[16]_i_1_n_8\,
      Q => \^itimebase_count_reg\(23),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[24]_i_1_n_15\,
      Q => \^itimebase_count_reg\(24),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[24]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \iTimebase_count_reg[16]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_iTimebase_count_reg[24]_i_1_CO_UNCONNECTED\(7),
      CO(6) => \iTimebase_count_reg[24]_i_1_n_1\,
      CO(5) => \iTimebase_count_reg[24]_i_1_n_2\,
      CO(4) => \iTimebase_count_reg[24]_i_1_n_3\,
      CO(3) => \iTimebase_count_reg[24]_i_1_n_4\,
      CO(2) => \iTimebase_count_reg[24]_i_1_n_5\,
      CO(1) => \iTimebase_count_reg[24]_i_1_n_6\,
      CO(0) => \iTimebase_count_reg[24]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \iTimebase_count_reg[24]_i_1_n_8\,
      O(6) => \iTimebase_count_reg[24]_i_1_n_9\,
      O(5) => \iTimebase_count_reg[24]_i_1_n_10\,
      O(4) => \iTimebase_count_reg[24]_i_1_n_11\,
      O(3) => \iTimebase_count_reg[24]_i_1_n_12\,
      O(2) => \iTimebase_count_reg[24]_i_1_n_13\,
      O(1) => \iTimebase_count_reg[24]_i_1_n_14\,
      O(0) => \iTimebase_count_reg[24]_i_1_n_15\,
      S(7) => \^p_0_in\,
      S(6 downto 0) => \^itimebase_count_reg\(30 downto 24)
    );
\iTimebase_count_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[24]_i_1_n_14\,
      Q => \^itimebase_count_reg\(25),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[24]_i_1_n_13\,
      Q => \^itimebase_count_reg\(26),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[24]_i_1_n_12\,
      Q => \^itimebase_count_reg\(27),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[24]_i_1_n_11\,
      Q => \^itimebase_count_reg\(28),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[24]_i_1_n_10\,
      Q => \^itimebase_count_reg\(29),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[0]_i_3_n_13\,
      Q => \^itimebase_count_reg\(2),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[24]_i_1_n_9\,
      Q => \^itimebase_count_reg\(30),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[24]_i_1_n_8\,
      Q => \^p_0_in\,
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[0]_i_3_n_12\,
      Q => \^itimebase_count_reg\(3),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[0]_i_3_n_11\,
      Q => \^itimebase_count_reg\(4),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[0]_i_3_n_10\,
      Q => \^itimebase_count_reg\(5),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[0]_i_3_n_9\,
      Q => \^itimebase_count_reg\(6),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[0]_i_3_n_8\,
      Q => \^itimebase_count_reg\(7),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[8]_i_1_n_15\,
      Q => \^itimebase_count_reg\(8),
      R => timebase_Reg_Reset
    );
\iTimebase_count_reg[8]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \iTimebase_count_reg[0]_i_3_n_0\,
      CI_TOP => '0',
      CO(7) => \iTimebase_count_reg[8]_i_1_n_0\,
      CO(6) => \iTimebase_count_reg[8]_i_1_n_1\,
      CO(5) => \iTimebase_count_reg[8]_i_1_n_2\,
      CO(4) => \iTimebase_count_reg[8]_i_1_n_3\,
      CO(3) => \iTimebase_count_reg[8]_i_1_n_4\,
      CO(2) => \iTimebase_count_reg[8]_i_1_n_5\,
      CO(1) => \iTimebase_count_reg[8]_i_1_n_6\,
      CO(0) => \iTimebase_count_reg[8]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \iTimebase_count_reg[8]_i_1_n_8\,
      O(6) => \iTimebase_count_reg[8]_i_1_n_9\,
      O(5) => \iTimebase_count_reg[8]_i_1_n_10\,
      O(4) => \iTimebase_count_reg[8]_i_1_n_11\,
      O(3) => \iTimebase_count_reg[8]_i_1_n_12\,
      O(2) => \iTimebase_count_reg[8]_i_1_n_13\,
      O(1) => \iTimebase_count_reg[8]_i_1_n_14\,
      O(0) => \iTimebase_count_reg[8]_i_1_n_15\,
      S(7 downto 0) => \^itimebase_count_reg\(15 downto 8)
    );
\iTimebase_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \p_0_in__0\,
      D => \iTimebase_count_reg[8]_i_1_n_14\,
      Q => \^itimebase_count_reg\(9),
      R => timebase_Reg_Reset
    );
\timer_width_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => bus2ip_wrce(0),
      D => s_axi_wdata(0),
      Q => \^q\(0),
      S => \^bus2ip_reset\
    );
\timer_width_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => bus2ip_wrce(0),
      D => s_axi_wdata(1),
      Q => \^q\(1),
      R => \^bus2ip_reset\
    );
\timer_width_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => bus2ip_wrce(0),
      D => s_axi_wdata(2),
      Q => \^q\(2),
      S => \^bus2ip_reset\
    );
\timer_width_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => bus2ip_wrce(0),
      D => s_axi_wdata(3),
      Q => \^q\(3),
      S => \^bus2ip_reset\
    );
\timer_width_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => bus2ip_wrce(0),
      D => s_axi_wdata(4),
      Q => \^q\(4),
      S => \^bus2ip_reset\
    );
wdt_Bitin_1d_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFAEAAFFFF"
    )
        port map (
      I0 => wdt_Bitin_1d_i_2_n_0,
      I1 => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      I2 => Bus_RNW_reg,
      I3 => s_axi_wdata(2),
      I4 => s_axi_aresetn,
      I5 => iWDT_Reset,
      O => wdt_Bitin_1d_i_1_n_0
    );
wdt_Bitin_1d_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => g0_b3_n_0,
      I1 => Current_State,
      I2 => wdt_State_Preset_reg_i_2_n_0,
      O => wdt_Bitin_1d_i_2_n_0
    );
wdt_Bitin_1d_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => wdt_Bitin_1d_i_1_n_0,
      Q => wdt_Bitin_1d,
      R => '0'
    );
wdt_Reset_Status_Reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EE0EEEEE"
    )
        port map (
      I0 => \^wdt_reset_status_reg\,
      I1 => iWDT_Reset,
      I2 => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      I3 => Bus_RNW_reg,
      I4 => s_axi_wdata(3),
      O => wdt_Reset_Status_Reg_i_1_n_0
    );
wdt_Reset_Status_Reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => wdt_Reset_Status_Reg_i_1_n_0,
      Q => \^wdt_reset_status_reg\,
      R => '0'
    );
wdt_State_Preset_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000041414100"
    )
        port map (
      I0 => wdt_State_Preset_reg_i_2_n_0,
      I1 => Current_State,
      I2 => g0_b3_n_0,
      I3 => \^read_mux_in\(1),
      I4 => \^read_mux_in\(0),
      I5 => wdt_Bitin_1d,
      O => p_2_in
    );
wdt_State_Preset_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => \^itimebase_count_reg\(28),
      I1 => \^itimebase_count_reg\(29),
      I2 => g0_b0_n_0,
      I3 => g0_b1_n_0,
      I4 => \^itimebase_count_reg\(30),
      I5 => \^p_0_in\,
      O => wdt_State_Preset_i_10_n_0
    );
wdt_State_Preset_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => \^itimebase_count_reg\(16),
      I1 => \^itimebase_count_reg\(17),
      I2 => g0_b0_n_0,
      I3 => g0_b1_n_0,
      I4 => \^itimebase_count_reg\(18),
      I5 => \^itimebase_count_reg\(19),
      O => wdt_State_Preset_i_11_n_0
    );
wdt_State_Preset_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => \^itimebase_count_reg\(20),
      I1 => \^itimebase_count_reg\(21),
      I2 => g0_b0_n_0,
      I3 => g0_b1_n_0,
      I4 => \^itimebase_count_reg\(22),
      I5 => \^itimebase_count_reg\(23),
      O => wdt_State_Preset_i_12_n_0
    );
wdt_State_Preset_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => wdt_State_Preset_i_5_n_0,
      I1 => wdt_State_Preset_i_6_n_0,
      I2 => \g0_b2__1_n_0\,
      I3 => wdt_State_Preset_i_7_n_0,
      I4 => \g0_b2__0_n_0\,
      I5 => wdt_State_Preset_i_8_n_0,
      O => wdt_State_Preset_i_3_n_0
    );
wdt_State_Preset_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => wdt_State_Preset_i_9_n_0,
      I1 => wdt_State_Preset_i_10_n_0,
      I2 => \g0_b2__1_n_0\,
      I3 => wdt_State_Preset_i_11_n_0,
      I4 => \g0_b2__0_n_0\,
      I5 => wdt_State_Preset_i_12_n_0,
      O => wdt_State_Preset_i_4_n_0
    );
wdt_State_Preset_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => \^itimebase_count_reg\(8),
      I1 => \^itimebase_count_reg\(9),
      I2 => g0_b0_n_0,
      I3 => g0_b1_n_0,
      I4 => \^itimebase_count_reg\(10),
      I5 => \^itimebase_count_reg\(11),
      O => wdt_State_Preset_i_5_n_0
    );
wdt_State_Preset_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => \^itimebase_count_reg\(12),
      I1 => \^itimebase_count_reg\(13),
      I2 => g0_b0_n_0,
      I3 => g0_b1_n_0,
      I4 => \^itimebase_count_reg\(14),
      I5 => \^itimebase_count_reg\(15),
      O => wdt_State_Preset_i_6_n_0
    );
wdt_State_Preset_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => \^itimebase_count_reg\(0),
      I1 => \^itimebase_count_reg\(1),
      I2 => g0_b0_n_0,
      I3 => g0_b1_n_0,
      I4 => \^itimebase_count_reg\(2),
      I5 => \^itimebase_count_reg\(3),
      O => wdt_State_Preset_i_7_n_0
    );
wdt_State_Preset_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => \^itimebase_count_reg\(4),
      I1 => \^itimebase_count_reg\(5),
      I2 => g0_b0_n_0,
      I3 => g0_b1_n_0,
      I4 => \^itimebase_count_reg\(6),
      I5 => \^itimebase_count_reg\(7),
      O => wdt_State_Preset_i_8_n_0
    );
wdt_State_Preset_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FCAF0CAFFCA00CA0"
    )
        port map (
      I0 => \^itimebase_count_reg\(24),
      I1 => \^itimebase_count_reg\(25),
      I2 => g0_b0_n_0,
      I3 => g0_b1_n_0,
      I4 => \^itimebase_count_reg\(26),
      I5 => \^itimebase_count_reg\(27),
      O => wdt_State_Preset_i_9_n_0
    );
wdt_State_Preset_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_2_in,
      Q => wdt_State_Preset,
      R => \^bus2ip_reset\
    );
wdt_State_Preset_reg_i_2: unisim.vcomponents.MUXF7
     port map (
      I0 => wdt_State_Preset_i_3_n_0,
      I1 => wdt_State_Preset_i_4_n_0,
      O => wdt_State_Preset_reg_i_2_n_0,
      S => \g0_b2__2_n_0\
    );
wdt_State_Reg_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AE00AE00AE00"
    )
        port map (
      I0 => \^wdt_state_reg_reg_0\,
      I1 => p_2_in,
      I2 => wdt_State_Preset,
      I3 => s_axi_aresetn,
      I4 => s_axi_wdata(2),
      I5 => bus2ip_wrce(1),
      O => wdt_State_Reg_i_1_n_0
    );
wdt_State_Reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => wdt_State_Reg_i_1_n_0,
      Q => \^wdt_state_reg_reg_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_timebase_wdt_0_0_slave_attachment is
  port (
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ : out STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    bus2ip_cs : out STD_LOGIC;
    bus2ip_rnw_i_reg_0 : out STD_LOGIC;
    Bus_RNW_reg_reg : out STD_LOGIC;
    s_axi_rvalid_i_reg_0 : out STD_LOGIC;
    s_axi_bvalid_i_reg_0 : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    is_write_reg_0 : out STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ : out STD_LOGIC;
    bus2ip_wrce : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_wdata_0_sp_1 : out STD_LOGIC;
    s_axi_wdata_1_sp_1 : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bus2ip_reset : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    ip2bus_error : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    iTimebase_count_reg : in STD_LOGIC_VECTOR ( 30 downto 0 );
    read_Mux_In : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \s_axi_rdata_i_reg[2]_0\ : in STD_LOGIC;
    wdt_Reset_Status_Reg : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of cont_microblaze_axi_timebase_wdt_0_0_slave_attachment : entity is "slave_attachment";
end cont_microblaze_axi_timebase_wdt_0_0_slave_attachment;

architecture STRUCTURE of cont_microblaze_axi_timebase_wdt_0_0_slave_attachment is
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[3]\ : STD_LOGIC;
  signal \INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1_n_0\ : STD_LOGIC;
  signal \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal I_DECODER_n_47 : STD_LOGIC;
  signal I_DECODER_n_48 : STD_LOGIC;
  signal I_DECODER_n_49 : STD_LOGIC;
  signal I_DECODER_n_6 : STD_LOGIC;
  signal I_DECODER_n_7 : STD_LOGIC;
  signal I_DECODER_n_8 : STD_LOGIC;
  signal \TIMEBASE_WDT_CORE_I/sl_DBus_In\ : STD_LOGIC_VECTOR ( 0 to 31 );
  signal \bus2ip_addr_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[3]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[3]_i_2_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i_reg_n_0_[2]\ : STD_LOGIC;
  signal \bus2ip_addr_i_reg_n_0_[3]\ : STD_LOGIC;
  signal bus2ip_rnw_i_i_1_n_0 : STD_LOGIC;
  signal \^bus2ip_rnw_i_reg_0\ : STD_LOGIC;
  signal is_read : STD_LOGIC;
  signal is_read_i_1_n_0 : STD_LOGIC;
  signal is_read_reg_n_0 : STD_LOGIC;
  signal is_write : STD_LOGIC;
  signal is_write_reg_n_0 : STD_LOGIC;
  signal p_0_out : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal plusOp : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal rst : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_axi_bresp_i : STD_LOGIC;
  signal \^s_axi_bvalid_i_reg_0\ : STD_LOGIC;
  signal s_axi_rresp_i : STD_LOGIC;
  signal \^s_axi_rvalid_i_reg_0\ : STD_LOGIC;
  signal s_axi_wdata_0_sn_1 : STD_LOGIC;
  signal s_axi_wdata_1_sn_1 : STD_LOGIC;
  signal start2 : STD_LOGIC;
  signal start2_i_1_n_0 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state[1]_i_2_n_0\ : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "iSTATE:0010,iSTATE0:0100,iSTATE1:1000,iSTATE2:0001";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[1]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \INCLUDE_DPHASE_TIMER.dpto_cnt[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \bus2ip_addr_i[3]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of is_read_i_2 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of is_write_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of start2_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \state[1]_i_2\ : label is "soft_lutpair8";
begin
  bus2ip_rnw_i_reg_0 <= \^bus2ip_rnw_i_reg_0\;
  s_axi_bresp(0) <= \^s_axi_bresp\(0);
  s_axi_bvalid_i_reg_0 <= \^s_axi_bvalid_i_reg_0\;
  s_axi_rvalid_i_reg_0 <= \^s_axi_rvalid_i_reg_0\;
  s_axi_wdata_0_sp_1 <= s_axi_wdata_0_sn_1;
  s_axi_wdata_1_sp_1 <= s_axi_wdata_1_sn_1;
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44444F444F444F44"
    )
        port map (
      I0 => \FSM_onehot_state[3]_i_2_n_0\,
      I1 => \FSM_onehot_state_reg_n_0_[3]\,
      I2 => s_axi_arvalid,
      I3 => \FSM_onehot_state_reg_n_0_[0]\,
      I4 => s_axi_wvalid,
      I5 => s_axi_awvalid,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0777"
    )
        port map (
      I0 => \^s_axi_rvalid_i_reg_0\,
      I1 => s_axi_rready,
      I2 => \^s_axi_bvalid_i_reg_0\,
      I3 => s_axi_bready,
      O => \FSM_onehot_state[3]_i_2_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_state[0]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[0]\,
      S => rst
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_8,
      Q => s_axi_rresp_i,
      R => rst
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_7,
      Q => s_axi_bresp_i,
      R => rst
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_6,
      Q => \FSM_onehot_state_reg_n_0_[3]\,
      R => rst
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(0),
      O => plusOp(0)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(0),
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(1),
      O => plusOp(1)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(2),
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(1),
      I2 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(0),
      O => plusOp(2)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(3),
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(0),
      I2 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(1),
      I3 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(2),
      O => plusOp(3)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(4),
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(2),
      I2 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(1),
      I3 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(0),
      I4 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(3),
      O => plusOp(4)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      O => \INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1_n_0\
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(5),
      I1 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(3),
      I2 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(0),
      I3 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(1),
      I4 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(2),
      I5 => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(4),
      O => plusOp(5)
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(0),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(0),
      R => \INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1_n_0\
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(1),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(1),
      R => \INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1_n_0\
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(2),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(2),
      R => \INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1_n_0\
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(3),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(3),
      R => \INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1_n_0\
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(4),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(4),
      R => \INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1_n_0\
    );
\INCLUDE_DPHASE_TIMER.dpto_cnt_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => plusOp(5),
      Q => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(5),
      R => \INCLUDE_DPHASE_TIMER.dpto_cnt[5]_i_1_n_0\
    );
I_DECODER: entity work.cont_microblaze_axi_timebase_wdt_0_0_address_decoder
     port map (
      Bus_RNW_reg_reg_0 => Bus_RNW_reg_reg,
      Bus_RNW_reg_reg_1 => \^bus2ip_rnw_i_reg_0\,
      D(1 downto 0) => p_0_out(1 downto 0),
      \FSM_onehot_state_reg[1]\(2) => I_DECODER_n_6,
      \FSM_onehot_state_reg[1]\(1) => I_DECODER_n_7,
      \FSM_onehot_state_reg[1]\(0) => I_DECODER_n_8,
      \FSM_onehot_state_reg[2]\ => I_DECODER_n_49,
      \FSM_onehot_state_reg[3]\(3) => \FSM_onehot_state_reg_n_0_[3]\,
      \FSM_onehot_state_reg[3]\(2) => s_axi_bresp_i,
      \FSM_onehot_state_reg[3]\(1) => s_axi_rresp_i,
      \FSM_onehot_state_reg[3]\(0) => \FSM_onehot_state_reg_n_0_[0]\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_1\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(31) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(0),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(30) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(1),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(29) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(2),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(28) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(3),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(27) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(4),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(26) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(5),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(25) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(6),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(24) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(7),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(23) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(8),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(22) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(9),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(21) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(10),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(20) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(11),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(19) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(12),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(18) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(13),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(17) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(14),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(16) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(15),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(15) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(16),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(14) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(17),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(13) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(18),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(12) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(19),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(11) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(20),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(10) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(21),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(9) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(22),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(8) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(23),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(7) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(24),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(6) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(25),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(5) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(26),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(4) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(27),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(3) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(28),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(2) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(29),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(1) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(30),
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_2\(0) => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(31),
      \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0\(1) => \bus2ip_addr_i_reg_n_0_[3]\,
      \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]_0\(0) => \bus2ip_addr_i_reg_n_0_[2]\,
      \MEM_DECODE_GEN[0].cs_out_i_reg[0]_0\ => is_read_reg_n_0,
      Q => start2,
      bus2ip_cs => bus2ip_cs,
      bus2ip_wrce(1 downto 0) => bus2ip_wrce(1 downto 0),
      iTimebase_count_reg(30 downto 0) => iTimebase_count_reg(30 downto 0),
      ip2bus_error => ip2bus_error,
      is_write_reg => is_write_reg_0,
      p_0_in => p_0_in,
      read_Mux_In(1 downto 0) => read_Mux_In(1 downto 0),
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bready_0 => I_DECODER_n_48,
      s_axi_bresp(0) => \^s_axi_bresp\(0),
      s_axi_bvalid_i_reg => \^s_axi_bvalid_i_reg_0\,
      \s_axi_rdata_i_reg[2]\ => \s_axi_rdata_i_reg[2]_0\,
      \s_axi_rdata_i_reg[4]\(4 downto 0) => Q(4 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rready_0 => I_DECODER_n_47,
      s_axi_rvalid_i_reg(1 downto 0) => state(1 downto 0),
      s_axi_rvalid_i_reg_0 => \^s_axi_rvalid_i_reg_0\,
      s_axi_wdata(1 downto 0) => s_axi_wdata(1 downto 0),
      s_axi_wdata_0_sp_1 => s_axi_wdata_0_sn_1,
      s_axi_wdata_1_sp_1 => s_axi_wdata_1_sn_1,
      s_axi_wready => is_write_reg_n_0,
      s_axi_wready_0(5 downto 0) => \INCLUDE_DPHASE_TIMER.dpto_cnt_reg\(5 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      \state_reg[0]\ => \FSM_onehot_state[3]_i_2_n_0\,
      \state_reg[1]\ => \state[1]_i_2_n_0\,
      wdt_Reset_Status_Reg => wdt_Reset_Status_Reg
    );
\bus2ip_addr_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(0),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(0),
      O => \bus2ip_addr_i[2]_i_1_n_0\
    );
\bus2ip_addr_i[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03020202"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => state(0),
      I2 => state(1),
      I3 => s_axi_wvalid,
      I4 => s_axi_awvalid,
      O => \bus2ip_addr_i[3]_i_1_n_0\
    );
\bus2ip_addr_i[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => s_axi_araddr(1),
      I1 => s_axi_arvalid,
      I2 => s_axi_awaddr(1),
      O => \bus2ip_addr_i[3]_i_2_n_0\
    );
\bus2ip_addr_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[3]_i_1_n_0\,
      D => \bus2ip_addr_i[2]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg_n_0_[2]\,
      R => rst
    );
\bus2ip_addr_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \bus2ip_addr_i[3]_i_1_n_0\,
      D => \bus2ip_addr_i[3]_i_2_n_0\,
      Q => \bus2ip_addr_i_reg_n_0_[3]\,
      R => rst
    );
bus2ip_rnw_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFF02020202"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => state(0),
      I2 => state(1),
      I3 => s_axi_wvalid,
      I4 => s_axi_awvalid,
      I5 => \^bus2ip_rnw_i_reg_0\,
      O => bus2ip_rnw_i_i_1_n_0
    );
bus2ip_rnw_i_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_rnw_i_i_1_n_0,
      Q => \^bus2ip_rnw_i_reg_0\,
      R => rst
    );
is_read_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAEAEAAAAAAAAA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => \^s_axi_rvalid_i_reg_0\,
      I2 => s_axi_rready,
      I3 => \^s_axi_bvalid_i_reg_0\,
      I4 => s_axi_bready,
      I5 => \FSM_onehot_state_reg_n_0_[3]\,
      O => is_read_i_1_n_0
    );
is_read_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => \FSM_onehot_state_reg_n_0_[0]\,
      O => is_read
    );
is_read_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => is_read_i_1_n_0,
      D => is_read,
      Q => is_read_reg_n_0,
      R => rst
    );
is_write_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => s_axi_wvalid,
      I2 => \FSM_onehot_state_reg_n_0_[0]\,
      I3 => s_axi_arvalid,
      O => is_write
    );
is_write_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => is_read_i_1_n_0,
      D => is_write,
      Q => is_write_reg_n_0,
      R => rst
    );
rst_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_reset,
      Q => rst,
      R => '0'
    );
\s_axi_bresp_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_49,
      Q => \^s_axi_bresp\(0),
      R => rst
    );
s_axi_bvalid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_48,
      Q => \^s_axi_bvalid_i_reg_0\,
      R => rst
    );
\s_axi_rdata_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(31),
      Q => s_axi_rdata(0),
      R => rst
    );
\s_axi_rdata_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(21),
      Q => s_axi_rdata(10),
      R => rst
    );
\s_axi_rdata_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(20),
      Q => s_axi_rdata(11),
      R => rst
    );
\s_axi_rdata_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(19),
      Q => s_axi_rdata(12),
      R => rst
    );
\s_axi_rdata_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(18),
      Q => s_axi_rdata(13),
      R => rst
    );
\s_axi_rdata_i_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(17),
      Q => s_axi_rdata(14),
      R => rst
    );
\s_axi_rdata_i_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(16),
      Q => s_axi_rdata(15),
      R => rst
    );
\s_axi_rdata_i_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(15),
      Q => s_axi_rdata(16),
      R => rst
    );
\s_axi_rdata_i_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(14),
      Q => s_axi_rdata(17),
      R => rst
    );
\s_axi_rdata_i_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(13),
      Q => s_axi_rdata(18),
      R => rst
    );
\s_axi_rdata_i_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(12),
      Q => s_axi_rdata(19),
      R => rst
    );
\s_axi_rdata_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(30),
      Q => s_axi_rdata(1),
      R => rst
    );
\s_axi_rdata_i_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(11),
      Q => s_axi_rdata(20),
      R => rst
    );
\s_axi_rdata_i_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(10),
      Q => s_axi_rdata(21),
      R => rst
    );
\s_axi_rdata_i_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(9),
      Q => s_axi_rdata(22),
      R => rst
    );
\s_axi_rdata_i_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(8),
      Q => s_axi_rdata(23),
      R => rst
    );
\s_axi_rdata_i_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(7),
      Q => s_axi_rdata(24),
      R => rst
    );
\s_axi_rdata_i_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(6),
      Q => s_axi_rdata(25),
      R => rst
    );
\s_axi_rdata_i_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(5),
      Q => s_axi_rdata(26),
      R => rst
    );
\s_axi_rdata_i_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(4),
      Q => s_axi_rdata(27),
      R => rst
    );
\s_axi_rdata_i_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(3),
      Q => s_axi_rdata(28),
      R => rst
    );
\s_axi_rdata_i_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(2),
      Q => s_axi_rdata(29),
      R => rst
    );
\s_axi_rdata_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(29),
      Q => s_axi_rdata(2),
      R => rst
    );
\s_axi_rdata_i_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(1),
      Q => s_axi_rdata(30),
      R => rst
    );
\s_axi_rdata_i_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(0),
      Q => s_axi_rdata(31),
      R => rst
    );
\s_axi_rdata_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(28),
      Q => s_axi_rdata(3),
      R => rst
    );
\s_axi_rdata_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(27),
      Q => s_axi_rdata(4),
      R => rst
    );
\s_axi_rdata_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(26),
      Q => s_axi_rdata(5),
      R => rst
    );
\s_axi_rdata_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(25),
      Q => s_axi_rdata(6),
      R => rst
    );
\s_axi_rdata_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(24),
      Q => s_axi_rdata(7),
      R => rst
    );
\s_axi_rdata_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(23),
      Q => s_axi_rdata(8),
      R => rst
    );
\s_axi_rdata_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => \TIMEBASE_WDT_CORE_I/sl_DBus_In\(22),
      Q => s_axi_rdata(9),
      R => rst
    );
\s_axi_rresp_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rresp_i,
      D => ip2bus_error,
      Q => s_axi_rresp(0),
      R => rst
    );
s_axi_rvalid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_47,
      Q => \^s_axi_rvalid_i_reg_0\,
      R => rst
    );
start2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000F0008"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => s_axi_awvalid,
      I2 => state(0),
      I3 => state(1),
      I4 => s_axi_arvalid,
      O => start2_i_1_n_0
    );
start2_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => start2_i_1_n_0,
      Q => start2,
      R => rst
    );
\state[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_wvalid,
      I1 => s_axi_awvalid,
      O => \state[1]_i_2_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_out(0),
      Q => state(0),
      R => rst
    );
\state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_out(1),
      Q => state(1),
      R => rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_timebase_wdt_0_0_axi_lite_ipif is
  port (
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ : out STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    bus2ip_cs : out STD_LOGIC;
    bus2ip_rnw_i_reg : out STD_LOGIC;
    Bus_RNW_reg : out STD_LOGIC;
    s_axi_rvalid_i_reg : out STD_LOGIC;
    s_axi_bvalid_i_reg : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    is_write_reg : out STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ : out STD_LOGIC;
    bus2ip_wrce : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_wdata_0_sp_1 : out STD_LOGIC;
    s_axi_wdata_1_sp_1 : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    bus2ip_reset : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    ip2bus_error : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    iTimebase_count_reg : in STD_LOGIC_VECTOR ( 30 downto 0 );
    read_Mux_In : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \s_axi_rdata_i_reg[2]\ : in STD_LOGIC;
    wdt_Reset_Status_Reg : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of cont_microblaze_axi_timebase_wdt_0_0_axi_lite_ipif : entity is "axi_lite_ipif";
end cont_microblaze_axi_timebase_wdt_0_0_axi_lite_ipif;

architecture STRUCTURE of cont_microblaze_axi_timebase_wdt_0_0_axi_lite_ipif is
  signal s_axi_wdata_0_sn_1 : STD_LOGIC;
  signal s_axi_wdata_1_sn_1 : STD_LOGIC;
begin
  s_axi_wdata_0_sp_1 <= s_axi_wdata_0_sn_1;
  s_axi_wdata_1_sp_1 <= s_axi_wdata_1_sn_1;
I_SLAVE_ATTACHMENT: entity work.cont_microblaze_axi_timebase_wdt_0_0_slave_attachment
     port map (
      Bus_RNW_reg_reg => Bus_RNW_reg,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\,
      Q(4 downto 0) => Q(4 downto 0),
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset => bus2ip_reset,
      bus2ip_rnw_i_reg_0 => bus2ip_rnw_i_reg,
      bus2ip_wrce(1 downto 0) => bus2ip_wrce(1 downto 0),
      iTimebase_count_reg(30 downto 0) => iTimebase_count_reg(30 downto 0),
      ip2bus_error => ip2bus_error,
      is_write_reg_0 => is_write_reg,
      p_0_in => p_0_in,
      read_Mux_In(1 downto 0) => read_Mux_In(1 downto 0),
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(1 downto 0) => s_axi_araddr(1 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(1 downto 0) => s_axi_awaddr(1 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => s_axi_bresp(0),
      s_axi_bvalid_i_reg_0 => s_axi_bvalid_i_reg,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      \s_axi_rdata_i_reg[2]_0\ => \s_axi_rdata_i_reg[2]\,
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => s_axi_rresp(0),
      s_axi_rvalid_i_reg_0 => s_axi_rvalid_i_reg,
      s_axi_wdata(1 downto 0) => s_axi_wdata(1 downto 0),
      s_axi_wdata_0_sp_1 => s_axi_wdata_0_sn_1,
      s_axi_wdata_1_sp_1 => s_axi_wdata_1_sn_1,
      s_axi_wvalid => s_axi_wvalid,
      wdt_Reset_Status_Reg => wdt_Reset_Status_Reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt is
  port (
    is_write_reg : out STD_LOGIC;
    wdt_reset : out STD_LOGIC;
    timebase_interrupt : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    wdt_State_Reg_reg : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rvalid_i_reg : out STD_LOGIC;
    s_axi_bvalid_i_reg : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aresetn : in STD_LOGIC;
    freeze : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt : entity is "axi_timebase_wdt";
end cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt;

architecture STRUCTURE of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt is
  signal AXI4_LITE_I_n_13 : STD_LOGIC;
  signal AXI4_LITE_I_n_14 : STD_LOGIC;
  signal AXI4_LITE_I_n_3 : STD_LOGIC;
  signal AXI4_LITE_I_n_9 : STD_LOGIC;
  signal \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\ : STD_LOGIC;
  signal \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ : STD_LOGIC;
  signal bus2ip_cs : STD_LOGIC;
  signal bus2ip_reset : STD_LOGIC;
  signal bus2ip_wrce : STD_LOGIC_VECTOR ( 0 to 3 );
  signal iTimebase_count_reg : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \ip2bus_error__0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal read_Mux_In : STD_LOGIC_VECTOR ( 2 to 3 );
  signal timer_width : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal wdt_Reset_Status_Reg : STD_LOGIC;
  signal \^wdt_state_reg_reg\ : STD_LOGIC;
begin
  wdt_State_Reg_reg <= \^wdt_state_reg_reg\;
AXI4_LITE_I: entity work.cont_microblaze_axi_timebase_wdt_0_0_axi_lite_ipif
     port map (
      Bus_RNW_reg => \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ => \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ => AXI4_LITE_I_n_9,
      Q(4 downto 0) => timer_width(4 downto 0),
      bus2ip_cs => bus2ip_cs,
      bus2ip_reset => bus2ip_reset,
      bus2ip_rnw_i_reg => AXI4_LITE_I_n_3,
      bus2ip_wrce(1) => bus2ip_wrce(0),
      bus2ip_wrce(0) => bus2ip_wrce(3),
      iTimebase_count_reg(30 downto 0) => iTimebase_count_reg(30 downto 0),
      ip2bus_error => \ip2bus_error__0\,
      is_write_reg => is_write_reg,
      p_0_in => p_0_in,
      read_Mux_In(1) => read_Mux_In(2),
      read_Mux_In(0) => read_Mux_In(3),
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(1 downto 0) => s_axi_araddr(1 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(1 downto 0) => s_axi_awaddr(1 downto 0),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => s_axi_bresp(0),
      s_axi_bvalid_i_reg => s_axi_bvalid_i_reg,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      \s_axi_rdata_i_reg[2]\ => \^wdt_state_reg_reg\,
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => s_axi_rresp(0),
      s_axi_rvalid_i_reg => s_axi_rvalid_i_reg,
      s_axi_wdata(1 downto 0) => s_axi_wdata(1 downto 0),
      s_axi_wdata_0_sp_1 => AXI4_LITE_I_n_13,
      s_axi_wdata_1_sp_1 => AXI4_LITE_I_n_14,
      s_axi_wvalid => s_axi_wvalid,
      wdt_Reset_Status_Reg => wdt_Reset_Status_Reg
    );
TIMEBASE_WDT_CORE_I: entity work.cont_microblaze_axi_timebase_wdt_0_0_timebase_wdt_core
     port map (
      Bus_RNW_reg => \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ => \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      Q(4 downto 0) => timer_width(4 downto 0),
      bus2ip_reset => bus2ip_reset,
      bus2ip_wrce(1) => bus2ip_wrce(0),
      bus2ip_wrce(0) => bus2ip_wrce(3),
      eWDT1_Reg_reg_0 => AXI4_LITE_I_n_14,
      eWDT2_Reg_reg_0 => AXI4_LITE_I_n_13,
      freeze => freeze,
      iTimebase_count_reg(30 downto 0) => iTimebase_count_reg(30 downto 0),
      \iTimebase_count_reg[0]_0\ => AXI4_LITE_I_n_9,
      p_0_in => p_0_in,
      read_Mux_In(1) => read_Mux_In(2),
      read_Mux_In(0) => read_Mux_In(3),
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_wdata(4 downto 0) => s_axi_wdata(4 downto 0),
      timebase_interrupt => timebase_interrupt,
      wdt_Reset_Status_Reg => wdt_Reset_Status_Reg,
      wdt_State_Reg_reg_0 => \^wdt_state_reg_reg\,
      wdt_reset => wdt_reset
    );
ip2bus_error: unisim.vcomponents.LUT6
    generic map(
      INIT => X"002A00AA00AA00AA"
    )
        port map (
      I0 => bus2ip_cs,
      I1 => s_axi_wstrb(1),
      I2 => s_axi_wstrb(2),
      I3 => AXI4_LITE_I_n_3,
      I4 => s_axi_wstrb(3),
      I5 => s_axi_wstrb(0),
      O => \ip2bus_error__0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top is
  port (
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awready : out STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rready : in STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wready : out STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    freeze : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    timebase_interrupt : out STD_LOGIC;
    wdt_interrupt : out STD_LOGIC;
    wdt_reset : out STD_LOGIC;
    wdt_reset_pending : out STD_LOGIC;
    wdt_state_vec : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute C_ENABLE_WINDOW_WDT : integer;
  attribute C_ENABLE_WINDOW_WDT of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top : entity is "kintexu";
  attribute C_MAX_COUNT_WIDTH : integer;
  attribute C_MAX_COUNT_WIDTH of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top : entity is 32;
  attribute C_SST_COUNT_WIDTH : integer;
  attribute C_SST_COUNT_WIDTH of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top : entity is 8;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top : entity is 4;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top : entity is 32;
  attribute C_WDT_ENABLE_ONCE : integer;
  attribute C_WDT_ENABLE_ONCE of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top : entity is 1;
  attribute C_WDT_INTERVAL : integer;
  attribute C_WDT_INTERVAL of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top : entity is 29;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top : entity is "axi_timebase_wdt_top";
end cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top;

architecture STRUCTURE of cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top is
  signal \<const0>\ : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_wready\ : STD_LOGIC;
begin
  s_axi_awready <= \^s_axi_wready\;
  s_axi_bresp(1) <= \^s_axi_bresp\(1);
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rresp(1) <= \^s_axi_rresp\(1);
  s_axi_rresp(0) <= \<const0>\;
  s_axi_wready <= \^s_axi_wready\;
  wdt_reset_pending <= \<const0>\;
  wdt_state_vec(6) <= \<const0>\;
  wdt_state_vec(5) <= \<const0>\;
  wdt_state_vec(4) <= \<const0>\;
  wdt_state_vec(3) <= \<const0>\;
  wdt_state_vec(2) <= \<const0>\;
  wdt_state_vec(1) <= \<const0>\;
  wdt_state_vec(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\LEGACY_WDT.axi_timebase_wdt_i\: entity work.cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt
     port map (
      freeze => freeze,
      is_write_reg => \^s_axi_wready\,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(1 downto 0) => s_axi_araddr(3 downto 2),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(1 downto 0) => s_axi_awaddr(3 downto 2),
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => \^s_axi_bresp\(1),
      s_axi_bvalid_i_reg => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => \^s_axi_rresp\(1),
      s_axi_rvalid_i_reg => s_axi_rvalid,
      s_axi_wdata(4 downto 0) => s_axi_wdata(4 downto 0),
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      timebase_interrupt => timebase_interrupt,
      wdt_State_Reg_reg => wdt_interrupt,
      wdt_reset => wdt_reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_timebase_wdt_0_0 is
  port (
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awready : out STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rready : in STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wready : out STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    freeze : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    timebase_interrupt : out STD_LOGIC;
    wdt_interrupt : out STD_LOGIC;
    wdt_reset : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of cont_microblaze_axi_timebase_wdt_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of cont_microblaze_axi_timebase_wdt_0_0 : entity is "cont_microblaze_axi_timebase_wdt_0_0,axi_timebase_wdt_top,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of cont_microblaze_axi_timebase_wdt_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of cont_microblaze_axi_timebase_wdt_0_0 : entity is "axi_timebase_wdt_top,Vivado 2019.1";
end cont_microblaze_axi_timebase_wdt_0_0;

architecture STRUCTURE of cont_microblaze_axi_timebase_wdt_0_0 is
  signal NLW_U0_wdt_reset_pending_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wdt_state_vec_UNCONNECTED : STD_LOGIC_VECTOR ( 6 downto 0 );
  attribute C_ENABLE_WINDOW_WDT : integer;
  attribute C_ENABLE_WINDOW_WDT of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "kintexu";
  attribute C_MAX_COUNT_WIDTH : integer;
  attribute C_MAX_COUNT_WIDTH of U0 : label is 32;
  attribute C_SST_COUNT_WIDTH : integer;
  attribute C_SST_COUNT_WIDTH of U0 : label is 8;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of U0 : label is 4;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of U0 : label is 32;
  attribute C_WDT_ENABLE_ONCE : integer;
  attribute C_WDT_ENABLE_ONCE of U0 : label is 1;
  attribute C_WDT_INTERVAL : integer;
  attribute C_WDT_INTERVAL of U0 : label is 29;
  attribute x_interface_info : string;
  attribute x_interface_info of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of s_axi_aclk : signal is "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET s_axi_aresetn:wdt_reset, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN cont_microblaze_Clk, INSERT_VIP 0";
  attribute x_interface_info of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST";
  attribute x_interface_parameter of s_axi_aresetn : signal is "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute x_interface_info of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute x_interface_info of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute x_interface_info of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute x_interface_info of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute x_interface_info of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute x_interface_info of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute x_interface_info of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute x_interface_info of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute x_interface_info of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute x_interface_info of timebase_interrupt : signal is "xilinx.com:signal:interrupt:1.0 TIMEBASE_INTERRUPT INTERRUPT";
  attribute x_interface_parameter of timebase_interrupt : signal is "XIL_INTERFACENAME TIMEBASE_INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute x_interface_info of wdt_interrupt : signal is "xilinx.com:signal:interrupt:1.0 WDT_INTERRUPT INTERRUPT";
  attribute x_interface_parameter of wdt_interrupt : signal is "XIL_INTERFACENAME WDT_INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute x_interface_info of wdt_reset : signal is "xilinx.com:signal:reset:1.0 WDT_RESET RST";
  attribute x_interface_parameter of wdt_reset : signal is "XIL_INTERFACENAME WDT_RESET, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute x_interface_info of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute x_interface_parameter of s_axi_araddr : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN cont_microblaze_Clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute x_interface_info of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute x_interface_info of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute x_interface_info of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute x_interface_info of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute x_interface_info of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
begin
U0: entity work.cont_microblaze_axi_timebase_wdt_0_0_axi_timebase_wdt_top
     port map (
      freeze => freeze,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(3 downto 0) => s_axi_araddr(3 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(3 downto 0) => s_axi_awaddr(3 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(1 downto 0) => s_axi_rresp(1 downto 0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      timebase_interrupt => timebase_interrupt,
      wdt_interrupt => wdt_interrupt,
      wdt_reset => wdt_reset,
      wdt_reset_pending => NLW_U0_wdt_reset_pending_UNCONNECTED,
      wdt_state_vec(6 downto 0) => NLW_U0_wdt_state_vec_UNCONNECTED(6 downto 0)
    );
end STRUCTURE;
