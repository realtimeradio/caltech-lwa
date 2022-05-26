-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Sun Feb  7 22:16:18 2021
-- Host        : jarvis running 64-bit Ubuntu 18.04.3 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.srcs/sources_1/bd/cont_microblaze/ip/cont_microblaze_axi_slave_wishbone_classic_master_0_0/cont_microblaze_axi_slave_wishbone_classic_master_0_0_sim_netlist.vhdl
-- Design      : cont_microblaze_axi_slave_wishbone_classic_master_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku115-flvf1924-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_slave_wishbone_classic_master_0_0_axi_slave_wishbone_classic_master is
  port (
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_BVALID : out STD_LOGIC;
    RST_O : out STD_LOGIC;
    DAT_O : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ADR_O : out STD_LOGIC_VECTOR ( 19 downto 0 );
    SEL_O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    WE_O : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RLAST : out STD_LOGIC;
    CYC_O : out STD_LOGIC;
    STB_O : out STD_LOGIC;
    S_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_RREADY : in STD_LOGIC;
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    DAT_I : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARVALID : in STD_LOGIC;
    ACK_I : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 19 downto 0 );
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 19 downto 0 );
    S_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of cont_microblaze_axi_slave_wishbone_classic_master_0_0_axi_slave_wishbone_classic_master : entity is "axi_slave_wishbone_classic_master";
end cont_microblaze_axi_slave_wishbone_classic_master_0_0_axi_slave_wishbone_classic_master;

architecture STRUCTURE of cont_microblaze_axi_slave_wishbone_classic_master_0_0_axi_slave_wishbone_classic_master is
  signal \^adr_o\ : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \^cyc_o\ : STD_LOGIC;
  signal CYC_O_i_1_n_0 : STD_LOGIC;
  signal CYC_O_i_2_n_0 : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state[6]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state[7]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state[8]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state_reg_n_0_[1]\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state_reg_n_0_[2]\ : STD_LOGIC;
  signal \FSM_onehot_current_axi_bridge_state_reg_n_0_[6]\ : STD_LOGIC;
  signal SEL_O1 : STD_LOGIC;
  signal \SEL_O[3]_i_1_n_0\ : STD_LOGIC;
  signal \^stb_o\ : STD_LOGIC;
  signal STB_O_i_1_n_0 : STD_LOGIC;
  signal STB_O_i_2_n_0 : STD_LOGIC;
  signal STB_O_i_3_n_0 : STD_LOGIC;
  signal STB_O_i_4_n_0 : STD_LOGIC;
  signal STB_O_i_5_n_0 : STD_LOGIC;
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \S_AXI_BID[0]_i_1_n_0\ : STD_LOGIC;
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal S_AXI_RDATA0 : STD_LOGIC;
  signal \^s_axi_rid\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \S_AXI_RID[0]_i_1_n_0\ : STD_LOGIC;
  signal S_AXI_RLAST_INST_0_i_1_n_0 : STD_LOGIC;
  signal S_AXI_RLAST_INST_0_i_2_n_0 : STD_LOGIC;
  signal S_AXI_RLAST_INST_0_i_3_n_0 : STD_LOGIC;
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal \burst_count[5]_i_2_n_0\ : STD_LOGIC;
  signal \burst_count[7]_i_1_n_0\ : STD_LOGIC;
  signal \burst_count[7]_i_2_n_0\ : STD_LOGIC;
  signal burst_count_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal burst_length : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \burst_length[0]_i_1_n_0\ : STD_LOGIC;
  signal \burst_length[1]_i_1_n_0\ : STD_LOGIC;
  signal \burst_length[2]_i_1_n_0\ : STD_LOGIC;
  signal \burst_length[3]_i_1_n_0\ : STD_LOGIC;
  signal \burst_length[4]_i_1_n_0\ : STD_LOGIC;
  signal \burst_length[5]_i_1_n_0\ : STD_LOGIC;
  signal \burst_length[6]_i_1_n_0\ : STD_LOGIC;
  signal \burst_length[7]_i_2_n_0\ : STD_LOGIC;
  signal burst_length_0 : STD_LOGIC;
  signal \current_address[0]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[10]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[11]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[12]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[13]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[14]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[15]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[16]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[17]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[18]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[19]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[19]_i_2_n_0\ : STD_LOGIC;
  signal \current_address[1]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[2]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[3]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[4]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[5]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[6]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[7]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[8]_i_1_n_0\ : STD_LOGIC;
  signal \current_address[9]_i_1_n_0\ : STD_LOGIC;
  signal in14 : STD_LOGIC_VECTOR ( 19 downto 1 );
  signal p_0_in : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal p_1_in : STD_LOGIC;
  signal \plusOp_carry__0_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_n_1\ : STD_LOGIC;
  signal \plusOp_carry__0_n_2\ : STD_LOGIC;
  signal \plusOp_carry__0_n_3\ : STD_LOGIC;
  signal \plusOp_carry__0_n_4\ : STD_LOGIC;
  signal \plusOp_carry__0_n_5\ : STD_LOGIC;
  signal \plusOp_carry__0_n_6\ : STD_LOGIC;
  signal \plusOp_carry__0_n_7\ : STD_LOGIC;
  signal \plusOp_carry__1_n_6\ : STD_LOGIC;
  signal \plusOp_carry__1_n_7\ : STD_LOGIC;
  signal plusOp_carry_i_1_n_0 : STD_LOGIC;
  signal plusOp_carry_n_0 : STD_LOGIC;
  signal plusOp_carry_n_1 : STD_LOGIC;
  signal plusOp_carry_n_2 : STD_LOGIC;
  signal plusOp_carry_n_3 : STD_LOGIC;
  signal plusOp_carry_n_4 : STD_LOGIC;
  signal plusOp_carry_n_5 : STD_LOGIC;
  signal plusOp_carry_n_6 : STD_LOGIC;
  signal plusOp_carry_n_7 : STD_LOGIC;
  signal \NLW_plusOp_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_plusOp_carry__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of CYC_O_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_onehot_current_axi_bridge_state[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FSM_onehot_current_axi_bridge_state[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \FSM_onehot_current_axi_bridge_state[7]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_onehot_current_axi_bridge_state[8]_i_1\ : label is "soft_lutpair5";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_axi_bridge_state_reg[0]\ : label is "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_axi_bridge_state_reg[1]\ : label is "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_axi_bridge_state_reg[2]\ : label is "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_axi_bridge_state_reg[3]\ : label is "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_axi_bridge_state_reg[4]\ : label is "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_axi_bridge_state_reg[5]\ : label is "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_axi_bridge_state_reg[6]\ : label is "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_axi_bridge_state_reg[7]\ : label is "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_axi_bridge_state_reg[8]\ : label is "t_write_wb_ack:010000000,t_write_axi_ready:000100000,t_write_axi_valid:001000000,t_latch_write_address:100000000,t_idle:000000010,t_read_wb_ack:000000100,t_latch_read_address:000001000,t_read_axi_ready:000000001,t_write_resp:000010000";
  attribute SOFT_HLUTNM of STB_O_i_3 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of STB_O_i_4 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of STB_O_i_5 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of S_AXI_RLAST_INST_0 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \burst_count[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \burst_count[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \burst_count[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \burst_count[5]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \burst_count[6]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \burst_count[7]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \burst_length[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \burst_length[1]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \burst_length[2]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \burst_length[3]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \burst_length[4]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \burst_length[5]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \burst_length[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \burst_length[7]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \current_address[17]_i_1\ : label is "soft_lutpair2";
begin
  ADR_O(19 downto 0) <= \^adr_o\(19 downto 0);
  CYC_O <= \^cyc_o\;
  STB_O <= \^stb_o\;
  S_AXI_ARREADY <= \^s_axi_arready\;
  S_AXI_AWREADY <= \^s_axi_awready\;
  S_AXI_BID(0) <= \^s_axi_bid\(0);
  S_AXI_BVALID <= \^s_axi_bvalid\;
  S_AXI_RID(0) <= \^s_axi_rid\(0);
  S_AXI_RVALID <= \^s_axi_rvalid\;
  S_AXI_WREADY <= \^s_axi_wready\;
CYC_O_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F7FFFFF0F0F0F0F"
    )
        port map (
      I0 => S_AXI_RREADY,
      I1 => \^s_axi_rvalid\,
      I2 => CYC_O_i_2_n_0,
      I3 => \^s_axi_wready\,
      I4 => S_AXI_RLAST_INST_0_i_1_n_0,
      I5 => \^cyc_o\,
      O => CYC_O_i_1_n_0
    );
CYC_O_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => \^s_axi_arready\,
      O => CYC_O_i_2_n_0
    );
CYC_O_reg: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      CLR => p_0_in,
      D => CYC_O_i_1_n_0,
      Q => \^cyc_o\
    );
\DAT_O_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(0),
      Q => DAT_O(0),
      R => '0'
    );
\DAT_O_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(10),
      Q => DAT_O(10),
      R => '0'
    );
\DAT_O_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(11),
      Q => DAT_O(11),
      R => '0'
    );
\DAT_O_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(12),
      Q => DAT_O(12),
      R => '0'
    );
