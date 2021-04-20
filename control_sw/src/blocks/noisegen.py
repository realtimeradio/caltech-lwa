from .block import Block

class NoiseGen(Block):
    """
    Noise Generator controller

    This block controls a digital noise source,
    which can generate multiple independent channels
    of gaussian noise.
    These channels can be assigned to multiple outputs
    of this block, to create correlated or uncorrelated
    noise streams.

    :param host: CasperFpga interface for host.
    :type host: casperfpga.CasperFpga

    :param name: Name of block in Simulink hierarchy.
    :type name: str

    :param logger: Logger instance to which log messages should be emitted.
    :type logger: logging.Logger

    :param n_noise: The number of independent noise generation cores in
        the underlying block. 2*n_noise independent noise
        streams will be produced.
    :type n_noise: int

    :param n_outputs: The number of output channels from the block.
    :type n_outputs: int

    """
    def __init__(self, host, name, n_noise=5, n_outputs=64, logger=None):
        super(NoiseGen, self).__init__(host, name, logger)
        self.n_noise = n_noise
        self.n_outputs = n_outputs

    def set_seed(self, n, seed):
        """
        Set the seed of a noise generator.

        :param n: Noise generator ID to seed.
        :type n: int

        :param seed: Noise generator seed to load.
        :type seed: int
        """
        if n> self.n_noise:
            self._error('Tried to set noise generator seed fo core %d > n_noise (%d)' % (m, self.n_noise))
            return
        if seed > 255:
            self._error('Seed value is an 8-bit integer. It cannot be %d' % seed)
            return
        regname = 'seeds%d' % (n // 4)
        self.change_reg_bits(regname, seed, 8 * (n % 4), 8)

    def get_seed(self, n):
        """
        Get the seed of a noise generator.

        :param n: Noise generator ID whose seed to read.
        :type n: int

        :return: Noise generator seed.
        :rtype int:
        """
        if n > self.n_noise:
            self._error('Tried to get noise generator seed for n %d > n_noise (%d)' % (n, self.n_noise))
            return
        regname = 'seeds%d' % (n // 4)
        return self.get_reg_bits(regname, 8 * (n % 4), 8)

    def assign_output(self, output, noise):
        """
        Assign an output channel to a given noise stream. Note
        that the output stream will not be affected unless the
        downstream input multiplexors are set to noise mode.
        
        :param output: The index of the output stream to be assigned.
        :type output: int

        :param noise: The index of the noise stream to assign to `output`.
            Note that each noise generator core generates two
            independent streams, so `noise` can be in
            range(0, 2*self.n_noise)
        :type noise: int
        """
        assert (noise < 2*self.n_noise), "Tried to assign noise source >= 2*self.n_noise"
        assert (output < self.n_outputs), "Tried to assign an output >= self.n_outputs"
        # Control is in blocks of 8. Which block do we need?
        octal_block = output // 8
        octal_index = output % 8
        ctrl_reg = "octal_mux%d_sel" % octal_block
        self.change_reg_bits(ctrl_reg, noise, 4*octal_index, 4)

    def get_output_assignment(self, output):
        """
        Get the index of the noise stream assigned to an output.

        :param output: The index of the output stream to query.
        :type output: int

        :return: The index of the noise stream to assign to `output`.
            Note that each noise generator core generates two
            independent streams, so `noise` can be in
            range(0, 2*self.n_noise)
        :rtype: int
        """
        assert (output < self.n_outputs), "Tried to assign an output >= self.n_outputs"
        # Control is in blocks of 8. Which block do we need?
        octal_block = output // 8
        octal_index = output % 8
        ctrl_reg = "octal_mux%d_sel" % octal_block
        noise = self.get_reg_bits(ctrl_reg, 4*octal_index, 4)
        return noise

    def initialize(self, read_only=False):
        """
        Initialize the block

        :param read_only: If False, set the seen of noise generator ``n`` to ``n``.
            If True, do nothing.
        :type read_only: bool
        """
        if read_only:
            return
        for n in range(self.n_noise):
            self.set_seed(0, n)

    def get_status(self):
        """
        Get status and error flag dictionaries.

        Status keys:

            - noise_core<m>_seed (int): Seed currently loaded into noise generator
              core ``m``. ``m`` should be a two-digit integer starting at 00.

            - output_assignment<n> (int): The noise generator ID currently
              assigned to output stream ``n``, where ``n`` is a two-digit
              integer starting at 00.

        :return: (status_dict, flags_dict) tuple. `status_dict` is a dictionary of
            status key-value pairs. flags_dict is
            a dictionary with all, or a sub-set, of the keys in `status_dict`. The values
            held in this dictionary are as defined in `error_levels.py` and indicate
            that values in the status dictionary are outside normal ranges.

        """
        stats = {}
        flags = {}
        for n in range(self.n_noise):
            stats['noise_core%.2d_seed' % n] = self.get_seed(n)
        for o in range(self.n_outputs):
            stats['output_assignment%.2d' % o] = self.get_output_assignment(o)
        return stats, flags
