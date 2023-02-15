--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.1.3 (lin64) Build 2644227 Wed Sep  4 09:44:18 MDT 2019
--Date        : Tue Feb 14 18:26:02 2023
--Host        : rtr-dev1 running 64-bit Ubuntu 18.04.6 LTS
--Command     : generate_target fft_4096c_1i_core_bd.bd
--Design      : fft_4096c_1i_core_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fft_4096c_1i_core_bd is
  port (
    clk : in STD_LOGIC;
    overflow : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pol_in : in STD_LOGIC_VECTOR ( 287 downto 0 );
    pol_out : out STD_LOGIC_VECTOR ( 287 downto 0 );
    shift : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sync : in STD_LOGIC_VECTOR ( 31 downto 0 );
    sync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of fft_4096c_1i_core_bd : entity is "fft_4096c_1i_core_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=fft_4096c_1i_core_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=1,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SYSGEN,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of fft_4096c_1i_core_bd : entity is "fft_4096c_1i_core_bd.hwdef";
end fft_4096c_1i_core_bd;

architecture STRUCTURE of fft_4096c_1i_core_bd is
  component fft_4096c_1i_core_bd_fft_4096c_1i_core_1_0 is
  port (
    pol_in : in STD_LOGIC_VECTOR ( 287 downto 0 );
    shift : in STD_LOGIC_VECTOR ( 15 downto 0 );
    sync : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    overflow : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pol_out : out STD_LOGIC_VECTOR ( 287 downto 0 );
    sync_out : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component fft_4096c_1i_core_bd_fft_4096c_1i_core_1_0;
  signal clk_1 : STD_LOGIC;
  signal fft_4096c_1i_core_1_overflow : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal fft_4096c_1i_core_1_pol_out : STD_LOGIC_VECTOR ( 287 downto 0 );
  signal fft_4096c_1i_core_1_sync_out : STD_LOGIC_VECTOR ( 0 to 0 );
  signal pol_in_1 : STD_LOGIC_VECTOR ( 287 downto 0 );
  signal shift_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal sync_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN fft_4096c_1i_core_bd_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of overflow : signal is "xilinx.com:signal:data:1.0 DATA.OVERFLOW DATA";
  attribute X_INTERFACE_PARAMETER of overflow : signal is "XIL_INTERFACENAME DATA.OVERFLOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 4} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}";
  attribute X_INTERFACE_INFO of pol_in : signal is "xilinx.com:signal:data:1.0 DATA.POL_IN DATA";
  attribute X_INTERFACE_PARAMETER of pol_in : signal is "XIL_INTERFACENAME DATA.POL_IN, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of pol_out : signal is "xilinx.com:signal:data:1.0 DATA.POL_OUT DATA";
  attribute X_INTERFACE_PARAMETER of pol_out : signal is "XIL_INTERFACENAME DATA.POL_OUT, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 288} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}";
  attribute X_INTERFACE_INFO of shift : signal is "xilinx.com:signal:data:1.0 DATA.SHIFT DATA";
  attribute X_INTERFACE_PARAMETER of shift : signal is "XIL_INTERFACENAME DATA.SHIFT, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of sync : signal is "xilinx.com:signal:data:1.0 DATA.SYNC DATA";
  attribute X_INTERFACE_PARAMETER of sync : signal is "XIL_INTERFACENAME DATA.SYNC, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of sync_out : signal is "xilinx.com:signal:data:1.0 DATA.SYNC_OUT DATA";
  attribute X_INTERFACE_PARAMETER of sync_out : signal is "XIL_INTERFACENAME DATA.SYNC_OUT, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} real {fixed {fractwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}}";
begin
  clk_1 <= clk;
  overflow(3 downto 0) <= fft_4096c_1i_core_1_overflow(3 downto 0);
  pol_in_1(287 downto 0) <= pol_in(287 downto 0);
  pol_out(287 downto 0) <= fft_4096c_1i_core_1_pol_out(287 downto 0);
  shift_1(15 downto 0) <= shift(15 downto 0);
  sync_1(31 downto 0) <= sync(31 downto 0);
  sync_out(0) <= fft_4096c_1i_core_1_sync_out(0);
fft_4096c_1i_core_1: component fft_4096c_1i_core_bd_fft_4096c_1i_core_1_0
     port map (
      clk => clk_1,
      overflow(3 downto 0) => fft_4096c_1i_core_1_overflow(3 downto 0),
      pol_in(287 downto 0) => pol_in_1(287 downto 0),
      pol_out(287 downto 0) => fft_4096c_1i_core_1_pol_out(287 downto 0),
      shift(15 downto 0) => shift_1(15 downto 0),
      sync(31 downto 0) => sync_1(31 downto 0),
      sync_out(0) => fft_4096c_1i_core_1_sync_out(0)
    );
end STRUCTURE;
