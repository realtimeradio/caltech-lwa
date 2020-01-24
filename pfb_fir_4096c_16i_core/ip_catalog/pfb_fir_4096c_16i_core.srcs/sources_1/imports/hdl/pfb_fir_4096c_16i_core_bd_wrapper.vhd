--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
--Date        : Fri Jan 24 10:31:15 2020
--Host        : maze running 64-bit unknown
--Command     : generate_target pfb_fir_4096c_16i_core_bd_wrapper.bd
--Design      : pfb_fir_4096c_16i_core_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pfb_fir_4096c_16i_core_bd_wrapper is
  port (
    clk : in STD_LOGIC;
    pol_in : in STD_LOGIC_VECTOR ( 127 downto 0 );
    pol_out : out STD_LOGIC_VECTOR ( 191 downto 0 );
    sync : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end pfb_fir_4096c_16i_core_bd_wrapper;

architecture STRUCTURE of pfb_fir_4096c_16i_core_bd_wrapper is
  component pfb_fir_4096c_16i_core_bd is
  port (
    clk : in STD_LOGIC;
    pol_in : in STD_LOGIC_VECTOR ( 127 downto 0 );
    pol_out : out STD_LOGIC_VECTOR ( 191 downto 0 );
    sync : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component pfb_fir_4096c_16i_core_bd;
begin
pfb_fir_4096c_16i_core_bd_i: component pfb_fir_4096c_16i_core_bd
     port map (
      clk => clk,
      pol_in(127 downto 0) => pol_in(127 downto 0),
      pol_out(191 downto 0) => pol_out(191 downto 0),
      sync(31 downto 0) => sync(31 downto 0),
      sync_out(0) => sync_out(0)
    );
end STRUCTURE;