\DAT_O_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(13),
      Q => DAT_O(13),
      R => '0'
    );
\DAT_O_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(14),
      Q => DAT_O(14),
      R => '0'
    );
\DAT_O_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(15),
      Q => DAT_O(15),
      R => '0'
    );
\DAT_O_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(16),
      Q => DAT_O(16),
      R => '0'
    );
\DAT_O_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(17),
      Q => DAT_O(17),
      R => '0'
    );
\DAT_O_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(18),
      Q => DAT_O(18),
      R => '0'
    );
\DAT_O_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(19),
      Q => DAT_O(19),
      R => '0'
    );
\DAT_O_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(1),
      Q => DAT_O(1),
      R => '0'
    );
\DAT_O_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(20),
      Q => DAT_O(20),
      R => '0'
    );
\DAT_O_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(21),
      Q => DAT_O(21),
      R => '0'
    );
\DAT_O_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(22),
      Q => DAT_O(22),
      R => '0'
    );
\DAT_O_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(23),
      Q => DAT_O(23),
      R => '0'
    );
\DAT_O_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(24),
      Q => DAT_O(24),
      R => '0'
    );
\DAT_O_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(25),
      Q => DAT_O(25),
      R => '0'
    );
\DAT_O_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(26),
      Q => DAT_O(26),
      R => '0'
    );
\DAT_O_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(27),
      Q => DAT_O(27),
      R => '0'
    );
\DAT_O_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(28),
      Q => DAT_O(28),
      R => '0'
    );
\DAT_O_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(29),
      Q => DAT_O(29),
      R => '0'
    );
\DAT_O_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(2),
      Q => DAT_O(2),
      R => '0'
    );
\DAT_O_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(30),
      Q => DAT_O(30),
      R => '0'
    );
\DAT_O_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(31),
      Q => DAT_O(31),
      R => '0'
    );
\DAT_O_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(3),
      Q => DAT_O(3),
      R => '0'
    );
\DAT_O_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(4),
      Q => DAT_O(4),
      R => '0'
    );
\DAT_O_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(5),
      Q => DAT_O(5),
      R => '0'
    );
\DAT_O_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(6),
      Q => DAT_O(6),
      R => '0'
    );
\DAT_O_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(7),
      Q => DAT_O(7),
      R => '0'
    );
\DAT_O_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(8),
      Q => DAT_O(8),
      R => '0'
    );
\DAT_O_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WDATA(9),
      Q => DAT_O(9),
      R => '0'
    );
\FSM_onehot_current_axi_bridge_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[2]\,
      I1 => ACK_I,
      I2 => S_AXI_RREADY,
      I3 => \^s_axi_rvalid\,
      O => \FSM_onehot_current_axi_bridge_state[0]_i_1_n_0\
    );
