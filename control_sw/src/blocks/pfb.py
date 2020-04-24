class Pfb(Block):
    N_CORES = 4
    def __init__(self, host, name, logger=None):
        super(Pfb, self).__init__(host, name, logger)
        self.SHIFT_OFFSET = 0
        self.SHIFT_WIDTH  = 16
        self.PRESHIFT_OFFSET = 16
        self.PRESHIFT_WIDTH  = 2
        self.STAT_RST_BIT = 18

    def set_fft_shift(self, shift):
        self.change_reg_bits('ctrl', shift, self.SHIFT_OFFSET, self.SHIFT_WIDTH)

    def set_fft_preshift(self, shift):
        self.change_reg_bits('ctrl', shift, self.PRESHIFT_OFFSET, self.PRESHIFT_WIDTH)

    def rst_stats(self):
        self.change_reg_bits('ctrl', 1, self.STAT_RST_BIT)
        self.change_reg_bits('ctrl', 0, self.STAT_RST_BIT)

    def _is_overflowing_per_core(self):
        core_is_of = []
        for i in range(self.N_CORES):
            core_is_of += [self.read_uint('pfb16x_%d_status' % i) != 0]
            
    def is_overflowing(self):
        return any(self._is_overflowing_per_core())
        
    def initialize(self):
        self.write_int('ctrl', 0)
        self.set_fft_shift(0b110101010101)
        self.rst_stats()
