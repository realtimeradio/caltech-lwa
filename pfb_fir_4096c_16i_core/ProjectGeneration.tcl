# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator. 
#


namespace eval ::xilinx::dsp::planaheaddriver {
	set Compilation {IP Catalog}
	set CompilationFlow {IP}
	set CreateInterfaceDocument {off}
	set DSPDevice {xcku115}
	set DSPFamily {kintexu}
	set DSPPackage {flvf1924}
	set DSPSpeed {-2-e}
	set FPGAClockPeriod 5
	set GenerateTestBench 0
	set HDLLanguage {vhdl}
	set IPOOCCacheRootPath {/home/jackh/.Xilinx/Sysgen/SysgenVivado/lnx64.o/ip}
	set IP_Auto_Infer {1}
	set IP_Categories_Text {System_Generator_for_DSP}
	set IP_Common_Repos {0}
	set IP_Description {}
	set IP_Dir {}
	set IP_Library_Text {SysGen}
	set IP_LifeCycle_Menu {2}
	set IP_Logo {sysgen_icon_100.png}
	set IP_Name {}
	set IP_Revision {258570576}
	set IP_Socket_IP {0}
	set IP_Socket_IP_Proj_Path {}
	set IP_Vendor_Text {User_Company}
	set IP_Version_Text {1.0}
	set ImplStrategyName {Vivado Implementation Defaults}
	set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
	set Project {pfb_fir_4096c_16i_core}
	set ProjectFiles {
		{{conv_pkg.vhd} -lib {xil_defaultlib}}
		{{synth_reg.vhd} -lib {xil_defaultlib}}
		{{synth_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{srl17e.vhd} -lib {xil_defaultlib}}
		{{srl33e.vhd} -lib {xil_defaultlib}}
		{{synth_reg_reg.vhd} -lib {xil_defaultlib}}
		{{single_reg_w_init.vhd} -lib {xil_defaultlib}}
		{{xlclockdriver_rd.vhd} -lib {xil_defaultlib}}
		{{vivado_ip.tcl}}
		{{xpm_4defad_vivado.mem}}
		{{xpm_55a16b_vivado.mem}}
		{{xpm_f41339_vivado.mem}}
		{{xpm_11a8f9_vivado.mem}}
		{{xpm_24d74b_vivado.mem}}
		{{xpm_eb8f56_vivado.mem}}
		{{xpm_60270a_vivado.mem}}
		{{xpm_c8d736_vivado.mem}}
		{{xpm_458e11_vivado.mem}}
		{{xpm_ab518a_vivado.mem}}
		{{xpm_e6221f_vivado.mem}}
		{{xpm_d1001f_vivado.mem}}
		{{xpm_dc0e31_vivado.mem}}
		{{xpm_c4dd72_vivado.mem}}
		{{xpm_b4fa9c_vivado.mem}}
		{{xpm_1d09f6_vivado.mem}}
		{{xpm_15a026_vivado.mem}}
		{{xpm_7c999a_vivado.mem}}
		{{xpm_767aef_vivado.mem}}
		{{xpm_3a480d_vivado.mem}}
		{{xpm_6cee1e_vivado.mem}}
		{{xpm_73da4b_vivado.mem}}
		{{xpm_ae982d_vivado.mem}}
		{{xpm_27c26f_vivado.mem}}
		{{xpm_dbd99c_vivado.mem}}
		{{xpm_534789_vivado.mem}}
		{{xpm_edb5fc_vivado.mem}}
		{{xpm_f11525_vivado.mem}}
		{{xpm_0d69c4_vivado.mem}}
		{{xpm_0825b5_vivado.mem}}
		{{xpm_ba7252_vivado.mem}}
		{{xpm_0ec7b7_vivado.mem}}
		{{xpm_4a1036_vivado.mem}}
		{{xpm_44c632_vivado.mem}}
		{{xpm_3149cb_vivado.mem}}
		{{xpm_05b3c4_vivado.mem}}
		{{xpm_2c86ec_vivado.mem}}
		{{xpm_c6c2e7_vivado.mem}}
		{{xpm_d184d8_vivado.mem}}
		{{xpm_1e5bbe_vivado.mem}}
		{{xpm_8a7607_vivado.mem}}
		{{xpm_679225_vivado.mem}}
		{{xpm_a0b0b8_vivado.mem}}
		{{xpm_7e67ae_vivado.mem}}
		{{xpm_139bb3_vivado.mem}}
		{{xpm_c99d5d_vivado.mem}}
		{{xpm_73ac4c_vivado.mem}}
		{{xpm_dd3843_vivado.mem}}
		{{xpm_45501a_vivado.mem}}
		{{xpm_885564_vivado.mem}}
		{{xpm_63c7a0_vivado.mem}}
		{{xpm_9159ca_vivado.mem}}
		{{xpm_d85f4c_vivado.mem}}
		{{xpm_930ef4_vivado.mem}}
		{{xpm_360713_vivado.mem}}
		{{xpm_70e728_vivado.mem}}
		{{xpm_17b35a_vivado.mem}}
		{{xpm_2d7b7f_vivado.mem}}
		{{xpm_a76be4_vivado.mem}}
		{{xpm_c9c90b_vivado.mem}}
		{{xpm_6de52f_vivado.mem}}
		{{xpm_ea8895_vivado.mem}}
		{{xpm_b2f3da_vivado.mem}}
		{{xpm_9fce2b_vivado.mem}}
		{{xpm_5ddc0b_vivado.mem}}
		{{pfb_fir_4096c_16i_core_entity_declarations.vhd} -lib {xil_defaultlib}}
		{{pfb_fir_4096c_16i_core.vhd} -lib {xil_defaultlib}}
		{{pfb_fir_4096c_16i_core_clock.xdc}}
		{{pfb_fir_4096c_16i_core.xdc}}
	}
	set SimPeriod 1
	set SimTime 10
	set SimulationTime {255.00000000 ns}
	set SynthStrategyName {Vivado Synthesis Defaults}
	set SynthesisTool {Vivado}
	set TargetDir {/home/jackh/src/caltech-lwa/pfb_fir_4096c_16i_core}
	set TopLevelModule {pfb_fir_4096c_16i_core}
	set TopLevelSimulinkHandle 328494
	set VHDLLib {xil_defaultlib}
	set TopLevelPortInterface {}
	dict set TopLevelPortInterface sync Name {sync}
	dict set TopLevelPortInterface sync Type UFix_32_0
	dict set TopLevelPortInterface sync ArithmeticType xlUnsigned
	dict set TopLevelPortInterface sync BinaryPoint 0
	dict set TopLevelPortInterface sync Width 32
	dict set TopLevelPortInterface sync DatFile {pfb_fir_4096c_16i_core_sync.dat}
	dict set TopLevelPortInterface sync IconText {sync}
	dict set TopLevelPortInterface sync Direction in
	dict set TopLevelPortInterface sync Period 1
	dict set TopLevelPortInterface sync Interface 0
	dict set TopLevelPortInterface sync InterfaceName {}
	dict set TopLevelPortInterface sync InterfaceString {DATA}
	dict set TopLevelPortInterface sync ClockDomain {pfb_fir_4096c_16i_core}
	dict set TopLevelPortInterface sync Locs {}
	dict set TopLevelPortInterface sync IOStandard {}
	dict set TopLevelPortInterface pol_in Name {pol_in}
	dict set TopLevelPortInterface pol_in Type UFix_160_0
	dict set TopLevelPortInterface pol_in ArithmeticType xlUnsigned
	dict set TopLevelPortInterface pol_in BinaryPoint 0
	dict set TopLevelPortInterface pol_in Width 160
	dict set TopLevelPortInterface pol_in DatFile {pfb_fir_4096c_16i_core_pol_in.dat}
	dict set TopLevelPortInterface pol_in IconText {pol_in}
	dict set TopLevelPortInterface pol_in Direction in
	dict set TopLevelPortInterface pol_in Period 1
	dict set TopLevelPortInterface pol_in Interface 0
	dict set TopLevelPortInterface pol_in InterfaceName {}
	dict set TopLevelPortInterface pol_in InterfaceString {DATA}
	dict set TopLevelPortInterface pol_in ClockDomain {pfb_fir_4096c_16i_core}
	dict set TopLevelPortInterface pol_in Locs {}
	dict set TopLevelPortInterface pol_in IOStandard {}
	dict set TopLevelPortInterface pol_out Name {pol_out}
	dict set TopLevelPortInterface pol_out Type UFix_288_0
	dict set TopLevelPortInterface pol_out ArithmeticType xlUnsigned
	dict set TopLevelPortInterface pol_out BinaryPoint 0
	dict set TopLevelPortInterface pol_out Width 288
	dict set TopLevelPortInterface pol_out DatFile {pfb_fir_4096c_16i_core_pol_out.dat}
	dict set TopLevelPortInterface pol_out IconText {pol_out}
	dict set TopLevelPortInterface pol_out Direction out
	dict set TopLevelPortInterface pol_out Period 1
	dict set TopLevelPortInterface pol_out Interface 0
	dict set TopLevelPortInterface pol_out InterfaceName {}
	dict set TopLevelPortInterface pol_out InterfaceString {DATA}
	dict set TopLevelPortInterface pol_out ClockDomain {pfb_fir_4096c_16i_core}
	dict set TopLevelPortInterface pol_out Locs {}
	dict set TopLevelPortInterface pol_out IOStandard {}
	dict set TopLevelPortInterface sync_out Name {sync_out}
	dict set TopLevelPortInterface sync_out Type Bool
	dict set TopLevelPortInterface sync_out ArithmeticType xlUnsigned
	dict set TopLevelPortInterface sync_out BinaryPoint 0
	dict set TopLevelPortInterface sync_out Width 1
	dict set TopLevelPortInterface sync_out DatFile {pfb_fir_4096c_16i_core_sync_out.dat}
	dict set TopLevelPortInterface sync_out IconText {sync_out}
	dict set TopLevelPortInterface sync_out Direction out
	dict set TopLevelPortInterface sync_out Period 1
	dict set TopLevelPortInterface sync_out Interface 0
	dict set TopLevelPortInterface sync_out InterfaceName {}
	dict set TopLevelPortInterface sync_out InterfaceString {DATA}
	dict set TopLevelPortInterface sync_out ClockDomain {pfb_fir_4096c_16i_core}
	dict set TopLevelPortInterface sync_out Locs {}
	dict set TopLevelPortInterface sync_out IOStandard {}
	dict set TopLevelPortInterface clk Name {clk}
	dict set TopLevelPortInterface clk Type -
	dict set TopLevelPortInterface clk ArithmeticType xlUnsigned
	dict set TopLevelPortInterface clk BinaryPoint 0
	dict set TopLevelPortInterface clk Width 1
	dict set TopLevelPortInterface clk DatFile {}
	dict set TopLevelPortInterface clk Direction in
	dict set TopLevelPortInterface clk Period 1
	dict set TopLevelPortInterface clk Interface 6
	dict set TopLevelPortInterface clk InterfaceName {}
	dict set TopLevelPortInterface clk InterfaceString {CLOCK}
	dict set TopLevelPortInterface clk ClockDomain {pfb_fir_4096c_16i_core}
	dict set TopLevelPortInterface clk Locs {}
	dict set TopLevelPortInterface clk IOStandard {}
	dict set TopLevelPortInterface clk AssociatedInterfaces {}
	dict set TopLevelPortInterface clk AssociatedResets {}
	set MemoryMappedPort {}
}

source SgPaProject.tcl
::xilinx::dsp::planaheadworker::dsp_create_project