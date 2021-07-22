--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1.3 (lin64) Build 2644227 Wed Sep  4 09:44:18 MDT 2019
--Date        : Thu Jul 22 12:30:56 2021
--Host        : rtr-dev1 running 64-bit Ubuntu 18.04.4 LTS
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
    pol_in : in STD_LOGIC_VECTOR ( 287 downto 0 );
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
    pol_in : in STD_LOGIC_VECTOR ( 287 downto 0 );
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
      pol_in(287 downto 0) => pol_in(287 downto 0),
      pol_out(287 downto 0) => pol_out(287 downto 0),
      shift(15 downto 0) => shift(15 downto 0),
      sync(31 downto 0) => sync(31 downto 0),
      sync_out(0) => sync_out(0)
    );
end STRUCTURE;
