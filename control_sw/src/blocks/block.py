import logging
from termcolor import colored
from lwa_f import helpers
from lwa_f import error_levels as el

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

    def get_status(self):
        """
        Get a dictionary of status values, with optional warning of error flags.
        To be overridden by individual blocks

        :return: (status_dict, flags_dict) tuple. `status_dict` is a dictionary of
            status key-value pairs, defined on a per-block basis. flags_dict is
            a dictionary with all, or a sub-set, of the keys in `status_dict`. The values
            held in this dictionary should be as defined in `error_levels.py`.
        """
        status_dict = {}
        flags_dict = {}
        return status_dict, flags_dict

    def print_status(self, use_color=True):
        """
        Print the information returned by `get_status`, highlighting error flags
        with colors.

        :param use_color: If True, print with errors highlighted with colored text.
        :type use_color: bool
        """
        colormap = {
            el.FENG_OK: 'green',
            el.FENG_NOTIFY: 'blue',
            el.FENG_WARNING: 'yellow',
            el.FENG_ERROR: 'red',
        }
        try:
            stats, flags = self.get_status()
        except TypeError:
            # If the block was too lazy to provide flags
            try:
                stats = self.get_status()
                flags = {}
            except:
                self._error("Failed to call get_status successfully")
                return
        for k, v in sorted(stats.items()):
            err = flags.get(k, el.FENG_OK)
            color = colormap[err]
            msg = '%s: %s' % (k, v)
            if use_color:
                print(colored(msg, color))
            else:
                print(msg)

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
        try:
            return self.host.read_int(self.prefix + reg, word_offset=word_offset, **kwargs)
        except:
            if reg not in self.listdev():
                self._error("Tried to read register %s which doesn't exist!" % reg)
            raise

    def write_int(self, reg, val, word_offset=0, **kwargs):
        try:
            self.host.write_int(self.prefix + reg, val, word_offset=word_offset, **kwargs)
        except:
            if reg not in self.listdev():
                self._error("Tried to read register %s which doesn't exist!" % reg)
            else:
                # Only raise an exception if the register is there, otherwise
                # just skip the write
                raise

    def read_uint(self, reg, word_offset=0, **kwargs):
        try:
            return self.host.read_uint(self.prefix + reg, word_offset=word_offset, **kwargs)
        except:
            if reg not in self.listdev():
                self._error("Tried to read register %s which doesn't exist!" % reg)
            raise

    def write_uint(self, reg, val, word_offset=0, **kwargs):
        try:
            self.host.write_int(self.prefix + reg, val, word_offset=word_offset, **kwargs)
        except:
            if reg not in self.listdev():
                self._error("Tried to read register %s which doesn't exist!" % reg)
            else:
                # Only raise an exception if the register is there, otherwise
                # just skip the write
                raise

    def read(self, reg, nbytes, **kwargs):
        try:
            return self.host.read(self.prefix + reg, nbytes, **kwargs)
        except:
            if reg not in self.listdev():
                self._error("Tried to read register %s which doesn't exist!" % reg)
            raise

    def write(self, reg, val, offset=0, **kwargs):
        try:
            self.host.write(self.prefix + reg, val, offset=offset, **kwargs)
        except:
            if reg not in self.listdev():
                self._error("Tried to read register %s which doesn't exist!" % reg)
            else:
                # Only raise an exception if the register is there, otherwise
                # just skip the write
                raise

    def blindwrite(self, reg, val, **kwargs):
        try:
            self.host.blindwrite(self.prefix + reg, val, **kwargs)
        except:
            if reg not in self.listdev():
                self._error("Tried to read register %s which doesn't exist!" % reg)
            else:
                # Only raise an exception if the register is there, otherwise
                # just skip the write
                raise

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
