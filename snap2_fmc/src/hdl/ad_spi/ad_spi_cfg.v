module ad_spi_cfg #(
    parameter CLK_DELAY = 30
    )(

    clk             ,
	clk200m         ,
    sys_rst_n       ,		//ϵͳ��λ
    adc_rst         ,    	//AD��λ  �͵�ƽ��Ч  
    adc_mosi        ,    	//spi����AD��������      write  
    adc_sen         ,      //spi����AD��ʹ���ź� 
    adc_sclk        ,	   //spi����AD��ʱ��  
	adc_miso        ,      //spi����AD��������      read
    adc_sync        ,
    adc_sync_dir    ,	 
	//----------------	 
    work_mode       ,
//    clk_ctrl        ,      //��AD��صĿ��ƹܽ�
    cfg_reday       ,
	//-------debug---------
	vio_config_addr,
	vio_config_data,
	vio_start_spi,
	vio_select,
	adc_spi_rdout,
	adc_spi_rdy
	
	);

//=============input output================
input               clk             ;
input               clk200m         ;
input               sys_rst_n       ;

input               work_mode       ;
//input   [1:0]       clk_ctrl        ;

output                 adc_rst      ;    	//AD��λ  �͵�ƽ��Ч  
output                 adc_mosi     ;    	//spi����AD��������   
output                 adc_sen      ;     //spi����AD��ʹ���ź� 
output       reg       adc_sclk     ;	   //spi����AD��ʱ�� 
input                  adc_miso     ;     //ADоƬ����Power Down
output reg             cfg_reday    ;
output                 adc_sync_dir ;
output reg             adc_sync     ;
                
//-----debug-----
input [7:0]  vio_config_addr;
input [15:0] vio_config_data;
input vio_start_spi;
input vio_select;
output [15:0] adc_spi_rdout;
output  adc_spi_rdy;



//=============register definition==========
localparam	    Idle       = 5'd0,
				Ctr_cfg    = 5'd1,		Idle1 = 5'd2,			Test_mode_cfg = 5'd3,	 Idle2 = 5'd4,
				Sync_Y_cfg = 5'd5,		Idle3 = 5'd6,	      Sel_cfg        = 5'd7,	 Idle4 = 5'd8,
				offset_cfg = 5'd9,		Idle5 = 5'd10,	      gain_cfg      = 5'd11,	 Idle6 = 5'd12,
				phase_cfg  = 5'd13,		Idle7 = 5'd14,	      cal_cfg       = 5'd15,   Idle8 = 5'd16,
				cfg_wait   = 5'd17,     Sync_sig   = 5'd18,  Sync_wait = 5'd19;
localparam	//-----ע���ַ�����λ�����Ŷ�д ��Ϊд ��Ϊ��----------
				ADD_STEP1 = 8'h84,				REG_STEP1 = 16'h0001,  //soware reset
				ADD_STEP2 = 8'h81,				ADCMODE   = 4'b1000,   //contrl
				ADD_STEP3 = 8'h85,				REG_STEP3 = 16'h0000,  //test mode 
				ADD_STEP4 = 8'h86,				REG_STEP4 = 16'h0000,  //SYNC register
				//-----------------gain offset phase----------------
				ADD_STEP5 = 8'h8F,				REG_STEP5 = 16'h0001,  //channel selector
				ADD_STEP6 = 8'h90,				REG_STEP6 = 16'h00A8,  //CAL contrl register
				ADD_STEP7 = 8'h11,				/*REG_STEP7 = 16'h0000,*/  //CAL contrl register mail box (read only)
				ADD_STEP8 = 8'h12,				/*REG_STEP8 = 16'h0000,*/  //global status (read only)
				ADD_STEP9 = 8'h93,				REG_STEP9  = 16'h0007,  //trimmer register
				ADD_STEP10 = 8'hA0,				REG_STEP10 = 16'h0200,  //External Offset Registers
				ADD_STEP11 = 8'h21,				/*REG_STEP11 = 16'h0000,*/ //Offset Registers(read only)
				ADD_STEP12 = 8'hA2,				REG_STEP12 = 16'h0200,  //External gain Registers
				ADD_STEP13 = 8'h23,				/*REG_STEP13 = 16'h0000,*/  //gain Registers(read only)
				ADD_STEP14 = 8'hA4,				REG_STEP14 = 16'h0200,  //External phase Registers
				ADD_STEP15 = 8'h25;				/*REG_STEP15 = 16'h0000,*/  //phase Registers(read only)
