-- Generated from Simulink block gpio_pins3/a
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_a is
  port (
    gpio_pins3_a_user_data_out : in std_logic_vector( 32-1 downto 0 );
    in_reg : out std_logic_vector( 32-1 downto 0 )
  );
end gpio_pins3_a;
architecture structural of gpio_pins3_a is 
  signal reint1_output_port_net : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_a_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
  signal slice_reg_y_net : std_logic_vector( 32-1 downto 0 );
begin
  in_reg <= reint1_output_port_net;
  gpio_pins3_a_user_data_out_net <= gpio_pins3_a_user_data_out;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => gpio_pins3_a_user_data_out_net,
    q => io_delay_q_net
  );
  slice_reg : entity xil_defaultlib.gpio_pins3_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 31,
    x_width => 32,
    y_width => 32
  )
  port map (
    x => io_delay_q_net,
    y => slice_reg_y_net
  );
  reint1 : entity xil_defaultlib.sysgen_reinterpret_13a8635f37 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_reg_y_net,
    output_port => reint1_output_port_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/b
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_b is
  port (
    gpio_pins3_b_user_data_out : in std_logic_vector( 32-1 downto 0 );
    in_reg : out std_logic_vector( 32-1 downto 0 )
  );
end gpio_pins3_b;
architecture structural of gpio_pins3_b is 
  signal reint1_output_port_net : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_b_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
  signal slice_reg_y_net : std_logic_vector( 32-1 downto 0 );
