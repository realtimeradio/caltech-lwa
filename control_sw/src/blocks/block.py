import logging
from lwa_f import helpers

class Block(object):
    """
    A class to encapsulate a Simulink subsystem, which
    contains a variety of registers.
    The main function of this base class is to facilitate
    filtering the registers in a CasperFpga device to
    isolate those associated with a particular subsystem.
    
    This class should be sub-classed by each unique Simulink
    subsystem, which should add methods associated with its
    own functionality. For example, a "Sync Generator" block
    in Simulink might have methods for tasks such as issuing
    a synchronization pulse, or polling uptime.
    """
    def __init__(self, host, name, logger=None):
        """
        Block Constructor

        Parameters
        ----------
        host : CasperFpga
            The CasperFpga instance running firmware with which
            this block is associated.
        name : The name of this block. This should match the
            top-level Simulink block name.
        logger : a Logger instance which this block should use
            for output. If `None`, default log handlers (as
            defined in the `helpers.py` library) will be used.
        """
        self.host = host #casperfpga object
        # One logger per host. Multiple blocks share the same logger.
        # Multiple hosts should *not* share the same logger, since we can multithread over hosts.
        self.logger = logger or helpers.add_default_log_handlers(logging.getLogger(__name__ + ":%s" % (host.host)))
        self.name = name
        if (name is None) or (name == ''):
            self.prefix = ''
        else:
            self.prefix = name + '_'

    def _prefix_log(self, msg):
        """
        Take a log message, and prefix it with "<block> - ".
        Eg, take "Argh, I'm broken" and replace it with
        "eq_tvg - Argh I'm broken"
        """
        prefix = "%s - " % self.name
        return prefix + msg

    def _debug(self, msg, *args, **kwargs):
        self.logger.debug(self._prefix_log(msg), *args, **kwargs)

    def _info(self, msg, *args, **kwargs):
        self.logger.info(self._prefix_log(msg), *args, **kwargs)

    def _warning(self, msg, *args, **kwargs):
        self.logger.warning(self._prefix_log(msg), *args, **kwargs)

    def _error(self, msg, *args, **kwargs):
        self.logger.error(self._prefix_log(msg), *args, **kwargs)

    def _critical(self, msg, *args, **kwargs):
        self.logger.critical(self._prefix_log(msg), *args, **kwargs)

    def _exception(self, msg, *args, **kwargs):
        self.logger.exception(self._prefix_log(msg), *args, **kwargs)

    def print_status(self):
        """
        Individual blocks should override this
        method to print some useful information.
        """
        pass

    def initialize(self, read_only=False):
        """
        Individual blocks should override this
        method to configure themselves appropriately

        :param read_only: If False, initialize blocks in a way that might
            change the configuration of running hardware. If True, read runtime
            info from blocks, but don't change anything.
        :type read_only: bool
        """


    def listdev(self):
        """
        return a list of all register names associated with
        this block.
        """
        devs = self.host.listdev()
        return [x[len(self.prefix):] for x in devs if x.startswith(self.prefix)]

    def read_int(self, reg, word_offset=0, **kwargs):
        return self.host.read_int(self.prefix + reg, word_offset=word_offset, **kwargs)

    def write_int(self, reg, val, word_offset=0, **kwargs):
        self.host.write_int(self.prefix + reg, val, word_offset=word_offset, **kwargs)

    def read_uint(self, reg, word_offset=0, **kwargs):
        return self.host.read_uint(self.prefix + reg, word_offset=word_offset, **kwargs)

    def write_uint(self, reg, val, word_offset=0, **kwargs):
        self.host.write_int(self.prefix + reg, val, word_offset=word_offset, **kwargs)

    def read(self, reg, nbytes, **kwargs):
        return self.host.read(self.prefix + reg, nbytes, **kwargs)

    def write(self, reg, val, offset=0, **kwargs):
        self.host.write(self.prefix + reg, val, offset=offset, **kwargs)

    def blindwrite(self, reg, val, **kwargs):
        self.host.blindwrite(self.prefix + reg, val, **kwargs)

    def change_reg_bits(self, reg, val, start, width=1):
        """
        Change certain bits of a register.

        Parameters
        ----------
        reg : str
            The name of the register.
        val : int
            The value to write.
        start : int
            The bit index of the least significant bit to write.
        width : int
            The number of bits to write.
        
        Eg. to write the value of 0xA into bits 8,7,6,5,4 of register
            `my_reg`: `change_reg_bits('my_reg', 0xA, 4, 5)`
        """
        orig_val = self.read_uint(reg)
        masked   = orig_val & (0xffffffff - ((2**width - 1) << start))
        new_val  = masked + (val << start)
        self.write_int(reg, new_val)

    def get_reg_bits(self, reg, start, width=1):
        """
        Get certain bits of a register.

        Parameters
        ----------
        reg : str
            The name of the register.
        start : int
            The bit index of the least significant bit to write.
        width : int
            The number of bits to write.
        
        Eg. to bits 8,7,6,5,4 of register
            `my_reg`: `get_reg_bits('my_reg', 4, 5)`
        """
        val = self.read_uint(reg)
        val = val >> start
        val = val & (2**width - 1)
        return val