\FSM_onehot_current_axi_bridge_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F888F888F888FFFF"
    )
        port map (
      I0 => S_AXI_RLAST_INST_0_i_1_n_0,
      I1 => STB_O_i_3_n_0,
      I2 => S_AXI_BREADY,
      I3 => \^s_axi_bvalid\,
      I4 => S_AXI_ARVALID,
      I5 => \FSM_onehot_current_axi_bridge_state[1]_i_2_n_0\,
      O => \FSM_onehot_current_axi_bridge_state[1]_i_1_n_0\
    );
\FSM_onehot_current_axi_bridge_state[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => S_AXI_AWVALID,
      I1 => S_AXI_WVALID,
      I2 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[1]\,
      O => \FSM_onehot_current_axi_bridge_state[1]_i_2_n_0\
    );
\FSM_onehot_current_axi_bridge_state[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF08FFFFFF08FF08"
    )
        port map (
      I0 => \^s_axi_rvalid\,
      I1 => S_AXI_RREADY,
      I2 => S_AXI_RLAST_INST_0_i_1_n_0,
      I3 => \^s_axi_arready\,
      I4 => ACK_I,
      I5 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[2]\,
      O => \FSM_onehot_current_axi_bridge_state[2]_i_1_n_0\
    );
\FSM_onehot_current_axi_bridge_state[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0888"
    )
        port map (
      I0 => S_AXI_ARVALID,
      I1 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[1]\,
      I2 => S_AXI_WVALID,
      I3 => S_AXI_AWVALID,
      O => \FSM_onehot_current_axi_bridge_state[3]_i_1_n_0\
    );
\FSM_onehot_current_axi_bridge_state[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => S_AXI_RLAST_INST_0_i_1_n_0,
      I1 => \^s_axi_wready\,
      I2 => S_AXI_BREADY,
      I3 => \^s_axi_bvalid\,
      O => \FSM_onehot_current_axi_bridge_state[4]_i_1_n_0\
    );
\FSM_onehot_current_axi_bridge_state[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ACK_I,
      I1 => p_1_in,
      O => \FSM_onehot_current_axi_bridge_state[5]_i_1_n_0\
    );
\FSM_onehot_current_axi_bridge_state[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF44F4"
    )
        port map (
      I0 => S_AXI_RLAST_INST_0_i_1_n_0,
      I1 => \^s_axi_wready\,
      I2 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[6]\,
      I3 => S_AXI_WVALID,
      I4 => \^s_axi_awready\,
      O => \FSM_onehot_current_axi_bridge_state[6]_i_1_n_0\
    );
\FSM_onehot_current_axi_bridge_state[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F88"
    )
        port map (
      I0 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[6]\,
      I1 => S_AXI_WVALID,
      I2 => ACK_I,
      I3 => p_1_in,
      O => \FSM_onehot_current_axi_bridge_state[7]_i_1_n_0\
    );
\FSM_onehot_current_axi_bridge_state[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => S_AXI_AWVALID,
      I1 => S_AXI_WVALID,
      I2 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[1]\,
      O => \FSM_onehot_current_axi_bridge_state[8]_i_1_n_0\
    );
\FSM_onehot_current_axi_bridge_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      CLR => p_0_in,
      D => \FSM_onehot_current_axi_bridge_state[0]_i_1_n_0\,
      Q => \^s_axi_rvalid\
    );
\FSM_onehot_current_axi_bridge_state_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \FSM_onehot_current_axi_bridge_state[1]_i_1_n_0\,
      PRE => p_0_in,
      Q => \FSM_onehot_current_axi_bridge_state_reg_n_0_[1]\
    );
\FSM_onehot_current_axi_bridge_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      CLR => p_0_in,
      D => \FSM_onehot_current_axi_bridge_state[2]_i_1_n_0\,
      Q => \FSM_onehot_current_axi_bridge_state_reg_n_0_[2]\
    );
\FSM_onehot_current_axi_bridge_state_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      CLR => p_0_in,
      D => \FSM_onehot_current_axi_bridge_state[3]_i_1_n_0\,
      Q => \^s_axi_arready\
    );
\FSM_onehot_current_axi_bridge_state_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      CLR => p_0_in,
      D => \FSM_onehot_current_axi_bridge_state[4]_i_1_n_0\,
      Q => \^s_axi_bvalid\
    );
\FSM_onehot_current_axi_bridge_state_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      CLR => p_0_in,
      D => \FSM_onehot_current_axi_bridge_state[5]_i_1_n_0\,
      Q => \^s_axi_wready\
    );
\FSM_onehot_current_axi_bridge_state_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      CLR => p_0_in,
      D => \FSM_onehot_current_axi_bridge_state[6]_i_1_n_0\,
      Q => \FSM_onehot_current_axi_bridge_state_reg_n_0_[6]\
    );
\FSM_onehot_current_axi_bridge_state_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      CLR => p_0_in,
      D => \FSM_onehot_current_axi_bridge_state[7]_i_1_n_0\,
      Q => p_1_in
    );
\FSM_onehot_current_axi_bridge_state_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => S_AXI_ACLK,
      CE => '1',
      CLR => p_0_in,
      D => \FSM_onehot_current_axi_bridge_state[8]_i_1_n_0\,
      Q => \^s_axi_awready\
    );
RST_O_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => S_AXI_ARESETN,
      O => p_0_in
    );
RST_O_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => p_0_in,
      Q => RST_O,
      R => '0'
    );
\SEL_O[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[6]\,
      I1 => p_1_in,
      I2 => \^s_axi_wready\,
      O => \SEL_O[3]_i_1_n_0\
    );
\SEL_O_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WSTRB(0),
      Q => SEL_O(0),
      S => \SEL_O[3]_i_1_n_0\
    );
\SEL_O_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WSTRB(1),
      Q => SEL_O(1),
      S => \SEL_O[3]_i_1_n_0\
    );
\SEL_O_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WSTRB(2),
      Q => SEL_O(2),
      S => \SEL_O[3]_i_1_n_0\
    );
