## Software
Testing software is provided, and requires Python 3.
**This software requires the custom version of the `casperfpga` provided in this repository in `control_software/libs/casperfpga`.

On `maze` you can activate an appropriate python environment with the command

```
source ~jackh/py3_mlib_venv/bin/activate
```

### Available scripts

#### `send_spi.py`

A script for issuing SPI read and write commands.

```
usage: send_spi.py [-h] [--fmcA] [--fmcB] [--csstart CSSTART]
                   [--csstop CSSTOP] [--host HOST] [--addr ADDR] [--data DATA]
                   [--reset] [--sync] [--diagram] [--loop]

Generate SPI traffic from SNAP2 -> ADC

optional arguments:
  -h, --help         show this help message and exit
  --fmcA             Use FMC A; aka FMC 0; aka 'right hand' (default: False)
  --fmcB             Use FMC B; aka FMC 1; aka 'left hand' (default: False)
  --csstart CSSTART  Loop through chip selects starting here (default: 0)
  --csstop CSSTOP    Loop through chip selects stopping here (default: 7)
  --host HOST        Snap hostname / IP address (default: snap2-rev2-10)
  --addr ADDR        Address to read/write (default: 42)
  --data DATA        Value to write. If None is given, the address will be
                     read and not written (default: None)
  --reset            Strobe ADC reset line (default: False)
  --sync             Strobe ADC sync line (default: False)
  --diagram          Print ASCII waveforms (default: False)
  --loop             Loop through ADCs forever (default: False)
```

**You must program the SNAP2 using Vivado prior to using this script**

Example usage:

1. Write the value 0xff to address 0x10 of the ADC with chip select 1 on FMC A

```
jackh@maze:~/src/caltech-lwa/ads5296_snap2_tests$ ./send_spi.py --fmcB --csstart 1 --csstop 1 --addr 16 --data 255
```

2. Write the value 0xff to address 0x10 of all ADCs (chip selects 0..7) on FMC A

```
jackh@maze:~/src/caltech-lwa/ads5296_snap2_tests$ ./send_spi.py --fmcB --addr 16 --data 255
```

3. Read SPI address 0x10 of all ADCs (chip selects 0..7) on FMC A

```
jackh@maze:~/src/caltech-lwa/ads5296_snap2_tests$ ./send_spi.py --fmcB --addr 16
```


#### `adc_test.py`

A simple script for configuring ADCs and capturing data to file.

Diagnostic information is printed to stderr, so can be redirected with (eg) 2>/dev/null to leave
only pertinent information printed to screen.

```
jackh@maze:~/src/caltech-lwa/ads5296_snap2_tests$ ./adc_test.py -h
Usage: adc_test.py [-h] [--fmcA] [--fmcB] [--host HOST]
                   [--clocksource CLOCKSOURCE] [--init] [--sync] [--use_ramp]
                   [--cal_fclk] [--load_fclk]
                   [--fclk_delayfile FCLK_DELAYFILE] [--cal_data]
                   [--data_delayfile DATA_DELAYFILE] [--load_data] [--err_cnt]
                   [--outfile OUTFILE] [--header HEADER] [-f] [--print_binary]
                   [-C CHANNEL] [-N N_DUMPS]

Configure an ADS5296 board and grab data

optional arguments:
  -h, --help            show this help message and exit
  --fmcA                Use FMC A; aka FMC 0; aka 'right hand' (default:
                        False)
  --fmcB                Use FMC B; aka FMC 1; aka 'left hand' (default: False)
  --host HOST           Snap hostname / IP address (default: snap2-rev2-10)
  --clocksource CLOCKSOURCE
                        Board form which FPGA clock should be derived.
                        0='top', 1='bottom' (default: 0)
  --init                Reset and initialize ADCs (default: False)
  --sync                Strobe ADC sync line (default: False)
  --use_ramp            Turn on ramp test mode (default: False)
  --cal_fclk            Sweep FCLK delays and use to set ADC data (default:
                        False)
  --load_fclk           Load fclk delays from a provided file specified with
                        --fclk_delayfile (default: False)
  --fclk_delayfile FCLK_DELAYFILE
                        File to which new FCLK calibration delays should be
                        written/read (default: fclk_delays.csv)
  --cal_data            Sweep data line delays and use to set ADC data
                        (default: False)
  --data_delayfile DATA_DELAYFILE
                        File to which new data lane calibration delays should
                        be written/read (default: data_delays.csv)
  --load_data           Load data delays from a provided file specified with
                        --data_delayfile (default: False)
  --err_cnt             Get error counts (default: False)
  --outfile OUTFILE     Custom output filename (default: None)
  --header HEADER       Custom header text to be written to ithe third line of
                        output file (default: )
  -f, --force           Force overwriting of any existing output file
                        (default: False)
  --print_binary        print a snapshot excerpt in binary (default: False)
  -C CHANNEL, --channel CHANNEL
                        grab 64k samples for a single channel (default: None)
  -N N_DUMPS            Number of captures to dump to disk. 0 for no file
                        output (default: 0)
default: 0)

```

