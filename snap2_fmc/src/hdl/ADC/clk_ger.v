`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:17 03/28/2016 
// Design Name: 
// Module Name:    clk_ger 
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
module clk_ger(
     sys_rst_n       ,
//	 sys_clkp        ,
//     sys_clkn        ,
     sys_clk,
	 gclk10m_bufr    ,
	 gclk10m_locked  ,
	 gclk200m_bufr   ,
	 spi_clk   
    );

//---input output------
input               sys_rst_n       ;
input               sys_clk;
//input               sys_clkp        ;
//input               sys_clkn        ; 
output              gclk10m_bufr    ;
output              gclk10m_locked  ;
output              gclk200m_bufr   ;
output              spi_clk         ;



//---sys_clk------
//wire                sys_clk         ;
wire                sys_clkr        ;

//   IBUFDS #(
//         .DQS_BIAS("FALSE")  // (FALSE, TRUE)
//      )
//   IBUFDS_clka (
//     .O  (sys_clk),
//     .I  (sys_clkp),
//     .IB (sys_clkn)
//   );
	
	BUFG sys_clk_buf
  (
        .O (sys_clkr),
        .I (sys_clk)
    );


reg rst_r1;
reg rst_r2;
always@(posedge sys_clkr or negedge sys_rst_n)
    if(!sys_rst_n)
        rst_r1 <= 1'b1;
    else
        rst_r1 <= 1'b0;

always@(posedge sys_clkr or negedge sys_rst_n)
    if(!sys_rst_n)
        rst_r2 <= 1'b1;
    else
        rst_r2 <= rst_r1;

wire mmcm_rst;
assign mmcm_rst = rst_r2;
//=============== MMCM =================
  //---由系统时钟产生 10M 200M --- 
         clk_wiz_0 inst_10m_200m_5m
         (
           // Clock in ports
             .clk_in1(sys_clkr),      // input 50M
           // Clock out ports
             .clk_out1(gclk200m_bufr),// output 200M
             .clk_out2(gclk10m_bufr), // output 10M
             .clk_out3(spi_clk),      // output 5M
           // Status and control signals
             .reset(mmcm_rst), // input reset
             .locked(gclk10m_locked)
          );      // output locked 
	

endmodule
