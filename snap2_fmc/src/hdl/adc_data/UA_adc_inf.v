module UA_adc_inf #(
    parameter CLK_DELAY = 30
    )(
    //--------------
	 clk10m          , 
	 clk200m         ,
	 auto_spi_rstan  ,
	 //----------------
     a_adc_gclk      , //625M
	 clk_div_a       , //156.25M
	 rst_IODELAY     ,
	 rst_SERDES      ,
    //--------------
     work_mode       ,
//     clk_ctrl        ,
	 //--------------
	 spi_clk         ,
     adc_rst         ,
     adc_mosi        ,
     adc_sen         ,
     adc_sclk        ,
	 adc_miso        ,
	 adc_sync        ,
	 adc_sync_dir    ,
	 //--------------
     A_P          , //channel 1
	 A_N          ,
	 B_P          ,
	 B_N          ,
	 C_P          , //channel 2
	 C_N          ,
	 D_P          ,
	 D_N          ,
	 //---------------
	 AOR_P      ,
	 AOR_N      ,
	 BOR_P      ,
	 BOR_N      ,
	 COR_P      ,
     COR_N      ,
	 DOR_P      ,
	 DOR_N      ,
	 //----------------
	 dataA        ,
	 dataB        ,
	 dataC        ,
	 dataD        ,
	 //----------------
     adc_ready    ,
     data_or	  ,
    //-----------------
     load,
     a_CNTVALUEIN,
     a_CNTVALUEOUT,
	 //-------debug---------
	 vio_config_addr,
	 vio_config_data,
	 vio_start_spi,
	 vio_select,
	 adc_spi_rdout,
	 adc_spi_rdy
);


//----------input output-------------
input               clk10m          ; 
input               clk200m         ;
input               auto_spi_rstan  ;

input               a_adc_gclk      ;
input            	clk_div_a       ; 
input	            rst_IODELAY     ;
input               rst_SERDES      ;
//-----------contrl--------
input               work_mode       ;
//input       [1:0]   clk_ctrl        ;
//-----------config--------
input               spi_clk         ;
output              adc_rst         ;
output              adc_mosi        ;
output              adc_sen         ;
output              adc_sclk        ;
output              adc_sync        ;
output              adc_sync_dir    ;
input               adc_miso        ;
//------------data-------
input     [9:0]         A_P          ;
input     [9:0]         A_N          ;
input     [9:0]         B_P          ;
input     [9:0]         B_N          ;
input     [9:0]         C_P          ;
input     [9:0]         C_N          ;
input     [9:0]         D_P          ;
input     [9:0]         D_N          ;
//-----------------------
input               AOR_P      ;
input               AOR_N      ;
input               BOR_P      ;
input               BOR_N      ;
input               COR_P      ;
input               COR_N      ;
input               DOR_P      ;
input               DOR_N      ;
//--------------------
output    [79:0]    dataA       ;
output    [79:0]    dataB       ;
output    [79:0]    dataC       ;
output    [79:0]    dataD       ;
//--------------------
output              adc_ready   ;
output    [3:0]     data_or     ;
//--------------------
input               load;
input     [8:0]     a_CNTVALUEIN;
output    [8:0]     a_CNTVALUEOUT;       
//-----debug-----
input     [7:0]   vio_config_addr;
input     [15:0]  vio_config_data;
input             vio_start_spi;
input             vio_select;
output    [15:0]  adc_spi_rdout;
output            adc_spi_rdy;

/////////time domain translation//////////
//---------------------------
reg [8:0] CNTVALUEIN_lr;
reg  load_lr;
always@(posedge clk10m)
begin
    CNTVALUEIN_lr <= a_CNTVALUEIN;
    load_lr       <= load;
end
reg [8:0] CNTVALUEIN_r1;
reg  load_r1;
always@(posedge clk_div_a)
begin
    CNTVALUEIN_r1 <= CNTVALUEIN_lr;
    load_r1       <= load_lr;
end
reg [8:0] CNTVALUEIN_r2;
reg  load_r2;
always@(posedge clk_div_a)
begin
    CNTVALUEIN_r2 <= CNTVALUEIN_r1;
    load_r2       <= load_r1;
end
//---------------------------
wire [8:0] CNTVALUEOUT;
reg [8:0] CNTVALUEOUT_r1;
reg [8:0] CNTVALUEOUT_r2;
always@(posedge clk10m)
begin
    CNTVALUEOUT_r1 <= CNTVALUEOUT;
    CNTVALUEOUT_r2 <= CNTVALUEOUT_r1;
end
assign a_CNTVALUEOUT = CNTVALUEOUT_r2;
//-----------------------------
reg rst_r1;
reg rst_r2;
always@(posedge clk_div_a or posedge rst_IODELAY)
    if(rst_IODELAY)
        rst_r1 <= 1'b1;
    else
        rst_r1 <= 1'b0;

always@(posedge clk_div_a or posedge rst_IODELAY)
    if(rst_IODELAY)
        rst_r2 <= 1'b1;
    else
        rst_r2 <= rst_r1;
        
