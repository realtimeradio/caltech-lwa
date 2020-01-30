import corr
import logging
import caltech_adc
import time

logging.basicConfig()
logger = logging.getLogger()
logger.setLevel(logging.INFO)

r = corr.katcp_wrapper.FpgaClient('r2d020669')
time.sleep(0.1)

a = caltech_adc.CaltechAdc(r, logger=logger)

a.logger.info('Check if MMCM locked')
if not a.getWord('ADC16_LOCKED'):
   a.logger.error('MMCM not locked.')
else:
   a.logger.info('ok')

a.snapshot()
x = a.readRAM()
for i in range(4):
    for j in range(8):
        print "%d:%d:" % (i,j), x[i][0:12,j]

print "initializing"
a.init(samplingRate=200, numChannel=4)

a.snapshot()
x = a.readRAM()
for i in range(4):
    for j in range(8):
        print "%d:%d:" % (i,j), x[i][0:12,j]