begin
  in_reg <= reint1_output_port_net;
  gpio_pins3_b_user_data_out_net <= gpio_pins3_b_user_data_out;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => gpio_pins3_b_user_data_out_net,
    q => io_delay_q_net
  );
  slice_reg : entity xil_defaultlib.gpio_pins3_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 31,
    x_width => 32,
    y_width => 32
  )
  port map (
    x => io_delay_q_net,
    y => slice_reg_y_net
  );
  reint1 : entity xil_defaultlib.sysgen_reinterpret_13a8635f37 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => slice_reg_y_net,
    output_port => reint1_output_port_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/edge_detect
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_edge_detect is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_edge_detect;
architecture structural of gpio_pins3_edge_detect is 
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= edge_op_y_net;
  slice_reg_y_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => slice_reg_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_ac628fe281 
  port map (
    clr => '0',
    ip => slice_reg_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  edge_op : entity xil_defaultlib.sysgen_logical_1d0500c979 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => delay_q_net,
    y => edge_op_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/edge_detect1
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_edge_detect1 is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_edge_detect1;
architecture structural of gpio_pins3_edge_detect1 is 
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_in_pin_gateway_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= edge_op_y_net;
  gpio_pins3_in_pin_gateway_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => gpio_pins3_in_pin_gateway_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_ac628fe281 
  port map (
    clr => '0',
    ip => gpio_pins3_in_pin_gateway_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  edge_op : entity xil_defaultlib.sysgen_logical_1d0500c979 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => delay_q_net,
    y => edge_op_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/edge_detect2
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_edge_detect2 is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_edge_detect2;
architecture structural of gpio_pins3_edge_detect2 is 
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= edge_op_y_net;
  slice_reg_y_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => slice_reg_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_ac628fe281 
  port map (
    clr => '0',
    ip => slice_reg_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  edge_op : entity xil_defaultlib.sysgen_logical_1d0500c979 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => delay_q_net,
    y => edge_op_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/edge_detect3
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_edge_detect3 is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_edge_detect3;
architecture structural of gpio_pins3_edge_detect3 is 
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= edge_op_y_net;
  relational_op_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_ac628fe281 
  port map (
    clr => '0',
    ip => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  edge_op : entity xil_defaultlib.sysgen_logical_1d0500c979 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => delay_q_net,
    y => edge_op_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/edge_detect4
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_edge_detect4 is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_edge_detect4;
architecture structural of gpio_pins3_edge_detect4 is 
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= edge_op_y_net;
  relational_op_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_ac628fe281 
  port map (
    clr => '0',
    ip => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  edge_op : entity xil_defaultlib.sysgen_logical_1e740d9cf8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => delay_q_net,
    y => edge_op_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/edge_detect5
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_edge_detect5 is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_edge_detect5;
architecture structural of gpio_pins3_edge_detect5 is 
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= edge_op_y_net;
  slice_reg_y_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => slice_reg_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_ac628fe281 
  port map (
    clr => '0',
    ip => slice_reg_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  edge_op : entity xil_defaultlib.sysgen_logical_1d0500c979 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => delay_q_net,
    y => edge_op_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/edge_detect6
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_edge_detect6 is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_edge_detect6;
architecture structural of gpio_pins3_edge_detect6 is 
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= edge_op_y_net;
  slice_reg_y_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => slice_reg_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_ac628fe281 
  port map (
    clr => '0',
    ip => slice_reg_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  edge_op : entity xil_defaultlib.sysgen_logical_1d0500c979 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => delay_q_net,
    y => edge_op_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/edge_detect7
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_edge_detect7 is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_edge_detect7;
architecture structural of gpio_pins3_edge_detect7 is 
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= edge_op_y_net;
  slice_reg_y_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => slice_reg_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_ac628fe281 
  port map (
    clr => '0',
    ip => slice_reg_y_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  edge_op : entity xil_defaultlib.sysgen_logical_1d0500c979 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => delay_q_net,
    y => edge_op_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/edgedetect9
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_edgedetect9 is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_edgedetect9;
architecture structural of gpio_pins3_edgedetect9 is 
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant13_op_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= edge_op_y_net;
  constant13_op_net <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => constant13_op_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_ac628fe281 
  port map (
    clr => '0',
    ip => constant13_op_net,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  edge_op : entity xil_defaultlib.sysgen_logical_1d0500c979 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => delay_q_net,
    y => edge_op_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/in_pin
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_in_pin is
  port (
    gpio_pins3_in_pin_gateway : in std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_in_pin;
architecture structural of gpio_pins3_in_pin is 
  signal gpio_pins3_in_pin_gateway_net : std_logic_vector( 1-1 downto 0 );
begin
  gpio_pins3_in_pin_gateway_net <= gpio_pins3_in_pin_gateway;
end structural;
-- Generated from Simulink block gpio_pins3/led0
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_led0 is
  port (
    gpio_out : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gpio_pins3_led0_gateway : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_led0;
architecture structural of gpio_pins3_led0 is 
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  relational_op_net <= gpio_out;
  gpio_pins3_led0_gateway <= convert_dout_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  convert : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 1,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 1,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => relational_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/one_gbe
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_one_gbe is
  port (
    tx_rst : in std_logic_vector( 1-1 downto 0 );
    rx_rst : in std_logic_vector( 1-1 downto 0 );
    tx_data : in std_logic_vector( 64-1 downto 0 );
    tx_val : in std_logic_vector( 1-1 downto 0 );
    tx_destip : in std_logic_vector( 64-1 downto 0 );
    tx_destport : in std_logic_vector( 64-1 downto 0 );
    tx_eof : in std_logic_vector( 1-1 downto 0 );
    rx_ack : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_ack : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_rst : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_data : out std_logic_vector( 8-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_destip : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_destport : out std_logic_vector( 16-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_dvld : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_eof : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_rst : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_one_gbe;
architecture structural of gpio_pins3_one_gbe is 
  signal constant5_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant7_op_net : std_logic_vector( 64-1 downto 0 );
  signal constant4_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant8_op_net : std_logic_vector( 64-1 downto 0 );
  signal constant9_op_net : std_logic_vector( 64-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant6_op_net : std_logic_vector( 1-1 downto 0 );
  signal convert_rx_ack_dout_net : std_logic_vector( 1-1 downto 0 );
  signal convert_rx_rst_dout_net : std_logic_vector( 1-1 downto 0 );
  signal convert_tx_data_dout_net : std_logic_vector( 8-1 downto 0 );
  signal convert_tx_dest_ip_dout_net : std_logic_vector( 32-1 downto 0 );
  signal convert_tx_port_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert_tx_valid_dout_net : std_logic_vector( 1-1 downto 0 );
  signal convert_tx_end_of_frame_dout_net : std_logic_vector( 1-1 downto 0 );
  signal convert_tx_rst_dout_net : std_logic_vector( 1-1 downto 0 );
begin
  constant6_op_net <= tx_rst;
  constant5_op_net <= rx_rst;
  constant7_op_net <= tx_data;
  constant4_op_net <= tx_val;
  constant8_op_net <= tx_destip;
  constant9_op_net <= tx_destport;
  constant3_op_net <= tx_eof;
  constant2_op_net <= rx_ack;
  gpio_pins3_one_gbe_app_rx_ack <= convert_rx_ack_dout_net;
  gpio_pins3_one_gbe_app_rx_rst <= convert_rx_rst_dout_net;
  gpio_pins3_one_gbe_app_tx_data <= convert_tx_data_dout_net;
  gpio_pins3_one_gbe_app_tx_destip <= convert_tx_dest_ip_dout_net;
  gpio_pins3_one_gbe_app_tx_destport <= convert_tx_port_dout_net;
  gpio_pins3_one_gbe_app_tx_dvld <= convert_tx_valid_dout_net;
  gpio_pins3_one_gbe_app_tx_eof <= convert_tx_end_of_frame_dout_net;
  gpio_pins3_one_gbe_app_tx_rst <= convert_tx_rst_dout_net;
  convert_rx_ack : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 1,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    en => "1",
    din => constant2_op_net,
    dout => convert_rx_ack_dout_net
  );
  convert_rx_rst : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 1,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    en => "1",
    din => constant5_op_net,
    dout => convert_rx_rst_dout_net
  );
  convert_tx_data : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 0,
    din_width => 64,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 8,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    en => "1",
    din => constant7_op_net,
    dout => convert_tx_data_dout_net
  );
  convert_tx_dest_ip : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 0,
    din_width => 64,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 32,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    en => "1",
    din => constant8_op_net,
    dout => convert_tx_dest_ip_dout_net
  );
  convert_tx_end_of_frame : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 1,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    en => "1",
    din => constant3_op_net,
    dout => convert_tx_end_of_frame_dout_net
  );
  convert_tx_port : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 2,
    din_bin_pt => 0,
    din_width => 64,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 16,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    en => "1",
    din => constant9_op_net,
    dout => convert_tx_port_dout_net
  );
  convert_tx_rst : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 1,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    en => "1",
    din => constant6_op_net,
    dout => convert_tx_rst_dout_net
  );
  convert_tx_valid : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 1,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 0,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clk => '1',
    ce => '1',
    clr => '0',
    en => "1",
    din => constant4_op_net,
    dout => convert_tx_valid_dout_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/out_pin
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_out_pin is
  port (
    gpio_out : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gpio_pins3_out_pin_gateway : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_out_pin;
architecture structural of gpio_pins3_out_pin is 
  signal relational5_op_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
begin
  relational5_op_net <= gpio_out;
  gpio_pins3_out_pin_gateway <= convert_dout_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  convert : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 1,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 1,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => relational5_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/pulse_ext/posedge
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_posedge is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_posedge;
architecture structural of gpio_pins3_posedge is 
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal inverter_op_net : std_logic_vector( 1-1 downto 0 );
begin
  out_x0 <= edge_op_y_net;
  edge_op_y_net_x0 <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => edge_op_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
  inverter : entity xil_defaultlib.sysgen_inverter_ac628fe281 
  port map (
    clr => '0',
    ip => edge_op_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => inverter_op_net
  );
  edge_op : entity xil_defaultlib.sysgen_logical_1d0500c979 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d0 => inverter_op_net,
    d1 => delay_q_net,
    y => edge_op_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/pulse_ext
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_pulse_ext is
  port (
    in_x0 : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_x0 : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_pulse_ext;
architecture structural of gpio_pins3_pulse_ext is 
  signal relational5_op_net : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal constant5_op_net : std_logic_vector( 10-1 downto 0 );
  signal counter3_op_net : std_logic_vector( 10-1 downto 0 );
begin
  out_x0 <= relational5_op_net;
  edge_op_y_net_x0 <= in_x0;
  clk_net <= clk_1;
  ce_net <= ce_1;
  posedge : entity xil_defaultlib.gpio_pins3_posedge 
  port map (
    in_x0 => edge_op_y_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => edge_op_y_net
  );
  constant5 : entity xil_defaultlib.sysgen_constant_5e39713d57 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant5_op_net
  );
  counter3 : entity xil_defaultlib.gpio_pins3_xlcounter_free 
  generic map (
    core_name0 => "gpio_pins3_c_counter_binary_v12_0_i2",
    op_arith => xlUnsigned,
    op_width => 10
  )
  port map (
    clr => '0',
    rst => edge_op_y_net,
    en => relational5_op_net,
    clk => clk_net,
    ce => ce_net,
    op => counter3_op_net
  );
  relational5 : entity xil_defaultlib.sysgen_relational_54362a63ae 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    a => counter3_op_net,
    b => constant5_op_net,
    op => relational5_op_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/readout_state_value
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_readout_state_value is
  port (
    out_reg : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gpio_pins3_readout_state_value_user_data_in : out std_logic_vector( 32-1 downto 0 )
  );
end gpio_pins3_readout_state_value;
architecture structural of gpio_pins3_readout_state_value is 
  signal assert_reg_dout_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal cast_gw_dout_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal io_delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal reint1_output_port_net : std_logic_vector( 1-1 downto 0 );
begin
  relational_op_net <= out_reg;
  gpio_pins3_readout_state_value_user_data_in <= cast_gw_dout_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  io_delay : entity xil_defaultlib.sysgen_delay_33c64eb62b 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => reint1_output_port_net,
    q => io_delay_q_net
  );
  cast_gw : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 32,
    latency => 1,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => io_delay_q_net,
    clk => clk_net,
    ce => ce_net,
    dout => cast_gw_dout_net
  );
  assert_reg : entity xil_defaultlib.xlpassthrough 
  generic map (
    din_width => 1,
    dout_width => 1
  )
  port map (
    din => relational_op_net,
    dout => assert_reg_dout_net
  );
  reint1 : entity xil_defaultlib.sysgen_reinterpret_7c4c2ea2a8 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => assert_reg_dout_net,
    output_port => reint1_output_port_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/reset_to_listen
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_reset_to_listen is
  port (
    gpio_pins3_reset_to_listen_user_data_out : in std_logic_vector( 32-1 downto 0 );
    in_reg : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_reset_to_listen;
architecture structural of gpio_pins3_reset_to_listen is 
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_reset_to_listen_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
begin
  in_reg <= slice_reg_y_net;
  gpio_pins3_reset_to_listen_user_data_out_net <= gpio_pins3_reset_to_listen_user_data_out;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => gpio_pins3_reset_to_listen_user_data_out_net,
    q => io_delay_q_net
  );
  slice_reg : entity xil_defaultlib.gpio_pins3_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 32,
    y_width => 1
  )
  port map (
    x => io_delay_q_net,
    y => slice_reg_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/send_trigger
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_send_trigger is
  port (
    gpio_pins3_send_trigger_user_data_out : in std_logic_vector( 32-1 downto 0 );
    in_reg : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_send_trigger;
architecture structural of gpio_pins3_send_trigger is 
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_send_trigger_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
begin
  in_reg <= slice_reg_y_net;
  gpio_pins3_send_trigger_user_data_out_net <= gpio_pins3_send_trigger_user_data_out;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => gpio_pins3_send_trigger_user_data_out_net,
    q => io_delay_q_net
  );
  slice_reg : entity xil_defaultlib.gpio_pins3_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 32,
    y_width => 1
  )
  port map (
    x => io_delay_q_net,
    y => slice_reg_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/snapshot_count_reset
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_snapshot_count_reset is
  port (
    gpio_pins3_snapshot_count_reset_user_data_out : in std_logic_vector( 32-1 downto 0 );
    in_reg : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_snapshot_count_reset;
architecture structural of gpio_pins3_snapshot_count_reset is 
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_snapshot_count_reset_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
begin
  in_reg <= slice_reg_y_net;
  gpio_pins3_snapshot_count_reset_user_data_out_net <= gpio_pins3_snapshot_count_reset_user_data_out;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => gpio_pins3_snapshot_count_reset_user_data_out_net,
    q => io_delay_q_net
  );
  slice_reg : entity xil_defaultlib.gpio_pins3_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 32,
    y_width => 1
  )
  port map (
    x => io_delay_q_net,
    y => slice_reg_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/snapshot_counter
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_snapshot_counter is
  port (
    out_reg : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gpio_pins3_snapshot_counter_user_data_in : out std_logic_vector( 32-1 downto 0 )
  );
end gpio_pins3_snapshot_counter;
architecture structural of gpio_pins3_snapshot_counter is 
  signal assert_reg_dout_net : std_logic_vector( 32-1 downto 0 );
  signal snapshot_count_op_net : std_logic_vector( 32-1 downto 0 );
  signal cast_gw_dout_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
  signal reint1_output_port_net : std_logic_vector( 32-1 downto 0 );
begin
  snapshot_count_op_net <= out_reg;
  gpio_pins3_snapshot_counter_user_data_in <= cast_gw_dout_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => reint1_output_port_net,
    q => io_delay_q_net
  );
  cast_gw : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 32,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 32,
    latency => 1,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => io_delay_q_net,
    clk => clk_net,
    ce => ce_net,
    dout => cast_gw_dout_net
  );
  assert_reg : entity xil_defaultlib.xlpassthrough 
  generic map (
    din_width => 32,
    dout_width => 32
  )
  port map (
    din => snapshot_count_op_net,
    dout => assert_reg_dout_net
  );
  reint1 : entity xil_defaultlib.sysgen_reinterpret_13a8635f37 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => assert_reg_dout_net,
    output_port => reint1_output_port_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/sum_ab
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_sum_ab is
  port (
    out_reg : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gpio_pins3_sum_ab_user_data_in : out std_logic_vector( 32-1 downto 0 )
  );
end gpio_pins3_sum_ab;
architecture structural of gpio_pins3_sum_ab is 
  signal addsub_s_net : std_logic_vector( 32-1 downto 0 );
  signal cast_gw_dout_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
  signal reint1_output_port_net : std_logic_vector( 32-1 downto 0 );
  signal assert_reg_dout_net : std_logic_vector( 32-1 downto 0 );
begin
  addsub_s_net <= out_reg;
  gpio_pins3_sum_ab_user_data_in <= cast_gw_dout_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => reint1_output_port_net,
    q => io_delay_q_net
  );
  cast_gw : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 32,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 32,
    latency => 1,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => io_delay_q_net,
    clk => clk_net,
    ce => ce_net,
    dout => cast_gw_dout_net
  );
  assert_reg : entity xil_defaultlib.xlpassthrough 
  generic map (
    din_width => 32,
    dout_width => 32
  )
  port map (
    din => addsub_s_net,
    dout => assert_reg_dout_net
  );
  reint1 : entity xil_defaultlib.sysgen_reinterpret_13a8635f37 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => assert_reg_dout_net,
    output_port => reint1_output_port_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/trig_debug_reset
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_trig_debug_reset is
  port (
    gpio_pins3_trig_debug_reset_user_data_out : in std_logic_vector( 32-1 downto 0 );
    in_reg : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_trig_debug_reset;
architecture structural of gpio_pins3_trig_debug_reset is 
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_trig_debug_reset_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
begin
  in_reg <= slice_reg_y_net;
  gpio_pins3_trig_debug_reset_user_data_out_net <= gpio_pins3_trig_debug_reset_user_data_out;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => gpio_pins3_trig_debug_reset_user_data_out_net,
    q => io_delay_q_net
  );
  slice_reg : entity xil_defaultlib.gpio_pins3_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 32,
    y_width => 1
  )
  port map (
    x => io_delay_q_net,
    y => slice_reg_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/trig_debug_timer
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_trig_debug_timer is
  port (
    out_reg : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gpio_pins3_trig_debug_timer_user_data_in : out std_logic_vector( 32-1 downto 0 )
  );
end gpio_pins3_trig_debug_timer;
architecture structural of gpio_pins3_trig_debug_timer is 
  signal trigger_timer_op_net : std_logic_vector( 32-1 downto 0 );
  signal cast_gw_dout_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
  signal reint1_output_port_net : std_logic_vector( 32-1 downto 0 );
  signal assert_reg_dout_net : std_logic_vector( 32-1 downto 0 );
begin
  trigger_timer_op_net <= out_reg;
  gpio_pins3_trig_debug_timer_user_data_in <= cast_gw_dout_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => reint1_output_port_net,
    q => io_delay_q_net
  );
  cast_gw : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 32,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 32,
    latency => 1,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => io_delay_q_net,
    clk => clk_net,
    ce => ce_net,
    dout => cast_gw_dout_net
  );
  assert_reg : entity xil_defaultlib.xlpassthrough 
  generic map (
    din_width => 32,
    dout_width => 32
  )
  port map (
    din => trigger_timer_op_net,
    dout => assert_reg_dout_net
  );
  reint1 : entity xil_defaultlib.sysgen_reinterpret_13a8635f37 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => assert_reg_dout_net,
    output_port => reint1_output_port_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/trig_debug_timer_reset
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_trig_debug_timer_reset is
  port (
    gpio_pins3_trig_debug_timer_reset_user_data_out : in std_logic_vector( 32-1 downto 0 );
    in_reg : out std_logic_vector( 1-1 downto 0 )
  );
end gpio_pins3_trig_debug_timer_reset;
architecture structural of gpio_pins3_trig_debug_timer_reset is 
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_trig_debug_timer_reset_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
begin
  in_reg <= slice_reg_y_net;
  gpio_pins3_trig_debug_timer_reset_user_data_out_net <= gpio_pins3_trig_debug_timer_reset_user_data_out;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => gpio_pins3_trig_debug_timer_reset_user_data_out_net,
    q => io_delay_q_net
  );
  slice_reg : entity xil_defaultlib.gpio_pins3_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 0,
    x_width => 32,
    y_width => 1
  )
  port map (
    x => io_delay_q_net,
    y => slice_reg_y_net
  );
