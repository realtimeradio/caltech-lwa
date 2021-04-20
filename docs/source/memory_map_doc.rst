F-Engine Register Definitions
=============================

F-Engine firmware is designed to be manipulated using the provided
``Snap2FEngine`` class, or its higher level etcd-based control interface.

However, individual F-engine registers and their purposes are described below.

Register Descriptions
---------------------


.. list-table::
    :widths: 10 10 10 70
    :header-rows: 1

    * - Register Name
      - Size (Bytes)
      - Permission
      - Description
    * - **ADC Registers**
      -
      -
      -
    * - ads5296_controller_<i>_<j>
      - 128
      - r/w
      - ADS5296 board control register for the ``j`` th ADC card in FMC ``i``. Should be manipulated using the ``ADS5296`` class of the ``casperfpga`` python library.
    * - ads5296_spi_controller<i>
      - 16
      - r/w
      - ADS5296 SPI controller register for ADC cards on FMC slot ``i``. Should be manipulated using the ``ADS5296`` class of the ``casperfpga`` python library.
    * - ads5296_wb_ram<i>_<j>_<k>
      - 4096
      - r/w
      - ADC snapshot RAM for ADC chip ``k`` on board ``j`` of FMC port ``i``. Should be manipulated using the ``ADS5296`` class of the ``casperfpga`` python library.



    * - adc_rst
      - 4
      - r/w
      - Set to ``1`` to assert the ADC reset. This flushes the ADC output FIFOs. Data will not begin flowing again until the ADC ``sync`` input transitions from ``0`` to ``1``.
    * - adc_snapshot_trigger
      - 4
      - r/w
      - When this register transitions from ``0`` to ``1``, all ADC channels will simultaneously capture a burst of ADC samples.
    * - adc_sync
      - 4
      - r/w
      - Write ``1`` to this register to assert the ADC's ``sync`` input. This input is edge sensitive.

    * - **Auto-Correlator Registers**
      -
      -
      -

    * - autocorr_acc_cnt
      - 4
      - r
      - 32-bit wrapping accumulation counter, which increments each time a new accumulation is recorded to RAM. There is no buffer locking when correlation data are read, so this counter can be used to ensure that data have not changed during a read.
    * - autocorr_acc_len
      - 4
      - r/w
      - Accumulation length, in spectra.
    * - autocorr_common_dout0_bram
      - 262144
      - r/w
      - For memory name suffix ``<n>_bram``, stores the autocorrelation powers for frequency channels ``8n`` of 16 consective F-engine inputs. Data are stored in ``[input_number, freq_channel]`` order.
    * - autocorr_common_dout1_bram
      - 262144
      - r/w
      - For memory name suffix ``<n>_bram``, stores the autocorrelation powers for frequency channels ``8n`` of 16 consective F-engine inputs. Data are stored in ``[input_number, freq_channel]`` order.
    * - autocorr_common_dout2_bram
      - 262144
      - r/w
      - For memory name suffix ``<n>_bram``, stores the autocorrelation powers for frequency channels ``8n`` of 16 consective F-engine inputs. Data are stored in ``[input_number, freq_channel]`` order.
    * - autocorr_common_dout3_bram
      - 262144
      - r/w
      - For memory name suffix ``<n>_bram``, stores the autocorrelation powers for frequency channels ``8n`` of 16 consective F-engine inputs. Data are stored in ``[input_number, freq_channel]`` order.
    * - autocorr_common_dout4_bram
      - 262144
      - r/w
      - For memory name suffix ``<n>_bram``, stores the autocorrelation powers for frequency channels ``8n`` of 16 consective F-engine inputs. Data are stored in ``[input_number, freq_channel]`` order.
    * - autocorr_common_dout5_bram
      - 262144
      - r/w
      - For memory name suffix ``<n>_bram``, stores the autocorrelation powers for frequency channels ``8n`` of 16 consective F-engine inputs. Data are stored in ``[input_number, freq_channel]`` order.
    * - autocorr_common_dout6_bram
      - 262144
      - r/w
      - For memory name suffix ``<n>_bram``, stores the autocorrelation powers for frequency channels ``8n`` of 16 consective F-engine inputs. Data are stored in ``[input_number, freq_channel]`` order.
    * - autocorr_common_dout7_bram
      - 262144
      - r/w
      - For memory name suffix ``<n>_bram``, stores the autocorrelation powers for frequency channels ``8n`` of 16 consective F-engine inputs. Data are stored in ``[input_number, freq_channel]`` order.
    * - autocorr_mux_sel
      - 4
      - r/w
      - Input selection controller. Set bits ``[1:0]`` to ``n`` to compute the autocorrelations of F-engine inputs ``16n..16(n+1)-1``.

    * - **Channel Reorder Registers**
      -
      -
      -

    * - chan_reorder_dynamic_map1
      - 16384
      - r/w
      - Determines the remapping of input samples to output samples. I.e., if  the first entry is ``5``, then the first sample into the reorder will come out 5th

    * - **Correlation Registers**
      -
      -
      -

    * - corr_0_acc_cnt
      - 4
      - r
      - 32-bit wrapping accumulation counter, which increments each time a new accumulation is recorded to RAM. There is no buffer locking when correlation data are read, so this counter can be used to ensure that data have not changed during a read.
    * - corr_0_acc_len
      - 4
      - r/w
      - Accumulation length, in FPGA clock cycles. To specify an accumulation length as a number of spectra this register should be written with ``number_of_spectra x frequency_channels_per_spectra``. Here the number of frequency channels per spectra is the number *output* by the correlation subsystem. Glitches may occur (resulting in the no new accumulations for a few seconds) if the value in this register is reduced without re-applying a sync to the correlation module.
    * - corr_0_dout
      - 32768
      - r/w
      - Correlation data buffer. Word ``[2n]`` is the real part of the correlation of frequency channel ``n`` (after any channel averaging). Word ``[2n+1]`` is the imaginary part of this correlation.
    * - corr_0_input_sel
      - 4
      - r/w
      - Input selector control register. Bits ``[5:0]`` select the unconjugated correlation input. Bits ``[13:8]`` select the conjugated correlation input.

    * - **Delay Registers**
      -
      -
      -

    * - delay_<n>_delay
      - 4
      - r/w
      - The delay applied to stream ``n``. Any value entered in this 32-bit register will be interpretted modulo the maximum supported delay.
    
    * - delay_max_delay
      - 4
      - r
      - Interpretted as a unint32 value, contains the maximum allowed delay, in ADC samples, which may be applied to a data stream.

    * - **Equalization Registers**
      -
      -
      -

    * - eq_core<n>_clip_cnt
      - 4
      - r
      - A count of the number of times a sample has been clipped, for any of F-engine inputs ``16n..16(n+1)-1``. This counter is reset only by a global system reset.
    * - eq_core<n>_coeffs
      - 131072
      - r/w
      - This memory holds coefficients for F-engine streams ``16n..16(n+1)-1``. Coefficients are stored as a ``[16, n_fft_channels / 8]`` array, where the first axis (over input number) varies *slowest*. Coefficients are shared over 8 consecutive frequency channels, with coefficient ``m`` being applied to frequency channel ``m..8(m+1)-1``. Coefficients are interpretted with 5 bits below the binary point.
   
    * - **40GbE Registers**
      -
      -
      -

    * - eth_ctrl
      - 4
      - r/w
      - 40GbE control register. Bit ``0`` is an active high reset of the 40GbE interface core. Bit ``1`` is an active high transmission enable for the core, which takes effect either after the next packet is sent, or when the ``force`` flag is asserted. Bit ``18`` is an active high reset for statistics provided by the Ethernet core. Bit ``19`` is an active high ``force`` signal, which causes the current transmission enable flag to immediately take effect.
    * - eth_forty_gbe_txctr
      - 4
      - r
      - Counter which increments each time a valid end-of-frame is seen on a packet to be transmitted
    * - eth_forty_gbe_txfullctr
      - 4
      - r
      - Counter which increments every time the transmission buffer is full
    * - eth_forty_gbe_txofctr
      - 4
      - r
      - Counter which increments on every transmission overflow event
    * - eth_forty_gbe_txvldctr
      - 4
      - r
      - Counter which increments with every valid word of data input to the core

    * - **Input Control Registers**
      -
      -
      -

    * - input_bit_stats_histogram_output
      - 32768
      - r/w
      - BRAM storing histogram data. Word ``n`` in the bottom half of the RAM stores the number of occurances of of ADC sample code ``n`` in _even_ numbered ADC samples. Word ``n`` in the _top_ half of the RAM stores the number of occurances of ADC sample code ``n`` in _odd_ numbered ADC samples.
    * - input_bit_stats_input_sel
      - 4
      - r/w
      - Input selection. The least significant 6 bits should be set to ``n`` to compute the histogram for input ``n``.
    * - input_rms_enable
      - 4
      - r/w
      - Enable statistics recording. If the least-significant bit is ``1``, statistics will be recorded to RAM.
    * - input_rms_levels
      - 32768
      - r/w
      - Multi-channel statistics. For the ``n`` th 64-bit word, the least signficant 32 bits represent the accumulated ADC power, accumulated over 65536 samples and stored as an unsigned 32-bit integer. The most significant 32 bits represent the sum of 65536 ADC samples stored as a signed 32-bit integer.
    * - input_source_sel0
      - 4
      - r/w
      - Selector control to determine if signal streams carry ADC samples, digital noise samples, or zeros. Streams ``n=0..15`` is controlled by register bits ``[2n+1:2n]``. Value ``0`` selects noise; ``1`` selects ADC; ``2`` selects zeros. 
    * - input_source_sel1
      - 4
      - r/w
      - Selector control to determine if signal streams carry ADC samples, digital noise samples, or zeros. Streams ``n=16..31`` is controlled by register bits ``[2(n-16)+1:2(n-16)]``. Value ``0`` selects noise; ``1`` selects ADC; ``2`` selects zeros. 
    * - input_source_sel2
      - 4
      - r/w
      - Selector control to determine if signal streams carry ADC samples, digital noise samples, or zeros. Streams ``n=32..47`` is controlled by register bits ``[2(n-32)+1:2(n-32)]``. Value ``0`` selects noise; ``1`` selects ADC; ``2`` selects zeros. 
    * - input_source_sel3
      - 4
      - r/w
      - Selector control to determine if signal streams carry ADC samples, digital noise samples, or zeros. Streams ``n=48..63`` is controlled by register bits ``[2(n-48)+1:2(n-48)]``. Value ``0`` selects noise; ``1`` selects ADC; ``2`` selects zeros. 

    * - **Noise Generator Registers**
      -
      -
      -

    * - noise_octal_mux0_sel
      - 4
      - r/w
      - The lower 2 bits define the select signal for the noise multiplexor. If this register has value ``v``, then noise generator ``v`` is selected.
    * - noise_octal_mux1_sel
      - 4
      - r/w
      - The lower 2 bits define the select signal for the noise multiplexor. If this register has value ``v``, then noise generator ``v`` is selected.
    * - noise_octal_mux2_sel
      - 4
      - r/w
      - The lower 2 bits define the select signal for the noise multiplexor. If this register has value ``v``, then noise generator ``v`` is selected.
    * - noise_octal_mux3_sel
      - 4
      - r/w
      - The lower 2 bits define the select signal for the noise multiplexor. If this register has value ``v``, then noise generator ``v`` is selected.
    * - noise_octal_mux4_sel
      - 4
      - r/w
      - The lower 2 bits define the select signal for the noise multiplexor. If this register has value ``v``, then noise generator ``v`` is selected.
    * - noise_octal_mux5_sel
      - 4
      - r/w
      - The lower 2 bits define the select signal for the noise multiplexor. If this register has value ``v``, then noise generator ``v`` is selected.
    * - noise_octal_mux6_sel
      - 4
      - r/w
      - The lower 2 bits define the select signal for the noise multiplexor. If this register has value ``v``, then noise generator ``v`` is selected.
    * - noise_octal_mux7_sel
      - 4
      - r/w
      - The lower 2 bits define the select signal for the noise multiplexor. If this register has value ``v``, then noise generator ``v`` is selected.
    * - noise_seeds0
      - 4
      - r/w
      - Noise generator seed values. If the 32-bit value in this register is ``v``, the seed for the first noise generator is (using Verilog syntax) ``{8'h5c, v[7:0], v[0:7], 8'ha3}``. The seed for the second noise generator is ``{8'h5c, v[15:8], v[8:15], 8'ha3}``. The seed for the third noise generator is ``{8'h5c, v[23:16], v[16:23], 8'ha3}``. The seed for the fourth noise generator is ``{8'h5c, v[31:24], v[24:31], 8'ha3}``

    * - **Packetizer Registers**
      -
      -
      -

    * - packetizer_ants
      - 262144
      - r/w
      - Antenna header entry map. Word ``n``contains the header antenna ID field for sample ``n`` in a transmission period. This field is only relevant for samples accompanied by ``valid`` and ``header`` flags.
    * - packetizer_chans
      - 262144
      - r/w
      - Channel ID header entry map. Bits ``[23:0]`` of word ``n`` contain the header channel ID field for sample ``n`` in a transmission period. This header field should hold the index of the first channel in a packet. Bits ``[31:24]`` contain the header channel block index field for this sample. These field is only relevant for samples accompanied by ``valid`` and ``header`` flags.
    * - packetizer_flags
      - 262144
      - r/w
      - Packet flags. For word ``n``, bit ``0`` is an active high flag which indicates that sample ``n`` in a transmission period is a packet header. Bit ``8`` is an active high flag which indicates that this word is valid and should be transmitted. Bit ``16`` is an active high flag indicating that this word is the last in a packet.
    * - packetizer_ips
      - 262144
      - r/w
      - IP Destination address map. Word ``n`` contains the IP address to which sample ``n`` in a transmission period should be sent. Only entries accompanied by ``valid`` and ``end of frame`` flags result in a packet's destination being set from this register. 
    * - packetizer_n_chans
      - 4
      - r/w
      - 32-bit ``n_chans`` header field for F-engine output data packets, indicating the number of frequency channels per packet.
    * - packetizer_n_pols
      - 4
      - r/w
      - 32-bit ``n_pols`` header field for F-engine output data packets, indicating the number of antenna-polarizations present in a packet.
    * - packetizer_ports
      - 262144
      - r/w
      - UDP Destination port map. For word ``n``, bits ``[15:0]`` contain the UDP port to which sample ``n`` in a transmission period should be sent. Only samples accompanied by ``valid`` and ``end of frame`` flags result in a packet's destination being set from this register. 

    * - **PFB Registers**
      -
      -
      -

    * - pfb_ctrl
      - 4
      - r/w
      - PFB control register. Bit ``18`` is an active-high reset for overflow statistics counters. Bits ``15:0`` hold the FFT shift schedule for the PFB processing pipeline, with bit ``n`` an active high shift signal for the ``n`` th FFT stage.
    * - pfb_pfb16x_<n>_status
      - 4
      - r
      - A 32-bit counter which, for register name suffix ``<n>_status`` increments every time an FFT overflow event is detected in any of FFT channels ``16n..16(n+1)-1``. Resets only when commanded via the PFB control register, and will wrap once the maximum value is reached. 

    * - **Post-EQ Test Vector Generator Registers**
      -
      -
      -
    * - post_eq_tvg_core<n>_tv
      - 524288
      - r/w
      - This memory holds 4+4 bit complex test vector streams for F-engine streams ``16n..16(n+1)-1``. Test vectors are stored as a ``[16, n_fft_channels]`` array, where the first axis (over input number) varies *slowest*, and vectors are stored in order of increasing FFT channel. An 8-bit word in location ``[m, c]`` is interpretted as a 4+4 bit complex value for channel ``c`` of F-engine stream ``16n + m``. The most significant 4 bits are interpretted as the real part of the complex value.
    * - post_eq_tvg_tvg_en
      - 4
      - r/w
      - Test vector multiplexor control. If the least significant bit is ``1``, ADC data will be replaced with software-controllable test vectors.

    * - **Synchronization Registers**
      -
      -
      -

    * - sync_ctrl
      - 4
      - r/w
      - Timing control register. Bit ``0``: active high enable allowing telescope time counter to be loaded from telescope time load registers on next synchronization pulse. Bit ``1``: When transitioned from ``0`` to ``1``, forces telescope time counter to be loaded from telescope time load registers immediately. Bit ``2``: active high telescope time counter reset. Bit ``3``: active high reset for error counters. Bit ``4``: active high ``arm`` signal, which causes a global system reset, released on the next synchronization pulse; a system sync on the next synchronization pulse. Bit ``5``: When transittioned from ``0`` to ``1``, emulates the arrival of an external sync pulse. Bit ``6``: When transittioned from ``0`` to ``1``, arms noise generator seed loaders.
    * - sync_ext_sync_count
      - 4
      - r
      - Number of external synchronization pulses received.
    * - sync_ext_sync_period
      - 4
      - r
      - Measured number of FPGA clock ticks between previous two external synchronization pulses.
    * - sync_ext_sync_tt_lsb
      - 4
      - r
      - Least significant 32 bits of the telescope time counter, at the point of the last external synchronization pulse.
    * - sync_ext_sync_tt_msb
      - 4
      - r
      - Most significant 32 bits of the telescope time counter, at the point of the last external synchronization pulse.
    * - sync_int_sync_count
      - 4
      - r
      - Number of synchronization pulses emitted via GPIO.
    * - sync_latency
      - 4
      - r
      - Measured latecy, in FPGA clock ticks, between transmitting a synchronization pulse and receiving it from the timing distribution system.
    * - sync_sync_div_bits
      - 4
      - r
      - Holds the log2 value of the sync period -- i.e. the rate at which sync pulses are emitted from the board via GPIO -- in FPGA clock ticks.
    * - sync_tt_load_lsb
      - 4
      - r/w
      - Telescope time load register. Least significant 32 bits to load to the telescope time counter.
    * - sync_tt_load_msb
      - 4
      - r/w
      - Telescope time load register. Most significant 32 bits to load to the telescope time counter.
    * - sync_tt_lsb
      - 4
      - r
      - Least significant 32 bits of the telescope time counter.
    * - sync_tt_msb
      - 4
      - r
      - Most significant 32 bits of the telescope time counter.
    * - sync_uptime_msb
      - 4
      - r
      - Board uptime, in units of ``2^32`` FPGA clock ticks.

    * - **Version Registers**
      -
      -
      -

    * - version_timestamp
      - 4
      - r
      - Unix timestamp, in integer seconds, when firmware was last compiled.
    * - version_version
      - 4
      - r
      - Version register. Bits ``[31:24]``: major version. Bits ``[23:16]``: minor version. Bits ``[15:8]``: revision. Bits ``[7:0]``: buxfix.

