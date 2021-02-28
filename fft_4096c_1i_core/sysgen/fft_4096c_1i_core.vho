  sysgen_dut : entity xil_defaultlib.fft_4096c_1i_core 
  port map (
    pol_in => pol_in,
    shift => shift,
    sync => sync,
    clk => clk,
    overflow => overflow,
    pol_out => pol_out,
    sync_out => sync_out
  );
