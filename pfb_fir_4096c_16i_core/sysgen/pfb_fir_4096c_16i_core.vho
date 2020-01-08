  sysgen_dut : entity xil_defaultlib.pfb_fir_4096c_16i_core 
  port map (
    pol_in => pol_in,
    sync => sync,
    clk => clk,
    pol_out => pol_out,
    sync_out => sync_out
  );
