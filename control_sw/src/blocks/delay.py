from .block import Block

class Delay(Block):
    MIN_DELAY = 5 # minimum delay allowed
    def __init__(self, host, name, n_streams=64, logger=None):
        """
        Instantiate a delay contol block.
        
        Inputs:
            host (casperfpga.CasperFpga): Host FPGA object
            name (string): Name (in simulink) of this block
            n_streams (int): Number of streams this block handles
        """
        super(Delay, self).__init__(host, name, logger)
        self.n_streams = n_streams
        self.max_delay = None

    def get_max_delay(self):
        """
        Query the firmware to get the maximum delay it
        supports.

        Returns
        -------
        delay : int
            Maximum supported delay, in ADC samples
        """
        self.max_delay = self.read_uint('max_delay')
        return self.max_delay

    def set_delay(self, stream, delay):
        """
        Insert a delay to a given input stream.

        Inputs:
            stream (int): Which antpol to delay.
            delay (int): Number of ADC clock cycles of delay to insert.
        """
        if delay < self.MIN_DELAY:
            self._warning("User requested delay of %d, but choosing %d because this is the minimum" % (delay, self.MIN_DELAY))
        if stream > self.n_streams:
            self._error('Tried to set delay for stream %d > n_streams (%d)' % (stream, self.n_streams))
        if self.max_delay is None:
            self.get_max_delay()
        if delay >= self.max_delay:
            self._error('Tried to set delay to %d which is > the allowed maximum (%d)' % (delay, self.max_delay))
        self._info('Setting delay of stream %d to %d' % (stream, delay))
        self.write_int('%d_delay' % stream, delay)

    def get_delay(self, stream):
        """
        Get the current delay for a given input.

        Parameters
        ----------
        stream : int
            Which input number to query

        Returns
        -------
        delay : int
            Currently loaded delay, in ADC samples
        """
        if stream > self.n_streams:
            self._error('Tried to get delay for stream %d > n_streams (%d)' % (stream, self.n_streams))
        return self.read_uint('%d_delay' % stream)

    def initialize(self, read_only=False):
        """
        Initialize all delays to minimum allowed
        """
        self.max_delay = self.get_max_delay()
        if not read_only:
            for i in range(self.n_streams):
                self.set_delay(i, self.MIN_DELAY)

    def print_status(self):
        for i in range(self.n_streams):
            self._info('Stream %d delay: %d' % (i, self.get_delay(i)))
