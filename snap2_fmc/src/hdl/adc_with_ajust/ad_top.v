module ad_top (

//---ϵͳʱ�Ӽ���λ----
	 sys_rst_n       ,
//     sys_clkp        ,   //125MHz
//     sys_clkn        ,
     sys_clk,
//========a_ADC���ź�==========
     ADR_P      ,   //625MHz
     ADR_N      ,
//-----OR----- 
     AOR_P      ,
	 AOR_N      ,
	 BOR_P      ,
	 BOR_N      ,
	 COR_P      ,
     COR_N      ,
	 DOR_P      ,
	 DOR_N      ,
//---ADC�����ź�---- 
     adc_sclk      ,   
     adc_sen       ,
     adc_rst       ,
     adc_mosi      ,
	 adc_miso      ,
     adc_sync      ,
	 adc_sync_dir  ,
//----------ADC�ɼ�����-----------
	 A_P   ,
	 A_N   ,
	 B_P   ,
	 B_N   ,
	 C_P   ,
	 C_N   ,
	 D_P   ,
	 D_N   ,
//========b_ADC���ź�==========
     ADR_P1      ,   //625MHz
     ADR_N1      ,
//-----OR----- 
     AOR_P1      ,
     AOR_N1      ,
     BOR_P1      ,
     BOR_N1      ,
     COR_P1      ,
     COR_N1      ,
     DOR_P1      ,
     DOR_N1      ,
//---ADC�����ź�---- 
     adc_sclk1      ,   
     adc_sen1       ,
     adc_rst1       ,
     adc_mosi1      ,
     adc_miso1      ,
     
     adc_sync1      ,
     adc_sync_dir1  ,
//----------ADC�ɼ�����-----------
     A_P1   ,
     A_N1   ,
     B_P1   ,
     B_N1   ,
     C_P1   ,
     C_N1   ,
     D_P1   ,
     D_N1   ,
	 //-------led--------
	 LED0  ,
	 LED1  ,
	 LED2  ,
	 LED3	 
	 );

////////////input output////////////
input               sys_rst_n;
//input               sys_clkp;
//input               sys_clkn;
input               sys_clk    ;
//-----------a_ADC--------------
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
//-----------b_ADC--------------
input               ADR_P1      ;
input               ADR_N1      ;

input               AOR_P1      ;
input               AOR_N1      ;
input               BOR_P1      ;
input               BOR_N1      ;
input               COR_P1      ;
input               COR_N1      ;
input               DOR_P1      ;
input               DOR_N1      ;

output              adc_sclk1       ;
output              adc_sen1        ;
output              adc_rst1        ;
output              adc_mosi1       ;
input               adc_miso1       ;

output              adc_sync1       ;
output              adc_sync_dir1   ;

input    [9:0]        A_P1          ;
input    [9:0]        A_N1          ;
input    [9:0]        B_P1          ;
input    [9:0]        B_N1          ;
input    [9:0]        C_P1          ;
input    [9:0]        C_N1          ;
input    [9:0]        D_P1          ;
input    [9:0]        D_N1          ;
//------------------------------------
output   LED0;
output   LED1;
output   LED2;
output   LED3;
/////////////////////clk/////////////////////
wire clk200m;
wire clk10m;
wire clk10m_locked;
wire spi_clk;
 
clk_ger inst_clk (
    .sys_rst_n(sys_rst_n), 
//    .sys_clkp(sys_clkp), 
//    .sys_clkn(sys_clkn),
    .sys_clk(sys_clk),
    //-----------	 
    .gclk10m_bufr(clk10m), 
    .gclk10m_locked(clk10m_locked), 
    .gclk200m_bufr(clk200m),
	 //-----------	 
	 .spi_clk(spi_clk) //5M
    );
	 
	//----------------------- 
	 wire sys_rst_n_10M;
	 
	 wire sysrst_nr0;
	 reg  sysrst_nr1;
	 reg  sysrst_nr2;
	 
	 assign sysrst_nr0 = sys_rst_n & clk10m_locked;
	 
	 always@(posedge clk10m or negedge sysrst_nr0)
		if(!sysrst_nr0)
			sysrst_nr1 <= 1'b0;
		else
			sysrst_nr1 <= 1'b1;

	 always@(posedge clk10m or negedge sysrst_nr0)
	 if(!sysrst_nr0)
		 sysrst_nr2 <= 1'b0;
	 else
		 sysrst_nr2 <= sysrst_nr1;

	  assign sys_rst_n_10M = sysrst_nr2;

