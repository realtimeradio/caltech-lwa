import lwa_f
import time
import numpy as np

f = lwa_f.LwaF()

feng = f.fengs_by_name['snap2-rev1']
feng.fpga.get_system_information('/home/jackh/foo.fpg')

print([block.name for block in feng.blocks])

feng.sync.initialize()
feng.sync.arm_sync()
feng.sync.sw_sync()
feng.sync.sw_sync()
feng.sync.sw_sync()
feng.sync.sw_sync()
feng.sync.sw_sync()

feng.input.use_zero()
feng.input.print_status()
feng.input.use_adc()
feng.input.print_status()
feng.input.use_noise()
feng.input.print_status()

#for i in range(feng.input.n_streams)[0:8]:
#    feng.input.plot_histogram(i)
#feng.input.show_histogram_plot()

feng.delay.initialize()
feng.delay.print_status()

feng.eq.initialize()
time.sleep(1)
feng.eq.print_status()
print('Setting EQ coefficients to 0 for all inputs')
for i in range(feng.eq.n_streams):
    feng.eq.set_coeffs(i, np.zeros(feng.eq.n_coeffs))
time.sleep(1)
feng.eq.print_status()


feng.eq_tvg.write_freq_ramp()
feng.eq_tvg.tvg_enable()

#feng.corr.initialize()
#feng.corr.plot_corr(0, 0, show=True)

feng.fpga.gbes.eth_forty_gbe.setup(0x02030405aa, '192.168.11.101', 10000, gateway=None, subnet_mask='255.255.255.0')
feng.fpga.gbes.eth_forty_gbe.configure_core()
for i in range(256):
    feng.fpga.gbes.eth_forty_gbe.set_single_arp_entry('192.168.11.%d'%i, 0x248a07e87c31)

# Make this F-engine look like 2 boards, each sending 32 chans
#feng.configure_output(32, 2*list(range(8,8+32)), 2*['192.168.11.4'], ants=[0,64])
# Make this F-engine look like 4 boards, each sending 2*96 chans to a single destination
n_boards = 4
n_chans_per_packet = 96
n_chans_per_x = 96*2
n_packets_per_x = n_chans_per_x // n_chans_per_packet
data_rate_gbps = n_chans_per_x * 24.0e3 * 64 * 8 * n_boards / 1e9 # assuming real sample rate -> 24kHz channels
print('Data rate (for 24 kHz chans): %.2f' % data_rate_gbps)
ants = []
for b in range(n_boards):
    for p in range(n_packets_per_x):
        ants += [b*64]
feng.configure_output(n_chans_per_packet, 
                      n_boards*list(range(n_chans_per_x)),
                      n_packets_per_x * n_boards * ['192.168.11.4'],
                      ants=ants,
                     )

