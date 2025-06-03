import socket
import datetime

from .block import Block
from lwa_f.error_levels import *
from lwa_f.zcu102_i2c import *

class PowerMon(Block):
    """
    Instantiate a Power Monitor control block.

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    """
    I2C_REF_CLK_MHZ = 100
    I2C_CLK_KHZ = 100
    I2C_MUX_OUTPUT_INDEX = 2
    I2C_NAME = 'powermon_i2c_interface'
    voltage_sensor_config = {
        'vcc_int_0v85' : {
            'address' : 0x40,
            'shunt_r' : 10.,
            'max_current' : 32.,
            'voltage' : 0.85,
        },
        'vccbram_0v85' : {
            'address' : 0x41,
            'shunt_r' : 10.,
            'max_current' : 13.,
            'voltage' : 0.85,
        },
        'vccaux_1v8' : {
            'address' : 0x42,
            'shunt_r' : 10.,
            'max_current' : 13.,
            'voltage' : 1.8,
        },
        'vcc_1v2' : {
            'address' : 0x43,
            'shunt_r' : 10.,
            'max_current' : 13.,
            'voltage' : 1.2,
        },
        'vcc_3v3' : {
            'address' : 0x44,
            'shunt_r' : 10.,
            'max_current' : 13.,
            'voltage' : 3.3,
        },
        'vadj_1v8' : {
            'address' : 0x45,
            'shunt_r' : 10.,
            'max_current' : 13.,
            'voltage' : 1.8,
        },
        'mgtavcc_0v9' : {
            'address' : 0x46,
            'shunt_r' : 0.1,
            'max_current' : 16.,
            'voltage' : 0.9,
        },
        'mgtavtt_1v2' : {
            'address' : 0x47,
            'shunt_r' : 10.,
            'max_current' : 16.,
            'voltage' : 1.2,
        },
    }
    def __init__(self, host, name, logger=None, passive=False):
        super(PowerMon, self).__init__(host, name, logger)
        self.i2c = None
        self.sensors = {}
        self._initialized = False
        if not passive:
            try:
                self.initialize(read_only=True)
            except:
                self._warning("Error while trying to initialize I2C objects")

    def initialize(self, read_only=False):
        """
        Initialize block.

        :param read_only: If False, configure I2C interface.
            If True, instantiate I2C control object and just try to use it.
        :type read_only: bool
        """

        if not self.I2C_NAME in self.host.listdev():
            self._warning('Couldn\'t initialize because I2C interface not found.' \
                          ' Will try again later')
            return

        try:
            self.i2c = i2c.I2C(self.host, self.I2C_NAME)
            if not read_only:
                self.i2c.setClock(self.I2C_CLK_KHZ, self.I2C_REF_CLK_MHZ)
                self._configure_mux()
        except:
            self._exception('Failed to instantiate I2C control object')
            self.i2c = None
            return

        for sensorname, sensor in self.voltage_sensor_config.items():
            try:
                s = INA226(self.i2c, sensor['address'])
                if not read_only:
                    s.init()
            except:
                self._exception('Error configuring INA226 sensor at address 0x%x' % sensor['address'])
                return
            self.sensors[sensorname] = s
        self._initialized = True


    def _configure_mux(self):
        if self.i2c is not None:
            mux = PCA9544A(self.i2c, 0b101)
            mux.set_output(0b100 | self.I2C_MUX_OUTPUT_INDEX)
        else:
            self._warning("Couldn't configure MUX because I2C not connected")

    def get_status(self):
        """
        Get status and error flag dictionaries.

        Status keys:

            - <rail_name>_voltage (float) : Voltage measured on <rail_name> in
              units of Volts.

            - <rail_name>_current(float) : Current draw measured on <rail_name>
              in units of Amps.

        Currents are flagged as warnings if they exceed 80% of the allowed
        maximum.

        Voltages are flagged as errors if they are not within 3% of the
        expected level.

        :return: (status_dict, flags_dict) tuple. `status_dict` is a dictionary of
            status key-value pairs. flags_dict is
            a dictionary with all, or a sub-set, of the keys in `status_dict`. The values
            held in this dictionary are as defined in `error_levels.py` and indicate
            that values in the status dictionary are outside normal ranges.
        """
        if not self._initialized:
            try:
                self.initialize(read_only=True)
            except:
                self._warning("Error while trying to initialize I2C objects")

        stats = {}
        flags = {}
        for sensorname, sensor in self.sensors.items():
            conf = self.voltage_sensor_config[sensorname]
            v = sensor.readVolt('bus')
            i = sensor.readCurrent(conf['shunt_r'])
            stats['%s_voltage' % sensorname] = v
            stats['%s_current' % sensorname] = i
            if (v < 0.97*conf['voltage']) or (v > 1.03*conf['voltage']):
                flags['%s_voltage' % sensorname] = FENG_WARNING
            if (i > 0.8*conf['max_current']):
                flags['%s_current' % sensorname] = FENG_WARNING
            if (i > conf['max_current']):
                flags['%s_current' % sensorname] = FENG_WARNING
        return stats, flags
