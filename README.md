# caltech-lwa
A repository for LWA SNAP2 firmware

Based on the versions of the CASPER libraries provided by https://github.com/shlean/mlib_devel/

## Software Versions:
- Ubuntu 18.04
- Xilinx Vivado System Edition 2019.1.3
- MATLAB/Simulink 2019b

## To open/modify/compile:

1. Clone this repository
2. Clone submodules:
```
git submodule init
git submodule update
```
3. Create a local environment specification file `startsg.local`.
4. From the top level of this repository, run `startsg` (if your environment file is called `startsg.local`) or `startsg <my_local_environment_file.local>`.

## Source Files
`snap2_adc5g.slx` -- A skeletal design comprising an ADC interface, ADC snapshot blocks, and a 1GbE control/monitoring core
`snap2_f_200msps_64i_4096c.slx` -- A 64-input F-engine, outputting (up to) 4096 frequency channels. Based on the HERA F-engine design (https://github.com/hera-team/hera_corr_f)
`*_core*` -- Sub-components of `snap2_f_200msps_64i_4096c.slx` pre-compiled to keep the top-level model (relatively) lightweight
