set_property PACKAGE_PIN AJ25 [get_ports gpio_gpio_1_1_ext[0]]
set_property IOSTANDARD LVCMOS25 [get_ports gpio_gpio_1_1_ext[0]]
set_property PACKAGE_PIN AR25 [get_ports gpio_led_0_0_ext[0]]
set_property IOSTANDARD LVCMOS25 [get_ports gpio_led_0_0_ext[0]]
set_property PACKAGE_PIN AA6 [get_ports gpio_pins3_one_gbe_sfp_tx_p]
set_property PACKAGE_PIN AA5 [get_ports gpio_pins3_one_gbe_sfp_tx_n]
set_property PACKAGE_PIN AB4 [get_ports gpio_pins3_one_gbe_sfp_rx_p]
set_property PACKAGE_PIN AB3 [get_ports gpio_pins3_one_gbe_sfp_rx_n]
set_property PACKAGE_PIN AB8 [get_ports gpio_pins3_one_gbe_mgt_clk_p]
set_property PACKAGE_PIN AU25 [get_ports gpio_pins3_one_gbe_mgt_clk_n]
set_property IOSTANDARD LVDS_25 [get_ports gpio_pins3_one_gbe_mgt_clk_n]
set_property PACKAGE_PIN AL19 [get_ports phy_rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports phy_rst_n]
set_property PACKAGE_PIN AK25 [get_ports gpio_gpio_2_2_ext[0]]
set_property IOSTANDARD LVCMOS25 [get_ports gpio_gpio_2_2_ext[0]]
set_property PACKAGE_PIN N12 [get_ports sys_clk_n]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports sys_clk_n]
set_property PACKAGE_PIN N13 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports sys_clk_p]
set_property PACKAGE_PIN AK26 [get_ports UART_rxd]
set_property IOSTANDARD LVCMOS25 [get_ports UART_rxd]
set_property PACKAGE_PIN AP25 [get_ports UART_txd]
set_property IOSTANDARD LVCMOS25 [get_ports UART_txd]
create_clock -period 8.000 -name onegbe_clk -waveform {0.000 4.000} [get_ports {gpio_pins3_one_gbe_mgt_clk_p}]
create_clock -period 8.000 -name sys_clk_p_CLK -waveform {0.000 4.000} [get_ports {sys_clk_p}]
set_max_delay 1.0 -from [get_ports {gpio_gpio_1_1_ext[*]}]
set_max_delay 1.0 -to [get_ports {gpio_led_0_0_ext[*]}]
set_max_delay 1.0 -to [get_ports {gpio_gpio_2_2_ext[*]}]
set_min_delay 1.0 -from [get_ports {gpio_gpio_1_1_ext[*]}]
set_min_delay 1.0 -to [get_ports {gpio_led_0_0_ext[*]}]
set_min_delay 1.0 -to [get_ports {gpio_gpio_2_2_ext[*]}]
set_false_path -from [get_ports {gpio_gpio_1_1_ext[*]}]
set_false_path -to [get_ports {gpio_led_0_0_ext[*]}]
set_false_path -to [get_ports {gpio_gpio_2_2_ext[*]}]
set_multicycle_path -from [get_pins gpio_pins3_a/register_request_reg/C] -to [get_pins gpio_pins3_a/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_a/register_request_reg/C] -to [get_pins gpio_pins3_a/register_requestR_reg/D] -hold 1
set_multicycle_path -from [get_pins gpio_pins3_b/register_request_reg/C] -to [get_pins gpio_pins3_b/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_b/register_request_reg/C] -to [get_pins gpio_pins3_b/register_requestR_reg/D] -hold 1
create_clock -period 8.000 -name gbe_userclk2_out -waveform {0.000 4.000} [get_nets {gbe_userclk2_out}]
set_clock_groups -name asyncclocks_onegbe -asynchronous -group [get_clocks -include_generated_clocks sys_clk_p_CLK] -group [get_clocks -include_generated_clocks gbe_userclk2_out]
set_clock_groups -name asyncclocks_onegbe_usr_clk -asynchronous -group [get_clocks -of_objects [get_cells -hierarchical -filter {name=~*clk_counter*}]] -group [get_clocks -include_generated_clocks gbe_userclk2_out]
set_property LOC BITSLICE_RX_TX_X2Y86 [get_cells gpio_pins3_one_gbe_pcs_pma/U0/pcs_pma_block_i/lvds_transceiver_mw/serdes_1_to_10_ser8_i/idelay_cal]
set_multicycle_path -from [get_pins gpio_pins3_readout_state_value/register_request_reg/C] -to [get_pins gpio_pins3_readout_state_value/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_readout_state_value/register_request_reg/C] -to [get_pins gpio_pins3_readout_state_value/register_requestR_reg/D] -hold 1
set_multicycle_path -from [get_pins gpio_pins3_reset_to_listen/register_request_reg/C] -to [get_pins gpio_pins3_reset_to_listen/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_reset_to_listen/register_request_reg/C] -to [get_pins gpio_pins3_reset_to_listen/register_requestR_reg/D] -hold 1
set_multicycle_path -from [get_pins gpio_pins3_send_trigger/register_request_reg/C] -to [get_pins gpio_pins3_send_trigger/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_send_trigger/register_request_reg/C] -to [get_pins gpio_pins3_send_trigger/register_requestR_reg/D] -hold 1
set_multicycle_path -from [get_pins gpio_pins3_snapshot_count_reset/register_request_reg/C] -to [get_pins gpio_pins3_snapshot_count_reset/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_snapshot_count_reset/register_request_reg/C] -to [get_pins gpio_pins3_snapshot_count_reset/register_requestR_reg/D] -hold 1
set_multicycle_path -from [get_pins gpio_pins3_snapshot_counter/register_request_reg/C] -to [get_pins gpio_pins3_snapshot_counter/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_snapshot_counter/register_request_reg/C] -to [get_pins gpio_pins3_snapshot_counter/register_requestR_reg/D] -hold 1
set_multicycle_path -from [get_pins gpio_pins3_sum_ab/register_request_reg/C] -to [get_pins gpio_pins3_sum_ab/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_sum_ab/register_request_reg/C] -to [get_pins gpio_pins3_sum_ab/register_requestR_reg/D] -hold 1
set_multicycle_path -from [get_pins gpio_pins3_trig_debug_reset/register_request_reg/C] -to [get_pins gpio_pins3_trig_debug_reset/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_trig_debug_reset/register_request_reg/C] -to [get_pins gpio_pins3_trig_debug_reset/register_requestR_reg/D] -hold 1
set_multicycle_path -from [get_pins gpio_pins3_trig_debug_timer/register_request_reg/C] -to [get_pins gpio_pins3_trig_debug_timer/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_trig_debug_timer/register_request_reg/C] -to [get_pins gpio_pins3_trig_debug_timer/register_requestR_reg/D] -hold 1
set_multicycle_path -from [get_pins gpio_pins3_trig_debug_timer_reset/register_request_reg/C] -to [get_pins gpio_pins3_trig_debug_timer_reset/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_trig_debug_timer_reset/register_request_reg/C] -to [get_pins gpio_pins3_trig_debug_timer_reset/register_requestR_reg/D] -hold 1
set_multicycle_path -from [get_pins gpio_pins3_trig_debug_trig_rec_count/register_request_reg/C] -to [get_pins gpio_pins3_trig_debug_trig_rec_count/register_requestR_reg/D] 2
set_multicycle_path -from [get_pins gpio_pins3_trig_debug_trig_rec_count/register_request_reg/C] -to [get_pins gpio_pins3_trig_debug_trig_rec_count/register_requestR_reg/D] -hold 1
set_property CONFIG_VOLTAGE 2.5 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes [current_design]
set_property BITSTREAM.CONFIG.TIMER_CFG 20000000 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