**You must program the SNAP2 using Vivado prior to using this script**

Example usage:

1. Initialize a board, training the ADC->FPGA and setting input pin delays appropriately. Save the resulting delays to `fclk_delays.csv`

First, initialize ADC registers and align the frame clock

```
jackh@maze:~/src/caltech-lwa/ads5296_snap2_tests$ ./adc_test.py --fmcB --cal_fclk --init
```

Among the various textual outputs, the delays of the frame clocks from the two boards, in units of FPGA IODELAY taps, will be printed. Eg.:

```
################################
Board 0 FCLK Delay 344 (slack 17)
Board 1 FCLK Delay 144 (slack 22)
################################
```

`slack` is the number of delay taps between the chosen delay and the first delay setting which gives errors.

Next, calibrate the data line delays, saving the resultant delay settings to `data_delays.csv`

```
jackh@maze:~/src/caltech-lwa/ads5296_snap2_tests$ ./adc_test.py --fmcB --cal_data
```

Delays are printed to screen, with each row representing an ADC chip, and each column one of the 8 data lanes from the ADC.
Units are in FPGA DELAY taps.

**It appears that sometimes this proceedure fails for some lanes and/or some chips**. Rerunning might help.

```
Data lane delays
[[220 216 216 216 216 216 208 216]
 [120 112 120 108 116 116 120 108]
 [180 184 180 176 180 184 180 176]
 [216 220 236 220 228 232 232 216]
 [172 180 192 176 184 184 184 184]
 [168 168 180 188 180 168 168 160]
 [288 304 300 284 292 304 292 300]
 [396 400 388 392 412 400 392 388]]
```


2. Capture some counter data and print to screen

The following prints a block of data to screen, after issuing a sync pulse to the ADC.

