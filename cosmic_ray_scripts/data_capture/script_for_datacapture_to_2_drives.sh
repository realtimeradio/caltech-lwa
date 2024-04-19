#!/bin/bash

#This is a script to run datacapture.py with data saved to data0 until it's nearly full and then stop and run datacapture to data1


./datacapture.py gpu09 overnight /data0/cosmic-ray-data/newdata/ 704000 60 417479744 13500 
./datacapture.py gpu09 overnight /data1/cosmic-ray-data/newdata/ 704000 60 417479744 0 
