--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
--Date        : Fri Jan 24 10:27:21 2020
--Host        : maze running 64-bit unknown
--Command     : generate_target fft_4096c_1i_core_bd_wrapper.bd
--Design      : fft_4096c_1i_core_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fft_4096c_1i_core_bd_wrapper is
  port (
    clk : in STD_LOGIC;
    overflow : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pol_in : in STD_LOGIC_VECTOR ( 191 downto 0 );
    pol_out : out STD_LOGIC_VECTOR ( 287 downto 0 );
    shift : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sync : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end fft_4096c_1i_core_bd_wrapper;

architecture STRUCTURE of fft_4096c_1i_core_bd_wrapper is
  component fft_4096c_1i_core_bd is
  port (
    clk : in STD_LOGIC;
    overflow : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pol_in : in STD_LOGIC_VECTOR ( 191 downto 0 );
    pol_out : out STD_LOGIC_VECTOR ( 287 downto 0 );
    shift : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sync : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component fft_4096c_1i_core_bd;
begin
fft_4096c_1i_core_bd_i: component fft_4096c_1i_core_bd
     port map (
      clk => clk,
      overflow(3 downto 0) => overflow(3 downto 0),
      pol_in(191 downto 0) => pol_in(191 downto 0),
      pol_out(287 downto 0) => pol_out(287 downto 0),
      shift(15 downto 0) => shift(15 downto 0),
      sync(31 downto 0) => sync(31 downto 0),
      sync_out(0) => sync_out(0)
    );
end STRUCTURE;
