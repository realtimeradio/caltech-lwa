import corr
import logging
import caltech_adc
import time
from matplotlib import pyplot as plt
import numpy as np

ADCS_TO_PLOT = [2]
TEST_FREQ = 10 # MHz
SAMPLE_RATE = 100

CORE_SAMPLE_RATE = SAMPLE_RATE / 2.

logging.basicConfig()
logger = logging.getLogger()
logger.setLevel(logging.INFO)

r = corr.katcp_wrapper.FpgaClient('r2d020669')
time.sleep(0.1)

a = caltech_adc.CaltechAdc(r, logger=logger)


a.snapshot()
x = a.readRAM(signed=True, undo_bitflip=False)
for i in ADCS_TO_PLOT:
    fig = plt.figure()
    for j in range(4):
        d_even = x[i][:,j]
        d_odd  = x[i][:,j+4]
        n_samples = d_even.shape[0]
        d = np.zeros(2*n_samples)
        d[0::2] = d_even
        d[1::2] = d_odd
        plt.subplot(2,2,j+1)
        plt.plot(d)
        plt.ylabel("ADC value")
        plt.xlabel("Sample Number")
        plt.title("ADC %d:%d" % (i,j))

powers = []
for i in ADCS_TO_PLOT:
    fig = plt.figure()
    for j in range(4):
        d_even = x[i][:,j]
        d_odd  = x[i][:,j+4]
        n_samples = d_even.shape[0]
        d = np.zeros(2*n_samples)
        d[0::2] = d_even
        d[1::2] = d_odd
        plt.subplot(2,2,j+1)
        spec = np.abs(np.fft.rfft(d))**2
        freq_axis = np.linspace(0, SAMPLE_RATE/2., spec.shape[0])
        powers += [spec[3:].max()] # ignore DC
        plt.plot(freq_axis, 10*np.log10(spec))
        plt.xlabel("Frequency [MHz]")
        plt.ylabel("Power [dB arb reference]")
        plt.title("FFT(ADC %d:%d)" % (i,j))

# Get phases between cores
# convert degrees of test tone phase to true time
SAMPLES_PER_CYCLE = CORE_SAMPLE_RATE/TEST_FREQ
TIME_PER_CYCLE = SAMPLES_PER_CYCLE / CORE_SAMPLE_RATE * 1000 # ns
TIME_PER_DEGREE = TIME_PER_CYCLE / 360.
SAMPLES_PER_DEGREE = SAMPLES_PER_CYCLE / 360.

for i in ADCS_TO_PLOT:
   for j in range(4):
       d_even = x[i][:,j]
       d_odd  = x[i][:,j+4]
       S_even = np.fft.rfft(d_even)[10:] # kill DC power
       S_even_pow = np.abs(S_even)**2
       S_odd  = np.fft.rfft(d_odd)[10:] # kill DC power
       S_odd_pow = np.abs(S_odd)**2
       S_even_max = S_even[S_even_pow.argmax()]
       S_odd_max = S_odd[S_odd_pow.argmax()]
       corr = np.conj(S_even_max)*S_odd_max
       corr_phase_deg = np.angle(corr)*180/np.pi
       corr_phase_time = corr_phase_deg * TIME_PER_DEGREE
       corr_phase_samples = corr_phase_deg * SAMPLES_PER_DEGREE
       print("ADC %d:%d : core offset = %.1f degrees (%.1f ns; %.1f samples)" % (i,j,corr_phase_deg, corr_phase_time, corr_phase_samples))

powers = np.array(powers)
max_power = powers.max()
max_power_db = 10*np.log10(max_power)
rel_powers_db = 10*np.log10(powers) - max_power_db
for pn, p in enumerate(rel_powers_db):
    print "ADC %d: %.2f dB (relative to max channel)" % (pn, p)

print "Max power: %.2f dB (arb ref)" % (max_power_db)

plt.show()