\SEL_O_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => S_AXI_WSTRB(3),
      Q => SEL_O(3),
      S => \SEL_O[3]_i_1_n_0\
    );
STB_O_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAFBAAAAAA08"
    )
        port map (
      I0 => STB_O_i_2_n_0,
      I1 => STB_O_i_3_n_0,
      I2 => S_AXI_RLAST_INST_0_i_1_n_0,
      I3 => \^s_axi_arready\,
      I4 => STB_O_i_4_n_0,
      I5 => \^stb_o\,
      O => STB_O_i_1_n_0
    );
STB_O_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFEFFFE"
    )
        port map (
      I0 => STB_O_i_5_n_0,
      I1 => \^s_axi_arready\,
      I2 => \^s_axi_bvalid\,
      I3 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[1]\,
      I4 => S_AXI_WVALID,
      I5 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[6]\,
      O => STB_O_i_2_n_0
    );
STB_O_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => S_AXI_RREADY,
      I1 => \^s_axi_rvalid\,
      O => STB_O_i_3_n_0
    );
STB_O_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFC8C8C8"
    )
        port map (
      I0 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[2]\,
      I1 => ACK_I,
      I2 => p_1_in,
      I3 => S_AXI_WVALID,
      I4 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[6]\,
      O => STB_O_i_4_n_0
    );
STB_O_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => \^s_axi_wready\,
      I1 => \^s_axi_rvalid\,
      I2 => S_AXI_RREADY,
      O => STB_O_i_5_n_0
    );
STB_O_reg: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      CLR => p_0_in,
      D => STB_O_i_1_n_0,
      Q => \^stb_o\
    );
\S_AXI_BID[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => S_AXI_AWID(0),
      I1 => \^s_axi_awready\,
      I2 => \^s_axi_bid\(0),
      O => \S_AXI_BID[0]_i_1_n_0\
    );
\S_AXI_BID_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \S_AXI_BID[0]_i_1_n_0\,
      Q => \^s_axi_bid\(0),
      R => '0'
    );
\S_AXI_RDATA[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => ACK_I,
      I1 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[2]\,
      O => S_AXI_RDATA0
    );
\S_AXI_RDATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(0),
      Q => S_AXI_RDATA(0),
      R => '0'
    );
\S_AXI_RDATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(10),
      Q => S_AXI_RDATA(10),
      R => '0'
    );
\S_AXI_RDATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(11),
      Q => S_AXI_RDATA(11),
      R => '0'
    );
\S_AXI_RDATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(12),
      Q => S_AXI_RDATA(12),
      R => '0'
    );
\S_AXI_RDATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(13),
      Q => S_AXI_RDATA(13),
      R => '0'
    );
\S_AXI_RDATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(14),
      Q => S_AXI_RDATA(14),
      R => '0'
    );
\S_AXI_RDATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(15),
      Q => S_AXI_RDATA(15),
      R => '0'
    );
\S_AXI_RDATA_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(16),
      Q => S_AXI_RDATA(16),
      R => '0'
    );
\S_AXI_RDATA_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(17),
      Q => S_AXI_RDATA(17),
      R => '0'
    );
\S_AXI_RDATA_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(18),
      Q => S_AXI_RDATA(18),
      R => '0'
    );
\S_AXI_RDATA_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(19),
      Q => S_AXI_RDATA(19),
      R => '0'
    );
\S_AXI_RDATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(1),
      Q => S_AXI_RDATA(1),
      R => '0'
    );
\S_AXI_RDATA_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(20),
      Q => S_AXI_RDATA(20),
      R => '0'
    );
\S_AXI_RDATA_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(21),
      Q => S_AXI_RDATA(21),
      R => '0'
    );
\S_AXI_RDATA_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(22),
      Q => S_AXI_RDATA(22),
      R => '0'
    );
\S_AXI_RDATA_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(23),
      Q => S_AXI_RDATA(23),
      R => '0'
    );
\S_AXI_RDATA_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(24),
      Q => S_AXI_RDATA(24),
      R => '0'
    );
\S_AXI_RDATA_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(25),
      Q => S_AXI_RDATA(25),
      R => '0'
    );
\S_AXI_RDATA_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(26),
      Q => S_AXI_RDATA(26),
      R => '0'
    );
\S_AXI_RDATA_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(27),
      Q => S_AXI_RDATA(27),
      R => '0'
    );
\S_AXI_RDATA_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(28),
      Q => S_AXI_RDATA(28),
      R => '0'
    );
\S_AXI_RDATA_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(29),
      Q => S_AXI_RDATA(29),
      R => '0'
    );
\S_AXI_RDATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(2),
      Q => S_AXI_RDATA(2),
      R => '0'
    );
\S_AXI_RDATA_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(30),
      Q => S_AXI_RDATA(30),
      R => '0'
    );
\S_AXI_RDATA_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(31),
      Q => S_AXI_RDATA(31),
      R => '0'
    );
\S_AXI_RDATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(3),
      Q => S_AXI_RDATA(3),
      R => '0'
    );
\S_AXI_RDATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(4),
      Q => S_AXI_RDATA(4),
      R => '0'
    );
\S_AXI_RDATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(5),
      Q => S_AXI_RDATA(5),
      R => '0'
    );
\S_AXI_RDATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(6),
      Q => S_AXI_RDATA(6),
      R => '0'
    );
\S_AXI_RDATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(7),
      Q => S_AXI_RDATA(7),
      R => '0'
    );
\S_AXI_RDATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(8),
      Q => S_AXI_RDATA(8),
      R => '0'
    );
\S_AXI_RDATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => S_AXI_RDATA0,
      D => DAT_I(9),
      Q => S_AXI_RDATA(9),
      R => '0'
    );
\S_AXI_RID[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => S_AXI_ARID(0),
      I1 => \^s_axi_arready\,
      I2 => \^s_axi_rid\(0),
      O => \S_AXI_RID[0]_i_1_n_0\
    );
