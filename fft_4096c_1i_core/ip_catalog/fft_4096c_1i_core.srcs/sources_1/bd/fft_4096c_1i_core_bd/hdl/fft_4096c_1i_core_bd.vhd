--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
--Date        : Fri Jan 24 10:27:21 2020
--Host        : maze running 64-bit unknown
--Command     : generate_target fft_4096c_1i_core_bd.bd
--Design      : fft_4096c_1i_core_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fft_4096c_1i_core_bd is
  port (
    clk : in STD_LOGIC;
    overflow : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pol_in : in STD_LOGIC_VECTOR ( 191 downto 0 );
    pol_out : out STD_LOGIC_VECTOR ( 287 downto 0 );
    shift : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sync : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of fft_4096c_1i_core_bd : entity is "fft_4096c_1i_core_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=fft_4096c_1i_core_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of fft_4096c_1i_core_bd : entity is "fft_4096c_1i_core_bd.hwdef";
end fft_4096c_1i_core_bd;

architecture STRUCTURE of fft_4096c_1i_core_bd is
  component fft_4096c_1i_core_bd_fft_4096c_1i_core_1_0 is
  port (
    pol_in : in STD_LOGIC_VECTOR ( 191 downto 0 );
    shift : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sync : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    pol_out : out STD_LOGIC_VECTOR ( 287 downto 0 );
    overflow : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component fft_4096c_1i_core_bd_fft_4096c_1i_core_1_0;
  signal clk_1 : STD_LOGIC;
  signal fft_4096c_1i_core_1_overflow : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal fft_4096c_1i_core_1_pol_out : STD_LOGIC_VECTOR ( 287 downto 0 );
  signal fft_4096c_1i_core_1_sync_out : STD_LOGIC_VECTOR ( 0 to 0 );
  signal pol_in_1 : STD_LOGIC_VECTOR ( 191 downto 0 );
  signal shift_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sync_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
begin
  clk_1 <= clk;
  overflow(3 downto 0) <= fft_4096c_1i_core_1_overflow(3 downto 0);
  pol_in_1(191 downto 0) <= pol_in(191 downto 0);
  pol_out(287 downto 0) <= fft_4096c_1i_core_1_pol_out(287 downto 0);
  shift_1(15 downto 0) <= shift(15 downto 0);
  sync_1(31 downto 0) <= sync(31 downto 0);
  sync_out(0) <= fft_4096c_1i_core_1_sync_out(0);
fft_4096c_1i_core_1: component fft_4096c_1i_core_bd_fft_4096c_1i_core_1_0
     port map (
      clk => clk_1,
      overflow(3 downto 0) => fft_4096c_1i_core_1_overflow(3 downto 0),
      pol_in(191 downto 0) => pol_in_1(191 downto 0),
      pol_out(287 downto 0) => fft_4096c_1i_core_1_pol_out(287 downto 0),
      shift(15 downto 0) => shift_1(15 downto 0),
      sync(31 downto 0) => sync_1(31 downto 0),
      sync_out(0) => fft_4096c_1i_core_1_sync_out(0)
    );
end STRUCTURE;
