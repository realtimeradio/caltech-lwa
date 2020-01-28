# snap2_5gad_test
A project for testing the 5GAD<->SNAP2 interface.

Based on a Vivado project provided by the Institute of Automation, Chinese Academy of Sciences

## Software Versions:
- Ubuntu 16.04
- Xilinx Vivado System Edition 2016.4

## To build

1. Source an appropriate Vivado environment (eg. `source ~/sw/Vivado/2016.4/settings64.sh` )
2. Open Vivado
3. Source the project configuration script: `source generate_project.tcl`
4. Build the generated project using the Vivado GUI

## Interface integrity testing

The provided project includes an HDL module to count errors in received ADC data, when the ADC is placed in "ramp" test mode.

To interrogate error counters:

1. Source an appropriate Vivado environment (eg. `source ~/sw/Vivado/2016.4/settings64.sh` )
2. Run one of the provided test scripts. `test_fmc_si_right.tcl` tests the right-hand (when viewed from the analog inputs) FMC port. `test_fmc_si_left.tcl` tests the left-hand port. For example, to test the right-hand port:
```
vivado -mode batch -source test_fmc_si_right.tcl
```
This script will program the FPGA, and poll error registers every 5 seconds.

To execute this script without reprogramming the FPGA:
```
vivado -mode batch -source test_fmc_si_right.tcl -tclargs noprogram
```