end structural;
-- Generated from Simulink block gpio_pins3/trig_debug_trig_rec_count
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_trig_debug_trig_rec_count is
  port (
    out_reg : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gpio_pins3_trig_debug_trig_rec_count_user_data_in : out std_logic_vector( 32-1 downto 0 )
  );
end gpio_pins3_trig_debug_trig_rec_count;
architecture structural of gpio_pins3_trig_debug_trig_rec_count is 
  signal trig_received_count_op_net : std_logic_vector( 32-1 downto 0 );
  signal cast_gw_dout_net : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal io_delay_q_net : std_logic_vector( 32-1 downto 0 );
  signal reint1_output_port_net : std_logic_vector( 32-1 downto 0 );
  signal assert_reg_dout_net : std_logic_vector( 32-1 downto 0 );
begin
  trig_received_count_op_net <= out_reg;
  gpio_pins3_trig_debug_trig_rec_count_user_data_in <= cast_gw_dout_net;
  clk_net <= clk_1;
  ce_net <= ce_1;
  io_delay : entity xil_defaultlib.sysgen_delay_c1f8da4b81 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    d => reint1_output_port_net,
    q => io_delay_q_net
  );
  cast_gw : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 0,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 32,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 32,
    latency => 1,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => io_delay_q_net,
    clk => clk_net,
    ce => ce_net,
    dout => cast_gw_dout_net
  );
  assert_reg : entity xil_defaultlib.xlpassthrough 
  generic map (
    din_width => 32,
    dout_width => 32
  )
  port map (
    din => trig_received_count_op_net,
    dout => assert_reg_dout_net
  );
  reint1 : entity xil_defaultlib.sysgen_reinterpret_13a8635f37 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    input_port => assert_reg_dout_net,
    output_port => reint1_output_port_net
  );