//////////////AD interface///////////////////
//--------VIO debug---------
wire [7:0]  vio_config_addr;
wire [15:0] vio_config_data;
wire vio_start_spi;
wire vio_select;
wire adc_sync_vio;

assign vio_config_addr = 8'd0;
assign vio_config_data = 16'd0;
assign vio_start_spi   = 1'd0;
assign vio_select      = 1'd0;
assign adc_sync_vio    = 1'd0;
//===================ADC_U72=========================
//---------ila--------
wire [4:0] a_seek_win_state;
wire [8:0] a_first_win;
wire [8:0] a_end_win;
wire a_first_win_v;
wire a_end_win_v;
wire [8:0] a_CNTVALUEIN;
wire [8:0] a_CNTVALUEOUT;
wire a_error;
//---------data-----------
wire  a_flag;
wire  [79:0] a_dataA_out;
wire  [79:0] a_dataB_out;
wire  [79:0] a_dataC_out;
wire  [79:0] a_dataD_out;
wire  [3:0]  a_data_or;

wire  a_clk_data;
wire  a_clk_data_locked;
//--------------------------

ad_fun  #(
    .CLK_DELAY(30)
    ) inst_AD_u72 (
	 //INPUT
	//----------------
    .gclk200m_buf(clk200m), 
    .gclk10m_buf(clk10m), 
    .spi_clk(spi_clk),
    .sys_rst_n(sys_rst_n_10M), 
    //-----------------     
    .ADR_P(ADR_P), 
    .ADR_N(ADR_N), 
    .AOR_P(AOR_P), 
    .AOR_N(AOR_N), 
    .BOR_P(BOR_P), 
    .BOR_N(BOR_N), 
    .COR_P(COR_P), 
    .COR_N(COR_N), 
    .DOR_P(DOR_P), 
    .DOR_N(DOR_N),  
    .A_P(A_P), 
    .A_N(A_N), 
    .B_P(B_P), 
    .B_N(B_N), 
    .C_P(C_P), 
    .C_N(C_N), 
    .D_P(D_P), 
    .D_N(D_N),
	 //OUTPUT
	 //-------AD-----------
	.adc_sclk(adc_sclk), 
    .adc_sen(adc_sen), 
    .adc_rst(adc_rst), 
    .adc_mosi(adc_mosi), 
    .adc_miso(adc_miso), 
    .adc_sync(adc_sync), 
    .adc_sync_dir(adc_sync_dir),
	 //-----������ݼ�ʱ���ź�------
    .flag(a_flag),	 
    .dataA_out(a_dataA_out), 
    .dataB_out(a_dataB_out), 
    .dataC_out(a_dataC_out), 
    .dataD_out(a_dataD_out), 
    .data_or(a_data_or), 
    .clk_data(a_clk_data), 
    .clk_data_locked(a_clk_data_locked),
     //----��������AD-----
    .vio_config_addr(vio_config_addr), 
    .vio_config_data(vio_config_data), 
    .vio_start_spi(vio_start_spi), 
    .vio_select(vio_select), 
    .adc_sync_vio(adc_sync_vio),
    //----------debug--------------
    .seek_win_state(a_seek_win_state),
    .first_win(a_first_win),
    .end_win(a_end_win),
    .first_win_v(a_first_win_v),
    .end_win_v(a_end_win_v),
    .a_CNTVALUEIN(a_CNTVALUEIN),
    .a_CNTVALUEOUT(a_CNTVALUEOUT),
    .error(a_error)
    );
//===================ADC_U73=========================
//---------ila--------
wire [4:0] b_seek_win_state;
wire [8:0] b_first_win;
wire [8:0] b_end_win;
wire b_first_win_v;
wire b_end_win_v;
wire [8:0] b_CNTVALUEIN;
wire [8:0] b_CNTVALUEOUT;
wire b_error;
//---------data-----------
wire  b_flag;
wire  [79:0] b_dataA_out;
wire  [79:0] b_dataB_out;
wire  [79:0] b_dataC_out;
wire  [79:0] b_dataD_out;
wire  [3:0]  b_data_or;

