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
	set IP_Revision {210767397}
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
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i0_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i1_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i2_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i3_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i4_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i5_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i6_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i7_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i8_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i9_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i10_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i11_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i12_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i13_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i14_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i15_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i16_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i17_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i18_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i19_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i20_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i21_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i22_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i23_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i24_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i25_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i26_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i27_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i28_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i29_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i30_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i31_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i32_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i33_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i34_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i35_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i36_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i37_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i38_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i39_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i40_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i41_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i42_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i43_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i44_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i45_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i46_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i47_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i48_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i49_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i50_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i51_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i52_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i53_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i54_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i55_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i56_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i57_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i58_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i59_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i60_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i61_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i62_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i63_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i64_vivado.coe}}
		{{pfb_fir_4096c_16i_core_blk_mem_gen_v8_3_i65_vivado.coe}}
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
	set TopLevelSimulinkHandle 126243
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
	dict set TopLevelPortInterface pol_in Type UFix_128_0
	dict set TopLevelPortInterface pol_in ArithmeticType xlUnsigned
	dict set TopLevelPortInterface pol_in BinaryPoint 0
	dict set TopLevelPortInterface pol_in Width 128
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
	dict set TopLevelPortInterface pol_out Type UFix_192_0
	dict set TopLevelPortInterface pol_out ArithmeticType xlUnsigned
	dict set TopLevelPortInterface pol_out BinaryPoint 0
	dict set TopLevelPortInterface pol_out Width 192
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