\S_AXI_RID_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => \S_AXI_RID[0]_i_1_n_0\,
      Q => \^s_axi_rid\(0),
      R => '0'
    );
S_AXI_RLAST_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => S_AXI_RLAST_INST_0_i_1_n_0,
      I1 => \^s_axi_rvalid\,
      I2 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[2]\,
      O => S_AXI_RLAST
    );
S_AXI_RLAST_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000009009"
    )
        port map (
      I0 => burst_count_reg(6),
      I1 => burst_length(6),
      I2 => burst_count_reg(7),
      I3 => burst_length(7),
      I4 => S_AXI_RLAST_INST_0_i_2_n_0,
      I5 => S_AXI_RLAST_INST_0_i_3_n_0,
      O => S_AXI_RLAST_INST_0_i_1_n_0
    );
S_AXI_RLAST_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => burst_length(0),
      I1 => burst_count_reg(0),
      I2 => burst_count_reg(2),
      I3 => burst_length(2),
      I4 => burst_count_reg(1),
      I5 => burst_length(1),
      O => S_AXI_RLAST_INST_0_i_2_n_0
    );
S_AXI_RLAST_INST_0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => burst_length(3),
      I1 => burst_count_reg(3),
      I2 => burst_count_reg(5),
      I3 => burst_length(5),
      I4 => burst_count_reg(4),
      I5 => burst_length(4),
      O => S_AXI_RLAST_INST_0_i_3_n_0
    );
WE_O_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^s_axi_wready\,
      I1 => p_1_in,
      I2 => \FSM_onehot_current_axi_bridge_state_reg_n_0_[6]\,
      O => SEL_O1
    );
WE_O_reg: unisim.vcomponents.FDRE
     port map (
      C => S_AXI_ACLK,
      CE => '1',
      D => SEL_O1,
      Q => WE_O,
      R => '0'
    );
\burst_count[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => \^s_axi_awready\,
      I2 => burst_count_reg(0),
      O => \p_0_in__0\(0)
    );
\burst_count[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0110"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => \^s_axi_awready\,
      I2 => burst_count_reg(1),
      I3 => burst_count_reg(0),
      O => \p_0_in__0\(1)
    );
\burst_count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01111000"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => \^s_axi_awready\,
      I2 => burst_count_reg(0),
      I3 => burst_count_reg(1),
      I4 => burst_count_reg(2),
      O => \p_0_in__0\(2)
    );
\burst_count[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0111111110000000"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => \^s_axi_awready\,
      I2 => burst_count_reg(1),
      I3 => burst_count_reg(0),
      I4 => burst_count_reg(2),
      I5 => burst_count_reg(3),
      O => \p_0_in__0\(3)
    );
\burst_count[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => CYC_O_i_2_n_0,
      I1 => burst_count_reg(2),
      I2 => burst_count_reg(0),
      I3 => burst_count_reg(1),
      I4 => burst_count_reg(3),
      I5 => burst_count_reg(4),
      O => \p_0_in__0\(4)
    );
\burst_count[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1001"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => \^s_axi_awready\,
      I2 => \burst_count[5]_i_2_n_0\,
      I3 => burst_count_reg(5),
      O => \p_0_in__0\(5)
    );
\burst_count[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => burst_count_reg(3),
      I1 => burst_count_reg(1),
      I2 => burst_count_reg(0),
      I3 => burst_count_reg(2),
      I4 => burst_count_reg(4),
      O => \burst_count[5]_i_2_n_0\
    );
\burst_count[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0110"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => \^s_axi_awready\,
      I2 => \burst_count[7]_i_2_n_0\,
      I3 => burst_count_reg(6),
      O => \p_0_in__0\(6)
    );
\burst_count[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000078"
    )
        port map (
      I0 => \burst_count[7]_i_2_n_0\,
      I1 => burst_count_reg(6),
      I2 => burst_count_reg(7),
      I3 => \^s_axi_arready\,
      I4 => \^s_axi_awready\,
      O => \burst_count[7]_i_1_n_0\
    );
\burst_count[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => burst_count_reg(5),
      I1 => burst_count_reg(4),
      I2 => burst_count_reg(2),
      I3 => burst_count_reg(0),
      I4 => burst_count_reg(1),
      I5 => burst_count_reg(3),
      O => \burst_count[7]_i_2_n_0\
    );
\burst_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \p_0_in__0\(0),
      Q => burst_count_reg(0)
    );
\burst_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \p_0_in__0\(1),
      Q => burst_count_reg(1)
    );
\burst_count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \p_0_in__0\(2),
      Q => burst_count_reg(2)
    );
\burst_count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \p_0_in__0\(3),
      Q => burst_count_reg(3)
    );
\burst_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \p_0_in__0\(4),
      Q => burst_count_reg(4)
    );
\burst_count_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \p_0_in__0\(5),
      Q => burst_count_reg(5)
    );
\burst_count_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \p_0_in__0\(6),
      Q => burst_count_reg(6)
    );
\burst_count_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \burst_count[7]_i_1_n_0\,
      Q => burst_count_reg(7)
    );
\burst_length[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => S_AXI_AWLEN(0),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARLEN(0),
      O => \burst_length[0]_i_1_n_0\
    );
\burst_length[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => S_AXI_AWLEN(1),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARLEN(1),
      O => \burst_length[1]_i_1_n_0\
    );
\burst_length[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => S_AXI_AWLEN(2),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARLEN(2),
      O => \burst_length[2]_i_1_n_0\
    );
\burst_length[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => S_AXI_AWLEN(3),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARLEN(3),
      O => \burst_length[3]_i_1_n_0\
    );
\burst_length[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => S_AXI_AWLEN(4),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARLEN(4),
      O => \burst_length[4]_i_1_n_0\
    );
\burst_length[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => S_AXI_AWLEN(5),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARLEN(5),
      O => \burst_length[5]_i_1_n_0\
    );
