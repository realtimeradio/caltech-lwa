  sysgen_dut : entity xil_defaultlib.fft_4096c_1i_core 
  port map (
    pol_in => pol_in,
    shift => shift,
    sync => sync,
    clk => clk,
    pol_out => pol_out,
    overflow => overflow,
    sync_out => sync_out
  );
