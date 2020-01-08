#-----------------------------------------------------------------
# System Generator version 2016.4 IP Tcl source file.
#
# Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
# text/file contains proprietary, confidential information of Xilinx,
# Inc., is distributed under license from Xilinx, Inc., and may be used,
# copied and/or disclosed only pursuant to the terms of a valid license
# agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
# this text/file solely for design, simulation, implementation and
# creation of design files limited to Xilinx devices or technologies.
# Use with non-Xilinx devices or technologies is expressly prohibited
# and immediately terminates your license unless covered by a separate
# agreement.
#
# Xilinx is providing this design, code, or information "as is" solely
# for use in developing programs and solutions for Xilinx devices.  By
# providing this design, code, or information as one possible
# implementation of this feature, application or standard, Xilinx is
# making no representation that this implementation is free from any
# claims of infringement.  You are responsible for obtaining any rights
# you may require for your implementation.  Xilinx expressly disclaims
# any warranty whatsoever with respect to the adequacy of the
# implementation, including but not limited to warranties of
# merchantability or fitness for a particular purpose.
#
# Xilinx products are not intended for use in life support appliances,
# devices, or systems.  Use in such applications is expressly prohibited.
#
# Any modifications that are made to the source code are done at the user's
# sole risk and will be unsupported.
#
# This copyright and support notice must be retained as part of this
# text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
# reserved.
#-----------------------------------------------------------------