\burst_length[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => S_AXI_AWLEN(6),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARLEN(6),
      O => \burst_length[6]_i_1_n_0\
    );
\burst_length[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => \^s_axi_awready\,
      O => burst_length_0
    );
\burst_length[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => S_AXI_AWLEN(7),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARLEN(7),
      O => \burst_length[7]_i_2_n_0\
    );
\burst_length_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => burst_length_0,
      CLR => p_0_in,
      D => \burst_length[0]_i_1_n_0\,
      Q => burst_length(0)
    );
\burst_length_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => burst_length_0,
      CLR => p_0_in,
      D => \burst_length[1]_i_1_n_0\,
      Q => burst_length(1)
    );
\burst_length_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => burst_length_0,
      CLR => p_0_in,
      D => \burst_length[2]_i_1_n_0\,
      Q => burst_length(2)
    );
\burst_length_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => burst_length_0,
      CLR => p_0_in,
      D => \burst_length[3]_i_1_n_0\,
      Q => burst_length(3)
    );
\burst_length_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => burst_length_0,
      CLR => p_0_in,
      D => \burst_length[4]_i_1_n_0\,
      Q => burst_length(4)
    );
\burst_length_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => burst_length_0,
      CLR => p_0_in,
      D => \burst_length[5]_i_1_n_0\,
      Q => burst_length(5)
    );
\burst_length_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => burst_length_0,
      CLR => p_0_in,
      D => \burst_length[6]_i_1_n_0\,
      Q => burst_length(6)
    );
\burst_length_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => burst_length_0,
      CLR => p_0_in,
      D => \burst_length[7]_i_2_n_0\,
      Q => burst_length(7)
    );
\current_address[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(0),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(0),
      I3 => \^s_axi_arready\,
      I4 => \^adr_o\(0),
      O => \current_address[0]_i_1_n_0\
    );
\current_address[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(10),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(10),
      I3 => \^s_axi_arready\,
      I4 => in14(10),
      O => \current_address[10]_i_1_n_0\
    );
\current_address[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(11),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(11),
      I3 => \^s_axi_arready\,
      I4 => in14(11),
      O => \current_address[11]_i_1_n_0\
    );
\current_address[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(12),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(12),
      I3 => \^s_axi_arready\,
      I4 => in14(12),
      O => \current_address[12]_i_1_n_0\
    );
\current_address[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(13),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(13),
      I3 => \^s_axi_arready\,
      I4 => in14(13),
      O => \current_address[13]_i_1_n_0\
    );
\current_address[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(14),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(14),
      I3 => \^s_axi_arready\,
      I4 => in14(14),
      O => \current_address[14]_i_1_n_0\
    );
\current_address[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(15),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(15),
      I3 => \^s_axi_arready\,
      I4 => in14(15),
      O => \current_address[15]_i_1_n_0\
    );
\current_address[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(16),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(16),
      I3 => \^s_axi_arready\,
      I4 => in14(16),
      O => \current_address[16]_i_1_n_0\
    );
\current_address[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(17),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(17),
      I3 => \^s_axi_arready\,
      I4 => in14(17),
      O => \current_address[17]_i_1_n_0\
    );
\current_address[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(18),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(18),
      I3 => \^s_axi_arready\,
      I4 => in14(18),
      O => \current_address[18]_i_1_n_0\
    );
\current_address[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF8"
    )
        port map (
      I0 => S_AXI_RREADY,
      I1 => \^s_axi_rvalid\,
      I2 => \^s_axi_wready\,
      I3 => \^s_axi_arready\,
      I4 => \^s_axi_awready\,
      O => \current_address[19]_i_1_n_0\
    );
\current_address[19]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(19),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(19),
      I3 => \^s_axi_arready\,
      I4 => in14(19),
      O => \current_address[19]_i_2_n_0\
    );
\current_address[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(1),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(1),
      I3 => \^s_axi_arready\,
      I4 => in14(1),
      O => \current_address[1]_i_1_n_0\
    );
\current_address[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(2),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(2),
      I3 => \^s_axi_arready\,
      I4 => in14(2),
      O => \current_address[2]_i_1_n_0\
    );
\current_address[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(3),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(3),
      I3 => \^s_axi_arready\,
      I4 => in14(3),
      O => \current_address[3]_i_1_n_0\
    );
\current_address[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(4),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(4),
      I3 => \^s_axi_arready\,
      I4 => in14(4),
      O => \current_address[4]_i_1_n_0\
    );
\current_address[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(5),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(5),
      I3 => \^s_axi_arready\,
      I4 => in14(5),
      O => \current_address[5]_i_1_n_0\
    );
\current_address[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(6),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(6),
      I3 => \^s_axi_arready\,
      I4 => in14(6),
      O => \current_address[6]_i_1_n_0\
    );
\current_address[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(7),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(7),
      I3 => \^s_axi_arready\,
      I4 => in14(7),
      O => \current_address[7]_i_1_n_0\
    );
\current_address[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(8),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(8),
      I3 => \^s_axi_arready\,
      I4 => in14(8),
      O => \current_address[8]_i_1_n_0\
    );
\current_address[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => S_AXI_AWADDR(9),
      I1 => \^s_axi_awready\,
      I2 => S_AXI_ARADDR(9),
      I3 => \^s_axi_arready\,
      I4 => in14(9),
      O => \current_address[9]_i_1_n_0\
    );
\current_address_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[0]_i_1_n_0\,
      Q => \^adr_o\(0)
    );
\current_address_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[10]_i_1_n_0\,
      Q => \^adr_o\(10)
    );
\current_address_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[11]_i_1_n_0\,
      Q => \^adr_o\(11)
    );
\current_address_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[12]_i_1_n_0\,
      Q => \^adr_o\(12)
    );
\current_address_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[13]_i_1_n_0\,
      Q => \^adr_o\(13)
    );
\current_address_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[14]_i_1_n_0\,
      Q => \^adr_o\(14)
    );
\current_address_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[15]_i_1_n_0\,
      Q => \^adr_o\(15)
    );
