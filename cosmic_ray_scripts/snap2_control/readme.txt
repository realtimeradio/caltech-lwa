cr_functions.py is a file of control functions for the cosmic ray system.

software_readout.py is a script that uses those functions to trigger reading out the cosmic ray buffer over 40Gb ethernet. Do python software_readout.py --help to see the options.

cr_registers.xlsx is a spreadsheet that describes which settings are contained within which registers, and is used by cr_functions.py.

scratchwork.ipynb is a notebook I used in writing and testing drafts of the code that became cr_functions.py, software_readout.py etc.

The directory before_register_rearrangement contains the previous scripts.