set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_c_addsub_v12_0_i0] < 0} {
create_ip -name c_addsub -version 12.0 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_c_addsub_v12_0_i0
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_c_addsub_v12_0_i0}
lappend params_list CONFIG.AINIT_Value {0}
lappend params_list CONFIG.A_Type {Signed}
lappend params_list CONFIG.A_Width {27}
lappend params_list CONFIG.Add_Mode {Add}
lappend params_list CONFIG.B_Constant {false}
lappend params_list CONFIG.B_Type {Signed}
lappend params_list CONFIG.B_Value {0}
lappend params_list CONFIG.B_Width {27}
lappend params_list CONFIG.Borrow_Sense {Active_Low}
lappend params_list CONFIG.Bypass {false}
lappend params_list CONFIG.Bypass_CE_Priority {Bypass_Overrides_CE}
lappend params_list CONFIG.Bypass_Sense {Active_Low}
lappend params_list CONFIG.CE {true}
lappend params_list CONFIG.C_In {false}
lappend params_list CONFIG.C_Out {false}
lappend params_list CONFIG.Implementation {DSP48}
lappend params_list CONFIG.Latency {1}
lappend params_list CONFIG.Out_Width {27}
lappend params_list CONFIG.SCLR {false}
lappend params_list CONFIG.SINIT {false}
lappend params_list CONFIG.SINIT_Value {0}
lappend params_list CONFIG.SSET {false}
lappend params_list CONFIG.Sync_CE_Priority {Sync_Overrides_CE}
lappend params_list CONFIG.Sync_Ctrl_Priority {Reset_Overrides_Set}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_c_addsub_v12_0_i0]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0] < 0} {
create_ip -name c_counter_binary -version 12.0 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0}
lappend params_list CONFIG.ainit_value {0}
lappend params_list CONFIG.ce {true}
lappend params_list CONFIG.count_mode {UP}
lappend params_list CONFIG.fb_latency {0}
lappend params_list CONFIG.final_count_value {1}
lappend params_list CONFIG.implementation {Fabric}
lappend params_list CONFIG.increment_value {1}
lappend params_list CONFIG.latency {1}
lappend params_list CONFIG.load {false}
lappend params_list CONFIG.output_width {9}
lappend params_list CONFIG.restrict_count {false}
lappend params_list CONFIG.sclr {false}
lappend params_list CONFIG.sinit {true}
lappend params_list CONFIG.sinit_value {0}
lappend params_list CONFIG.sset {false}
lappend params_list CONFIG.sync_ce_priority {Sync_Overrides_CE}
lappend params_list CONFIG.sync_threshold_output {false}
lappend params_list CONFIG.syncctrlpriority {Reset_Overrides_Set}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i0]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i0] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i0
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i0}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i0_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i0]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i1] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i1
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i1}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i1_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i1]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i2] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i2
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i2}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i2_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i2]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i3] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i3
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i3}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i3_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i3]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i4] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i4
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i4}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_RAM}
lappend params_list CONFIG.operating_mode_a {READ_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {8}
lappend params_list CONFIG.read_width_b {8}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {8192}
lappend params_list CONFIG.write_width_a {8}
lappend params_list CONFIG.write_width_b {8}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i4_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i4]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i1] < 0} {
create_ip -name c_counter_binary -version 12.0 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i1
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i1}
lappend params_list CONFIG.ainit_value {0}
lappend params_list CONFIG.ce {true}
lappend params_list CONFIG.count_mode {DOWN}
lappend params_list CONFIG.fb_latency {0}
lappend params_list CONFIG.final_count_value {1}
lappend params_list CONFIG.implementation {Fabric}
lappend params_list CONFIG.increment_value {1}
lappend params_list CONFIG.latency {1}
lappend params_list CONFIG.load {true}
lappend params_list CONFIG.output_width {14}
lappend params_list CONFIG.restrict_count {false}
lappend params_list CONFIG.sclr {false}
lappend params_list CONFIG.sinit {true}
lappend params_list CONFIG.sinit_value {0}
lappend params_list CONFIG.sset {false}
lappend params_list CONFIG.sync_ce_priority {Sync_Overrides_CE}
lappend params_list CONFIG.sync_threshold_output {false}
lappend params_list CONFIG.syncctrlpriority {Reset_Overrides_Set}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i1]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i5] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i5
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i5}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_RAM}
lappend params_list CONFIG.operating_mode_a {READ_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {8}
lappend params_list CONFIG.read_width_b {8}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {8}
lappend params_list CONFIG.write_width_b {8}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i5_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i5]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i2] < 0} {
create_ip -name c_counter_binary -version 12.0 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i2
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i2}
lappend params_list CONFIG.ainit_value {0}
lappend params_list CONFIG.ce {true}
lappend params_list CONFIG.count_mode {DOWN}
lappend params_list CONFIG.fb_latency {0}
lappend params_list CONFIG.final_count_value {1}
lappend params_list CONFIG.implementation {Fabric}
lappend params_list CONFIG.increment_value {1}
lappend params_list CONFIG.latency {1}
lappend params_list CONFIG.load {true}
lappend params_list CONFIG.output_width {10}
lappend params_list CONFIG.restrict_count {false}
lappend params_list CONFIG.sclr {false}
lappend params_list CONFIG.sinit {true}
lappend params_list CONFIG.sinit_value {0}
lappend params_list CONFIG.sset {false}
lappend params_list CONFIG.sync_ce_priority {Sync_Overrides_CE}
lappend params_list CONFIG.sync_threshold_output {false}
lappend params_list CONFIG.syncctrlpriority {Reset_Overrides_Set}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_c_counter_binary_v12_0_i2]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i6] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i6
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i6}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i6_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i6]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i7] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i7
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i7}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i7_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i7]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i8] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i8
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i8}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i8_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i8]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i9] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i9
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i9}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i9_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i9]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i10] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i10
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i10}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i10_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i10]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i11] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i11
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i11}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i11_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i11]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i12] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i12
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i12}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i12_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i12]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i13] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i13
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i13}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i13_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i13]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i14] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i14
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i14}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i14_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i14]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i15] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i15
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i15}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i15_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i15]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i16] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i16
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i16}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i16_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i16]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i17] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i17
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i17}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i17_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i17]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i18] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i18
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i18}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i18_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i18]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i19] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i19
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i19}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i19_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i19]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i20] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i20
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i20}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i20_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i20]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i21] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i21
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i21}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i21_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i21]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i22] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i22
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i22}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i22_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i22]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i23] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i23
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i23}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i23_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i23]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i24] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i24
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i24}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i24_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i24]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i25] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i25
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i25}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i25_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i25]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i26] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i26
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i26}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i26_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i26]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i27] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i27
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i27}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i27_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i27]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i28] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i28
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i28}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i28_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i28]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i29] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i29
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i29}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i29_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i29]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i30] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i30
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i30}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i30_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i30]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i31] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i31
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i31}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i31_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i31]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i32] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i32
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i32}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i32_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i32]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i33] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i33
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i33}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i33_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i33]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i34] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i34
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i34}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i34_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i34]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i35] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i35
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i35}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i35_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i35]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i36] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i36
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i36}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i36_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i36]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i37] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i37
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i37}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i37_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i37]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i38] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i38
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i38}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i38_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i38]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i39] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i39
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i39}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i39_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i39]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i40] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i40
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i40}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i40_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i40]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i41] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i41
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i41}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i41_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i41]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i42] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i42
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i42}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i42_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i42]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i43] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i43
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i43}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i43_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i43]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i44] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i44
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i44}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i44_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i44]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i45] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i45
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i45}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i45_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i45]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i46] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i46
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i46}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i46_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i46]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i47] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i47
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i47}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i47_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i47]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i48] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i48
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i48}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i48_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i48]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i49] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i49
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i49}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i49_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i49]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i50] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i50
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i50}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i50_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i50]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i51] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i51
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i51}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i51_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i51]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i52] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i52
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i52}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i52_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i52]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i53] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i53
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i53}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i53_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i53]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i54] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i54
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i54}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i54_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i54]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i55] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i55
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i55}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i55_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i55]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i56] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i56
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i56}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i56_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i56]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i57] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i57
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i57}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i57_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i57]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i58] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i58
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i58}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i58_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i58]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i59] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i59
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i59}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i59_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i59]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i60] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i60
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i60}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i60_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i60]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i61] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i61
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i61}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i61_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i61]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i62] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i62
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i62}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i62_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i62]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i63] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i63
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i63}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i63_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i63]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i64] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i64
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i64}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i64_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i64]
}