\current_address_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[16]_i_1_n_0\,
      Q => \^adr_o\(16)
    );
\current_address_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[17]_i_1_n_0\,
      Q => \^adr_o\(17)
    );
\current_address_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[18]_i_1_n_0\,
      Q => \^adr_o\(18)
    );
\current_address_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[19]_i_2_n_0\,
      Q => \^adr_o\(19)
    );
\current_address_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[1]_i_1_n_0\,
      Q => \^adr_o\(1)
    );
\current_address_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[2]_i_1_n_0\,
      Q => \^adr_o\(2)
    );
\current_address_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[3]_i_1_n_0\,
      Q => \^adr_o\(3)
    );
\current_address_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[4]_i_1_n_0\,
      Q => \^adr_o\(4)
    );
\current_address_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[5]_i_1_n_0\,
      Q => \^adr_o\(5)
    );
\current_address_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[6]_i_1_n_0\,
      Q => \^adr_o\(6)
    );
\current_address_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[7]_i_1_n_0\,
      Q => \^adr_o\(7)
    );
\current_address_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[8]_i_1_n_0\,
      Q => \^adr_o\(8)
    );
\current_address_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => S_AXI_ACLK,
      CE => \current_address[19]_i_1_n_0\,
      CLR => p_0_in,
      D => \current_address[9]_i_1_n_0\,
      Q => \^adr_o\(9)
    );
plusOp_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => plusOp_carry_n_0,
      CO(6) => plusOp_carry_n_1,
      CO(5) => plusOp_carry_n_2,
      CO(4) => plusOp_carry_n_3,
      CO(3) => plusOp_carry_n_4,
      CO(2) => plusOp_carry_n_5,
      CO(1) => plusOp_carry_n_6,
      CO(0) => plusOp_carry_n_7,
      DI(7 downto 2) => B"000000",
      DI(1) => \^adr_o\(2),
      DI(0) => '0',
      O(7 downto 0) => in14(8 downto 1),
      S(7 downto 2) => \^adr_o\(8 downto 3),
      S(1) => plusOp_carry_i_1_n_0,
      S(0) => \^adr_o\(1)
    );
\plusOp_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => plusOp_carry_n_0,
      CI_TOP => '0',
      CO(7) => \plusOp_carry__0_n_0\,
      CO(6) => \plusOp_carry__0_n_1\,
      CO(5) => \plusOp_carry__0_n_2\,
      CO(4) => \plusOp_carry__0_n_3\,
      CO(3) => \plusOp_carry__0_n_4\,
      CO(2) => \plusOp_carry__0_n_5\,
      CO(1) => \plusOp_carry__0_n_6\,
      CO(0) => \plusOp_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => in14(16 downto 9),
      S(7 downto 0) => \^adr_o\(16 downto 9)
    );
\plusOp_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \plusOp_carry__0_n_0\,
      CI_TOP => '0',
      CO(7 downto 2) => \NLW_plusOp_carry__1_CO_UNCONNECTED\(7 downto 2),
      CO(1) => \plusOp_carry__1_n_6\,
      CO(0) => \plusOp_carry__1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 3) => \NLW_plusOp_carry__1_O_UNCONNECTED\(7 downto 3),
      O(2 downto 0) => in14(19 downto 17),
      S(7 downto 3) => B"00000",
      S(2 downto 0) => \^adr_o\(19 downto 17)
    );
plusOp_carry_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^adr_o\(2),
      O => plusOp_carry_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity cont_microblaze_axi_slave_wishbone_classic_master_0_0 is
  port (
    RST_O : out STD_LOGIC;
    DAT_O : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DAT_I : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ACK_I : in STD_LOGIC;
    ADR_O : out STD_LOGIC_VECTOR ( 19 downto 0 );
    CYC_O : out STD_LOGIC;
    SEL_O : out STD_LOGIC_VECTOR ( 3 downto 0 );
    STB_O : out STD_LOGIC;
    WE_O : out STD_LOGIC;
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWID : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 19 downto 0 );
    S_AXI_AWLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_AWSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_AWLOCK : in STD_LOGIC;
    S_AXI_AWCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWREGION : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WLAST : in STD_LOGIC;
    S_AXI_WUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BID : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARID : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 19 downto 0 );
    S_AXI_ARLEN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXI_ARSIZE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARBURST : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_ARLOCK : in STD_LOGIC;
    S_AXI_ARCACHE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARQOS : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ARREGION : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ARUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RID : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RLAST : out STD_LOGIC;
    S_AXI_RUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of cont_microblaze_axi_slave_wishbone_classic_master_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of cont_microblaze_axi_slave_wishbone_classic_master_0_0 : entity is "cont_microblaze_axi_slave_wishbone_classic_master_0_0,axi_slave_wishbone_classic_master,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of cont_microblaze_axi_slave_wishbone_classic_master_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of cont_microblaze_axi_slave_wishbone_classic_master_0_0 : entity is "axi_slave_wishbone_classic_master,Vivado 2019.1";
end cont_microblaze_axi_slave_wishbone_classic_master_0_0;

