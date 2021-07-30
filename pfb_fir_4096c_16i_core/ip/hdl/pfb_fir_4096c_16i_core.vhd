-- Generated from Simulink block pfb_fir_4096c_16i_core/bus_create
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_bus_create is
  port (
    in1 : in std_logic_vector( 18-1 downto 0 );
    in2 : in std_logic_vector( 18-1 downto 0 );
    in3 : in std_logic_vector( 18-1 downto 0 );
    in4 : in std_logic_vector( 18-1 downto 0 );
    in5 : in std_logic_vector( 18-1 downto 0 );
    in6 : in std_logic_vector( 18-1 downto 0 );
    in7 : in std_logic_vector( 18-1 downto 0 );
    in8 : in std_logic_vector( 18-1 downto 0 );
    in9 : in std_logic_vector( 18-1 downto 0 );
    in10 : in std_logic_vector( 18-1 downto 0 );
    in11 : in std_logic_vector( 18-1 downto 0 );
    in12 : in std_logic_vector( 18-1 downto 0 );
    in13 : in std_logic_vector( 18-1 downto 0 );
    in14 : in std_logic_vector( 18-1 downto 0 );
    in15 : in std_logic_vector( 18-1 downto 0 );
    in16 : in std_logic_vector( 18-1 downto 0 );
    bus_out : out std_logic_vector( 288-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_bus_create;
architecture structural of pfb_fir_4096c_16i_core_bus_create is 
  signal convert_1_1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_2_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_3_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_4_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_5_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_6_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_7_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_8_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_9_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_10_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_11_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_12_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_13_dout_net : std_logic_vector( 18-1 downto 0 );
  signal concatenate_y_net : std_logic_vector( 288-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret8_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret9_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret10_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret11_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret12_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret13_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret14_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret15_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret16_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_14_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_15_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_16_dout_net : std_logic_vector( 18-1 downto 0 );
begin
  bus_out <= concatenate_y_net;
  convert_1_1_dout_net <= in1;
  convert_1_2_dout_net <= in2;
  convert_1_3_dout_net <= in3;
  convert_1_4_dout_net <= in4;
  convert_1_5_dout_net <= in5;
  convert_1_6_dout_net <= in6;
  convert_1_7_dout_net <= in7;
  convert_1_8_dout_net <= in8;
  convert_1_9_dout_net <= in9;
  convert_1_10_dout_net <= in10;
  convert_1_11_dout_net <= in11;
  convert_1_12_dout_net <= in12;
  convert_1_13_dout_net <= in13;
  convert_1_14_dout_net <= in14;
  convert_1_15_dout_net <= in15;
  convert_1_16_dout_net <= in16;
  concatenate : entity xil_defaultlib.sysgen_concat_677d3c3127 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    in4 => reinterpret5_output_port_net,
    in5 => reinterpret6_output_port_net,
    in6 => reinterpret7_output_port_net,
    in7 => reinterpret8_output_port_net,
    in8 => reinterpret9_output_port_net,
    in9 => reinterpret10_output_port_net,
    in10 => reinterpret11_output_port_net,
    in11 => reinterpret12_output_port_net,
    in12 => reinterpret13_output_port_net,
    in13 => reinterpret14_output_port_net,
    in14 => reinterpret15_output_port_net,
    in15 => reinterpret16_output_port_net,
    y => concatenate_y_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_1_dout_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret10 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_10_dout_net,
    output_port => reinterpret10_output_port_net
  );
  reinterpret11 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_11_dout_net,
    output_port => reinterpret11_output_port_net
  );
  reinterpret12 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_12_dout_net,
    output_port => reinterpret12_output_port_net
  );
  reinterpret13 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_13_dout_net,
    output_port => reinterpret13_output_port_net
  );
  reinterpret14 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_14_dout_net,
    output_port => reinterpret14_output_port_net
  );
  reinterpret15 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_15_dout_net,
    output_port => reinterpret15_output_port_net
  );
  reinterpret16 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_16_dout_net,
    output_port => reinterpret16_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_2_dout_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_3_dout_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_4_dout_net,
    output_port => reinterpret4_output_port_net
  );
  reinterpret5 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_5_dout_net,
    output_port => reinterpret5_output_port_net
  );
  reinterpret6 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_6_dout_net,
    output_port => reinterpret6_output_port_net
  );
  reinterpret7 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_7_dout_net,
    output_port => reinterpret7_output_port_net
  );
  reinterpret8 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_8_dout_net,
    output_port => reinterpret8_output_port_net
  );
  reinterpret9 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => convert_1_9_dout_net,
    output_port => reinterpret9_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/bus_expand
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_bus_expand is
  port (
    bus_in : in std_logic_vector( 160-1 downto 0 );
    msb_out16 : out std_logic_vector( 10-1 downto 0 );
    out15 : out std_logic_vector( 10-1 downto 0 );
    out14 : out std_logic_vector( 10-1 downto 0 );
    out13 : out std_logic_vector( 10-1 downto 0 );
    out12 : out std_logic_vector( 10-1 downto 0 );
    out11 : out std_logic_vector( 10-1 downto 0 );
    out10 : out std_logic_vector( 10-1 downto 0 );
    out9 : out std_logic_vector( 10-1 downto 0 );
    out8 : out std_logic_vector( 10-1 downto 0 );
    out7 : out std_logic_vector( 10-1 downto 0 );
    out6 : out std_logic_vector( 10-1 downto 0 );
    out5 : out std_logic_vector( 10-1 downto 0 );
    out4 : out std_logic_vector( 10-1 downto 0 );
    out3 : out std_logic_vector( 10-1 downto 0 );
    out2 : out std_logic_vector( 10-1 downto 0 );
    lsb_out1 : out std_logic_vector( 10-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_bus_expand;
architecture structural of pfb_fir_4096c_16i_core_bus_expand is 
  signal reinterpret10_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret9_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret8_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal pol_in_net : std_logic_vector( 160-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice10_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice11_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice12_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice13_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice14_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice15_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice16_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice2_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice3_y_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret16_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret15_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret14_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret13_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret12_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret11_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal slice4_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice5_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice6_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice7_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice8_y_net : std_logic_vector( 10-1 downto 0 );
  signal slice9_y_net : std_logic_vector( 10-1 downto 0 );
begin
  msb_out16 <= reinterpret16_output_port_net;
  out15 <= reinterpret15_output_port_net;
  out14 <= reinterpret14_output_port_net;
  out13 <= reinterpret13_output_port_net;
  out12 <= reinterpret12_output_port_net;
  out11 <= reinterpret11_output_port_net;
  out10 <= reinterpret10_output_port_net;
  out9 <= reinterpret9_output_port_net;
  out8 <= reinterpret8_output_port_net;
  out7 <= reinterpret7_output_port_net;
  out6 <= reinterpret6_output_port_net;
  out5 <= reinterpret5_output_port_net;
  out4 <= reinterpret4_output_port_net;
  out3 <= reinterpret3_output_port_net;
  out2 <= reinterpret2_output_port_net;
  lsb_out1 <= reinterpret1_output_port_net;
  pol_in_net <= bus_in;
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret10 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice10_y_net,
    output_port => reinterpret10_output_port_net
  );
  reinterpret11 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice11_y_net,
    output_port => reinterpret11_output_port_net
  );
  reinterpret12 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice12_y_net,
    output_port => reinterpret12_output_port_net
  );
  reinterpret13 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice13_y_net,
    output_port => reinterpret13_output_port_net
  );
  reinterpret14 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice14_y_net,
    output_port => reinterpret14_output_port_net
  );
  reinterpret15 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice15_y_net,
    output_port => reinterpret15_output_port_net
  );
  reinterpret16 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice16_y_net,
    output_port => reinterpret16_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice2_y_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice3_y_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice4_y_net,
    output_port => reinterpret4_output_port_net
  );
  reinterpret5 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice5_y_net,
    output_port => reinterpret5_output_port_net
  );
  reinterpret6 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice6_y_net,
    output_port => reinterpret6_output_port_net
  );
  reinterpret7 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice7_y_net,
    output_port => reinterpret7_output_port_net
  );
  reinterpret8 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice8_y_net,
    output_port => reinterpret8_output_port_net
  );
  reinterpret9 : entity xil_defaultlib.sysgen_reinterpret_331639f64f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice9_y_net,
    output_port => reinterpret9_output_port_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 9,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice1_y_net
  );
  slice10 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 90,
    new_msb => 99,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice10_y_net
  );
  slice11 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 100,
    new_msb => 109,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice11_y_net
  );
  slice12 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 110,
    new_msb => 119,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice12_y_net
  );
  slice13 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 120,
    new_msb => 129,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice13_y_net
  );
  slice14 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 130,
    new_msb => 139,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice14_y_net
  );
  slice15 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 140,
    new_msb => 149,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice15_y_net
  );
  slice16 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 150,
    new_msb => 159,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice16_y_net
  );
  slice2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 10,
    new_msb => 19,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice2_y_net
  );
  slice3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 20,
    new_msb => 29,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice3_y_net
  );
  slice4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 30,
    new_msb => 39,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice4_y_net
  );
  slice5 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 40,
    new_msb => 49,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice5_y_net
  );
  slice6 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 50,
    new_msb => 59,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice6_y_net
  );
  slice7 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 60,
    new_msb => 69,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice7_y_net
  );
  slice8 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 70,
    new_msb => 79,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice8_y_net
  );
  slice9 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 80,
    new_msb => 89,
    x_width => 160,
    y_width => 10
  )
  port map (
    x => pol_in_net,
    y => slice9_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_1 is
  port (
    sync : in std_logic_vector( 1-1 downto 0 );
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sync_out : out std_logic_vector( 1-1 downto 0 );
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_1;
architecture structural of pfb_fir_4096c_16i_core_adder_1_1 is 
  signal sync_delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  sync_out <= sync_delay_q_net;
  dout <= addr3_s_net;
  delay_q_net <= sync;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  sync_delay_x44 : entity xil_defaultlib.sysgen_delay_13a6bfe558 
  port map (
    clr => '0',
    d => delay_q_net,
    clk => clk_net,
    ce => ce_net,
    q => sync_delay_q_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_10
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_10 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_10;
architecture structural of pfb_fir_4096c_16i_core_adder_1_10 is 
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_11
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_11 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_11;
architecture structural of pfb_fir_4096c_16i_core_adder_1_11 is 
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_12
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_12 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_12;
architecture structural of pfb_fir_4096c_16i_core_adder_1_12 is 
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_13
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_13 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_13;
architecture structural of pfb_fir_4096c_16i_core_adder_1_13 is 
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_14
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_14 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_14;
architecture structural of pfb_fir_4096c_16i_core_adder_1_14 is 
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_15
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_15 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_15;
architecture structural of pfb_fir_4096c_16i_core_adder_1_15 is 
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_16
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_16 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_16;
architecture structural of pfb_fir_4096c_16i_core_adder_1_16 is 
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_2 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_2;
architecture structural of pfb_fir_4096c_16i_core_adder_1_2 is 
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_3 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_3;
architecture structural of pfb_fir_4096c_16i_core_adder_1_3 is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_4
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_4 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_4;
architecture structural of pfb_fir_4096c_16i_core_adder_1_4 is 
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_5
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_5 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_5;
architecture structural of pfb_fir_4096c_16i_core_adder_1_5 is 
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_6
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_6 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_6;
architecture structural of pfb_fir_4096c_16i_core_adder_1_6 is 
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_7
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_7 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_7;
architecture structural of pfb_fir_4096c_16i_core_adder_1_7 is 
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_8
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_8 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_8;
architecture structural of pfb_fir_4096c_16i_core_adder_1_8 is 
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/adder_1_9
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_adder_1_9 is
  port (
    din1 : in std_logic_vector( 27-1 downto 0 );
    din2 : in std_logic_vector( 27-1 downto 0 );
    din3 : in std_logic_vector( 27-1 downto 0 );
    din4 : in std_logic_vector( 27-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_adder_1_9;
architecture structural of pfb_fir_4096c_16i_core_adder_1_9 is 
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal addr1_s_net : std_logic_vector( 27-1 downto 0 );
  signal addr2_s_net : std_logic_vector( 27-1 downto 0 );
begin
  dout <= addr3_s_net;
  mult_p_net <= din1;
  mult_p_net_x1 <= din2;
  mult_p_net_x2 <= din3;
  mult_p_net_x0 <= din4;
  clk_net <= clk_1;
  ce_net <= ce_1;
  addr1 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net,
    b => mult_p_net_x1,
    clk => clk_net,
    ce => ce_net,
    s => addr1_s_net
  );
  addr2 : entity xil_defaultlib.sysgen_addsub_35e2930758 
  port map (
    clr => '0',
    a => mult_p_net_x2,
    b => mult_p_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addr2_s_net
  );
  addr3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xladdsub 
  generic map (
    a_arith => xlSigned,
    a_bin_pt => 25,
    a_width => 27,
    b_arith => xlSigned,
    b_bin_pt => 25,
    b_width => 27,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 28,
    core_name0 => "pfb_fir_4096c_16i_core_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 2,
    full_s_width => 28,
    latency => 1,
    overflow => 1,
    quantization => 1,
    s_arith => xlSigned,
    s_bin_pt => 25,
    s_width => 27
  )
  port map (
    clr => '0',
    en => "1",
    a => addr1_s_net,
    b => addr2_s_net,
    clk => clk_net,
    ce => ce_net,
    s => addr3_s_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in10_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in10_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in10_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in10_coeffs is 
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert9_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert9_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert9_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_4defad_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_55a16b_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_f41339_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_11a8f9_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in10_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x20 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x20;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x20 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in10_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in10_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in10_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in10_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x20 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in10_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in10_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in10_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in10_last_tap is 
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in10_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x19 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x19;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x19 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in10_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in10_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in10_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in10_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x19 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in10_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x18 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x18;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x18 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in10_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in10_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in10_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in10_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x18 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in11_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in11_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in11_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in11_coeffs is 
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert10_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert10_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert10_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_eb8f56_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_60270a_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_c8d736_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_458e11_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in11_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x42 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x42;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x42 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in11_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in11_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in11_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in11_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x42 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in11_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in11_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in11_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in11_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in11_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x41 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x41;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x41 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in11_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in11_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in11_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in11_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x41 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in11_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x40 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x40;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x40 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in11_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in11_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in11_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in11_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x40 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in12_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in12_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in12_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in12_coeffs is 
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert11_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert11_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert11_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_ab518a_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_e6221f_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_d1001f_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_dc0e31_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in12_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x39 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x39;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x39 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in12_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in12_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in12_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in12_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x39 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in12_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in12_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in12_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in12_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in12_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x38 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x38;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x38 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in12_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in12_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in12_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in12_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x38 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in12_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x43 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x43;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x43 is 
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in12_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in12_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in12_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in12_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x43 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in13_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in13_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in13_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in13_coeffs is 
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert12_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert12_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert12_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_c4dd72_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_b4fa9c_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_1d09f6_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_15a026_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in13_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x46 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x46;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x46 is 
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in13_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in13_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in13_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in13_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x46 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in13_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in13_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in13_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in13_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in13_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x45 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x45;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x45 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in13_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in13_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in13_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in13_tap2 is 
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x45 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in13_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x44 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x44;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x44 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in13_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in13_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in13_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in13_tap3 is 
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x44 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in14_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in14_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in14_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in14_coeffs is 
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert13_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert13_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert13_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_7c999a_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_767aef_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_3a480d_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_6cee1e_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in14_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x34 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x34;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x34 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in14_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in14_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in14_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in14_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x34 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in14_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in14_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in14_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in14_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in14_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x33 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x33;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x33 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in14_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in14_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in14_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in14_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x33 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in14_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x32 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x32;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x32 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in14_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in14_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in14_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in14_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x32 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in15_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in15_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in15_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in15_coeffs is 
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert14_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert14_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert14_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_73da4b_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_ae982d_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_27c26f_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_dbd99c_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in15_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x30 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x30;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x30 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in15_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in15_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in15_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in15_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x30 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in15_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in15_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in15_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in15_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in15_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x29 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x29;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x29 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in15_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in15_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in15_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in15_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x29 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in15_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x31 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x31;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x31 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in15_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in15_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in15_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in15_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x31 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in16_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in16_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in16_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in16_coeffs is 
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert15_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert15_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert15_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_534789_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_edb5fc_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_f11525_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_0d69c4_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in16_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x37 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x37;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x37 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in16_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in16_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in16_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in16_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x37 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in16_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in16_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in16_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in16_last_tap is 
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in16_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x35 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x35;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x35 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in16_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in16_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in16_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in16_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x35 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in16_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x36 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x36;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x36 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in16_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in16_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in16_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in16_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x36 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in1_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    sync_out : out std_logic_vector( 1-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in1_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in1_coeffs is 
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  sync_out <= delay_q_net;
  coeff <= register_q_net;
  convert_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_0825b5_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_ba7252_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_0ec7b7_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_4a1036_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x27 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x27;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x27 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_first_tap/sync_delay
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_sync_delay_x1 is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_sync_delay_x1;
architecture structural of pfb_fir_4096c_16i_core_sync_delay_x1 is 
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 14-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 14-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 14-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 14-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= mux_y_net;
  delay_q_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_fce50b36e0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_09918a51d2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_22d3decfb6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  constant3 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 14
  )
  port map (
    rst => "0",
    clr => '0',
    load => delay_q_net,
    din => constant2_op_net,
    en => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_8250b6831f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => delay_q_net,
    d1 => relational1_op_net,
    y => logical_y_net
  );
  mux : entity xil_defaultlib.sysgen_mux_aae8f8600d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => constant3_op_net,
    d0 => delay_q_net,
    d1 => relational_op_net,
    y => mux_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_1bb90894c7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant_op_net,
    b => counter_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_8ededad4be 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => constant1_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in1_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    sync_out : out std_logic_vector( 1-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in1_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in1_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  sync_out <= mux_y_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x27 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  sync_delay_x44 : entity xil_defaultlib.pfb_fir_4096c_16i_core_sync_delay_x1 
  port map (
    in_x0 => delay_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => mux_y_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in1_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 );
    sync_out : out std_logic_vector( 1-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in1_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in1_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  sync_out <= delay_q_net;
  ram_data_out_net <= din;
  mux_y_net <= sync;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => mux_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x2;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x2 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_tap2/sync_delay
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_sync_delay_x0 is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_sync_delay_x0;
architecture structural of pfb_fir_4096c_16i_core_sync_delay_x0 is 
  signal constant_op_net : std_logic_vector( 14-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 14-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 14-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 14-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  out_x0 <= mux_y_net_x0;
  mux_y_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_fce50b36e0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_09918a51d2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_22d3decfb6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  constant3 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 14
  )
  port map (
    rst => "0",
    clr => '0',
    load => mux_y_net,
    din => constant2_op_net,
    en => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_8250b6831f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => mux_y_net,
    d1 => relational1_op_net,
    y => logical_y_net
  );
  mux : entity xil_defaultlib.sysgen_mux_aae8f8600d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => constant3_op_net,
    d0 => mux_y_net,
    d1 => relational_op_net,
    y => mux_y_net_x0
  );
  relational : entity xil_defaultlib.sysgen_relational_1bb90894c7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant_op_net,
    b => counter_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_8ededad4be 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => constant1_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in1_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    sync_out : out std_logic_vector( 1-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in1_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in1_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  sync_out <= mux_y_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  mux_y_net <= sync;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x2 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  sync_delay_x44 : entity xil_defaultlib.pfb_fir_4096c_16i_core_sync_delay_x0 
  port map (
    in_x0 => mux_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => mux_y_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x1 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x1;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x1 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_tap3/sync_delay
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_sync_delay is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_sync_delay;
architecture structural of pfb_fir_4096c_16i_core_sync_delay is 
  signal constant2_op_net : std_logic_vector( 14-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 14-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 14-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 14-1 downto 0 );
begin
  out_x0 <= mux_y_net_x0;
  mux_y_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_fce50b36e0 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  constant1 : entity xil_defaultlib.sysgen_constant_09918a51d2 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_22d3decfb6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  constant3 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 14
  )
  port map (
    rst => "0",
    clr => '0',
    load => mux_y_net,
    din => constant2_op_net,
    en => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  logical : entity xil_defaultlib.sysgen_logical_8250b6831f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => mux_y_net,
    d1 => relational1_op_net,
    y => logical_y_net
  );
  mux : entity xil_defaultlib.sysgen_mux_aae8f8600d 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    sel => constant3_op_net,
    d0 => mux_y_net,
    d1 => relational_op_net,
    y => mux_y_net_x0
  );
  relational : entity xil_defaultlib.sysgen_relational_1bb90894c7 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => constant_op_net,
    b => counter_op_net,
    op => relational_op_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_8ededad4be 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter_op_net,
    b => constant1_op_net,
    op => relational1_op_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in1_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in1_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    sync_out : out std_logic_vector( 1-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in1_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in1_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal mux_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal mux_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  sync_out <= mux_y_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  mux_y_net <= sync;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x1 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  sync_delay_x44 : entity xil_defaultlib.pfb_fir_4096c_16i_core_sync_delay 
  port map (
    in_x0 => mux_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => mux_y_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in2_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in2_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in2_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in2_coeffs is 
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert1_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert1_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_44c632_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_3149cb_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_05b3c4_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_2c86ec_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in2_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x0 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x0;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x0 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in2_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in2_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in2_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in2_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x0 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in2_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in2_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in2_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in2_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in2_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x7 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x7;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x7 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in2_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in2_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in2_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in2_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x7 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in2_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x6 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x6;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x6 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in2_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in2_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in2_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in2_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x6 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in3_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in3_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in3_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in3_coeffs is 
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert2_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert2_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_c6c2e7_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_d184d8_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_1e5bbe_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_8a7607_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in3_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x5 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x5;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x5 is 
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in3_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in3_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in3_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in3_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x5 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in3_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in3_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in3_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in3_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in3_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x4 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x4;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x4 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in3_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in3_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in3_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in3_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x4 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in3_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x3;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x3 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in3_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in3_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in3_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in3_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x3 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in4_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in4_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in4_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in4_coeffs is 
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert3_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert3_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_679225_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_a0b0b8_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_7e67ae_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_139bb3_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in4_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram;
architecture structural of pfb_fir_4096c_16i_core_delay_bram is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in4_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in4_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in4_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in4_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in4_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in4_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in4_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in4_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in4_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x8 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x8;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x8 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in4_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in4_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in4_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in4_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x8 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in4_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x9 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x9;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x9 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in4_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in4_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in4_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in4_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x9 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in5_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in5_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in5_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in5_coeffs is 
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert4_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert4_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert4_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_c99d5d_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_73ac4c_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_dd3843_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_45501a_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in5_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x12 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x12;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x12 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in5_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in5_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in5_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in5_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x12 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in5_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in5_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in5_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in5_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in5_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x10 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x10;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x10 is 
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in5_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in5_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in5_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in5_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x10 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in5_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x11 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x11;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x11 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in5_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in5_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in5_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in5_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x11 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in6_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in6_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in6_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in6_coeffs is 
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert5_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert5_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_885564_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_63c7a0_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_9159ca_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_d85f4c_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in6_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x22 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x22;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x22 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in6_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in6_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in6_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in6_first_tap is 
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x22 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in6_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in6_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in6_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in6_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in6_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x23 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x23;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x23 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in6_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in6_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in6_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in6_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x23 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in6_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x28 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x28;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x28 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in6_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in6_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in6_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in6_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x28 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in7_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in7_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in7_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in7_coeffs is 
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert6_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert6_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert6_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_930ef4_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_360713_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_70e728_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_17b35a_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in7_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x24 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x24;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x24 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in7_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in7_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in7_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in7_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x24 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in7_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in7_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in7_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in7_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in7_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x26 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x26;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x26 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in7_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in7_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in7_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in7_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x26 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in7_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x25 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x25;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x25 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in7_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in7_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in7_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in7_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x25 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in8_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in8_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in8_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in8_coeffs is 
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert7_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert7_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert7_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_2d7b7f_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_a76be4_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_c9c90b_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_6de52f_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in8_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x17 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x17;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x17 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in8_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in8_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in8_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in8_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x17 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in8_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in8_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in8_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in8_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in8_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x16 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x16;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x16 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in8_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in8_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in8_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in8_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x16 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in8_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x13 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x13;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x13 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in8_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in8_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in8_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in8_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x13 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in9_coeffs
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in9_coeffs is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff : out std_logic_vector( 72-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in9_coeffs;
architecture structural of pfb_fir_4096c_16i_core_pol1_in9_coeffs is 
  signal ce_net : std_logic;
  signal concat_y_net : std_logic_vector( 72-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal counter_op_net : std_logic_vector( 9-1 downto 0 );
  signal rom1_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom2_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay2_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom3_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay3_q_net : std_logic_vector( 9-1 downto 0 );
  signal rom4_data_net : std_logic_vector( 18-1 downto 0 );
  signal fan_delay4_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal convert8_dout_net : std_logic_vector( 9-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
begin
  dout <= delay1_q_net;
  coeff <= register_q_net;
  convert8_dout_net <= din;
  slice_y_net <= sync;
  clk_net <= clk_1;
  ce_net <= ce_1;
  concat : entity xil_defaultlib.sysgen_concat_3c2662d657 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    in0 => reinterpret1_output_port_net,
    in1 => reinterpret2_output_port_net,
    in2 => reinterpret3_output_port_net,
    in3 => reinterpret4_output_port_net,
    y => concat_y_net
  );
  counter : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlcounter_free 
  generic map (
    core_name0 => "pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 9
  )
  port map (
    en => "1",
    clr => '0',
    rst => slice_y_net,
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 4,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => convert8_dout_net,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net
  );
  rom1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_ea8895_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom1_data_net
  );
  rom2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_b2f3da_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay2_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom2_data_net
  );
  rom3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_9fce2b_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay3_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom3_data_net
  );
  rom4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlsprom 
  generic map (
    c_address_width => 9,
    c_width => 18,
    latency => 2,
    mem_init_file => "xpm_5ddc0b_vivado.mem",
    mem_size => 9216,
    mem_type => "block",
    read_reset_val => "0"
  )
  port map (
    en => "1",
    rst => "0",
    addr => fan_delay4_q_net,
    clk => clk_net,
    ce => ce_net,
    data => rom4_data_net
  );
  register_x0 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlregister 
  generic map (
    d_width => 72,
    init_value => b"000000000000000000000000000000000000000000000000000000000000000000000000"
  )
  port map (
    en => "1",
    rst => "0",
    d => concat_y_net,
    clk => clk_net,
    ce => ce_net,
    q => register_q_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom1_data_net,
    output_port => reinterpret1_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom2_data_net,
    output_port => reinterpret2_output_port_net
  );
  reinterpret3 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom3_data_net,
    output_port => reinterpret3_output_port_net
  );
  reinterpret4 : entity xil_defaultlib.sysgen_reinterpret_04c9d89fbb 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => rom4_data_net,
    output_port => reinterpret4_output_port_net
  );
  fan_delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay1_q_net
  );
  fan_delay2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay2_q_net
  );
  fan_delay3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay3_q_net
  );
  fan_delay4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 9
  )
  port map (
    en => '1',
    rst => '0',
    d => counter_op_net,
    clk => clk_net,
    ce => ce_net,
    q => fan_delay4_q_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in9_first_tap/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x15 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x15;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x15 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  delay1_q_net <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => delay1_q_net,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in9_first_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in9_first_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    sync : in std_logic_vector( 1-1 downto 0 );
    coeffs : in std_logic_vector( 72-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 54-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in9_first_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in9_first_tap is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret2_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net;
  coeff_out <= slice1_y_net;
  taps_out <= mult_p_net;
  delay1_q_net <= din;
  delay_q_net <= sync;
  register_q_net <= coeffs;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x15 
  port map (
    din => delay1_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret2_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret2 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => delay1_q_net,
    output_port => reinterpret2_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 72,
    y_width => 18
  )
  port map (
    x => register_q_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 71,
    x_width => 72,
    y_width => 54
  )
  port map (
    x => register_q_net,
    y => slice1_y_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in9_last_tap
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in9_last_tap is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 18-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    tap_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in9_last_tap;
architecture structural of pfb_fir_4096c_16i_core_pol1_in9_last_tap is 
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 18-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
begin
  tap_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice1_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in9_tap2/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x14 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x14;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x14 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in9_tap2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in9_tap2 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 54-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 36-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in9_tap2;
architecture structural of pfb_fir_4096c_16i_core_pol1_in9_tap2 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x14 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 54,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 53,
    x_width => 54,
    y_width => 36
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in9_tap3/delay_bram
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_delay_bram_x21 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_delay_bram_x21;
architecture structural of pfb_fir_4096c_16i_core_delay_bram_x21 is 
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal constant_op_net : std_logic_vector( 1-1 downto 0 );
  signal counter_op_net : std_logic_vector( 13-1 downto 0 );
begin
  dout <= ram_data_out_net;
  ram_data_out_net_x0 <= din;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant_x0 : entity xil_defaultlib.sysgen_constant_0f5def3c4e 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  counter : entity xil_defaultlib.sysgen_counter_7aeb6a6be8 
  port map (
    clr => '0',
    clk => clk_net,
    ce => ce_net,
    op => counter_op_net
  );
  ram : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlspram 
  generic map (
    init_value => b"000000000",
    latency => 2,
    mem_init_file => "xpm_24d74b_vivado.mem",
    mem_size => 73728,
    mem_type => "block",
    read_reset_val => "0",
    width => 9,
    width_addr => 13,
    write_mode_a => "read_first",
    xpm_lat => 2
  )
  port map (
    en => "1",
    rst => "0",
    addr => counter_op_net,
    data_in => ram_data_out_net_x0,
    we => constant_op_net,
    clk => clk_net,
    ce => ce_net,
    data_out => ram_data_out_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real/pol1_in9_tap3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pol1_in9_tap3 is
  port (
    din : in std_logic_vector( 9-1 downto 0 );
    coeff : in std_logic_vector( 36-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    dout : out std_logic_vector( 9-1 downto 0 );
    coeff_out : out std_logic_vector( 18-1 downto 0 );
    taps_out : out std_logic_vector( 27-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pol1_in9_tap3;
architecture structural of pfb_fir_4096c_16i_core_pol1_in9_tap3 is 
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 18-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 36-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reinterpret1_output_port_net : std_logic_vector( 9-1 downto 0 );
  signal reinterpret_output_port_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 18-1 downto 0 );
begin
  dout <= ram_data_out_net_x0;
  coeff_out <= slice1_y_net_x0;
  taps_out <= mult_p_net;
  ram_data_out_net <= din;
  slice1_y_net <= coeff;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay_bram : entity xil_defaultlib.pfb_fir_4096c_16i_core_delay_bram_x21 
  port map (
    din => ram_data_out_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0
  );
  mult : entity xil_defaultlib.sysgen_mult_6a02b0ad65 
  port map (
    clr => '0',
    a => reinterpret1_output_port_net,
    b => reinterpret_output_port_net,
    clk => clk_net,
    ce => ce_net,
    p => mult_p_net
  );
  reinterpret : entity xil_defaultlib.sysgen_reinterpret_4d62ff9bf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_y_net,
    output_port => reinterpret_output_port_net
  );
  reinterpret1 : entity xil_defaultlib.sysgen_reinterpret_ffc349a5bf 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => ram_data_out_net,
    output_port => reinterpret1_output_port_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 17,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice_y_net
  );
  slice1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 18,
    new_msb => 35,
    x_width => 36,
    y_width => 18
  )
  port map (
    x => slice1_y_net,
    y => slice1_y_net_x0
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core/pfb_fir_real
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_pfb_fir_real is
  port (
    sync : in std_logic_vector( 1-1 downto 0 );
    pol1_in1 : in std_logic_vector( 9-1 downto 0 );
    pol1_in2 : in std_logic_vector( 9-1 downto 0 );
    pol1_in3 : in std_logic_vector( 9-1 downto 0 );
    pol1_in4 : in std_logic_vector( 9-1 downto 0 );
    pol1_in5 : in std_logic_vector( 9-1 downto 0 );
    pol1_in6 : in std_logic_vector( 9-1 downto 0 );
    pol1_in7 : in std_logic_vector( 9-1 downto 0 );
    pol1_in8 : in std_logic_vector( 9-1 downto 0 );
    pol1_in9 : in std_logic_vector( 9-1 downto 0 );
    pol1_in10 : in std_logic_vector( 9-1 downto 0 );
    pol1_in11 : in std_logic_vector( 9-1 downto 0 );
    pol1_in12 : in std_logic_vector( 9-1 downto 0 );
    pol1_in13 : in std_logic_vector( 9-1 downto 0 );
    pol1_in14 : in std_logic_vector( 9-1 downto 0 );
    pol1_in15 : in std_logic_vector( 9-1 downto 0 );
    pol1_in16 : in std_logic_vector( 9-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    sync_out : out std_logic_vector( 1-1 downto 0 );
    pol1_out1 : out std_logic_vector( 18-1 downto 0 );
    pol1_out2 : out std_logic_vector( 18-1 downto 0 );
    pol1_out3 : out std_logic_vector( 18-1 downto 0 );
    pol1_out4 : out std_logic_vector( 18-1 downto 0 );
    pol1_out5 : out std_logic_vector( 18-1 downto 0 );
    pol1_out6 : out std_logic_vector( 18-1 downto 0 );
    pol1_out7 : out std_logic_vector( 18-1 downto 0 );
    pol1_out8 : out std_logic_vector( 18-1 downto 0 );
    pol1_out9 : out std_logic_vector( 18-1 downto 0 );
    pol1_out10 : out std_logic_vector( 18-1 downto 0 );
    pol1_out11 : out std_logic_vector( 18-1 downto 0 );
    pol1_out12 : out std_logic_vector( 18-1 downto 0 );
    pol1_out13 : out std_logic_vector( 18-1 downto 0 );
    pol1_out14 : out std_logic_vector( 18-1 downto 0 );
    pol1_out15 : out std_logic_vector( 18-1 downto 0 );
    pol1_out16 : out std_logic_vector( 18-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_pfb_fir_real;
architecture structural of pfb_fir_4096c_16i_core_pfb_fir_real is 
  signal ram_data_out_net_x44 : std_logic_vector( 9-1 downto 0 );
  signal mux_y_net_x44 : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net_x44 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x46 : std_logic_vector( 9-1 downto 0 );
  signal mux_y_net_x46 : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net_x46 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x45 : std_logic_vector( 9-1 downto 0 );
  signal mux_y_net_x45 : std_logic_vector( 1-1 downto 0 );
  signal slice1_y_net_x45 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x13 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x12 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x37 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x37 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x39 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x39 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x38 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x38 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x14 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x13 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x40 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x40 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x13 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x23 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x41 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x41 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x5 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x4 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x14 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x13 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x16 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x15 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x15 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x14 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x6 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x5 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x17 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x16 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x8 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x7 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x7 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x9 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x3 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x2 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x9 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x8 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x11 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x11 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x10 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x10 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x4 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x3 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x12 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x12 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x23 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x21 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x22 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x20 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x7 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x6 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x21 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x22 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x25 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x25 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x24 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x24 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x8 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x7 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x18 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x17 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x20 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x19 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x19 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x18 : std_logic_vector( 36-1 downto 0 );
  signal scale_1_1_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_2_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_3_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_4_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_5_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_9_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_6_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_7_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_8_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_10_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_11_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_12_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_13_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_14_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_15_op_net : std_logic_vector( 27-1 downto 0 );
  signal scale_1_16_op_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x4 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x43 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x45 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x46 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x44 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x14 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x47 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x34 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x35 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x37 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x13 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x36 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x39 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x40 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x38 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x12 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x41 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x58 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x59 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x57 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x11 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x48 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x50 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x51 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x49 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x10 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x52 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x54 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x55 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x53 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x9 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x16 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x18 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x19 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x17 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x8 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x20 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x22 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x11 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x21 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x7 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x12 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x10 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x14 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x13 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x6 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x15 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x28 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x29 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x27 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x5 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x30 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x32 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x33 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x31 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x4 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x26 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x24 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x25 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x23 : std_logic_vector( 27-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 9-1 downto 0 );
  signal register_q_net : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net : std_logic_vector( 54-1 downto 0 );
  signal delay_q_net_x28 : std_logic_vector( 1-1 downto 0 );
  signal ram_data_out_net_x1 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x1 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x0 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x0 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x2 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x1 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x6 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x6 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x4 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x2 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x5 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x5 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x1 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x0 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x3 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x4 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x31 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x33 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x2 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x3 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x11 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x10 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x32 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x34 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x35 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x35 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x34 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x32 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x12 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x11 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x36 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x36 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x27 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x27 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x26 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x26 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x9 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x8 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x28 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x28 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x30 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x30 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x29 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x29 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x10 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x9 : std_logic_vector( 72-1 downto 0 );
  signal ram_data_out_net_x33 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x31 : std_logic_vector( 54-1 downto 0 );
  signal ram_data_out_net_x43 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x43 : std_logic_vector( 18-1 downto 0 );
  signal ram_data_out_net_x42 : std_logic_vector( 9-1 downto 0 );
  signal slice1_y_net_x42 : std_logic_vector( 36-1 downto 0 );
  signal delay1_q_net_x15 : std_logic_vector( 9-1 downto 0 );
  signal register_q_net_x14 : std_logic_vector( 72-1 downto 0 );
  signal delay1_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal convert_1_1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_2_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_3_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_4_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_5_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_6_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_7_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_8_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_9_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_10_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_11_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_12_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_13_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_14_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_15_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_16_dout_net : std_logic_vector( 18-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert4_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert6_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert7_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert8_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert9_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert10_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert11_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert12_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert13_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert14_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert15_dout_net : std_logic_vector( 9-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal sync_delay_q_net_x2 : std_logic_vector( 1-1 downto 0 );
  signal addr3_s_net_x3 : std_logic_vector( 27-1 downto 0 );
  signal delay_q_net_x29 : std_logic_vector( 1-1 downto 0 );
  signal mult_p_net_x56 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x61 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x62 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x60 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x2 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x1 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x9 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x7 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x6 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x8 : std_logic_vector( 27-1 downto 0 );
  signal addr3_s_net_x0 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x5 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x3 : std_logic_vector( 27-1 downto 0 );
  signal mult_p_net_x42 : std_logic_vector( 27-1 downto 0 );
begin
  sync_out <= delay1_q_net_x0;
  pol1_out1 <= convert_1_1_dout_net;
  pol1_out2 <= convert_1_2_dout_net;
  pol1_out3 <= convert_1_3_dout_net;
  pol1_out4 <= convert_1_4_dout_net;
  pol1_out5 <= convert_1_5_dout_net;
  pol1_out6 <= convert_1_6_dout_net;
  pol1_out7 <= convert_1_7_dout_net;
  pol1_out8 <= convert_1_8_dout_net;
  pol1_out9 <= convert_1_9_dout_net;
  pol1_out10 <= convert_1_10_dout_net;
  pol1_out11 <= convert_1_11_dout_net;
  pol1_out12 <= convert_1_12_dout_net;
  pol1_out13 <= convert_1_13_dout_net;
  pol1_out14 <= convert_1_14_dout_net;
  pol1_out15 <= convert_1_15_dout_net;
  pol1_out16 <= convert_1_16_dout_net;
  slice_y_net <= sync;
  convert_dout_net <= pol1_in1;
  convert1_dout_net <= pol1_in2;
  convert2_dout_net <= pol1_in3;
  convert3_dout_net <= pol1_in4;
  convert4_dout_net <= pol1_in5;
  convert5_dout_net <= pol1_in6;
  convert6_dout_net <= pol1_in7;
  convert7_dout_net <= pol1_in8;
  convert8_dout_net <= pol1_in9;
  convert9_dout_net <= pol1_in10;
  convert10_dout_net <= pol1_in11;
  convert11_dout_net <= pol1_in12;
  convert12_dout_net <= pol1_in13;
  convert13_dout_net <= pol1_in14;
  convert14_dout_net <= pol1_in15;
  convert15_dout_net <= pol1_in16;
  clk_net <= clk_1;
  ce_net <= ce_1;
  adder_1_1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_1 
  port map (
    sync => delay_q_net_x29,
    din1 => mult_p_net_x56,
    din2 => mult_p_net_x61,
    din3 => mult_p_net_x62,
    din4 => mult_p_net_x60,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sync_out => sync_delay_q_net_x2,
    dout => addr3_s_net_x3
  );
  adder_1_10 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_10 
  port map (
    din1 => mult_p_net,
    din2 => mult_p_net_x1,
    din3 => mult_p_net_x2,
    din4 => mult_p_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x2
  );
  adder_1_11 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_11 
  port map (
    din1 => mult_p_net_x9,
    din2 => mult_p_net_x7,
    din3 => mult_p_net_x6,
    din4 => mult_p_net_x8,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x1
  );
  adder_1_12 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_12 
  port map (
    din1 => mult_p_net_x5,
    din2 => mult_p_net_x3,
    din3 => mult_p_net_x42,
    din4 => mult_p_net_x4,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x0
  );
  adder_1_13 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_13 
  port map (
    din1 => mult_p_net_x43,
    din2 => mult_p_net_x45,
    din3 => mult_p_net_x46,
    din4 => mult_p_net_x44,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net
  );
  adder_1_14 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_14 
  port map (
    din1 => mult_p_net_x47,
    din2 => mult_p_net_x34,
    din3 => mult_p_net_x35,
    din4 => mult_p_net_x37,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x14
  );
  adder_1_15 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_15 
  port map (
    din1 => mult_p_net_x36,
    din2 => mult_p_net_x39,
    din3 => mult_p_net_x40,
    din4 => mult_p_net_x38,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x13
  );
  adder_1_16 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_16 
  port map (
    din1 => mult_p_net_x41,
    din2 => mult_p_net_x58,
    din3 => mult_p_net_x59,
    din4 => mult_p_net_x57,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x12
  );
  adder_1_2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_2 
  port map (
    din1 => mult_p_net_x48,
    din2 => mult_p_net_x50,
    din3 => mult_p_net_x51,
    din4 => mult_p_net_x49,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x11
  );
  adder_1_3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_3 
  port map (
    din1 => mult_p_net_x52,
    din2 => mult_p_net_x54,
    din3 => mult_p_net_x55,
    din4 => mult_p_net_x53,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x10
  );
  adder_1_4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_4 
  port map (
    din1 => mult_p_net_x16,
    din2 => mult_p_net_x18,
    din3 => mult_p_net_x19,
    din4 => mult_p_net_x17,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x9
  );
  adder_1_5 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_5 
  port map (
    din1 => mult_p_net_x20,
    din2 => mult_p_net_x22,
    din3 => mult_p_net_x11,
    din4 => mult_p_net_x21,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x8
  );
  adder_1_6 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_6 
  port map (
    din1 => mult_p_net_x12,
    din2 => mult_p_net_x10,
    din3 => mult_p_net_x14,
    din4 => mult_p_net_x13,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x7
  );
  adder_1_7 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_7 
  port map (
    din1 => mult_p_net_x15,
    din2 => mult_p_net_x28,
    din3 => mult_p_net_x29,
    din4 => mult_p_net_x27,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x6
  );
  adder_1_8 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_8 
  port map (
    din1 => mult_p_net_x30,
    din2 => mult_p_net_x32,
    din3 => mult_p_net_x33,
    din4 => mult_p_net_x31,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x5
  );
  adder_1_9 : entity xil_defaultlib.pfb_fir_4096c_16i_core_adder_1_9 
  port map (
    din1 => mult_p_net_x26,
    din2 => mult_p_net_x24,
    din3 => mult_p_net_x25,
    din4 => mult_p_net_x23,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => addr3_s_net_x4
  );
  pol1_in10_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in10_coeffs 
  port map (
    din => convert9_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net,
    coeff => register_q_net
  );
  pol1_in10_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in10_first_tap 
  port map (
    din => delay1_q_net,
    sync => delay_q_net_x28,
    coeffs => register_q_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net,
    coeff_out => slice1_y_net,
    taps_out => mult_p_net
  );
  pol1_in10_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in10_last_tap 
  port map (
    din => ram_data_out_net_x1,
    coeff => slice1_y_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x0
  );
  pol1_in10_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in10_tap2 
  port map (
    din => ram_data_out_net,
    coeff => slice1_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x0,
    coeff_out => slice1_y_net_x0,
    taps_out => mult_p_net_x1
  );
  pol1_in10_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in10_tap3 
  port map (
    din => ram_data_out_net_x0,
    coeff => slice1_y_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x1,
    coeff_out => slice1_y_net_x1,
    taps_out => mult_p_net_x2
  );
  pol1_in11_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in11_coeffs 
  port map (
    din => convert10_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x2,
    coeff => register_q_net_x1
  );
  pol1_in11_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in11_first_tap 
  port map (
    din => delay1_q_net_x2,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x6,
    coeff_out => slice1_y_net_x6,
    taps_out => mult_p_net_x9
  );
  pol1_in11_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in11_last_tap 
  port map (
    din => ram_data_out_net_x4,
    coeff => slice1_y_net_x2,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x8
  );
  pol1_in11_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in11_tap2 
  port map (
    din => ram_data_out_net_x6,
    coeff => slice1_y_net_x6,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x5,
    coeff_out => slice1_y_net_x5,
    taps_out => mult_p_net_x7
  );
  pol1_in11_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in11_tap3 
  port map (
    din => ram_data_out_net_x5,
    coeff => slice1_y_net_x5,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x4,
    coeff_out => slice1_y_net_x2,
    taps_out => mult_p_net_x6
  );
  pol1_in12_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in12_coeffs 
  port map (
    din => convert11_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x1,
    coeff => register_q_net_x0
  );
  pol1_in12_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in12_first_tap 
  port map (
    din => delay1_q_net_x1,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x3,
    coeff_out => slice1_y_net_x4,
    taps_out => mult_p_net_x5
  );
  pol1_in12_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in12_last_tap 
  port map (
    din => ram_data_out_net_x31,
    coeff => slice1_y_net_x33,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x4
  );
  pol1_in12_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in12_tap2 
  port map (
    din => ram_data_out_net_x3,
    coeff => slice1_y_net_x4,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x2,
    coeff_out => slice1_y_net_x3,
    taps_out => mult_p_net_x3
  );
  pol1_in12_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in12_tap3 
  port map (
    din => ram_data_out_net_x2,
    coeff => slice1_y_net_x3,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x31,
    coeff_out => slice1_y_net_x33,
    taps_out => mult_p_net_x42
  );
  pol1_in13_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in13_coeffs 
  port map (
    din => convert12_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x11,
    coeff => register_q_net_x10
  );
  pol1_in13_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in13_first_tap 
  port map (
    din => delay1_q_net_x11,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x10,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x32,
    coeff_out => slice1_y_net_x34,
    taps_out => mult_p_net_x43
  );
  pol1_in13_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in13_last_tap 
  port map (
    din => ram_data_out_net_x35,
    coeff => slice1_y_net_x35,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x44
  );
  pol1_in13_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in13_tap2 
  port map (
    din => ram_data_out_net_x32,
    coeff => slice1_y_net_x34,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x34,
    coeff_out => slice1_y_net_x32,
    taps_out => mult_p_net_x45
  );
  pol1_in13_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in13_tap3 
  port map (
    din => ram_data_out_net_x34,
    coeff => slice1_y_net_x32,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x35,
    coeff_out => slice1_y_net_x35,
    taps_out => mult_p_net_x46
  );
  pol1_in14_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in14_coeffs 
  port map (
    din => convert13_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x12,
    coeff => register_q_net_x11
  );
  pol1_in14_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in14_first_tap 
  port map (
    din => delay1_q_net_x12,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x11,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x36,
    coeff_out => slice1_y_net_x36,
    taps_out => mult_p_net_x47
  );
  pol1_in14_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in14_last_tap 
  port map (
    din => ram_data_out_net_x27,
    coeff => slice1_y_net_x27,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x37
  );
  pol1_in14_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in14_tap2 
  port map (
    din => ram_data_out_net_x36,
    coeff => slice1_y_net_x36,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x26,
    coeff_out => slice1_y_net_x26,
    taps_out => mult_p_net_x34
  );
  pol1_in14_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in14_tap3 
  port map (
    din => ram_data_out_net_x26,
    coeff => slice1_y_net_x26,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x27,
    coeff_out => slice1_y_net_x27,
    taps_out => mult_p_net_x35
  );
  pol1_in15_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in15_coeffs 
  port map (
    din => convert14_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x9,
    coeff => register_q_net_x8
  );
  pol1_in15_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in15_first_tap 
  port map (
    din => delay1_q_net_x9,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x8,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x28,
    coeff_out => slice1_y_net_x28,
    taps_out => mult_p_net_x36
  );
  pol1_in15_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in15_last_tap 
  port map (
    din => ram_data_out_net_x30,
    coeff => slice1_y_net_x30,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x38
  );
  pol1_in15_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in15_tap2 
  port map (
    din => ram_data_out_net_x28,
    coeff => slice1_y_net_x28,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x29,
    coeff_out => slice1_y_net_x29,
    taps_out => mult_p_net_x39
  );
  pol1_in15_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in15_tap3 
  port map (
    din => ram_data_out_net_x29,
    coeff => slice1_y_net_x29,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x30,
    coeff_out => slice1_y_net_x30,
    taps_out => mult_p_net_x40
  );
  pol1_in16_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in16_coeffs 
  port map (
    din => convert15_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x10,
    coeff => register_q_net_x9
  );
  pol1_in16_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in16_first_tap 
  port map (
    din => delay1_q_net_x10,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x9,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x33,
    coeff_out => slice1_y_net_x31,
    taps_out => mult_p_net_x41
  );
  pol1_in16_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in16_last_tap 
  port map (
    din => ram_data_out_net_x43,
    coeff => slice1_y_net_x43,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x57
  );
  pol1_in16_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in16_tap2 
  port map (
    din => ram_data_out_net_x33,
    coeff => slice1_y_net_x31,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x42,
    coeff_out => slice1_y_net_x42,
    taps_out => mult_p_net_x58
  );
  pol1_in16_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in16_tap3 
  port map (
    din => ram_data_out_net_x42,
    coeff => slice1_y_net_x42,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x43,
    coeff_out => slice1_y_net_x43,
    taps_out => mult_p_net_x59
  );
  pol1_in1_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in1_coeffs 
  port map (
    din => convert_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x15,
    sync_out => delay_q_net_x28,
    coeff => register_q_net_x14
  );
  pol1_in1_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in1_first_tap 
  port map (
    din => delay1_q_net_x15,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x14,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x44,
    sync_out => mux_y_net_x44,
    coeff_out => slice1_y_net_x44,
    taps_out => mult_p_net_x56
  );
  pol1_in1_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in1_last_tap 
  port map (
    din => ram_data_out_net_x46,
    sync => mux_y_net_x46,
    coeff => slice1_y_net_x46,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x60,
    sync_out => delay_q_net_x29
  );
  pol1_in1_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in1_tap2 
  port map (
    din => ram_data_out_net_x44,
    sync => mux_y_net_x44,
    coeff => slice1_y_net_x44,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x45,
    sync_out => mux_y_net_x45,
    coeff_out => slice1_y_net_x45,
    taps_out => mult_p_net_x61
  );
  pol1_in1_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in1_tap3 
  port map (
    din => ram_data_out_net_x45,
    sync => mux_y_net_x45,
    coeff => slice1_y_net_x45,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x46,
    sync_out => mux_y_net_x46,
    coeff_out => slice1_y_net_x46,
    taps_out => mult_p_net_x62
  );
  pol1_in2_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in2_coeffs 
  port map (
    din => convert1_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x13,
    coeff => register_q_net_x12
  );
  pol1_in2_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in2_first_tap 
  port map (
    din => delay1_q_net_x13,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x12,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x37,
    coeff_out => slice1_y_net_x37,
    taps_out => mult_p_net_x48
  );
  pol1_in2_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in2_last_tap 
  port map (
    din => ram_data_out_net_x39,
    coeff => slice1_y_net_x39,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x49
  );
  pol1_in2_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in2_tap2 
  port map (
    din => ram_data_out_net_x37,
    coeff => slice1_y_net_x37,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x38,
    coeff_out => slice1_y_net_x38,
    taps_out => mult_p_net_x50
  );
  pol1_in2_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in2_tap3 
  port map (
    din => ram_data_out_net_x38,
    coeff => slice1_y_net_x38,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x39,
    coeff_out => slice1_y_net_x39,
    taps_out => mult_p_net_x51
  );
  pol1_in3_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in3_coeffs 
  port map (
    din => convert2_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x14,
    coeff => register_q_net_x13
  );
  pol1_in3_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in3_first_tap 
  port map (
    din => delay1_q_net_x14,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x13,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x40,
    coeff_out => slice1_y_net_x40,
    taps_out => mult_p_net_x52
  );
  pol1_in3_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in3_last_tap 
  port map (
    din => ram_data_out_net_x13,
    coeff => slice1_y_net_x23,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x53
  );
  pol1_in3_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in3_tap2 
  port map (
    din => ram_data_out_net_x40,
    coeff => slice1_y_net_x40,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x41,
    coeff_out => slice1_y_net_x41,
    taps_out => mult_p_net_x54
  );
  pol1_in3_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in3_tap3 
  port map (
    din => ram_data_out_net_x41,
    coeff => slice1_y_net_x41,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x13,
    coeff_out => slice1_y_net_x23,
    taps_out => mult_p_net_x55
  );
  pol1_in4_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in4_coeffs 
  port map (
    din => convert3_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x5,
    coeff => register_q_net_x4
  );
  pol1_in4_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in4_first_tap 
  port map (
    din => delay1_q_net_x5,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x4,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x14,
    coeff_out => slice1_y_net_x13,
    taps_out => mult_p_net_x16
  );
  pol1_in4_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in4_last_tap 
  port map (
    din => ram_data_out_net_x16,
    coeff => slice1_y_net_x15,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x17
  );
  pol1_in4_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in4_tap2 
  port map (
    din => ram_data_out_net_x14,
    coeff => slice1_y_net_x13,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x15,
    coeff_out => slice1_y_net_x14,
    taps_out => mult_p_net_x18
  );
  pol1_in4_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in4_tap3 
  port map (
    din => ram_data_out_net_x15,
    coeff => slice1_y_net_x14,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x16,
    coeff_out => slice1_y_net_x15,
    taps_out => mult_p_net_x19
  );
  pol1_in5_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in5_coeffs 
  port map (
    din => convert4_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x6,
    coeff => register_q_net_x5
  );
  pol1_in5_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in5_first_tap 
  port map (
    din => delay1_q_net_x6,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x5,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x17,
    coeff_out => slice1_y_net_x16,
    taps_out => mult_p_net_x20
  );
  pol1_in5_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in5_last_tap 
  port map (
    din => ram_data_out_net_x8,
    coeff => slice1_y_net_x7,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x21
  );
  pol1_in5_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in5_tap2 
  port map (
    din => ram_data_out_net_x17,
    coeff => slice1_y_net_x16,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x7,
    coeff_out => slice1_y_net_x9,
    taps_out => mult_p_net_x22
  );
  pol1_in5_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in5_tap3 
  port map (
    din => ram_data_out_net_x7,
    coeff => slice1_y_net_x9,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x8,
    coeff_out => slice1_y_net_x7,
    taps_out => mult_p_net_x11
  );
  pol1_in6_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in6_coeffs 
  port map (
    din => convert5_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x3,
    coeff => register_q_net_x2
  );
  pol1_in6_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in6_first_tap 
  port map (
    din => delay1_q_net_x3,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x2,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x9,
    coeff_out => slice1_y_net_x8,
    taps_out => mult_p_net_x12
  );
  pol1_in6_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in6_last_tap 
  port map (
    din => ram_data_out_net_x11,
    coeff => slice1_y_net_x11,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x13
  );
  pol1_in6_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in6_tap2 
  port map (
    din => ram_data_out_net_x9,
    coeff => slice1_y_net_x8,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x10,
    coeff_out => slice1_y_net_x10,
    taps_out => mult_p_net_x10
  );
  pol1_in6_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in6_tap3 
  port map (
    din => ram_data_out_net_x10,
    coeff => slice1_y_net_x10,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x11,
    coeff_out => slice1_y_net_x11,
    taps_out => mult_p_net_x14
  );
  pol1_in7_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in7_coeffs 
  port map (
    din => convert6_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x4,
    coeff => register_q_net_x3
  );
  pol1_in7_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in7_first_tap 
  port map (
    din => delay1_q_net_x4,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x3,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x12,
    coeff_out => slice1_y_net_x12,
    taps_out => mult_p_net_x15
  );
  pol1_in7_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in7_last_tap 
  port map (
    din => ram_data_out_net_x23,
    coeff => slice1_y_net_x21,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x27
  );
  pol1_in7_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in7_tap2 
  port map (
    din => ram_data_out_net_x12,
    coeff => slice1_y_net_x12,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x22,
    coeff_out => slice1_y_net_x20,
    taps_out => mult_p_net_x28
  );
  pol1_in7_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in7_tap3 
  port map (
    din => ram_data_out_net_x22,
    coeff => slice1_y_net_x20,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x23,
    coeff_out => slice1_y_net_x21,
    taps_out => mult_p_net_x29
  );
  pol1_in8_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in8_coeffs 
  port map (
    din => convert7_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x7,
    coeff => register_q_net_x6
  );
  pol1_in8_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in8_first_tap 
  port map (
    din => delay1_q_net_x7,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x6,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x21,
    coeff_out => slice1_y_net_x22,
    taps_out => mult_p_net_x30
  );
  pol1_in8_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in8_last_tap 
  port map (
    din => ram_data_out_net_x25,
    coeff => slice1_y_net_x25,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x31
  );
  pol1_in8_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in8_tap2 
  port map (
    din => ram_data_out_net_x21,
    coeff => slice1_y_net_x22,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x24,
    coeff_out => slice1_y_net_x24,
    taps_out => mult_p_net_x32
  );
  pol1_in8_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in8_tap3 
  port map (
    din => ram_data_out_net_x24,
    coeff => slice1_y_net_x24,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x25,
    coeff_out => slice1_y_net_x25,
    taps_out => mult_p_net_x33
  );
  pol1_in9_coeffs : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in9_coeffs 
  port map (
    din => convert8_dout_net,
    sync => slice_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => delay1_q_net_x8,
    coeff => register_q_net_x7
  );
  pol1_in9_first_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in9_first_tap 
  port map (
    din => delay1_q_net_x8,
    sync => delay_q_net_x28,
    coeffs => register_q_net_x7,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x18,
    coeff_out => slice1_y_net_x17,
    taps_out => mult_p_net_x26
  );
  pol1_in9_last_tap : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in9_last_tap 
  port map (
    din => ram_data_out_net_x20,
    coeff => slice1_y_net_x19,
    clk_1 => clk_net,
    ce_1 => ce_net,
    tap_out => mult_p_net_x23
  );
  pol1_in9_tap2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in9_tap2 
  port map (
    din => ram_data_out_net_x18,
    coeff => slice1_y_net_x17,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x19,
    coeff_out => slice1_y_net_x18,
    taps_out => mult_p_net_x24
  );
  pol1_in9_tap3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_pol1_in9_tap3 
  port map (
    din => ram_data_out_net_x19,
    coeff => slice1_y_net_x18,
    clk_1 => clk_net,
    ce_1 => ce_net,
    dout => ram_data_out_net_x20,
    coeff_out => slice1_y_net_x19,
    taps_out => mult_p_net_x25
  );
  convert_1_1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_1_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_1_dout_net
  );
  convert_1_2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_2_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_2_dout_net
  );
  delay1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => sync_delay_q_net_x2,
    clk => clk_net,
    ce => ce_net,
    q => delay1_q_net_x0
  );
  scale_1_1 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x3,
    op => scale_1_1_op_net
  );
  scale_1_2 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x11,
    op => scale_1_2_op_net
  );
  scale_1_6 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x7,
    op => scale_1_6_op_net
  );
  convert_1_6 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_6_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_6_dout_net
  );
  scale_1_7 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x6,
    op => scale_1_7_op_net
  );
  convert_1_7 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_7_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_7_dout_net
  );
  scale_1_8 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x5,
    op => scale_1_8_op_net
  );
  convert_1_8 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_8_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_8_dout_net
  );
  scale_1_10 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x2,
    op => scale_1_10_op_net
  );
  convert_1_10 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_10_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_10_dout_net
  );
  scale_1_11 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x1,
    op => scale_1_11_op_net
  );
  convert_1_11 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_11_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_11_dout_net
  );
  scale_1_12 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x0,
    op => scale_1_12_op_net
  );
  convert_1_12 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_12_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_12_dout_net
  );
  scale_1_13 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net,
    op => scale_1_13_op_net
  );
  convert_1_13 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_13_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_13_dout_net
  );
  scale_1_14 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x14,
    op => scale_1_14_op_net
  );
  convert_1_14 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_14_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_14_dout_net
  );
  scale_1_15 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x13,
    op => scale_1_15_op_net
  );
  convert_1_15 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_15_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_15_dout_net
  );
  scale_1_16 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x12,
    op => scale_1_16_op_net
  );
  convert_1_16 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_16_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_16_dout_net
  );
  scale_1_3 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x10,
    op => scale_1_3_op_net
  );
  convert_1_3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_3_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_3_dout_net
  );
  scale_1_4 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x9,
    op => scale_1_4_op_net
  );
  convert_1_4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_4_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_4_dout_net
  );
  scale_1_5 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x8,
    op => scale_1_5_op_net
  );
  convert_1_5 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_5_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_5_dout_net
  );
  scale_1_9 : entity xil_defaultlib.sysgen_scale_06f443f0cd 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    ip => addr3_s_net_x4,
    op => scale_1_9_op_net
  );
  convert_1_9 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert_pipeline 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 26,
    din_width => 27,
    dout_arith => 2,
    dout_bin_pt => 17,
    dout_width => 18,
    latency => 1,
    overflow => xlWrap,
    quantization => xlRoundBanker
  )
  port map (
    clr => '0',
    en => "1",
    din => scale_1_9_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_1_9_dout_net
  );