set existingipslist [get_ips]
if {[lsearch $existingipslist pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i65] < 0} {
create_ip -name blk_mem_gen -version 8.3 -vendor xilinx.com -library ip -module_name pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i65
set params_list [list]
lappend params_list CONFIG.Component_Name {pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i65}
lappend params_list CONFIG.algorithm {Minimum_Area}
lappend params_list CONFIG.assume_synchronous_clk {false}
lappend params_list CONFIG.byte_size {9}
lappend params_list CONFIG.collision_warnings {ALL}
lappend params_list CONFIG.disable_collision_warnings {false}
lappend params_list CONFIG.ecc {false}
lappend params_list CONFIG.enable_a {Use_ENA_Pin}
lappend params_list CONFIG.enable_b {Always_Enabled}
lappend params_list CONFIG.error_injection_type {Single_Bit_Error_Injection}
lappend params_list CONFIG.fill_remaining_memory_locations {false}
lappend params_list CONFIG.load_init_file {TRUE}
lappend params_list CONFIG.memory_type {Single_Port_ROM}
lappend params_list CONFIG.operating_mode_a {WRITE_FIRST}
lappend params_list CONFIG.operating_mode_b {WRITE_FIRST}
lappend params_list CONFIG.output_reset_value_a {0}
lappend params_list CONFIG.output_reset_value_b {0}
lappend params_list CONFIG.pipeline_stages {0}
lappend params_list CONFIG.primitive {8kx2}
lappend params_list CONFIG.read_width_a {18}
lappend params_list CONFIG.read_width_b {18}
lappend params_list CONFIG.register_porta_output_of_memory_core {false}
lappend params_list CONFIG.register_porta_output_of_memory_primitives {true}
lappend params_list CONFIG.register_portb_output_of_memory_core {false}
lappend params_list CONFIG.register_portb_output_of_memory_primitives {false}
lappend params_list CONFIG.remaining_memory_locations {0}
lappend params_list CONFIG.reset_type {SYNC}
lappend params_list CONFIG.use_byte_write_enable {false}
lappend params_list CONFIG.use_error_injection_pins {false}
lappend params_list CONFIG.use_regcea_pin {false}
lappend params_list CONFIG.use_regceb_pin {false}
lappend params_list CONFIG.use_rsta_pin {false}
lappend params_list CONFIG.use_rstb_pin {false}
lappend params_list CONFIG.write_depth_a {512}
lappend params_list CONFIG.write_width_a {18}
lappend params_list CONFIG.write_width_b {18}
lappend params_list CONFIG.coe_file {../pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i65_vivado.coe}

set_property -dict $params_list [get_ips pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i65]
}


validate_ip [get_ips]