wire  b_clk_data;
wire  b_clk_data_locked;
//--------------------------
ad_fun #(
    .CLK_DELAY(60)
    ) inst_AD_u73 (
    //INPUT 
	//----------------
    .gclk200m_buf(clk200m), 
    .gclk10m_buf(clk10m), 
    .spi_clk(spi_clk),
    .sys_rst_n(sys_rst_n_10M),
    //-----------------      
    .ADR_P(ADR_P1), 
    .ADR_N(ADR_N1), 
    .AOR_P(AOR_P1), 
    .AOR_N(AOR_N1), 
    .BOR_P(BOR_P1), 
    .BOR_N(BOR_N1), 
    .COR_P(COR_P1), 
    .COR_N(COR_N1), 
    .DOR_P(DOR_P1), 
    .DOR_N(DOR_N1),  
    .A_P(A_P1), 
    .A_N(A_N1), 
    .B_P(B_P1), 
    .B_N(B_N1), 
    .C_P(C_P1), 
    .C_N(C_N1), 
    .D_P(D_P1), 
    .D_N(D_N1),
	 //OUTPUT
	 //-------AD-----------
	.adc_sclk(adc_sclk1), 
    .adc_sen(adc_sen1), 
    .adc_rst(adc_rst1), 
    .adc_mosi(adc_mosi1), 
    .adc_miso(adc_miso1), 
    .adc_sync(adc_sync1), 
    .adc_sync_dir(adc_sync_dir1),
	 //-----������ݼ�ʱ���ź�------
    .flag(b_flag),	 
    .dataA_out(b_dataA_out), 
    .dataB_out(b_dataB_out), 
    .dataC_out(b_dataC_out), 
    .dataD_out(b_dataD_out), 
    .data_or(b_data_or), 
    .clk_data(b_clk_data), 
    .clk_data_locked(b_clk_data_locked),
     //----��������AD-----
    .vio_config_addr(vio_config_addr), 
    .vio_config_data(vio_config_data), 
    .vio_start_spi(vio_start_spi), 
    .vio_select(vio_select), 
    .adc_sync_vio(adc_sync_vio),
    //----------debug--------------
    .seek_win_state(b_seek_win_state),
    .first_win(b_first_win),
    .end_win(b_end_win),
    .first_win_v(b_first_win_v),
    .end_win_v(b_end_win_v),
    .a_CNTVALUEIN(b_CNTVALUEIN),
    .a_CNTVALUEOUT(b_CNTVALUEOUT),
    .error(b_error)
    );
///////////////LED/////////////// 
assign LED0 = sys_rst_n;
assign LED3 = a_flag;
assign LED1 = sys_rst_n_10M;
assign LED2 = b_flag;
//LED inst_led (
//    .gclk10m_buf(clk10m), 
//    .clk_div_a(clk_data), 
//    .gclk10m_locked(clk10m_locked), 
//    .gclk_sd_lockeda(clk_data_locked), 
//    .LED1(LED1), 
//    .LED2(LED2)
//    );
//////////////////////////////////// 
//------------------chipscope------------------------
ila_0 inst_ctr (
	.clk(clk10m), // input wire clk
	.probe0(a_seek_win_state), // input wire [4:0]  probe0  
	.probe1(a_first_win), // input wire [8:0]  probe1 
	.probe2(a_end_win), // input wire [8:0]  probe2 
	.probe3(a_first_win_v), // input wire [0:0]  probe3 
	.probe4(a_end_win_v), // input wire [0:0]  probe4 
	.probe5(a_CNTVALUEIN), // input wire [8:0]  probe5 
	.probe6(a_CNTVALUEOUT), // input wire [8:0]  probe6 
	.probe7(a_error),
	//------------------
	.probe8(b_seek_win_state), // input wire [4:0]  probe0  
    .probe9(b_first_win), // input wire [8:0]  probe1 
    .probe10(b_end_win), // input wire [8:0]  probe2 
    .probe11(b_first_win_v), // input wire [0:0]  probe3 
    .probe12(b_end_win_v), // input wire [0:0]  probe4 
    .probe13(b_CNTVALUEIN), // input wire [8:0]  probe5 
    .probe14(b_CNTVALUEOUT), // input wire [8:0]  probe6 
    .probe15(b_error)	
);

