set impl_dir "/home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.runs/impl_1"
set bin_file "/home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.runs/impl_1/top.bin"
set bit_file "/home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.runs/impl_1/top.bit"
set hex_file "/home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.runs/impl_1/top.hex"
set mcs_file "/home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.runs/impl_1/top.mcs"
set prm_file "/home/kplant/lwa_firmware/gpio_pins3/myproj/myproj.runs/impl_1/top.prm"

proc check_timing {run} {
  if { [get_property STATS.WNS [get_runs $run] ] < 0 } {
    send_msg_id "CASPER-1" {CRITICAL WARNING} "ERROR: Found timing violations => Worst Negative Slack: [get_property STATS.WNS [get_runs $run]] ns"
  } else {
    puts "No timing violations => Worst Negative Slack: [get_property STATS.WNS [get_runs $run]] ns"
  }

  if { [get_property STATS.TNS [get_runs $run] ] < 0 } {
    send_msg_id "CASPER-1" {CRITICAL WARNING} "ERROR: Found timing violations => Total Negative Slack: [get_property STATS.TNS [get_runs $run]] ns"
  }

  if { [get_property STATS.WHS [get_runs $run] ] < 0 } {
    send_msg_id "CASPER-1" {CRITICAL WARNING} "ERROR: Found timing violations => Worst Hold Slack: [get_property STATS.WHS [get_runs $run]] ns"
  } else {
    puts "No timing violations => Worst Hold Slack: [get_property STATS.WHS [get_runs $run]] ns"
  }

  if { [get_property STATS.THS [get_runs $run] ] < 0 } {
    send_msg_id "CASPER-1" {CRITICAL WARNING} "ERROR: Found timing violations => Total Hold Slack: [get_property STATS.THS [get_runs $run]] ns"
  }
}


proc check_zero_critical {count mess} {
  if {$count > 0} {
    puts "************************************************"
    send_msg_id "CASPER-2" {CRITICAL WARNING} "$mess critical warning count: $count"
    puts "************************************************"
  }
}


proc puts_red {s} {
  puts -nonewline "\[1;31m"; #RED
  puts $s
  puts -nonewline "\[0m";# Reset
}

puts "Starting tcl script"
cd /home/kplant/lwa_firmware/gpio_pins3
create_project -f myproj myproj -part xcku115-flvf1924-2-e
import_files -force /home/kplant/lwa_firmware/gpio_pins3/top.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/wb_register_ppc2simulink
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/gpio_ext2simulink
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/gpio_simulink2ext
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/gbe_udp.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/gig_eth_mac.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/gbe_tx.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/gbe_rx.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/CRC_chk.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/gbe_cpu_attach_wb.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/gbe_udp2.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/mdio_config.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/gbe_tx2.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/gig_eth_mac_tx.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/CRC_gen.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/mdio_master.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/gig_eth_mac_rx.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/gig_ethernet_pcs_pma_sgmii_autonegotiation.xci
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/arp_cache_init.coe
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/virtex7/gbe_cpu_buffer.xci
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/virtex7/gig_ethernet_pcs_pma_sgmii_lvds.xci
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/virtex7/gbe_arp_cache.xci
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/virtex7/gig_ethernet_pcs_pma_sgmii.xci
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/virtex7/gbe_ctrl_fifo.xci
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/virtex7/gbe_rx_ctrl_fifo.xci
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/virtex7/gbe_rx_packet_fifo.xci
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/onegbe/virtex7/gbe_tx_packet_fifo.xci
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/wb_register_simulink2ppc
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/infrastructure/snap2_v2_infrastructure.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/infrastructure/snap2_infrastructure.v
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/wbs_arbiter
import_files -force /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/sys_block
import_files -force /home/kplant/lwa_firmware/gpio_pins3/sysgen/hdl_netlist/gpio_pins3.srcs/sources_1/imports/sysgen
import_files -force /home/kplant/lwa_firmware/gpio_pins3/sysgen/hdl_netlist/gpio_pins3.srcs/sources_1/ip/gpio_pins3_c_addsub_v12_0_i0/gpio_pins3_c_addsub_v12_0_i0.xci
import_files -force /home/kplant/lwa_firmware/gpio_pins3/sysgen/hdl_netlist/gpio_pins3.srcs/sources_1/ip/gpio_pins3_c_counter_binary_v12_0_i0/gpio_pins3_c_counter_binary_v12_0_i0.xci
import_files -force /home/kplant/lwa_firmware/gpio_pins3/sysgen/hdl_netlist/gpio_pins3.srcs/sources_1/ip/gpio_pins3_c_counter_binary_v12_0_i2/gpio_pins3_c_counter_binary_v12_0_i2.xci
import_files -force /home/kplant/lwa_firmware/gpio_pins3/sysgen/hdl_netlist/gpio_pins3.srcs/sources_1/ip/gpio_pins3_c_counter_binary_v12_0_i1/gpio_pins3_c_counter_binary_v12_0_i1.xci
set repos [get_property ip_repo_paths [current_project]]
set_property ip_repo_paths "$repos /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/axi_wb_bridge/ip_repo" [current_project]
update_ip_catalog
import_files -force -fileset constrs_1 /home/kplant/lwa_firmware/gpio_pins3/user_const.xdc
set_property target_language VHDL [current_project]
set_property top top [current_fileset]
update_compile_order -fileset sources_1
if {[llength [glob -nocomplain [get_property directory [current_project]]/myproj.srcs/sources_1/imports/*.coe]] > 0} {
file copy -force {*}[glob [get_property directory [current_project]]/myproj.srcs/sources_1/imports/*.coe] [get_property directory [current_project]]/myproj.srcs/sources_1/ip/
}
upgrade_ip -quiet [get_ips *]
source /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/microblaze_wb/microblaze_wb_no_xadc.tcl
reset_run synth_1
launch_runs synth_1 -jobs 4
wait_on_run synth_1
open_run synth_1
set synth_critical_count [get_msg_config -count -severity {CRITICAL WARNING}]
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
launch_runs impl_1 -jobs 4
wait_on_run impl_1
open_run impl_1
set impl_critical_count [get_msg_config -count -severity {CRITICAL WARNING}]
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
cd [get_property DIRECTORY [current_project]]
exec cat /home/kplant/software/caltech-lwa/mlib_devel/jasper_library/hdl_sources/microblaze_wb/executable_no_xadc.mem ../core_info.jam.tab.mem > ../executable_core_info.mem
exec -ignorestderr updatemem -bit ./myproj.runs/impl_1/top.bit -meminfo ./myproj.runs/impl_1/top.mmi -data ../executable_core_info.mem  -proc cont_microblaze_inst/microblaze_0 -out ./myproj.runs/impl_1/top.bit -force
write_cfgmem  -format bin -size 32 -interface SPIx4 -loadbit "up 0x0 ./myproj.runs/impl_1/top.bit " -checksum -file "./myproj.runs/impl_1/top.bin" -force
check_timing impl_1
check_zero_critical $impl_critical_count implementation
check_zero_critical $synth_critical_count synthesis
