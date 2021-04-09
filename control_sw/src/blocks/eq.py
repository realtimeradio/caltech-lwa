import struct
import numpy as np
from .block import Block

class Eq(Block):
    _WIDTH = 16
    _BP = 5
    _FORMAT = 'H'#'L'
    def __init__(self, host, name, n_streams=64, n_coeffs=2**9, logger=None):
        """
        Instantiate an EQ block
        
        Inputs:
            host (casperfpga.CasperFpga): Host FPGA object
            name (string): Name (in simulink) of this block
            n_streams (int): Number of streams this block handles
            n_coeffs (int): Number of coefficients per input stream
        """
        super(Eq, self).__init__(host, name, logger)
        self.n_streams = n_streams
        self.n_coeffs = n_coeffs
        self._stream_size = struct.calcsize(self._FORMAT)*self.n_coeffs

    def set_coeffs(self, stream, coeffs):
        """
        Set the coefficients for a data stream. Clipping and saturation will be applied before
        loading.
        
        Inputs
           stream (int): Which stream to manipulate
           coeffs (list or numpy array): Coefficients to load.
        """
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

    def get_coeffs(self, stream):
        """
        Get the coefficients currently loaded. Reads the actual coefficients from the board.
        Inputs:
            stream (int): Stream index to query
        Returns
            numpy array of `self.n_coeffs` coefficients currently being applied to this stream.
        """
        coeff_reg = 'core%d_coeffs' % (stream // 16)
        stream_sub_index = stream % 16
        coeffs_str = self.read(coeff_reg, self._stream_size, offset= self._stream_size * stream_sub_index)
        coeffs = np.array(struct.unpack('>%d%s' % (self.n_coeffs, self._FORMAT), coeffs_str))
        return coeffs, self._BP

    def clip_count(self):
        """
        Get the total number of times any samples have clipped, since last sync.
        """
        clip_cnt = 0
        for i in range(self.n_streams // 16):
            clip_cnt += self.read_uint('core%d_clip_cnt' % i)
        return clip_cnt

    def get_status(self):
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
        Initialize block, setting coefficients to some nominally sane value.
        Currently, this is 100.0
        """
        if read_only:
            return
        for stream in range(self.n_streams):
            self.set_coeffs(stream, 100*np.ones(self.n_coeffs,dtype='>%s'%self._FORMAT))