end structural;
-- Generated from Simulink block pfb_fir_4096c_16i_core_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_struct is
  port (
    pol_in : in std_logic_vector( 160-1 downto 0 );
    sync : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    pol_out : out std_logic_vector( 288-1 downto 0 );
    sync_out : out std_logic_vector( 1-1 downto 0 )
  );
end pfb_fir_4096c_16i_core_struct;
architecture structural of pfb_fir_4096c_16i_core_struct is 
  signal sync_net : std_logic_vector( 32-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal convert_1_1_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_2_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_3_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_4_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_5_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_6_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_7_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_8_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_9_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_10_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_11_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_12_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_13_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_14_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_15_dout_net : std_logic_vector( 18-1 downto 0 );
  signal convert_1_16_dout_net : std_logic_vector( 18-1 downto 0 );
  signal reinterpret16_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret15_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret14_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret13_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret12_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret11_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret10_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret9_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret8_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret7_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret6_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret5_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret4_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret3_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret2_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal reinterpret1_output_port_net : std_logic_vector( 10-1 downto 0 );
  signal slice_y_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert1_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert2_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert3_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert4_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert5_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert6_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert7_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert8_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert9_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert10_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert11_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert12_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert13_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert14_dout_net : std_logic_vector( 9-1 downto 0 );
  signal convert15_dout_net : std_logic_vector( 9-1 downto 0 );
  signal pol_in_net : std_logic_vector( 160-1 downto 0 );
  signal concatenate_y_net : std_logic_vector( 288-1 downto 0 );
begin
  pol_in_net <= pol_in;
  pol_out <= concatenate_y_net;
  sync_net <= sync;
  sync_out <= delay1_q_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  bus_create : entity xil_defaultlib.pfb_fir_4096c_16i_core_bus_create 
  port map (
    in1 => convert_1_1_dout_net,
    in2 => convert_1_2_dout_net,
    in3 => convert_1_3_dout_net,
    in4 => convert_1_4_dout_net,
    in5 => convert_1_5_dout_net,
    in6 => convert_1_6_dout_net,
    in7 => convert_1_7_dout_net,
    in8 => convert_1_8_dout_net,
    in9 => convert_1_9_dout_net,
    in10 => convert_1_10_dout_net,
    in11 => convert_1_11_dout_net,
    in12 => convert_1_12_dout_net,
    in13 => convert_1_13_dout_net,
    in14 => convert_1_14_dout_net,
    in15 => convert_1_15_dout_net,
    in16 => convert_1_16_dout_net,
    bus_out => concatenate_y_net
  );
  bus_expand : entity xil_defaultlib.pfb_fir_4096c_16i_core_bus_expand 
  port map (
    bus_in => pol_in_net,
    msb_out16 => reinterpret16_output_port_net,
    out15 => reinterpret15_output_port_net,
    out14 => reinterpret14_output_port_net,
    out13 => reinterpret13_output_port_net,
    out12 => reinterpret12_output_port_net,
    out11 => reinterpret11_output_port_net,
    out10 => reinterpret10_output_port_net,
    out9 => reinterpret9_output_port_net,
    out8 => reinterpret8_output_port_net,
    out7 => reinterpret7_output_port_net,
    out6 => reinterpret6_output_port_net,
    out5 => reinterpret5_output_port_net,
    out4 => reinterpret4_output_port_net,
    out3 => reinterpret3_output_port_net,
    out2 => reinterpret2_output_port_net,
    lsb_out1 => reinterpret1_output_port_net
  );
  pfb_fir_real : entity xil_defaultlib.pfb_fir_4096c_16i_core_pfb_fir_real 
  port map (
    sync => slice_y_net,
    pol1_in1 => convert_dout_net,
    pol1_in2 => convert1_dout_net,
    pol1_in3 => convert2_dout_net,
    pol1_in4 => convert3_dout_net,
    pol1_in5 => convert4_dout_net,
    pol1_in6 => convert5_dout_net,
    pol1_in7 => convert6_dout_net,
    pol1_in8 => convert7_dout_net,
    pol1_in9 => convert8_dout_net,
    pol1_in10 => convert9_dout_net,
    pol1_in11 => convert10_dout_net,
    pol1_in12 => convert11_dout_net,
    pol1_in13 => convert12_dout_net,
    pol1_in14 => convert13_dout_net,
    pol1_in15 => convert14_dout_net,
    pol1_in16 => convert15_dout_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    sync_out => delay1_q_net,
    pol1_out1 => convert_1_1_dout_net,
    pol1_out2 => convert_1_2_dout_net,
    pol1_out3 => convert_1_3_dout_net,
    pol1_out4 => convert_1_4_dout_net,
    pol1_out5 => convert_1_5_dout_net,
    pol1_out6 => convert_1_6_dout_net,
    pol1_out7 => convert_1_7_dout_net,
    pol1_out8 => convert_1_8_dout_net,
    pol1_out9 => convert_1_9_dout_net,
    pol1_out10 => convert_1_10_dout_net,
    pol1_out11 => convert_1_11_dout_net,
    pol1_out12 => convert_1_12_dout_net,
    pol1_out13 => convert_1_13_dout_net,
    pol1_out14 => convert_1_14_dout_net,
    pol1_out15 => convert_1_15_dout_net,
    pol1_out16 => convert_1_16_dout_net
  );
  convert : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret16_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
  convert1 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret15_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert1_dout_net
  );
  convert10 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret6_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert10_dout_net
  );
  convert11 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret5_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert11_dout_net
  );
  convert12 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret4_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert12_dout_net
  );
  convert13 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret3_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert13_dout_net
  );
  convert14 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret2_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert14_dout_net
  );
  convert15 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret1_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert15_dout_net
  );
  convert2 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret14_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert2_dout_net
  );
  convert3 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret13_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert3_dout_net
  );
  convert4 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret12_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert4_dout_net
  );
  convert5 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret11_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert5_dout_net
  );
  convert6 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret10_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert6_dout_net
  );
  convert7 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret9_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert7_dout_net
  );
  convert8 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret8_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert8_dout_net
  );
  convert9 : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 9,
    din_width => 10,
    dout_arith => 2,
    dout_bin_pt => 8,
    dout_width => 9,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => reinterpret7_output_port_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert9_dout_net
  );
  slice : entity xil_defaultlib.pfb_fir_4096c_16i_core_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 32,
    y_width => 1
  )
  port map (
    x => sync_net,
    y => slice_y_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core_default_clock_driver is
  port (
    pfb_fir_4096c_16i_core_sysclk : in std_logic;
    pfb_fir_4096c_16i_core_sysce : in std_logic;
    pfb_fir_4096c_16i_core_sysclr : in std_logic;
    pfb_fir_4096c_16i_core_clk1 : out std_logic;
    pfb_fir_4096c_16i_core_ce1 : out std_logic
  );
end pfb_fir_4096c_16i_core_default_clock_driver;
architecture structural of pfb_fir_4096c_16i_core_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => pfb_fir_4096c_16i_core_sysclk,
    sysce => pfb_fir_4096c_16i_core_sysce,
    sysclr => pfb_fir_4096c_16i_core_sysclr,
    clk => pfb_fir_4096c_16i_core_clk1,
    ce => pfb_fir_4096c_16i_core_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity pfb_fir_4096c_16i_core is
  port (
    pol_in : in std_logic_vector( 160-1 downto 0 );
    sync : in std_logic_vector( 32-1 downto 0 );
    clk : in std_logic;
    pol_out : out std_logic_vector( 288-1 downto 0 );
    sync_out : out std_logic_vector( 1-1 downto 0 )
  );
end pfb_fir_4096c_16i_core;
architecture structural of pfb_fir_4096c_16i_core is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "pfb_fir_4096c_16i_core,sysgen_core_2019_1,{,compilation=IP Catalog,block_icon_display=Default,family=kintexu,part=xcku115,speed=-2-e,package=flvf1924,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=5,system_simulink_period=1,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=10,addsub=48,concat=17,constant=240,convert=32,counter=112,delay=129,logical=48,mult=64,mux=48,register=16,reinterpret=224,relational=96,scale=16,slice=113,spram=48,sprom=64,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
begin
  pfb_fir_4096c_16i_core_default_clock_driver : entity xil_defaultlib.pfb_fir_4096c_16i_core_default_clock_driver 
  port map (
    pfb_fir_4096c_16i_core_sysclk => clk,
    pfb_fir_4096c_16i_core_sysce => '1',
    pfb_fir_4096c_16i_core_sysclr => '0',
    pfb_fir_4096c_16i_core_clk1 => clk_1_net,
    pfb_fir_4096c_16i_core_ce1 => ce_1_net
  );
  pfb_fir_4096c_16i_core_struct : entity xil_defaultlib.pfb_fir_4096c_16i_core_struct 
  port map (
    pol_in => pol_in,
    sync => sync,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    pol_out => pol_out,
    sync_out => sync_out
  );
end structural;
