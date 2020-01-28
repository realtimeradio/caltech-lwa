open_hw

# Get the locations of this script and its directory,
# so we can use relative paths
set script_name [file normalize [info script]]
set script_path [file dirname $script_name]

# Connect to hardware over JTAG at 3 MHz.
connect_hw_server -url localhost:3121
current_hw_target [get_hw_targets */xilinx_tcf/Xilinx/000016e62cdf01]
set_property PARAM.FREQUENCY 3000000 [get_hw_targets */xilinx_tcf/Xilinx/000016e62cdf01]
open_hw_target

# Go to where the script is and use relative paths for bitstream / ILA info 
cd $script_path

set_property PROGRAM.FILE {./outputs/ad_top.bit} [lindex [get_hw_devices xcku115_0] 0]
set_property PROBES.FILE {./outputs/debug_nets.ltx} [lindex [get_hw_devices xcku115_0] 0]

current_hw_device [lindex [get_hw_devices xcku115_0] 0]
refresh_hw_device [lindex [get_hw_devices xcku115_0] 0]

if {[string compare [lindex $argv 0] noprogram]} {
    puts "Programming FPGA (this will take a few minutes)"
    program_hw_devices [lindex [get_hw_devices xcku115_0] 0]
    refresh_hw_device [lindex [get_hw_devices xcku115_0] 0]
} else {
    puts "Skipping programming because 'noprogram' was passed"
}

set n_total_last 0
set sleep_ms 5000
while {1} {
    #puts "Triggering error counter ILA"
    set ila [get_hw_ilas -of_objects [get_hw_devices xcku115_0] -filter {CELL_NAME=~"inst_err_a"}]
    run_hw_ila -quiet [get_hw_ilas $ila]
    wait_on_hw_ila [get_hw_ilas $ila]
    
    set ila_data [upload_hw_ila_data -quiet [get_hw_ilas $ila]]
    set ila_data_timestamp [get_property TIMESTAMP $ila_data]
    #set ila_data_csv adc_err_cnt-${ila_data_timestamp}.csv
    set ila_data_csv adc_err_cnt.csv
    write_hw_ila_data -force -csv_file $ila_data_csv $ila_data
    
    # Now open the csv file for printing
    set fp [open $ila_data_csv r]
    set file_data [read $fp]
    close $fp
    
    set line_num 0
    set n_errors 0
    set n_ok 0
    set n_total 0
    foreach line [split $file_data "\n"] {
        if [expr {$line_num != 0}] {
            #puts $line
            if {[scan $line "%d,%d,%d, %x, %x, %x, %x, %x, %x, %x, %x" sb sw trig err_a err_b err_c err_d ok_a ok_b ok_c ok_d] == 11} {
            #puts "$ok_a, $ok_b, $ok_c, $ok_d"
    	    set n_errors [expr {$err_a + $err_b + $err_c + $err_d}]
    	    set n_ok [expr {$ok_a + $ok_b + $ok_c + $ok_d}]
            set n_total [expr {$n_errors + $n_ok}]
    	    #puts "Number of errors: ${n_errors}. Number of OK samples: ${n_ok}"
            }
        }   
        set line_num [expr {$line_num + 1}]
    }
    # Errors/OKs are counted per FPGA clock, which is 8 parallel ADC samples
    set diff [expr {8*($n_total - $n_total_last) / 1000000000.0}]
    set n_total_last $n_total
    puts "Trigger time: ${ila_data_timestamp}: Errors: ${n_errors}. OK: ${n_ok} ($diff Gsamples since last trigger)"
    # sleep for 5 seconds
    after $sleep_ms
}
