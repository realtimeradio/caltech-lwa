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
    """
    def __init__(self, host, name, n_noise=5, n_outputs=64, logger=None):
        """
        NoiseGen Constructor

        Parameters
        ----------
        host : CasperFpga
            The CasperFpga instance running firmware with which
            this block is associated.
        name : The name of this block. This should match the
            top-level Simulink block name.
        n_noise : int
            The number of independent noise generation cores in
            the underlying block. 2*n_noise independent noise
            streams will be produced.
        n_outputs : int
            The number of output channels from the block.
        logger : a Logger instance which this block should use
            for output. If `None`, default log handlers (as
            defined in the `helpers.py` library) will be used.
        """
        super(NoiseGen, self).__init__(host, name, logger)
        self.n_noise = n_noise
        self.n_outputs = n_outputs

    def set_seed(self, n, seed):
        """
        Set the seed of noise generator `n`
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
        Get the seed of noise generatr `n`
        """
        if n > self.n_noise:
            self._error('Tried to get noise generator seed for n %d > n_noise (%d)' % (n, self.n_noise))
            return
        regname = 'seeds%d' % (n // 4)
        return self.get_reg_bits(regname, 8 * (n % 4), 8)

    def assign_output(self, output, noise):
        """
        Assign an output channel with a given noise stream.
        
        Parameters
        ----------
        output : int
            The index of the output stream to be assigned.
        noise : int
            The index of the noise stream to assign to `output`.
            Note that each noise generator core generates two
            independent streams, so `noise` can be in
            range(0, 2*self.n_noise)
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
        Get the index of the noise stream assigned to `output`

        Parameters
        ----------
        output : int
            The index of the output stream to query.

        Returns
        -------
        noise : int
            The index of the noise stream to assign to `output`.
            Note that each noise generator core generates two
            independent streams, so `noise` can be in
            range(0, 2*self.n_noise)
        """
        assert (output < self.n_outputs), "Tried to assign an output >= self.n_outputs"
        # Control is in blocks of 8. Which block do we need?
        octal_block = output // 8
        octal_index = output % 8
        ctrl_reg = "octal_mux%d_sel" % octal_block
        noise = self.get_reg_bits(ctrl_reg, 4*octal_index, 4)
        return noise

    def initialize(self, read_only=False):
        if read_only:
            return
        for n in range(self.n_noise):
            self.set_seed(0, n)

    def print_status(self):
        for n in range(self.n_noise):
            self._info('Noise block %d seed: %d' % (n, self.get_seed(n)))
        for o in range(self.n_outputs):
            self._info('Output %d assigned to noise stream %d' % (o, self.get_output_assignment(o)))
