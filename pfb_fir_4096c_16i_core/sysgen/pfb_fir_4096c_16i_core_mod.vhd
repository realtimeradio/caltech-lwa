-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity pfb_fir_4096c_16i_core_stub is
  port (
    pol_in : in std_logic_vector( 128-1 downto 0 );
    sync : in std_logic_vector( 32-1 downto 0 );
    clk : in std_logic;
    pol_out : out std_logic_vector( 192-1 downto 0 );
    sync_out : out std_logic_vector( 1-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_stub;
architecture structural of pfb_fir_4096c_16i_core_stub is 
begin
  sysgen_dut : entity xil_defaultlib.pfb_fir_4096c_16i_core_0 
  port map (
    pol_in => pol_in,
    sync => sync,
    clk => clk,
    pol_out => pol_out,
    sync_out => sync_out
  );
end structural;