end structural;
-- Generated from Simulink block gpio_pins3_struct
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_struct is
  port (
    gpio_pins3_a_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_b_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_in_pin_gateway : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_dbg_data : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_one_gbe_app_dbg_dvld : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_badframe : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_data : in std_logic_vector( 8-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_dvld : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_eof : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_overrun : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_srcip : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_srcport : in std_logic_vector( 16-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_afull : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_overflow : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_reset_to_listen_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_send_trigger_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_snapshot_count_reset_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_trig_debug_reset_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_trig_debug_timer_reset_user_data_out : in std_logic_vector( 32-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    gpio_pins3_led0_gateway : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_ack : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_rst : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_data : out std_logic_vector( 8-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_destip : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_destport : out std_logic_vector( 16-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_dvld : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_eof : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_rst : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_out_pin_gateway : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_readout_state_value_user_data_in : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_snapshot_counter_user_data_in : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_sum_ab_user_data_in : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_trig_debug_timer_user_data_in : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_trig_debug_trig_rec_count_user_data_in : out std_logic_vector( 32-1 downto 0 )
  );
end gpio_pins3_struct;
architecture structural of gpio_pins3_struct is 
  signal gpio_pins3_a_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_b_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_in_pin_gateway_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_one_gbe_app_dbg_data_net : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_one_gbe_app_dbg_dvld_net : std_logic_vector( 1-1 downto 0 );
  signal convert_rx_ack_dout_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_one_gbe_app_rx_badframe_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_one_gbe_app_rx_data_net : std_logic_vector( 8-1 downto 0 );
  signal gpio_pins3_one_gbe_app_rx_dvld_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_one_gbe_app_rx_eof_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_one_gbe_app_rx_overrun_net : std_logic_vector( 1-1 downto 0 );
  signal convert_rx_rst_dout_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_one_gbe_app_rx_srcip_net : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_one_gbe_app_rx_srcport_net : std_logic_vector( 16-1 downto 0 );
  signal gpio_pins3_one_gbe_app_tx_afull_net : std_logic_vector( 1-1 downto 0 );
  signal convert_tx_data_dout_net : std_logic_vector( 8-1 downto 0 );
  signal convert_tx_dest_ip_dout_net : std_logic_vector( 32-1 downto 0 );
  signal convert_tx_port_dout_net : std_logic_vector( 16-1 downto 0 );
  signal convert_tx_valid_dout_net : std_logic_vector( 1-1 downto 0 );
  signal convert_tx_end_of_frame_dout_net : std_logic_vector( 1-1 downto 0 );
  signal gpio_pins3_one_gbe_app_tx_overflow_net : std_logic_vector( 1-1 downto 0 );
  signal convert_tx_rst_dout_net : std_logic_vector( 1-1 downto 0 );
  signal convert_dout_net : std_logic_vector( 1-1 downto 0 );
  signal cast_gw_dout_net : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_reset_to_listen_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_send_trigger_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_snapshot_count_reset_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal cast_gw_dout_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal cast_gw_dout_net_x1 : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_trig_debug_reset_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal cast_gw_dout_net_x3 : std_logic_vector( 32-1 downto 0 );
  signal gpio_pins3_trig_debug_timer_reset_user_data_out_net : std_logic_vector( 32-1 downto 0 );
  signal cast_gw_dout_net_x2 : std_logic_vector( 32-1 downto 0 );
  signal clk_net : std_logic;
  signal ce_net : std_logic;
  signal reint1_output_port_net : std_logic_vector( 32-1 downto 0 );
  signal reint1_output_port_net_x0 : std_logic_vector( 32-1 downto 0 );
  signal edge_op_y_net_x6 : std_logic_vector( 1-1 downto 0 );
  signal slice_reg_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net_x7 : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net_x5 : std_logic_vector( 1-1 downto 0 );
  signal slice_reg_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net : std_logic_vector( 1-1 downto 0 );
  signal relational_op_net : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal slice_reg_y_net : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net_x2 : std_logic_vector( 1-1 downto 0 );
  signal slice_reg_y_net_x2 : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net_x3 : std_logic_vector( 1-1 downto 0 );
  signal slice_reg_y_net_x3 : std_logic_vector( 1-1 downto 0 );
  signal edge_op_y_net_x4 : std_logic_vector( 1-1 downto 0 );
  signal constant13_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant6_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant5_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant7_op_net : std_logic_vector( 64-1 downto 0 );
  signal constant4_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant8_op_net : std_logic_vector( 64-1 downto 0 );
  signal constant9_op_net : std_logic_vector( 64-1 downto 0 );
  signal constant3_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant2_op_net : std_logic_vector( 1-1 downto 0 );
  signal relational5_op_net : std_logic_vector( 1-1 downto 0 );
  signal snapshot_count_op_net : std_logic_vector( 32-1 downto 0 );
  signal addsub_s_net : std_logic_vector( 32-1 downto 0 );
  signal trigger_timer_op_net : std_logic_vector( 32-1 downto 0 );
  signal trig_received_count_op_net : std_logic_vector( 32-1 downto 0 );
  signal constant11_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant20_op_net : std_logic_vector( 64-1 downto 0 );
  signal convert_dout_net_x1 : std_logic_vector( 1-1 downto 0 );
  signal trigger_timer_control_op_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal state_control_count_op_net : std_logic_vector( 64-1 downto 0 );
  signal logical2_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay_q_net : std_logic_vector( 1-1 downto 0 );
  signal relational1_op_net : std_logic_vector( 1-1 downto 0 );
  signal constant21_op_net : std_logic_vector( 32-1 downto 0 );
begin
  gpio_pins3_a_user_data_out_net <= gpio_pins3_a_user_data_out;
  gpio_pins3_b_user_data_out_net <= gpio_pins3_b_user_data_out;
  gpio_pins3_in_pin_gateway_net <= gpio_pins3_in_pin_gateway;
  gpio_pins3_led0_gateway <= convert_dout_net_x0;
  gpio_pins3_one_gbe_app_dbg_data_net <= gpio_pins3_one_gbe_app_dbg_data;
  gpio_pins3_one_gbe_app_dbg_dvld_net <= gpio_pins3_one_gbe_app_dbg_dvld;
  gpio_pins3_one_gbe_app_rx_ack <= convert_rx_ack_dout_net;
  gpio_pins3_one_gbe_app_rx_badframe_net <= gpio_pins3_one_gbe_app_rx_badframe;
  gpio_pins3_one_gbe_app_rx_data_net <= gpio_pins3_one_gbe_app_rx_data;
  gpio_pins3_one_gbe_app_rx_dvld_net <= gpio_pins3_one_gbe_app_rx_dvld;
  gpio_pins3_one_gbe_app_rx_eof_net <= gpio_pins3_one_gbe_app_rx_eof;
  gpio_pins3_one_gbe_app_rx_overrun_net <= gpio_pins3_one_gbe_app_rx_overrun;
  gpio_pins3_one_gbe_app_rx_rst <= convert_rx_rst_dout_net;
  gpio_pins3_one_gbe_app_rx_srcip_net <= gpio_pins3_one_gbe_app_rx_srcip;
  gpio_pins3_one_gbe_app_rx_srcport_net <= gpio_pins3_one_gbe_app_rx_srcport;
  gpio_pins3_one_gbe_app_tx_afull_net <= gpio_pins3_one_gbe_app_tx_afull;
  gpio_pins3_one_gbe_app_tx_data <= convert_tx_data_dout_net;
  gpio_pins3_one_gbe_app_tx_destip <= convert_tx_dest_ip_dout_net;
  gpio_pins3_one_gbe_app_tx_destport <= convert_tx_port_dout_net;
  gpio_pins3_one_gbe_app_tx_dvld <= convert_tx_valid_dout_net;
  gpio_pins3_one_gbe_app_tx_eof <= convert_tx_end_of_frame_dout_net;
  gpio_pins3_one_gbe_app_tx_overflow_net <= gpio_pins3_one_gbe_app_tx_overflow;
  gpio_pins3_one_gbe_app_tx_rst <= convert_tx_rst_dout_net;
  gpio_pins3_out_pin_gateway <= convert_dout_net;
  gpio_pins3_readout_state_value_user_data_in <= cast_gw_dout_net;
  gpio_pins3_reset_to_listen_user_data_out_net <= gpio_pins3_reset_to_listen_user_data_out;
  gpio_pins3_send_trigger_user_data_out_net <= gpio_pins3_send_trigger_user_data_out;
  gpio_pins3_snapshot_count_reset_user_data_out_net <= gpio_pins3_snapshot_count_reset_user_data_out;
  gpio_pins3_snapshot_counter_user_data_in <= cast_gw_dout_net_x0;
  gpio_pins3_sum_ab_user_data_in <= cast_gw_dout_net_x1;
  gpio_pins3_trig_debug_reset_user_data_out_net <= gpio_pins3_trig_debug_reset_user_data_out;
  gpio_pins3_trig_debug_timer_user_data_in <= cast_gw_dout_net_x3;
  gpio_pins3_trig_debug_timer_reset_user_data_out_net <= gpio_pins3_trig_debug_timer_reset_user_data_out;
  gpio_pins3_trig_debug_trig_rec_count_user_data_in <= cast_gw_dout_net_x2;
  clk_net <= clk_1;
  ce_net <= ce_1;
  a : entity xil_defaultlib.gpio_pins3_a 
  port map (
    gpio_pins3_a_user_data_out => gpio_pins3_a_user_data_out_net,
    in_reg => reint1_output_port_net
  );
  b : entity xil_defaultlib.gpio_pins3_b 
  port map (
    gpio_pins3_b_user_data_out => gpio_pins3_b_user_data_out_net,
    in_reg => reint1_output_port_net_x0
  );
  edge_detect : entity xil_defaultlib.gpio_pins3_edge_detect 
  port map (
    in_x0 => slice_reg_y_net_x0,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => edge_op_y_net_x6
  );
  edge_detect1 : entity xil_defaultlib.gpio_pins3_edge_detect1 
  port map (
    in_x0 => gpio_pins3_in_pin_gateway_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => edge_op_y_net_x7
  );
  edge_detect2 : entity xil_defaultlib.gpio_pins3_edge_detect2 
  port map (
    in_x0 => slice_reg_y_net_x1,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => edge_op_y_net_x5
  );
  edge_detect3 : entity xil_defaultlib.gpio_pins3_edge_detect3 
  port map (
    in_x0 => relational_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => edge_op_y_net
  );
  edge_detect4 : entity xil_defaultlib.gpio_pins3_edge_detect4 
  port map (
    in_x0 => relational_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => edge_op_y_net_x0
  );
  edge_detect5 : entity xil_defaultlib.gpio_pins3_edge_detect5 
  port map (
    in_x0 => slice_reg_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => edge_op_y_net_x1
  );
  edge_detect6 : entity xil_defaultlib.gpio_pins3_edge_detect6 
  port map (
    in_x0 => slice_reg_y_net_x2,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => edge_op_y_net_x2
  );
  edge_detect7 : entity xil_defaultlib.gpio_pins3_edge_detect7 
  port map (
    in_x0 => slice_reg_y_net_x3,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => edge_op_y_net_x3
  );
  edgedetect9 : entity xil_defaultlib.gpio_pins3_edgedetect9 
  port map (
    in_x0 => constant13_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => edge_op_y_net_x4
  );
  in_pin : entity xil_defaultlib.gpio_pins3_in_pin 
  port map (
    gpio_pins3_in_pin_gateway => gpio_pins3_in_pin_gateway_net
  );
  led0 : entity xil_defaultlib.gpio_pins3_led0 
  port map (
    gpio_out => relational_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gpio_pins3_led0_gateway => convert_dout_net_x0
  );
  one_gbe : entity xil_defaultlib.gpio_pins3_one_gbe 
  port map (
    tx_rst => constant6_op_net,
    rx_rst => constant5_op_net,
    tx_data => constant7_op_net,
    tx_val => constant4_op_net,
    tx_destip => constant8_op_net,
    tx_destport => constant9_op_net,
    tx_eof => constant3_op_net,
    rx_ack => constant2_op_net,
    gpio_pins3_one_gbe_app_rx_ack => convert_rx_ack_dout_net,
    gpio_pins3_one_gbe_app_rx_rst => convert_rx_rst_dout_net,
    gpio_pins3_one_gbe_app_tx_data => convert_tx_data_dout_net,
    gpio_pins3_one_gbe_app_tx_destip => convert_tx_dest_ip_dout_net,
    gpio_pins3_one_gbe_app_tx_destport => convert_tx_port_dout_net,
    gpio_pins3_one_gbe_app_tx_dvld => convert_tx_valid_dout_net,
    gpio_pins3_one_gbe_app_tx_eof => convert_tx_end_of_frame_dout_net,
    gpio_pins3_one_gbe_app_tx_rst => convert_tx_rst_dout_net
  );
  out_pin : entity xil_defaultlib.gpio_pins3_out_pin 
  port map (
    gpio_out => relational5_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gpio_pins3_out_pin_gateway => convert_dout_net
  );
  pulse_ext : entity xil_defaultlib.gpio_pins3_pulse_ext 
  port map (
    in_x0 => edge_op_y_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    out_x0 => relational5_op_net
  );
  readout_state_value : entity xil_defaultlib.gpio_pins3_readout_state_value 
  port map (
    out_reg => relational_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gpio_pins3_readout_state_value_user_data_in => cast_gw_dout_net
  );
  reset_to_listen : entity xil_defaultlib.gpio_pins3_reset_to_listen 
  port map (
    gpio_pins3_reset_to_listen_user_data_out => gpio_pins3_reset_to_listen_user_data_out_net,
    in_reg => slice_reg_y_net_x1
  );
  send_trigger : entity xil_defaultlib.gpio_pins3_send_trigger 
  port map (
    gpio_pins3_send_trigger_user_data_out => gpio_pins3_send_trigger_user_data_out_net,
    in_reg => slice_reg_y_net_x0
  );
  snapshot_count_reset : entity xil_defaultlib.gpio_pins3_snapshot_count_reset 
  port map (
    gpio_pins3_snapshot_count_reset_user_data_out => gpio_pins3_snapshot_count_reset_user_data_out_net,
    in_reg => slice_reg_y_net
  );
  snapshot_counter : entity xil_defaultlib.gpio_pins3_snapshot_counter 
  port map (
    out_reg => snapshot_count_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gpio_pins3_snapshot_counter_user_data_in => cast_gw_dout_net_x0
  );
  sum_ab : entity xil_defaultlib.gpio_pins3_sum_ab 
  port map (
    out_reg => addsub_s_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gpio_pins3_sum_ab_user_data_in => cast_gw_dout_net_x1
  );
  trig_debug_reset : entity xil_defaultlib.gpio_pins3_trig_debug_reset 
  port map (
    gpio_pins3_trig_debug_reset_user_data_out => gpio_pins3_trig_debug_reset_user_data_out_net,
    in_reg => slice_reg_y_net_x2
  );
  trig_debug_timer : entity xil_defaultlib.gpio_pins3_trig_debug_timer 
  port map (
    out_reg => trigger_timer_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gpio_pins3_trig_debug_timer_user_data_in => cast_gw_dout_net_x3
  );
  trig_debug_timer_reset : entity xil_defaultlib.gpio_pins3_trig_debug_timer_reset 
  port map (
    gpio_pins3_trig_debug_timer_reset_user_data_out => gpio_pins3_trig_debug_timer_reset_user_data_out_net,
    in_reg => slice_reg_y_net_x3
  );
  trig_debug_trig_rec_count : entity xil_defaultlib.gpio_pins3_trig_debug_trig_rec_count 
  port map (
    out_reg => trig_received_count_op_net,
    clk_1 => clk_net,
    ce_1 => ce_net,
    gpio_pins3_trig_debug_trig_rec_count_user_data_in => cast_gw_dout_net_x2
  );
  addsub : entity xil_defaultlib.gpio_pins3_xladdsub 
  generic map (
    a_arith => xlUnsigned,
    a_bin_pt => 0,
    a_width => 32,
    b_arith => xlUnsigned,
    b_bin_pt => 0,
    b_width => 32,
    c_has_c_out => 0,
    c_latency => 1,
    c_output_width => 33,
    core_name0 => "gpio_pins3_c_addsub_v12_0_i0",
    extra_registers => 0,
    full_s_arith => 1,
    full_s_width => 33,
    latency => 1,
    overflow => 2,
    quantization => 1,
    s_arith => xlUnsigned,
    s_bin_pt => 0,
    s_width => 32
  )
  port map (
    clr => '0',
    en => "1",
    a => reint1_output_port_net,
    b => reint1_output_port_net_x0,
    clk => clk_net,
    ce => ce_net,
    s => addsub_s_net
  );
  constant11 : entity xil_defaultlib.sysgen_constant_52c83d5d86 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant11_op_net
  );
  constant13 : entity xil_defaultlib.sysgen_constant_52c83d5d86 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant13_op_net
  );
  constant2 : entity xil_defaultlib.sysgen_constant_52c83d5d86 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant2_op_net
  );
  constant20 : entity xil_defaultlib.sysgen_constant_18e1eb608f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant20_op_net
  );
  constant3 : entity xil_defaultlib.sysgen_constant_52c83d5d86 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant3_op_net
  );
  constant4 : entity xil_defaultlib.sysgen_constant_52c83d5d86 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant4_op_net
  );
  constant5 : entity xil_defaultlib.sysgen_constant_52c83d5d86 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant5_op_net
  );
  constant6 : entity xil_defaultlib.sysgen_constant_52c83d5d86 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant6_op_net
  );
  constant7 : entity xil_defaultlib.sysgen_constant_18e1eb608f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant7_op_net
  );
  constant8 : entity xil_defaultlib.sysgen_constant_18e1eb608f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant8_op_net
  );
  constant9 : entity xil_defaultlib.sysgen_constant_18e1eb608f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant9_op_net
  );
  convert : entity xil_defaultlib.gpio_pins3_xlconvert 
  generic map (
    bool_conversion => 1,
    din_arith => 1,
    din_bin_pt => 0,
    din_width => 1,
    dout_arith => 1,
    dout_bin_pt => 0,
    dout_width => 1,
    latency => 1,
    overflow => xlWrap,
    quantization => xlTruncate
  )
  port map (
    clr => '0',
    en => "1",
    din => trigger_timer_control_op_net,
    clk => clk_net,
    ce => ce_net,
    dout => convert_dout_net_x1
  );
  logical : entity xil_defaultlib.sysgen_logical_02becefdd4 
  port map (
    clr => '0',
    d0 => constant11_op_net,
    d1 => edge_op_y_net_x6,
    d2 => edge_op_y_net_x7,
    clk => clk_net,
    ce => ce_net,
    y => logical_y_net
  );
  logical1 : entity xil_defaultlib.sysgen_logical_7f90ee1858 
  port map (
    clr => '0',
    d0 => edge_op_y_net_x5,
    d1 => edge_op_y_net_x4,
    clk => clk_net,
    ce => ce_net,
    y => logical1_y_net
  );
  relational : entity xil_defaultlib.sysgen_relational_2fc7ea31ae 
  port map (
    clr => '0',
    a => state_control_count_op_net,
    b => constant20_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational_op_net
  );
  snapshot_count : entity xil_defaultlib.gpio_pins3_xlcounter_free 
  generic map (
    core_name0 => "gpio_pins3_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 32
  )
  port map (
    clr => '0',
    rst => edge_op_y_net_x1,
    en => edge_op_y_net_x0,
    clk => clk_net,
    ce => ce_net,
    op => snapshot_count_op_net
  );
  state_control_count : entity xil_defaultlib.gpio_pins3_xlcounter_free 
  generic map (
    core_name0 => "gpio_pins3_c_counter_binary_v12_0_i1",
    op_arith => xlUnsigned,
    op_width => 64
  )
  port map (
    clr => '0',
    rst => logical1_y_net,
    en => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    op => state_control_count_op_net
  );
  trig_received_count : entity xil_defaultlib.gpio_pins3_xlcounter_free 
  generic map (
    core_name0 => "gpio_pins3_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 32
  )
  port map (
    clr => '0',
    rst => edge_op_y_net_x2,
    en => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    op => trig_received_count_op_net
  );
  trigger_timer : entity xil_defaultlib.gpio_pins3_xlcounter_free 
  generic map (
    core_name0 => "gpio_pins3_c_counter_binary_v12_0_i0",
    op_arith => xlUnsigned,
    op_width => 32
  )
  port map (
    clr => '0',
    rst => edge_op_y_net_x3,
    en => convert_dout_net_x1,
    clk => clk_net,
    ce => ce_net,
    op => trigger_timer_op_net
  );
  trigger_timer_control : entity xil_defaultlib.sysgen_counter_fd0bb67de7 
  port map (
    clr => '0',
    rst => edge_op_y_net_x3,
    en => logical2_y_net,
    clk => clk_net,
    ce => ce_net,
    op => trigger_timer_control_op_net
  );
  logical2 : entity xil_defaultlib.sysgen_logical_0c07d298b5 
  port map (
    clr => '0',
    d0 => delay_q_net,
    d1 => relational1_op_net,
    clk => clk_net,
    ce => ce_net,
    y => logical2_y_net
  );
  relational1 : entity xil_defaultlib.sysgen_relational_2d7aefe8eb 
  port map (
    clr => '0',
    a => trig_received_count_op_net,
    b => constant21_op_net,
    clk => clk_net,
    ce => ce_net,
    op => relational1_op_net
  );
  constant21 : entity xil_defaultlib.sysgen_constant_794d10cc5f 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant21_op_net
  );
  delay : entity xil_defaultlib.gpio_pins3_xldelay 
  generic map (
    latency => 2,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
    d => logical_y_net,
    clk => clk_net,
    ce => ce_net,
    q => delay_q_net
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3_default_clock_driver is
  port (
    gpio_pins3_sysclk : in std_logic;
    gpio_pins3_sysce : in std_logic;
    gpio_pins3_sysclr : in std_logic;
    gpio_pins3_clk1 : out std_logic;
    gpio_pins3_ce1 : out std_logic
  );
end gpio_pins3_default_clock_driver;
architecture structural of gpio_pins3_default_clock_driver is 
begin
  clockdriver : entity xil_defaultlib.xlclockdriver 
  generic map (
    period => 1,
    log_2_period => 1
  )
  port map (
    sysclk => gpio_pins3_sysclk,
    sysce => gpio_pins3_sysce,
    sysclr => gpio_pins3_sysclr,
    clk => gpio_pins3_clk1,
    ce => gpio_pins3_ce1
  );
end structural;
-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity gpio_pins3 is
  port (
    gpio_pins3_a_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_b_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_in_pin_gateway : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_dbg_data : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_one_gbe_app_dbg_dvld : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_badframe : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_data : in std_logic_vector( 8-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_dvld : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_eof : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_overrun : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_srcip : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_srcport : in std_logic_vector( 16-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_afull : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_overflow : in std_logic_vector( 1-1 downto 0 );
    gpio_pins3_reset_to_listen_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_send_trigger_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_snapshot_count_reset_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_trig_debug_reset_user_data_out : in std_logic_vector( 32-1 downto 0 );
    gpio_pins3_trig_debug_timer_reset_user_data_out : in std_logic_vector( 32-1 downto 0 );
    clk : in std_logic;
    gpio_pins3_led0_gateway : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_ack : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_rx_rst : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_data : out std_logic_vector( 8-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_destip : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_destport : out std_logic_vector( 16-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_dvld : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_eof : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_one_gbe_app_tx_rst : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_out_pin_gateway : out std_logic_vector( 1-1 downto 0 );
    gpio_pins3_readout_state_value_user_data_in : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_snapshot_counter_user_data_in : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_sum_ab_user_data_in : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_trig_debug_timer_user_data_in : out std_logic_vector( 32-1 downto 0 );
    gpio_pins3_trig_debug_trig_rec_count_user_data_in : out std_logic_vector( 32-1 downto 0 )
  );
end gpio_pins3;
architecture structural of gpio_pins3 is 
  attribute core_generation_info : string;
  attribute core_generation_info of structural : architecture is "gpio_pins3,sysgen_core_2019_1,{,compilation=HDL Netlist,block_icon_display=Default,family=kintexu,part=xcku115,speed=-2-e,package=flvf1924,synthesis_language=vhdl,hdl_library=xil_defaultlib,synthesis_strategy=Vivado Synthesis Defaults,implementation_strategy=Vivado Implementation Defaults,testbench=0,interface_doc=0,ce_clr=0,clock_period=5,system_simulink_period=1,waveform_viewer=0,axilite_interface=0,ip_catalog_plugin=0,hwcosim_burst_mode=0,simulation_time=10,addsub=1,assert=5,constant=13,convert=16,counter=6,delay=28,inv=10,logical=13,reinterpret=7,relational=3,slice=7,}";
  signal clk_1_net : std_logic;
  signal ce_1_net : std_logic;
begin
  gpio_pins3_default_clock_driver : entity xil_defaultlib.gpio_pins3_default_clock_driver 
  port map (
    gpio_pins3_sysclk => clk,
    gpio_pins3_sysce => '1',
    gpio_pins3_sysclr => '0',
    gpio_pins3_clk1 => clk_1_net,
    gpio_pins3_ce1 => ce_1_net
  );
  gpio_pins3_struct : entity xil_defaultlib.gpio_pins3_struct 
  port map (
    gpio_pins3_a_user_data_out => gpio_pins3_a_user_data_out,
    gpio_pins3_b_user_data_out => gpio_pins3_b_user_data_out,
    gpio_pins3_in_pin_gateway => gpio_pins3_in_pin_gateway,
    gpio_pins3_one_gbe_app_dbg_data => gpio_pins3_one_gbe_app_dbg_data,
    gpio_pins3_one_gbe_app_dbg_dvld => gpio_pins3_one_gbe_app_dbg_dvld,
    gpio_pins3_one_gbe_app_rx_badframe => gpio_pins3_one_gbe_app_rx_badframe,
    gpio_pins3_one_gbe_app_rx_data => gpio_pins3_one_gbe_app_rx_data,
    gpio_pins3_one_gbe_app_rx_dvld => gpio_pins3_one_gbe_app_rx_dvld,
    gpio_pins3_one_gbe_app_rx_eof => gpio_pins3_one_gbe_app_rx_eof,
    gpio_pins3_one_gbe_app_rx_overrun => gpio_pins3_one_gbe_app_rx_overrun,
    gpio_pins3_one_gbe_app_rx_srcip => gpio_pins3_one_gbe_app_rx_srcip,
    gpio_pins3_one_gbe_app_rx_srcport => gpio_pins3_one_gbe_app_rx_srcport,
    gpio_pins3_one_gbe_app_tx_afull => gpio_pins3_one_gbe_app_tx_afull,
    gpio_pins3_one_gbe_app_tx_overflow => gpio_pins3_one_gbe_app_tx_overflow,
    gpio_pins3_reset_to_listen_user_data_out => gpio_pins3_reset_to_listen_user_data_out,
    gpio_pins3_send_trigger_user_data_out => gpio_pins3_send_trigger_user_data_out,
    gpio_pins3_snapshot_count_reset_user_data_out => gpio_pins3_snapshot_count_reset_user_data_out,
    gpio_pins3_trig_debug_reset_user_data_out => gpio_pins3_trig_debug_reset_user_data_out,
    gpio_pins3_trig_debug_timer_reset_user_data_out => gpio_pins3_trig_debug_timer_reset_user_data_out,
    clk_1 => clk_1_net,
    ce_1 => ce_1_net,
    gpio_pins3_led0_gateway => gpio_pins3_led0_gateway,
    gpio_pins3_one_gbe_app_rx_ack => gpio_pins3_one_gbe_app_rx_ack,
    gpio_pins3_one_gbe_app_rx_rst => gpio_pins3_one_gbe_app_rx_rst,
    gpio_pins3_one_gbe_app_tx_data => gpio_pins3_one_gbe_app_tx_data,
    gpio_pins3_one_gbe_app_tx_destip => gpio_pins3_one_gbe_app_tx_destip,
    gpio_pins3_one_gbe_app_tx_destport => gpio_pins3_one_gbe_app_tx_destport,
    gpio_pins3_one_gbe_app_tx_dvld => gpio_pins3_one_gbe_app_tx_dvld,
    gpio_pins3_one_gbe_app_tx_eof => gpio_pins3_one_gbe_app_tx_eof,
    gpio_pins3_one_gbe_app_tx_rst => gpio_pins3_one_gbe_app_tx_rst,
    gpio_pins3_out_pin_gateway => gpio_pins3_out_pin_gateway,
    gpio_pins3_readout_state_value_user_data_in => gpio_pins3_readout_state_value_user_data_in,
    gpio_pins3_snapshot_counter_user_data_in => gpio_pins3_snapshot_counter_user_data_in,
    gpio_pins3_sum_ab_user_data_in => gpio_pins3_sum_ab_user_data_in,
    gpio_pins3_trig_debug_timer_user_data_in => gpio_pins3_trig_debug_timer_user_data_in,
    gpio_pins3_trig_debug_trig_rec_count_user_data_in => gpio_pins3_trig_debug_trig_rec_count_user_data_in
  );
end structural;
