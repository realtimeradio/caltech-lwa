#! /bin/bash
#This script applies settings optimized for receiving cosmic ray data fast on enp65s0.
#Sudo privelege is required to run the script.



# Set High performance mode
for i in `ls /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor`; do echo performance > $i; done

#Set MTU
ifconfig enp65s0 mtu 9000 up

#Set kernel buffer sizes
sysctl net.core.rmem_max=536870912 
sysctl net.core.rmem_default=536870912

#Set ring buffer size to maximum
ethtool -G enp65s0 rx 8192


