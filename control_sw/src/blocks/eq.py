import struct
import numpy as np
from .block import Block

class Eq(Block):
    """
    Instantiate a control interface for an Equalization block.

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    :param n_streams: Number of independent streams which may be delayed
    :type n_streams: int

    :param n_coeffs: Number of coefficients per input stream. Coefficients
        are shared among neighbouring frequency channels.
    :type n_coeffs: int

    """
    _WIDTH = 16 #: Coefficient bit width
    _BP = 5     #: Coefficient binary point position
    _FORMAT = 'H'#'L' 
    def __init__(self, host, name, n_streams=64, n_coeffs=2**9, logger=None):
        super(Eq, self).__init__(host, name, logger)
        self.n_streams = n_streams
        self.n_coeffs = n_coeffs
        self._stream_size = struct.calcsize(self._FORMAT)*self.n_coeffs

    def set_coeffs(self, stream, coeffs):
        """
        Set the coefficients for a data stream.
        Clipping and saturation will be applied before loading.
        
        :param stream: ADC stream index to which coefficients should be applied.
        :type stream: int

        :param coeffs: Array of coefficients to load. This should be of length
            ``self.n_coeffs``, else an AssertionError will be raised.
        :type coeffs: list or numpy.ndarray

        """
        coeffs = np.array(coeffs)
        coeffs *= 2**self._BP
        if np.any(coeffs > (2**self._WIDTH - 1)):
            self._warning("Some coefficients out of range")
        # Make integer
        coeffs = np.array(coeffs, dtype=np.int64)
        # saturate coefficients
        coeffs[coeffs>(2**self._WIDTH - 1)] = 2**self._WIDTH - 1
        coeffs = list(coeffs)
        assert len(coeffs) == self.n_coeffs, "Length of provided coefficient vector should be %d" % self.n_coeffs
        coeffs_str = struct.pack('>%d%s' % (len(coeffs), self._FORMAT), *coeffs)
        coeff_reg = 'core%d_coeffs' % (stream // 16)
        stream_sub_index = stream % 16
        self.write(coeff_reg, coeffs_str, offset=self._stream_size * stream_sub_index)

    def plot_all_coefficients(self, db=False):
        """
        Plot EQ coefficients from all input paths.

        :param db: If True, plot 10log10(power). Else, plot linear.
        :type db: bool

        """
        from matplotlib import pyplot as plt
        for i in range(self.n_streams):
            coeff_val, coeff_scale = self.get_coeffs(i)
            coeffs = coeff_val / 2**coeff_scale
            if db:
                coeffs = 20*np.log10(coeffs)
            plt.plot(coeffs, label=i)
        plt.legend()
        plt.show()

    def get_coeffs(self, stream):
        """
        Get the coefficients currently loaded.
        Reads the actual coefficients from the board.

        :param stream: ADC stream index to query.
        :type stream: int

        :return: (coeffs, binary_point). ``coeffs`` is an array of
            ``self.n_coeffs`` integer coefficients currently being applied.
            ``binary_point`` is the position of the binary point wy which these
            integers are scaled on the FPGA.
        :rtype: (numpy.ndarray, int)

        """
        coeff_reg = 'core%d_coeffs' % (stream // 16)
        stream_sub_index = stream % 16
        coeffs_str = self.read(coeff_reg, self._stream_size, offset= self._stream_size * stream_sub_index)
        coeffs = np.array(struct.unpack('>%d%s' % (self.n_coeffs, self._FORMAT), coeffs_str))
        return coeffs, self._BP

    def clip_count(self):
        """
        Get the total number of times any samples have clipped, since last sync.

        :return: Clip count.
        :rtype: int

        """
        clip_cnt = 0
        for i in range(self.n_streams // 16):
            clip_cnt += self.read_uint('core%d_clip_cnt' % i)
        return clip_cnt

    def get_status(self):
        """
        Get status and error flag dictionaries.

        Status keys:

            - clip_count: Number of clip events in the last sync period.
            - width: Bit width of coefficients
            - binary_point: Binary point position of coefficients
            - coefficients<``n``>: The currently loaded, integer-valued coefficients
              for ADC stream ``n``.

        :return: (status_dict, flags_dict) tuple. `status_dict` is a dictionary of
            status key-value pairs. flags_dict is
            a dictionary with all, or a sub-set, of the keys in `status_dict`. The values
            held in this dictionary are as defined in `error_levels.py` and indicate
            that values in the status dictionary are outside normal ranges.

        """
        stats = {}
        flags = {}
        stats['clip_count'] = self.clip_count()
        for stream in range(self.n_streams):
            coeffs, bp = self.get_coeffs(stream)
            stats['coefficients%.2d' % stream] = coeffs.tolist()
            assert bp == self._BP, "Software hardcoded for all coefficient BPs the same"
        stats['binary_point'] = self._BP
        stats['width'] = self._WIDTH
        return stats, flags

    def initialize(self, read_only=False):
        """
        Initialize block.

        :param read_only: If False, set all coefficients to some nominally sane value.
            Currently, this is 100.0. If True, do nothing.
        :type read_only: bool

        """
        COEFF = 300.
        if read_only:
            return
        for stream in range(self.n_streams):
            self.set_coeffs(stream, COEFF*np.ones(self.n_coeffs,dtype='>%s'%self._FORMAT))