// Count ADC clocks for sanity
wire [31:0] adc_clk_counter_a;
counter counter_a (
    .clk(a_clk_data),
    .rst(1'b0),
    .trig(clk10m),
    .count_out(adc_clk_counter_a)
);
   
wire [31:0] adc_clk_counter_b;
counter counter_b (
    .clk(b_clk_data),
    .rst(1'b0),
    .trig(clk10m),
    .count_out(adc_clk_counter_b)
);   
   
ila_3 adc_ctr(
    .clk(clk10m), // input wire clk
    .probe0(adc_clk_counter_a), // input wire [31:0]
    .probe1(adc_clk_counter_b) // input wire [31:0]
);   


wire [4*64 - 1 : 0] ok_out_a;
wire [4*64 - 1 : 0] err_out_a;
wire [4*64 - 1 : 0] ok_out_b;
wire [4*64 - 1 : 0] err_out_b;

ramp_error_counter ramp_error_counter_a[3:0] (
    .clk(a_clk_data),
    .rst(a_seek_win_state != 5'h15),
    .din({a_dataA_out, a_dataB_out, a_dataB_out, a_dataC_out}),
    // If you want to deliberately break things:
    //.din({a_dataA_out[79:1], ~a_dataA_out[0], a_dataB_out[79:1], ~a_dataB_out[0], a_dataC_out[79:1], ~a_dataC_out[0], a_dataD_out[79:1], ~a_dataD_out[0]}),
    .err_out(err_out_a),
    .ok_out(ok_out_a)
    );
    
ramp_error_counter ramp_error_counter_b[3:0] (
    .clk(b_clk_data),
    .rst(b_seek_win_state != 5'h15),
    .din({b_dataA_out, b_dataB_out, b_dataB_out, b_dataC_out}),
    .err_out(err_out_b),
    .ok_out(ok_out_b)
);
 
 
ila_2 inst_err_a (
        .clk(a_clk_data), // input wire clk
        .probe0(err_out_a[1*64-1:0*64]), // input wire [31:0]
        .probe1(err_out_a[2*64-1:1*64]), // input wire [31:0]
        .probe2(err_out_a[3*64-1:2*64]), // input wire [31:0]
        .probe3(err_out_a[4*64-1:3*64]), // input wire [31:0]  
        .probe4(ok_out_a[1*64-1:0*64]), // input wire [31:0]
        .probe5(ok_out_a[2*64-1:1*64]), // input wire [31:0]
        .probe6(ok_out_a[3*64-1:2*64]), // input wire [31:0]
        .probe7(ok_out_a[4*64-1:3*64]) // input wire [31:0]  
    );   
    

ila_2 inst_err_b (
    .clk(b_clk_data), // input wire clk
    .probe0(err_out_b[1*64-1:0*64]), // input wire [31:0]
    .probe1(err_out_b[2*64-1:1*64]), // input wire [31:0]
    .probe2(err_out_b[3*64-1:2*64]), // input wire [31:0]
    .probe3(err_out_b[4*64-1:3*64]), // input wire [31:0]  
    .probe4(ok_out_b[1*64-1:0*64]), // input wire [31:0]
    .probe5(ok_out_b[2*64-1:1*64]), // input wire [31:0]
    .probe6(ok_out_b[3*64-1:2*64]), // input wire [31:0]
    .probe7(ok_out_b[4*64-1:3*64]) // input wire [31:0]  
);     

ila_1 inst_data_a (
	.clk(a_clk_data), // input wire clk
	.probe0(a_dataA_out), // input wire [79:0]  probe0  
	.probe1(a_dataB_out), // input wire [79:0]  probe1 
	.probe2(a_dataC_out), // input wire [79:0]  probe2 
	.probe3(a_dataD_out), // input wire [79:0]  probe3
	.probe4(a_data_or)    // input wire [3:0]  probe4
);

ila_1 inst_data_b (
	.clk(b_clk_data), // input wire clk
	.probe0(b_dataA_out), // input wire [79:0]  probe0  
	.probe1(b_dataB_out), // input wire [79:0]  probe1 
	.probe2(b_dataC_out), // input wire [79:0]  probe2 
	.probe3(b_dataD_out), // input wire [79:0]  probe3
	.probe4(b_data_or)    // input wire [3:0]  probe4
);
  
endmodule