reg rst_r3;
reg rst_r4;
always@(posedge clk_div_a or posedge rst_SERDES)
    if(rst_SERDES)
        rst_r3 <= 1'b1;
    else
        rst_r3 <= 1'b0;
        
always@(posedge clk_div_a or posedge rst_SERDES)
    if(rst_SERDES)
        rst_r4 <= 1'b1;
    else
        rst_r4 <= rst_r3;
wire rst_serdes;
wire rst_iodelay;
  assign rst_serdes = rst_r4;
  assign rst_iodelay= rst_r2;     
/////////////////��������//////////////////
//-----ͨ��0-------
UA_adc_data_receive u0_adc_data_receive(
    .adc_gclk        (    a_adc_gclk   ),
	.clk_div         (    clk_div_a    ),
    .rst_IODELAY     (    rst_iodelay  ),
    .rst_SERDES      (    rst_serdes   ),
	 //----------
    .dAp             (    A_P          ),
    .dAn             (    A_N          ),
	 //----------
    .dorp            (    AOR_P        ),
	.dorn            (    AOR_N        ),
	 //----------
	.data            (    dataA        ),
    .data_or         (    data_or[0]   ),
    //-------------
    .load            (    load_r2       ),
    .a_CNTVALUEIN    (    CNTVALUEIN_r2 ),
    .a_CNTVALUEOUT   (    CNTVALUEOUT )	 
    );
//-----ͨ��1-------
UA_adc_data_receive u1_adc_data_receive(
    .adc_gclk        (    a_adc_gclk    ),
	.clk_div         (    clk_div_a     ),	
    .rst_IODELAY     (    rst_iodelay   ),
    .rst_SERDES      (    rst_serdes    ),
    .dAp             (    B_P           ),
    .dAn             (    B_N           ),
	 //----------
	.dorp            (    BOR_P         ),
	.dorn            (    BOR_N         ),
	 //-----------
    .data            (    dataB         ),
    .data_or         (    data_or[1]    ),
    //-------------
    .load            (    load_r2       ),
    .a_CNTVALUEIN    (    CNTVALUEIN_r2 ),
    .a_CNTVALUEOUT   (                  )        	 
    );
//-----ͨ��2-------
UA_adc_data_receive u2_adc_data_receive(
    .adc_gclk        (    a_adc_gclk    ),
	.clk_div         (    clk_div_a     ),
    .rst_IODELAY     (    rst_iodelay   ),
    .rst_SERDES      (    rst_serdes    ),
	 //----------
    .dAp             (    C_P           ),
    .dAn             (    C_N           ),
	 //----------
    .dorp            (    COR_P         ),
	.dorn            (    COR_N         ),
	 //----------
	.data            (    dataC         ),
    .data_or         (    data_or[2]    ),
    //------------
    .load            (    load_r2       ),
    .a_CNTVALUEIN    (    CNTVALUEIN_r2 ),
    .a_CNTVALUEOUT   (                  )              	 
    );
//-----ͨ��3-------
UA_adc_data_receive u3_adc_data_receive(
    .adc_gclk        (    a_adc_gclk    ),
	.clk_div         (    clk_div_a     ),
    .rst_IODELAY     (    rst_iodelay  ),
    .rst_SERDES      (    rst_serdes   ),
	 //----------
    .dAp             (    D_P           ),
    .dAn             (    D_N           ),
	 //----------
	.dorp            (    DOR_P         ),
	.dorn            (    DOR_N         ),
	 //----------
	.data            (    dataD         ),
    .data_or         (    data_or[3]    ),
    //------------
    .load            (    load_r2       ),
    .a_CNTVALUEIN    (    CNTVALUEIN_r2 ),
    .a_CNTVALUEOUT   (                  )           
    );

//////////////////����	ADC//////////////////
ad_spi_cfg #(
    .CLK_DELAY       (    CLK_DELAY       )
    ) u_ad_spi_cfg (
    .clk             (    spi_clk         ),
	.clk200m         (    clk200m         ),
    .sys_rst_n       (    auto_spi_rstan  ), //reset AD config
	 //------------
    .adc_rst         (    adc_rst         ), //reset AD chip
    .adc_mosi        (    adc_mosi        ),
    .adc_sen         (    adc_sen         ),
    .adc_sclk        (    adc_sclk        ),
	.adc_miso        (    adc_miso        ),
	.adc_sync        (    adc_sync        ),
	.adc_sync_dir    (    adc_sync_dir    ),
	 //------------
    .work_mode       (    work_mode       ),
//    .clk_ctrl        (    clk_ctrl        ),
    .cfg_reday       (    adc_ready       ),
	 //-------debug-------
	.vio_config_addr (   vio_config_addr  ),
	.vio_config_data (   vio_config_data  ),
	.vio_start_spi   (   vio_start_spi    ),
	.vio_select      (   vio_select       ),
	.adc_spi_rdout   (   adc_spi_rdout    ),
	.adc_spi_rdy     (   adc_spi_rdy      )
	); 

endmodule