architecture STRUCTURE of cont_microblaze_axi_slave_wishbone_classic_master_0_0 is
  signal \<const0>\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of S_AXI_ACLK : signal is "xilinx.com:signal:clock:1.0 S_AXI_signal_clock CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of S_AXI_ACLK : signal is "XIL_INTERFACENAME S_AXI_signal_clock, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN cont_microblaze_Clk, INSERT_VIP 0";
  attribute x_interface_info of S_AXI_ARESETN : signal is "xilinx.com:signal:reset:1.0 S_AXI_signal_reset RST";
  attribute x_interface_parameter of S_AXI_ARESETN : signal is "XIL_INTERFACENAME S_AXI_signal_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of S_AXI_ARLOCK : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK";
  attribute x_interface_info of S_AXI_ARREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREADY";
  attribute x_interface_info of S_AXI_ARVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARVALID";
  attribute x_interface_info of S_AXI_AWLOCK : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK";
  attribute x_interface_info of S_AXI_AWREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREADY";
  attribute x_interface_info of S_AXI_AWVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWVALID";
  attribute x_interface_info of S_AXI_BREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI BREADY";
  attribute x_interface_info of S_AXI_BVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI BVALID";
  attribute x_interface_info of S_AXI_RLAST : signal is "xilinx.com:interface:aximm:1.0 S_AXI RLAST";
  attribute x_interface_info of S_AXI_RREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI RREADY";
  attribute x_interface_info of S_AXI_RVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI RVALID";
  attribute x_interface_info of S_AXI_WLAST : signal is "xilinx.com:interface:aximm:1.0 S_AXI WLAST";
  attribute x_interface_info of S_AXI_WREADY : signal is "xilinx.com:interface:aximm:1.0 S_AXI WREADY";
  attribute x_interface_info of S_AXI_WVALID : signal is "xilinx.com:interface:aximm:1.0 S_AXI WVALID";
  attribute x_interface_info of S_AXI_ARADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARADDR";
  attribute x_interface_info of S_AXI_ARBURST : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARBURST";
  attribute x_interface_info of S_AXI_ARCACHE : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE";
  attribute x_interface_info of S_AXI_ARID : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARID";
  attribute x_interface_info of S_AXI_ARLEN : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARLEN";
  attribute x_interface_info of S_AXI_ARPROT : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARPROT";
  attribute x_interface_info of S_AXI_ARQOS : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARQOS";
  attribute x_interface_info of S_AXI_ARREGION : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARREGION";
  attribute x_interface_info of S_AXI_ARSIZE : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE";
  attribute x_interface_info of S_AXI_ARUSER : signal is "xilinx.com:interface:aximm:1.0 S_AXI ARUSER";
  attribute x_interface_info of S_AXI_AWADDR : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWADDR";
  attribute x_interface_info of S_AXI_AWBURST : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWBURST";
  attribute x_interface_info of S_AXI_AWCACHE : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE";
  attribute x_interface_info of S_AXI_AWID : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWID";
  attribute x_interface_parameter of S_AXI_AWID : signal is "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 1, ADDR_WIDTH 20, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN cont_microblaze_Clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute x_interface_info of S_AXI_AWLEN : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWLEN";
  attribute x_interface_info of S_AXI_AWPROT : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWPROT";
  attribute x_interface_info of S_AXI_AWQOS : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWQOS";
  attribute x_interface_info of S_AXI_AWREGION : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWREGION";
  attribute x_interface_info of S_AXI_AWSIZE : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE";
  attribute x_interface_info of S_AXI_AWUSER : signal is "xilinx.com:interface:aximm:1.0 S_AXI AWUSER";
  attribute x_interface_info of S_AXI_BID : signal is "xilinx.com:interface:aximm:1.0 S_AXI BID";
  attribute x_interface_info of S_AXI_BRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI BRESP";
  attribute x_interface_info of S_AXI_BUSER : signal is "xilinx.com:interface:aximm:1.0 S_AXI BUSER";
  attribute x_interface_info of S_AXI_RDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI RDATA";
  attribute x_interface_info of S_AXI_RID : signal is "xilinx.com:interface:aximm:1.0 S_AXI RID";
  attribute x_interface_info of S_AXI_RRESP : signal is "xilinx.com:interface:aximm:1.0 S_AXI RRESP";
  attribute x_interface_info of S_AXI_RUSER : signal is "xilinx.com:interface:aximm:1.0 S_AXI RUSER";
  attribute x_interface_info of S_AXI_WDATA : signal is "xilinx.com:interface:aximm:1.0 S_AXI WDATA";
  attribute x_interface_info of S_AXI_WSTRB : signal is "xilinx.com:interface:aximm:1.0 S_AXI WSTRB";
  attribute x_interface_info of S_AXI_WUSER : signal is "xilinx.com:interface:aximm:1.0 S_AXI WUSER";
begin
  S_AXI_BRESP(1) <= \<const0>\;
  S_AXI_BRESP(0) <= \<const0>\;
  S_AXI_RRESP(1) <= \<const0>\;
  S_AXI_RRESP(0) <= \<const0>\;
  S_AXI_BUSER(0) <= 'Z';
  S_AXI_RUSER(0) <= 'Z';
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.cont_microblaze_axi_slave_wishbone_classic_master_0_0_axi_slave_wishbone_classic_master
     port map (
      ACK_I => ACK_I,
      ADR_O(19 downto 0) => ADR_O(19 downto 0),
      CYC_O => CYC_O,
      DAT_I(31 downto 0) => DAT_I(31 downto 0),
      DAT_O(31 downto 0) => DAT_O(31 downto 0),
      RST_O => RST_O,
      SEL_O(3 downto 0) => SEL_O(3 downto 0),
      STB_O => STB_O,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARADDR(19 downto 0) => S_AXI_ARADDR(19 downto 0),
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_ARID(0) => S_AXI_ARID(0),
      S_AXI_ARLEN(7 downto 0) => S_AXI_ARLEN(7 downto 0),
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_AWADDR(19 downto 0) => S_AXI_AWADDR(19 downto 0),
      S_AXI_AWID(0) => S_AXI_AWID(0),
      S_AXI_AWLEN(7 downto 0) => S_AXI_AWLEN(7 downto 0),
      S_AXI_AWREADY => S_AXI_AWREADY,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_BID(0) => S_AXI_BID(0),
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_RDATA(31 downto 0) => S_AXI_RDATA(31 downto 0),
      S_AXI_RID(0) => S_AXI_RID(0),
      S_AXI_RLAST => S_AXI_RLAST,
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_WDATA(31 downto 0) => S_AXI_WDATA(31 downto 0),
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_WSTRB(3 downto 0) => S_AXI_WSTRB(3 downto 0),
      S_AXI_WVALID => S_AXI_WVALID,
      WE_O => WE_O
    );
end STRUCTURE;
