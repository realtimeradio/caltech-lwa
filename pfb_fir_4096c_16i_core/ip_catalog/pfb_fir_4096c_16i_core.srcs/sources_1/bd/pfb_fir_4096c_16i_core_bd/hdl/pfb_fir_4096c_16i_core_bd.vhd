--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
--Date        : Tue Jan  7 09:27:36 2020
--Host        : maze running 64-bit unknown
--Command     : generate_target pfb_fir_4096c_16i_core_bd.bd
--Design      : pfb_fir_4096c_16i_core_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pfb_fir_4096c_16i_core_bd is
  port (
    clk : in STD_LOGIC;
    pol_in : in STD_LOGIC_VECTOR ( 127 downto 0 );
    pol_out : out STD_LOGIC_VECTOR ( 191 downto 0 );
    sync : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of pfb_fir_4096c_16i_core_bd : entity is "pfb_fir_4096c_16i_core_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pfb_fir_4096c_16i_core_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of pfb_fir_4096c_16i_core_bd : entity is "pfb_fir_4096c_16i_core_bd.hwdef";
end pfb_fir_4096c_16i_core_bd;

architecture STRUCTURE of pfb_fir_4096c_16i_core_bd is
  component pfb_fir_4096c_16i_core_bd_pfb_fir_4096c_16i_core_1_0 is
  port (
    pol_in : in STD_LOGIC_VECTOR ( 127 downto 0 );
    sync : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    pol_out : out STD_LOGIC_VECTOR ( 191 downto 0 );
    sync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pfb_fir_4096c_16i_core_bd_pfb_fir_4096c_16i_core_1_0;
  signal clk_1 : STD_LOGIC;
  signal pfb_fir_4096c_16i_core_1_pol_out : STD_LOGIC_VECTOR ( 191 downto 0 );
  signal pfb_fir_4096c_16i_core_1_sync_out : STD_LOGIC_VECTOR ( 0 to 0 );
  signal pol_in_1 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal sync_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  clk_1 <= clk;
  pol_in_1(127 downto 0) <= pol_in(127 downto 0);
  pol_out(191 downto 0) <= pfb_fir_4096c_16i_core_1_pol_out(191 downto 0);
  sync_1(31 downto 0) <= sync(31 downto 0);
  sync_out(0) <= pfb_fir_4096c_16i_core_1_sync_out(0);
pfb_fir_4096c_16i_core_1: component pfb_fir_4096c_16i_core_bd_pfb_fir_4096c_16i_core_1_0
     port map (
      clk => clk_1,
      pol_in(127 downto 0) => pol_in_1(127 downto 0),
      pol_out(191 downto 0) => pfb_fir_4096c_16i_core_1_pol_out(191 downto 0),
      sync(31 downto 0) => sync_1(31 downto 0),
      sync_out(0) => pfb_fir_4096c_16i_core_1_sync_out(0)
    );
end STRUCTURE;
