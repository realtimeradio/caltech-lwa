# caltech-lwa
A repository for LWA SNAP2 firmware

Basen on the versions of the CASPER libraries provided by https://github.com/shlean/mlib_devel/

## Software Versions:
- Ubuntu 16.04
- Xilinx Vivado System Edition 2016.4
- MATLAB/Simulink 2016b

## To open/modify/compile:

1. Clone this repository
2. Clone submodules:
```
git submodule init
git submodule update
```
3. Create a local environment specification file `startsg.local`.
4. From the top level of this repository, run `startsg` (if your environment file is called `startsg.local`) or `startsg <my_local_environment_file.local>`.

## Files
`snap2_adc5g.slx` -- A skeletal design comprising an ADC interface, ADC snapshot blocks, and a 1GbE control/monitoring core
