-- Generated from Simulink block 
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
entity gpio_pins3_stub is
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
end gpio_pins3_stub;
architecture structural of gpio_pins3_stub is 
begin
  sysgen_dut : entity xil_defaultlib.gpio_pins3 
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
    clk => clk,
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
