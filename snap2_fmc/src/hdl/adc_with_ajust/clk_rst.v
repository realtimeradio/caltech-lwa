module clk_rst(

//---rst------
     sys_rst_n  ,
//------时钟信号输入------
     ADR_P      ,   //625MHz
     ADR_N      ,
//   BDR_P      ,
//   BDR_N      ,
//	 CDR_P      ,   
//   CDR_N      ,
//   DDR_P      ,
//   DDR_N      ,
//---局部时钟-----------	 
	 gclk_sd_lockeda,
	 gclk_sd_bufra  ,
	 clk_div_a      
//---IOdelay-----------  
//     auto_seek_rsta	,
//     a_CNTVALUEIN	,
//     a_CNTVALUEOUT				
);
input               sys_rst_n  ;
input               ADR_P      ;
input               ADR_N      ;
//input               BDR_P      ;
//input               BDR_N      ;
//input               CDR_P      ;
//input               CDR_N      ;
//input               DDR_P      ;
//input               DDR_N      ;
output              clk_div_a;   //156.25M
output   reg        gclk_sd_lockeda;
output              gclk_sd_bufra  ; //625M

//input               auto_seek_rsta	;

//input [4:0]    			a_CNTVALUEIN		;
//output[4:0]    			a_CNTVALUEOUT		;

//=====================时钟输入及延时======================
//----channel A clk IOdelay----
wire                a_adc_clk       ;
//wire                a_adc_clk_d     ;
	
   IBUFDS IBUFDS_sys_clka
         (
           .O  (a_adc_clk),
           .I  (ADR_P),
           .IB (ADR_N)
         );
//	CLK_IODELAY_PARA a_clk_delay (
//    .clk200m		(gclk200m_bufr	), 
//    .clk_out		(a_adc_clk_d	), 
//    .rst				((auto_seek_rsta)|(~iodelay_rdy)), //IOdelay 复位信号和系统复位
//    .clkin			(a_adc_clk		), 
//    .CNTVALUEIN	(a_CNTVALUEIN 	), 
//    .CNTVALUEOUT  (a_CNTVALUEOUT )
//    ); 
	
	BUFG gclk_sd_buf
   (
		 .O (gclk_sd_bufra),
		 .I (a_adc_clk)
	 );
	
//	wire clk_div_a_bufr;
	
	BUFGCE_DIV #(
          .BUFGCE_DIVIDE(4),      // 1-8
          // Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
          .IS_CE_INVERTED(1'b0),  // Optional inversion for CE
          .IS_CLR_INVERTED(1'b0), // Optional inversion for CLR
          .IS_I_INVERTED(1'b0)    // Optional inversion for I
       )
       a_BUFGCE_DIVIDE (
          .O(clk_div_a),     // 1-bit output: Buffer
          .CE(1'b1),   // 1-bit input: Buffer enable
          .CLR(1'b0), // 1-bit input: Asynchronous clear
          .I(a_adc_clk)      // 1-bit input: Buffer
       );
		
//  BUFG a_adc_clk_buf
//   (
//		 .O (clk_div_a),
//		 .I (clk_div_a_bufr)
//	 );
	    
//===============locked=================
reg rst_r1n;
reg rst_r2n;
reg rst_r3n;
always@(posedge clk_div_a)
begin
    rst_r1n <= sys_rst_n;
    rst_r2n <= rst_r1n;
    rst_r3n <= rst_r2n;
end

//------lockeda------
	reg [9:0] cnt_lockeda;
	wire rst_lockeda;
	assign rst_lockeda = (~rst_r3n);  //|(auto_seek_rsta)|(~iodelay_rdy);
	always@(posedge clk_div_a or posedge rst_lockeda)
		if(rst_lockeda)
			begin
				gclk_sd_lockeda <= 1'b0;
				cnt_lockeda      <= 10'd0;
			end
		else if(cnt_lockeda < 10'd512)
			begin
				gclk_sd_lockeda <= 1'b0;
				cnt_lockeda      <= cnt_lockeda + 1;
			end
		else
			begin
				gclk_sd_lockeda <= 1'b1;
				cnt_lockeda      <= cnt_lockeda;
			end


endmodule
