import socket
import datetime

from .block import Block
from lwa_f.error_levels import *
from casperfpga import i2c, i2c_volt, i2c_mux

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
    I2C_NAME = 'i2c_interface'
    voltage_sensor_config = {
        'vcc_int_0v95' : {
            'address' : 0b1000000,
            'shunt_r' : 1./(3 * 1./0.001),
            'max_current' : 32.,
            'voltage' : 0.95,
        },
        'vccio_1v5' : {
            'address' : 0b1000001,
            'shunt_r' : 0.001,
            'max_current' : 13.,
            'voltage' : 1.5,
        },
        'vccio_1v8' : {
            'address' : 0b1000010,
            'shunt_r' : 0.001,
            'max_current' : 13.,
            'voltage' : 1.8,
        },
        'mgtavcc_1v0' : {
            'address' : 0b1000011,
            'shunt_r' : 0.001,
            'max_current' : 16.,
            'voltage' : 1.0,
        },
        'mgtaux_1v8' : {
            'address' : 0b1000100,
            'shunt_r' : 0.001,
            'max_current' : 1.1,
            'voltage' : 1.8,
        },
        'mgtavtt_1v2' : {
            'address' : 0b1000101,
            'shunt_r' : 0.001,
            'max_current' : 16.,
            'voltage' : 1.2,
        },
        'sys_5v0' : {
            'address' : 0b1000110,
            'shunt_r' : 0.001,
            'max_current' : 13.,
            'voltage' : 5.0,
        },
        'sys_3v3' : {
            'address' : 0b1000111,
            'shunt_r' : 0.001,
            'max_current' : 13.,
            'voltage' : 3.3,
        },
        'sys_1v8' : {
            'address' : 0b1001000,
            'shunt_r' : 0.001,
            'max_current' : 8.,
            'voltage' : 1.8,
        },
        'sys_1v0' : {
            'address' : 0b1001001,
            'shunt_r' : 0.001,
            'max_current' : 8.,
            'voltage' : 1.0,
        },
        'sys_2v5' : {
            'address' : 0b1001010,
            'shunt_r' : 0.001,
            'max_current' : 8.,
            'voltage' : 2.5,
        },
        'sys_1v5' : {
            'address' : 0b1001011,
            'shunt_r' : 0.001,
            'max_current' : 8.,
            'voltage' : 1.5,
        },
    }
    def __init__(self, host, name, logger=None):
        super(PowerMon, self).__init__(host, name, logger)
        self.i2c = None
        self.sensors = {}
        self._initialized = False
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

        if not self.I2C_NAME in self.listdev():
            self._warning('Couldn\'t initialize because I2C interface not found.' \
                          ' Will try again later')
            return

        try:
            self.i2c = i2c.I2C(self, self.I2C_NAME)
            if not read_only:
                self.i2c.setClock(self.I2C_CLK_KHZ, self.I2C_REF_CLK_MHZ)
                self._configure_mux()
        except:
            self._error('Failed to instantiate I2C control object')
            self.i2c = None
            return

        for sensorname, sensor in self.voltage_sensor_config.items():
            s = i2c_volt.INA219(self.i2c, sensor['address'])
            if not read_only:
                s.init()
            self.sensors[sensorname] = s
        self._initialized = True


    def _configure_mux(self):
        if self.i2c is not None:
            mux = i2c_mux.PCA9548A(self.i2c, addr=0)
            mux.set_output(1 << self.I2C_MUX_OUTPUT_INDEX)
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
        maximum, and errors if they exceed the allowed maximum.

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
                flags['%s_voltage' % sensorname] = FENG_ERROR
            if (i > 0.8*conf['max_current']):
                flags['%s_current' % sensorname] = FENG_WARNING
            if (i > conf['max_current']):
                flags['%s_current' % sensorname] = FENG_ERROR
        return stats, flags