```
(py3_mlib_venv) jackh@maze:~/src/caltech-lwa/ads5296_snap2_tests$ ./adc_test.py --fmcB --sync --use_ramp
Connecting to snap2-rev2-10
Using FMC 1 (B; left hand side)
FPGA clock: 200.313538
333  333  333  333  334  334  334  334 # First sample of data from eight data lanes of ADC0  
334  334  334  334  335  335  335  335 # Second sample... 
335  335  335  335  336  336  336  336  
336  336  336  336  337  337  337  337  
337  337  337  337  338  338  338  338  
338  338  338  338  339  339  339  339 # Sixth sample 

333  333  333  333  334  334  334  334 # First sample of data from eight data lanes of ADC1 
334  334  334  334  335  335  335  335  
335  335  335  335  336  336  336  336  
336  336  336  336  337  337  337  337  
337  337  337  337  338  338  338  338  
338  338  338  338  339  339  339  339  

333  333  333  333  334  334  334  334  
334  334  334  334  335  335  335  335  
335  335  335  335  336  336  336  336  
336  336  336  336  337  337  337  337  
337  337  337  337  338  338  338  338  
338  338  338  338  339  339  339  339  

333  333  333  333  334  334  334  334  
334  334  334  334  335  335  335  335  
335  335  335  335  336  336  336  336  
336  336  336  336  337  337  337  337  
337  337  337  337  338  338  338  338  
338  338  338  338  339  339  339  339  

333  333  333  333  334  334  334  334  
334  334  334  334  335  335  335  335  
335  335  335  335  336  336  336  336  
336  336  336  336  337  337  337  337  
337  337  337  337  338  338  338  338  
338  338  338  338  339  339  339  339  

333  333  333  333  334  334  334  334  
334  334  334  334  335  335  335  335  
335  335  335  335  336  336  336  336  
336  336  336  336  337  337  337  337  
337  337  337  337  338  338  338  338  
338  338  338  338  339  339  339  339  

333  333  333  333  334  334  334  334  
334  334  334  334  335  335  335  335  
335  335  335  335  336  336  336  336  
336  336  336  336  337  337  337  337  
337  337  337  337  338  338  338  338  
338  338  338  338  339  339  339  339  

333  -429  -429  333  334  334  334  334  
334  -173  -173  334  335  335  335  335  
335   83   83  335  336  336  336  336  
336  340  340  336  337  337  337  337  
337  -428  -428  337  338  338  338  338  
338  -172  -172  338  339  339  339  339
```

3. As above, but outputting data to a csv file

```
(py3_mlib_venv) jackh@maze:~/src/caltech-lwa/ads5296_snap2_tests$ ./adc_test.py --fmcB --sync --use_ramp -N 1
```

In this case, a csv file is created with the format used in the ROACH2 tests

Generated csv files have a three line header. The first line contains the time the dump script was launched, in python `time.ctime()` string representation. The second header line contains the ADC channels which were dumped, as a comma-separated list of ADC channels. With the current software, this is always all 32 channels of a dual ADC board stack.
The third line of the header contains custom text as supplied with the `--header` command line flag. It is empty if no custom header is supplied.

Following the header, each line of the file represents a sequence of 256k ADC samples which were captured. Sequential lines cycle through multiple ADC channels (if a file contains more than one channel) and then through consecutive dumps. For example, a file generated with the command `./adc_test.py --fmcB --sync --use_ramp -N 1` will generate a file with the following contents:

```
Wed Feb 26 11:29:58 2020
0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31

4,2,-4,3, ... -10,13 # 1k ADC samples from the first dump of channel 0
5,-10,20, ... 14,-19 # 1k ADC samples from the first dump of channel 1
# etc.
1,-1,-2,3, ...,-2,.. # 1k ADC samples from the first dump of channel 31
# END OF FILE
```

4. Capture 2 snapshots of 64k samples from ADC channel 4, FMC B, to csv file

```
(py3_mlib_venv) jackh@maze:~/src/caltech-lwa/ads5296_snap2_tests$ ./adc_test.py --fmcB --channel 4 -N 2
```

In this case, a csv file is created with the format used above, but containing a single ADC channel. Board 0, ADC_A input 0 is considered to be ADC channel 0
Board 1, ADC_A, input 0 is considered to be ADC channel 16.

Generated csv files have a three line header. The first line contains the time the dump script was launched, in python `time.ctime()` string representation. The second header line contains the ADC channels which were dumped, as a comma-separated list of ADC channels. When capturing 64k samples, only one ADC channel can be captured at one time.
The third line of the header contains custom text as supplied with the `--header` command line flag. It is empty if no custom header is supplied.

Following the header, each line of the file represents a sequence of 256k ADC samples which were captured. Sequential lines cycle through multiple ADC channels (if a file contains more than one channel) and then through consecutive dumps. For example, a file generated with the command `./adc_test.py --fmcB --sync --use_ramp -N 1` will generate a file with the following contents:

```
Wed Feb 26 11:29:58 2020
4

4,2,-4,3, ... -10,13 # 64k ADC samples from the first dump of channel 4
5,-10,20, ... 14,-19 # 64k ADC samples from the second dump of channel 4
# END OF FILE
```
