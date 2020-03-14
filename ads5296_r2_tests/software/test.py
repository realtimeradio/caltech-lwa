import corr
import logging
import caltech_adc
import time

BOFFILE = "caltech_adc_test.bof"

logging.basicConfig()
logger = logging.getLogger()
logger.setLevel(logging.INFO)


r = corr.katcp_wrapper.FpgaClient('r2d020669')
time.sleep(0.1)
print("Programming FPGA with %s" % BOFFILE)
r.progdev(BOFFILE)

a = caltech_adc.CaltechAdc(r, logger=logger)

a.init(samplingRate=200, numChannel=4)
a.reset() # Reset FPGA MMCMs

# Reporgram FPGA now that ADC clocks should be setup
print("Re-programming FPGA with %s now ADCs have been initialized" % BOFFILE)
r.progdev(BOFFILE)

a.logger.info('Check if MMCM locked')
if not a.getWord('ADC16_LOCKED'):
   a.logger.error('MMCM not locked.')
else:
   a.logger.info('ok')

a.calibrate()
