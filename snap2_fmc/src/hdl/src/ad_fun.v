`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:06:26 10/14/2014 
// Design Name: 
// Module Name:    ad_fun 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ad_fun(
    gclk200m_buf,
    gclk10m_buf,
    spi_clk,
    sys_rst_n  ,   //系统复位
	 //---ADC的时钟信号----
    ADR_P      ,   //625MHz
    ADR_N      ,
	 //---OR---- 
    AOR_P      ,
	AOR_N      ,
	BOR_P      ,
	BOR_N      ,
	COR_P      ,
    COR_N      ,
	DOR_P      ,
    DOR_N      ,
	 //---ADC配置信号---- 
    adc_sclk      ,   
    adc_sen       ,
    adc_rst       ,
    adc_mosi      ,
	adc_miso      ,

    adc_sync      ,
	adc_sync_dir  ,
	 //----------ADC采集数据-----------
	 A_P   ,
	 A_N   ,
	 B_P   ,
	 B_N   ,
	 C_P   ,
	 C_N   ,
	 D_P   ,
	 D_N   ,
	 //-------data output--------
	 flag,
	 dataA_out,
	 dataB_out,
	 dataC_out,
	 dataD_out, 
	 data_or,
	 //------------
	 clk_data,
	 clk_data_locked,
	 //------debug------
	 vio_config_addr,
	 vio_config_data,
     vio_start_spi,
     vio_select,
     adc_sync_vio,
     //-----------------
     seek_win_state,
     first_win,
     end_win,
     first_win_v,
     end_win_v,
     a_CNTVALUEIN,
     a_CNTVALUEOUT,
     error
	 );

/////////// input output////////////
input               gclk200m_buf    ;
input               gclk10m_buf     ;
input               spi_clk         ;
input               sys_rst_n       ;

input               ADR_P      ;
input               ADR_N      ;

input               AOR_P      ;
input               AOR_N      ;
input               BOR_P      ;
input               BOR_N      ;
input               COR_P      ;
input               COR_N      ;
input               DOR_P      ;
input               DOR_N      ;

output              adc_sclk       ;
output              adc_sen        ;
output              adc_rst        ;
output              adc_mosi       ;
input               adc_miso       ;

output              adc_sync       ;
output              adc_sync_dir   ;

input    [9:0]        A_P          ;
input    [9:0]        A_N          ;
input    [9:0]        B_P          ;
input    [9:0]        B_N          ;
input    [9:0]        C_P          ;
input    [9:0]        C_N          ;
input    [9:0]        D_P          ;
input    [9:0]        D_N          ;

output  flag;
output  [79:0] dataA_out;
output  [79:0] dataB_out;
output  [79:0] dataC_out;
output  [79:0] dataD_out;
output  [3:0]  data_or;
output  clk_data;
output  clk_data_locked;

//-----debug------
input [7:0]  vio_config_addr;
input [15:0] vio_config_data;
input vio_start_spi;
input vio_select;
input adc_sync_vio;
//-----------------
output [4:0] seek_win_state;
output [8:0] first_win;
output [8:0] end_win;
output first_win_v;
output end_win_v;
output [8:0] a_CNTVALUEIN;
output [8:0] a_CNTVALUEOUT;
output error;
/////////////////wire///////////////////
wire    [79:0]       dataA         ;  //unsigned data
wire    [79:0]       dataB         ;
wire    [79:0]       dataC         ;
wire    [79:0]       dataD         ;

wire                gclk_sd_bufra   ;
wire                gclk_sd_lockeda ;

wire                clk_div_a      ;

wire                adc_ready     ;

wire                work_mode     ; 
//wire    [1:0]       clk_ctrl      ; 

wire                auto_seek_rsta	; //复位IOdelay的复位信号，用于重新加载延迟计数值 也会复位MMCM单元

//wire                a_adc_ddrrst		; //用于构成接收数据的复位信号

wire                auto_spi_rstan	; //配置ADC逻辑的复位信号

//wire [8:0]    	    a_CNTVALUEIN	;
//wire [8:0]    		a_CNTVALUEOUT	;

wire                iodelay_rdy     ;
wire                data_valid      ;

assign  clk_data = clk_div_a;
assign  clk_data_locked = gclk_sd_lockeda;
///////////////////////reset sequencer////////////////////
wire rst_IDELAYCTRL;
wire rst_IODELAY;
wire rst_SERDES;
wire rst_pro;

  reset_sequence inst_reset_ctr (
      .sys_rst_n(sys_rst_n),
      .clk10m(gclk10m_buf),
      .iodelay_rdy(iodelay_rdy),
      //--------
      .rst_IDELAYCTRL(rst_IDELAYCTRL),
      .rst_IODELAY(rst_IODELAY),
      .rst_SERDES(rst_SERDES),
      .rst_pro(rst_pro)
      );

/////////////////////////IDELAYCTRL///////////////////////  
//  (* IODELAY_GROUP = "iodelay_group_adc" *) // Specifies group name forr associated IODELAYs and IDELAYCTRL 
//   IDELAYCTRL #(
//         .SIM_DEVICE("ULTRASCALE")  // Set the device version (7SERIES, ULTRASCALE)
//      )
//      u_IDELAYCTRL (
//         .RDY(iodelay_rdy),       // 1-bit output: Ready output
//         .REFCLK(gclk200m_buf),  // 1-bit input: Reference clock input
//         .RST(rst_IDELAYCTRL)    // 1-bit input: Active high reset input. Asynchronous assert, synchronous deassert to                                 // REFCLK
//      );
    assign iodelay_rdy = 1'b1;
///////////////////完成自动调整延时的功能/////////////////////

adc_AUTO_SEEK_D_WIN u_auto_seek_win (
    .gclk10m_buf			(gclk10m_buf), //10M 状态机时钟
    .rst     				(rst_pro),     
	 //----channel----
    .clk_div                (clk_div_a),          //接收数据和查错
    .gclk_sd_locked  	    (gclk_sd_lockeda), 
    .auto_seek_rst		    (auto_seek_rsta), //*******    //复位IOdelay的复位信号，用于重新加载延迟计数值
//    .a_adc_ddrrst			(a_adc_ddrrst),   //*******    //复位ISERDES
    .CNTVALUEIN 			(a_CNTVALUEIN ),	 
	 //-----------adc------------- 
    .auto_spi_rstn          (auto_spi_rstan),   //配置ADC逻辑的复位信号
    .work_mode			    (work_mode), 
//    .a_clk_ctrl			    (clk_ctrl),  
    .adc_ready			    (adc_ready), 
    //-------------
    .adc_dataA       	    (dataA), 
    .adc_dataB       	    (dataB),
	.adc_dataC       	    (dataC), 
    .adc_dataD       	    (dataD),
	 //-------------
	.win_ok_all            (data_valid),
	//-----debug-----
	.seek_win_state(seek_win_state),
	.first_win(first_win),
	.end_win(end_win),
	.first_win_v(first_win_v),
	.end_win_v(end_win_v),
	.error(error)
    );
	 
	  
////////////////////时钟信号的产生////////////////////
clk_rst u_clk_rst(
	 //--------system clk and rst---------------	
    .sys_rst_n       (    sys_rst_n       ),
	 //----input data clk-----
    .ADR_P           (    ADR_P           ),
    .ADR_N           (    ADR_N           ),
	 //-----------局部时钟---------------------	 
    .gclk_sd_lockeda (    gclk_sd_lockeda ), 
    .gclk_sd_bufra   (    gclk_sd_bufra   ), //625M
    .clk_div_a       (    clk_div_a       ) //156.25M
	 //-------------IOdelay------------------
//    .auto_seek_rsta  (	  auto_seek_rsta  ),
//    .a_CNTVALUEIN    (	  a_CNTVALUEIN    ),
//    .a_CNTVALUEOUT   (	  a_CNTVALUEOUT   )	 
);


////////////////////配置ADC 接收数据//////////////////// 
//-----debug-----
wire [15:0] adc_spi_rdout;
wire  adc_spi_rdy;
//------end------
wire adc_sync_out;
assign adc_sync = adc_sync_vio | adc_sync_out;
//--------------------------------------
 wire   load; 
 assign  load = auto_seek_rsta ;
UA_adc_inf adc_inf(
	.clk10m          (    gclk10m_buf     ), //10M 
	.clk200m         (    gclk200m_buf    ), //200M
	.auto_spi_rstan  (    auto_spi_rstan  ),
	 //-----channel A B C D receive data---------
	.a_adc_gclk      (    gclk_sd_bufra   ),
	.clk_div_a       (    clk_div_a       ),
    .rst_IODELAY     (    rst_IODELAY     ),
    .rst_SERDES      (    rst_SERDES      ),
	 //----ctrl------
    .work_mode       (    work_mode     ),
//    .clk_ctrl        (    clk_ctrl      ),
	 //----config-----
	.spi_clk         (    spi_clk       ), //5M
    .adc_rst         (    adc_rst       ),
    .adc_sen         (    adc_sen       ),
    .adc_sclk        (    adc_sclk      ),
	.adc_mosi        (    adc_mosi      ),
	.adc_miso        (    adc_miso      ),
	.adc_sync        (    adc_sync_out  ),
	.adc_sync_dir    (    adc_sync_dir  ),
	 //----data in------
    .A_P             (    A_P          ),
    .A_N             (    A_N          ),
    .B_P             (    B_P          ),
    .B_N             (    B_N          ),
	.C_P             (    C_P          ),
    .C_N             (    C_N          ),
    .D_P             (    D_P          ),
    .D_N             (    D_N          ),
	 //----out of range-----
    .AOR_P           (    AOR_P           ),
    .AOR_N           (    AOR_N           ),
    .BOR_P           (    BOR_P           ),
    .BOR_N           (    BOR_N           ),
    .COR_P           (    COR_P           ),
    .COR_N           (    COR_N           ),
	.DOR_P           (    DOR_P           ),
    .DOR_N           (    DOR_N           ),
	 //----data output-----
    .dataA           (    dataA        ),
    .dataB           (    dataB        ),
    .dataC           (    dataC        ),
	.dataD           (    dataD        ),	 
	 //-----------
    .adc_ready       (    adc_ready    ),
    .data_or         (	  data_or      ),
    //------------
    .load            (	  load          ),
    .a_CNTVALUEIN    (    a_CNTVALUEIN  ),
    .a_CNTVALUEOUT   (    a_CNTVALUEOUT ),    
	 //-------debug-------
	.vio_config_addr (   vio_config_addr  ),
	.vio_config_data (   vio_config_data  ),
	.vio_start_spi   (   vio_start_spi    ),
	.vio_select      (   vio_select       ),
	.adc_spi_rdout   (   adc_spi_rdout    ),
	.adc_spi_rdy     (   adc_spi_rdy      )
);
//----------接收数据复位信号的产生------------

/////////////////////////data process////////////////////////////

data_process 
      #(
         .DATA_FORMAT("UNSIGNED"),
		 .SERDES_RATIO(  8    )
       )
inst_process (
    .rst(rst_pro|(~data_valid)), //go into normal operation 
    .clk_div_a(clk_div_a),
    .clk10m(gclk10m_buf), 
    .dataA(dataA), 
    .dataB(dataB), 
    .dataC(dataC),  
    .dataD(dataD),
	 //-----output-----
	 .dataA_out(dataA_out),
	 .dataB_out(dataB_out),
	 .dataC_out(dataC_out),
	 .dataD_out(dataD_out),
	 .flag(flag)
    );	 

endmodule