//=============configuration================
//always@(posedge clk)
//begin
//	adc_rst <= 1;
//	adc_sync_dir <= 1; 
//end
assign   adc_rst = 1;      //active  low
assign   adc_sync_dir = 1; //config SN79 A to B
 
//------start config-------
(* KEEP="TRUE" *)reg config_start;
reg [2:0] conf_cnt;
always@(posedge clk or negedge sys_rst_n)
	if(~sys_rst_n)
		begin
			config_start <= 1'b0;
			conf_cnt     <= 3'd0; 
		end
	else if(conf_cnt < 3'd5)
		begin
			config_start <= 1'b1;
			conf_cnt     <= conf_cnt + 1; 
		end
	else
		begin
			config_start <= 1'b0;
			conf_cnt     <= conf_cnt; 
		end
 
//--------Phase Offset Gain----------
reg [15:0] offset_in[3:0];
reg [15:0] gain_in[3:0];
reg [15:0] phase_in[3:0];

//-----------start config------------
(* KEEP="TRUE" *) wire       spi_Idle_flag;
(* KEEP="TRUE" *) reg        start_spi; 
(* KEEP="TRUE" *) reg [7:0]  config_addr ;
(* KEEP="TRUE" *) reg [15:0] config_data ;
(* KEEP="TRUE" *) reg [4:0]  config_state;
(* KEEP="TRUE" *) reg [5:0]  delay_cnt;
reg [2:0]  index_N;

always @ (posedge clk or negedge sys_rst_n)
begin
	if(~sys_rst_n)
		begin
				config_addr   <= 8'd0;
				config_data   <= 16'd0;
				start_spi     <= 1'b0;
				config_state  <= Idle;		
				cfg_reday     <= 1'b0;
				delay_cnt     <= 6'd0;
				offset_in[0]  <= 16'h01C2; //channelA 01C2
				offset_in[1]  <= 16'h0203; //channelB
				offset_in[2]  <= 16'h024F; //channelC
				offset_in[3]  <= 16'h01ED; //channelD
				gain_in[0]    <= 16'h01C5; //01D9
				gain_in[1]    <= 16'h0200; //FIXED
				gain_in[2]    <= 16'h01EA; //01F0
				gain_in[3]    <= 16'h0200; //FIXED
				phase_in[0]   <= 16'h0200;
				phase_in[1]   <= 16'h0200;
				phase_in[2]   <= 16'h0200;
				phase_in[3]   <= 16'h0200;
				index_N       <= 3'd0;
				
		end
	else case(config_state)
		Idle:
		begin
				if(config_start & spi_Idle_flag)
					begin
						config_state  <= Ctr_cfg;
						cfg_reday     <= 0;
					end
				else
					begin
						config_state  <= Idle;	
						cfg_reday     <= cfg_reday;
					end
				start_spi  <= 1'b0;
				delay_cnt  <= 6'd0;
				index_N    <= 3'd0;
		end
		Ctr_cfg:
		begin  
				if(spi_Idle_flag) 
					begin
						start_spi     <= 1;
						config_addr   <= ADD_STEP2;    //contrl register
						config_data   <= {3'd0,work_mode,8'd0,ADCMODE}; //channel A
						//config_data   <= REG_STEP2;
						config_state  <= Ctr_cfg;
					end
				else 
					begin
						config_state  <= Idle1;
					end
		end
		Idle1:
		begin
				if(spi_Idle_flag)
					begin
						config_state  <= Sel_cfg; 
					end
				else 
					begin
						config_state  <= Idle1;
					end	
				start_spi     <= 0;
		end
//------------------------------------------------------
//		Test_mode_cfg:
//		begin
//				if(spi_Idle_flag)
//					begin
//						start_spi     <= 1;
//						config_addr   <= ADD_STEP3;   //test mode 
//						config_data   <= REG_STEP3;
//						config_state  <= Test_mode_cfg;
//					end
//				else 
//					begin
//						config_state  <= Idle2;
//					end	
//		end
//		Idle2:
//		begin
//				if(spi_Idle_flag)
//					begin
//						config_state  <= Sync_Y_cfg;
//					end
//				else 
//					begin
//						config_state  <= Idle2;
//					end	
//				start_spi     <= 0;
//		end
//	   Sync_Y_cfg:
//		begin
//				if(spi_Idle_flag)
//					begin
//						start_spi     <= 1;
//						config_addr   <= ADD_STEP4;  //SYNC register
//						config_data   <= REG_STEP4;
//						config_state  <= Sync_Y_cfg;
//					end
//				else 
//					begin
//						config_state  <= Idle3;
//					end	
//		end
//      Idle3:
//		begin
//				if(spi_Idle_flag)
//					begin
//						config_state  <= Sync_sig;  //**************************
//					end
//				else 
//					begin
//						config_state  <= Idle3;
//					end	
//				start_spi     <= 0;
//		end
		//---------------------channel config--------------------------
		Sel_cfg:
		begin
				if(spi_Idle_flag)
					begin
						start_spi     <= 1;
						config_addr   <= ADD_STEP5;  //channel select
						config_data   <= REG_STEP5 + {13'd0,index_N};
						config_state  <= Sel_cfg;
					end
				else 
					begin
						config_state  <= Idle4;
					end		
		end
		Idle4:
		begin
				if(spi_Idle_flag)
					begin
						config_state  <= offset_cfg;
					end
				else 
					begin
						config_state  <= Idle4;
					end	
				start_spi     <= 0;
		end
		offset_cfg:
		begin
				if(spi_Idle_flag)
					begin
						start_spi     <= 1;
						config_addr   <= ADD_STEP10;  //offset  config
						config_data   <= offset_in[index_N];
						config_state  <= offset_cfg;
					end
				else 
					begin
						config_state  <= Idle5;
					end		
		end
		Idle5:
		begin
				if(spi_Idle_flag)
					begin
						config_state  <= gain_cfg; 
					end
				else 
					begin
						config_state  <= Idle5;
					end	
				start_spi     <= 0;
		end
		gain_cfg:
		begin
				if(spi_Idle_flag)
					begin
						start_spi     <= 1;
						config_addr   <= ADD_STEP12;  //gain config
						config_data   <= gain_in[index_N];
						config_state  <= gain_cfg;
					end
				else 
					begin
						config_state  <= Idle6;
					end		
		end
		Idle6:
		begin
				if(spi_Idle_flag)
					begin
						config_state  <= phase_cfg;
					end
				else 
					begin
						config_state  <= Idle6;
					end	
				start_spi     <= 0;
		end
		phase_cfg:
		begin
				if(spi_Idle_flag)
					begin
						start_spi     <= 1;
						config_addr   <= ADD_STEP14;  //phase config
						config_data   <= phase_in[index_N];
						config_state  <= phase_cfg;
					end
				else 
					begin
						config_state  <= Idle7;
					end		
		end
		Idle7:
		begin
				if(spi_Idle_flag)
					begin
						config_state  <= cal_cfg;
					end
				else 
					begin
						config_state  <= Idle7;
					end	
				start_spi     <= 0;
		end
		cal_cfg:
		begin
				if(spi_Idle_flag)
					begin
						start_spi     <= 1;
						config_addr   <= ADD_STEP6;  //****************CAL control register
						config_data   <= REG_STEP6;
						config_state  <= cal_cfg;
					end
				else 
					begin
						config_state  <= Idle8;
					end		
		end
		Idle8:
		begin
				if(spi_Idle_flag)
					begin
						if(index_N==3'd3)
							begin
								config_state  <= Sync_sig;
							end
						else
							begin
								config_state  <= Sel_cfg;
								index_N <= index_N + 1;
							end
					end
				else 
					begin
						config_state  <= Idle8;
					end	
				start_spi     <= 0;
		end	
//--------------------------------------------------------------	
//		cfg_wait:
//		begin
//			if(delay_cnt > 6'd30)              // wait for sync 
//					begin
//					   delay_cnt     <= 6'd0;
//						config_state  <= Sync_sig;
//					end
//				else 
//					begin
//						config_state  <= cfg_wait;
//						delay_cnt     <= delay_cnt + 1;
//					end		
//		end
//--------------------------------------------------------------
      Sync_sig:
		begin
				 if(delay_cnt == 6'd10)              // sync signal
					begin
						adc_sync      <= 0;
					   delay_cnt     <= 6'd0;
						config_state  <= Sync_wait;
					end
				else 
					begin
						config_state  <= Sync_sig;
						delay_cnt     <= delay_cnt + 1;
						adc_sync      <= 1;
					end
					start_spi     <= 0;
		end 
		Sync_wait:
		begin
				 if(delay_cnt > 6'd50)              // wait for sync 
					begin
						cfg_reday     <= 1'b1;
					   delay_cnt     <= 6'd0;
						config_state  <= Idle;
					end
				else 
					begin
						config_state  <= Sync_wait;
						delay_cnt     <= delay_cnt + 1;
						cfg_reday     <= 0;
					end
		end
		default:
		begin
				config_addr   <= 8'd0;
				config_data   <= 16'd0;
				start_spi     <= 1'b0;
				config_state  <= Idle;		
				cfg_reday     <= 1'b0;
				delay_cnt     <= 6'd0;
				offset_in[0]  <= 16'h01C7; //channelA 01C7
				offset_in[1]  <= 16'h01F1; //channelB
				offset_in[2]  <= 16'h023A; //channelC
				offset_in[3]  <= 16'h0192; //channelD
				gain_in[0]    <= 16'h0200;
				gain_in[1]    <= 16'h0200;
				gain_in[2]    <= 16'h0200;
				gain_in[3]    <= 16'h0200;
				phase_in[0]   <= 16'h0200;
				phase_in[1]   <= 16'h0200;
				phase_in[2]   <= 16'h0200;
				phase_in[3]   <= 16'h0200;
				index_N       <= 3'd0;
		end
	endcase
end

//----------------vio select-----------------
	wire [7:0]  config_addr_sel;
	wire [15:0] config_data_sel;
	wire        start_spi_sel;
	
	assign  config_addr_sel = vio_select ? vio_config_addr : config_addr;
	assign  config_data_sel = vio_select ? vio_config_data : config_data;
	assign  start_spi_sel   = vio_select ? vio_start_spi   : start_spi;

//----------------------data transmit-----------------------
(* KEEP="TRUE" *)	wire [15:0] data_rd_out;
(* KEEP="TRUE" *)	wire        data_rd_rdy;
(* KEEP="TRUE" *)	wire        adc_sclk_out;

   data_transmit_spi ad_spi_data (
				      .clk(clk), 
				      .reset(~sys_rst_n), 
				      .reg_addr(config_addr_sel), 
				      .config_value(config_data_sel), 
				      .start_spi(start_spi_sel), 
				      .data_read_out(data_rd_out), 
				      .data_read_rdy(data_rd_rdy),
						.Idle_flag(spi_Idle_flag),
				      .spi_miso_i(adc_miso), 
				      .spi_sclk_o(adc_sclk_out), 
				      .spi_mosi_o(adc_mosi), 
				      .spi_csb_o (adc_sen)
						);
	
assign  adc_spi_rdout = data_rd_out;
assign  adc_spi_rdy   = data_rd_rdy;
//------------spi_clk delay------------------

reg adc_sclk_delay[127:0];

always@(posedge clk200m)
begin
	adc_sclk_delay[0] <= adc_sclk_out;
end

genvar 		i;  
generate for(i=0;i<127;i=i+1)
	begin: spi_clk_delay

		always@(posedge clk200m)
			begin
				adc_sclk_delay[i+1] <= adc_sclk_delay[i];
			end
	end
endgenerate	

always@(posedge clk200m)
begin
	adc_sclk <= adc_sclk_delay[CLK_DELAY];
end



endmodule 