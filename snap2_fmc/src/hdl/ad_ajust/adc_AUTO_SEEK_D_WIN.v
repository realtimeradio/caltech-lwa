`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:12 04/18/2013 
// Design Name: 
// Module Name:    AUTO_SEEK_D_WIN 
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
module adc_AUTO_SEEK_D_WIN //#(parameter LxDAT_DATA_BIT = 8'd7)
    (
	gclk10m_buf,
    rst,
    //---------
    clk_div,
    gclk_sd_locked,
    auto_seek_rst,
    auto_spi_rstn,   //ADC chip rst
    work_mode,
//    clk_ctrl,    
    adc_ready,       
//    adc_ddrrst,
     //---------
    adc_dataA,
    adc_dataB,
    adc_dataC,
    adc_dataD,
     //---------
    CNTVALUEIN,
    win_ok_all,
    //----debug-----
    seek_win_state,
    first_win,
    end_win,
    first_win_v,
    end_win_v,
    error
    );
    //-------------
    input      rst;
    input      gclk10m_buf;
    //-------------
    input   clk_div;
    input   gclk_sd_locked;
(*keep="true"*)    output reg  auto_seek_rst;
//(*keep="true"*)    output reg  adc_ddrrst;
(*keep="true"*)    output reg  auto_spi_rstn;
(*keep="true"*)    output reg  work_mode;
//    output  [1:0] clk_ctrl;
    input         adc_ready;
     //-------------
    input  [79:0] adc_dataA;
    input  [79:0] adc_dataB;
    input  [79:0] adc_dataC;
    input  [79:0] adc_dataD;
     
(*keep="true"*) output reg [8:0] CNTVALUEIN;
(*keep="true"*)     output reg win_ok_all;
//------------debug------------
(*keep="true"*) output reg [4:0]  seek_win_state  ;
(*keep="true"*) output reg [8:0]  first_win       ;
(*keep="true"*) output reg [8:0]  end_win         ;
(*keep="true"*) output reg        first_win_v     ;
(*keep="true"*) output reg        end_win_v       ;
//-------------
output  error;
//assign  clk_ctrl = 0;
//--------------
///////////////////////////////////////////////////////////////////////////////////////////////
//save adc data   
///////////////////////////////////////////////////////////////////////////////////////////////
reg rst_r1;
reg rst_r2;

always@(posedge clk_div or posedge rst)
    if(rst)
        rst_r1 <= 1'b1;
    else
        rst_r1 <= 1'b0;

always@(posedge clk_div or posedge rst)
    if(rst)
        rst_r2 <= 1'b1;
    else
        rst_r2 <= rst_r1;
        
reg rst_rt;        
always@(posedge clk_div)
begin
     rst_rt <= rst_r2;
end

(*keep="true"*)wire   en_buf_adc_data;
    assign en_buf_adc_data =  rst_rt ; 
   
//-------A------
(*keep="true"*)reg [79:0] old_adc_dataA;

        always@(posedge clk_div or posedge en_buf_adc_data)
        if(en_buf_adc_data)
             begin
                    old_adc_dataA<=80'd0;
             end
        else
             begin
                    old_adc_dataA<=adc_dataA;
             end
//-------B------
(*keep="true"*)reg [79:0] old_adc_dataB;

        always@(posedge clk_div or posedge en_buf_adc_data)
        if(en_buf_adc_data)
             begin
                    old_adc_dataB<=80'd0;
             end
        else
             begin
                    old_adc_dataB<=adc_dataB;
             end    
//-------C------              
(*keep="true"*)reg [79:0] old_adc_dataC;

        always@(posedge clk_div or posedge en_buf_adc_data)
        if(en_buf_adc_data)
             begin
                    old_adc_dataC<=80'd0;
             end
        else
             begin
                    old_adc_dataC<=adc_dataC;
             end
//-------D------              
(*keep="true"*)reg [79:0] old_adc_dataD;

        always@(posedge clk_div or posedge en_buf_adc_data)
        if(en_buf_adc_data)
             begin
                    old_adc_dataD<=80'd0;
             end
        else
             begin
                    old_adc_dataD<=adc_dataD;
             end

///////////////////////////////////////////////////////////////////////////////////////////////                
//detect record_Error          
///////////////////////////////////////////////////////////////////////////////////////////////
(*keep="true"*)reg   stop_detect_err;
//---------------------------------
reg stop_detect_r1;
reg stop_detect_r2;

always@(posedge clk_div or posedge stop_detect_err)
    if(stop_detect_err)
        stop_detect_r1 <= 1'b1;
    else
        stop_detect_r1 <= 1'b0;

always@(posedge clk_div or posedge stop_detect_err)
    if(stop_detect_err)
        stop_detect_r2 <= 1'b1;
    else
        stop_detect_r2 <= stop_detect_r1;
        
reg stop_detect_rt;        
always@(posedge clk_div)
begin
    stop_detect_rt <= stop_detect_r2;
end
wire stop_detect;
assign stop_detect = stop_detect_rt;
//----------------A----------------
(*keep="true"*)reg  [7:0] dtec_errorA;

genvar         i;  
generate for(i=0;i<8;i=i+1)
    begin: error_dtec_loopA

    always@(posedge clk_div or posedge stop_detect)
        if(stop_detect)
                  dtec_errorA[i] <= 0;
        else
             if( adc_dataA[i*10+9:i*10]==(old_adc_dataA[i*10+9:i*10]+10'd8) )
                  dtec_errorA[i]<=dtec_errorA[i];
             else
                  dtec_errorA[i]<=1;
    end
endgenerate            
//------8路数据检测结果整合-------
(*keep="true"*)wire    Rec_ErrorA;          
assign  Rec_ErrorA = | (dtec_errorA);
//----------------B----------------
(*keep="true"*)reg  [7:0] dtec_errorB;

genvar         j;  
generate for(j=0;j<8;j=j+1)
    begin: error_dtec_loopB

    always@(posedge clk_div or posedge stop_detect)
        if(stop_detect)
                  dtec_errorB[j] <= 0;
        else
             if( adc_dataB[j*10+9:j*10]==(old_adc_dataB[j*10+9:j*10]+10'd8) )
                  dtec_errorB[j]<=dtec_errorB[j];
             else
                  dtec_errorB[j]<=1;
    end
endgenerate            
//------8路数据检测结果整合-------
(*keep="true"*)wire    Rec_ErrorB;          
assign  Rec_ErrorB = | (dtec_errorB);
//----------------C----------------
(*keep="true"*)reg  [7:0] dtec_errorC;

genvar         m;  
generate for(m=0;m<8;m=m+1)
    begin: error_dtec_loopC

    always@(posedge clk_div or posedge stop_detect)
        if(stop_detect)
                  dtec_errorC[m] <= 0;
        else
             if( adc_dataC[m*10+9:m*10]==(old_adc_dataC[m*10+9:m*10]+10'd8) )
                  dtec_errorC[m]<=dtec_errorC[m];
             else
                  dtec_errorC[m]<=1;
    end
endgenerate            
//------8路数据检测结果整合-------
(*keep="true"*)wire    Rec_ErrorC;          
assign  Rec_ErrorC = | (dtec_errorC);    
//----------------D----------------
(*keep="true"*)reg  [7:0] dtec_errorD;

genvar         n;  
generate for(n=0;n<8;n=n+1)
    begin: error_dtec_loopD

    always@(posedge clk_div or posedge stop_detect)
        if(stop_detect)
                  dtec_errorD[n] <= 0;
        else
             if( adc_dataD[n*10+9:n*10]==(old_adc_dataD[n*10+9:n*10]+10'd8) )
                  dtec_errorD[n]<=dtec_errorD[n];
             else
                  dtec_errorD[n]<=1;
    end
endgenerate            
//------8路数据检测结果整合-------
(*keep="true"*)wire    Rec_ErrorD;          
assign  Rec_ErrorD = | (dtec_errorD);    

//---------------------------------------
(*keep="true"*) wire Rec_Error;
assign Rec_Error = Rec_ErrorA | Rec_ErrorB | Rec_ErrorC | Rec_ErrorD;

//------------debug-------------------
reg err1;
reg err2;
always@(posedge gclk10m_buf)
begin
    err1 <= Rec_Error;
    err2 <= err1;
end
assign error = err2;
///////////////////////////////////////////////////////////////////////////////////////////////        

localparam DetectSynWordsNum = 16'hc000; //49152

(*keep="true"*)    reg        detectOK        ;    
(*keep="true"*)    reg[15:0]  rec_cnt         ; 
(*keep="true"*)    reg[15:0]  delay_cnt       ;
//(*keep="true"*)    reg[8:0]   first_win       ;
//(*keep="true"*)    reg[8:0]   end_win         ;
//(*keep="true"*)    reg        first_win_v     ;
//(*keep="true"*)    reg        end_win_v       ;
(*keep="true"*)    reg[9:0]   sum_win_idx     ;
(*keep="true"*)    reg        win_ok          ;

//-------------state machine------------
//(*keep="true"*)reg [4:0] seek_win_state ;
    localparam IDEL                     = 5'd0 ;
    localparam INIT_CLKMODE_SET_PARA    = 5'd1 ;
    localparam INIT_CLKMODE_WAIT_PARA      = 5'd2 ;
    localparam INIT_AD_CONF_DELAY       = 5'd3 ; 
    localparam INIT_DVALUE_SET_PARA       = 5'd4 ;
    localparam INIT_DVALUE_WAIT_PARA    = 5'd5 ;
    localparam INIT_DVALUE_DELAY        = 5'd6;
    localparam INIT_DVALUE_OVER            = 5'd7;
    localparam INIT_SERDES_DELAY        = 5'd8; 
    localparam INIT_SERDES_DELAY_OP     = 5'd9; //--wait for serdes--    
    localparam DETECT                   = 5'd10;
    localparam DETECTOVER               = 5'd11;
    localparam SETCLKIDELAY             = 5'd12;
    localparam SETCLKIDELAYWAIT          = 5'd13;  
    localparam SETCLKIDELAY_D           = 5'd14;
    localparam SETCLKIDELAYOVER         = 5'd15; 
// localparam WAIT_OTHER_CHANNEL        = 5'd16;
     localparam AD_RESET                = 5'd17;
     localparam AD_DELAY                = 5'd18;
     localparam LOCKED_DELAY            = 5'd19;
     localparam SERDES_DELAY            = 5'd20;
     localparam NORMAL_OP                = 5'd21;


always@(posedge gclk10m_buf or posedge rst)
if(rst)  //系统复位结束，参考时钟锁定，IOdelay正常
    begin 
        seek_win_state  <=IDEL;
        RST_fun;  
    end
else
    case(seek_win_state)
    IDEL:begin   
                if(~gclk_sd_locked)    //ADR LOCKED
                    begin  
                        seek_win_state  <=IDEL;  
                        RST_fun;      
                    end
                if(win_ok==1'b0)       //seek win not over
                    begin 
                        seek_win_state  <=INIT_CLKMODE_SET_PARA;
                        IDEL_fun;     //IOdelay end reset,AD configure reset , data receive reset
                    end
         end
    INIT_CLKMODE_SET_PARA:
                   begin 
                       seek_win_state  <=INIT_CLKMODE_WAIT_PARA;
                       INIT_CLKMODE_SET_PARA_fun;  //AD配置复位无效，开始配置AD芯片,AD芯片设为测试模式 
                   end
    INIT_CLKMODE_WAIT_PARA:
                   begin 
                       seek_win_state  <=INIT_AD_CONF_DELAY;
                       INIT_CLKMODE_WAIT_PARA_fun;
                   end
     INIT_AD_CONF_DELAY:
                    begin 
                       if(adc_ready) //延时等待256个10M时钟周期 等待AD配置完成，接收数据模块复位完成
                           begin
                           seek_win_state  <=INIT_DVALUE_SET_PARA;
                           end
                       else
                           begin
                           seek_win_state  <=INIT_AD_CONF_DELAY;
                           end
                   end                 
    INIT_DVALUE_SET_PARA:
                   begin 
                       INIT_DVALUE_SET_PARA_fun; //IOdelay 复位 
                       seek_win_state  <=INIT_DVALUE_WAIT_PARA;
                       end
    INIT_DVALUE_WAIT_PARA:
                   begin 
                       INIT_DVALUE_WAIT_PARA_fun; //IOdelay 复位结束
                       seek_win_state  <=INIT_DVALUE_DELAY;
                   end
    INIT_DVALUE_DELAY:
                   begin 
                       if(delay_cnt>16'd512) //延时等待512个10M时钟周期 ,接收数据模块复位完成
                           begin
                           delay_cnt       <=0; 
                           seek_win_state  <=INIT_DVALUE_OVER;
                           end
                       else
                           begin
                           delay_cnt       <=delay_cnt+1; 
                           seek_win_state  <=INIT_DVALUE_DELAY;
                           end
                   end                 
       INIT_DVALUE_OVER:
                   begin 
                       if(~gclk_sd_locked)  //延时等待IOdelay复位完成
                           begin
                              seek_win_state  <=INIT_DVALUE_OVER;
                           end
                       else
                           begin
                           seek_win_state  <=INIT_SERDES_DELAY;
                           end                       
                   end 
     INIT_SERDES_DELAY:
                if(delay_cnt<16'd16) 
                           begin
                           delay_cnt       <=delay_cnt+1; 
                           seek_win_state  <=INIT_SERDES_DELAY;
                           end
                  else
                            begin
                           delay_cnt       <=0; 
                           seek_win_state  <=DETECT;
                           stop_detect_err <=1;    //stop detect data error
                           rec_cnt<=0;
                           detectOK<=1'b1;
                           end 
    DETECT:
            if(delay_cnt<16'd2)  // why????
               begin
                   delay_cnt       <=delay_cnt+1; 
                   seek_win_state  <=DETECT;
               end
           else
               begin 
                    auto_seek_rst   <=0;  //ensure don't reset IOdelay          
                    if( (rec_cnt<DetectSynWordsNum) &&  (detectOK==1'b1) )
                         begin
                              //start detect data error  
                              if(  ~Rec_Error   )
                                    begin   
                                        rec_cnt<=rec_cnt+1; 
                                        detectOK<=detectOK; 
                                        stop_detect_err <=0;  
                                    end
                              else
                                    begin   
                                        rec_cnt<=0; 
                                        detectOK<=1'b0; 
                                        stop_detect_err <=1; 
                                    end
                              seek_win_state  <=  DETECT ;
                         end
                    else
                         case ({detectOK,first_win_v,end_win_v})
                              3'b000:
                                         if(CNTVALUEIN==9'h1ff)  //fail next clk_mode_idx
                                              begin    
                                                seek_win_state  <=  IDEL ; 
                                                CNTVALUEIN<=0;  
                                              end
                                         else
                                             begin
                                                  CNTVALUEIN     <=  CNTVALUEIN+1 ;
                                                  seek_win_state  <=  INIT_DVALUE_SET_PARA ;
                                             end
                              3'b010: 
                                         begin
                                              CNTVALUEIN     <=  CNTVALUEIN+1 ;
                                              seek_win_state  <=  DETECTOVER ;
                                              end_win         <=  CNTVALUEIN-9'h1 ;
                                              end_win_v       <=  1'b1;
                                         end                    
                              3'b100:if(CNTVALUEIN==9'h1ff)
                                            begin
                                                  seek_win_state  <=  DETECTOVER ;
                                                  first_win       <=  CNTVALUEIN;
                                                  first_win_v     <=  1'b1;
                                                  end_win         <=  CNTVALUEIN;
                                                  end_win_v       <=  1'b1;
                                            end
                                        else
                                            begin
                                                  CNTVALUEIN     <=  CNTVALUEIN+1 ;
                                                  seek_win_state  <=  INIT_DVALUE_SET_PARA ;
                                                  first_win       <=  CNTVALUEIN;
                                                  first_win_v     <=  1'b1;
                                            end
                              3'b110:if(CNTVALUEIN==9'h1ff)
                                              begin
                                              seek_win_state  <=  DETECTOVER ;
                                              end_win         <=  CNTVALUEIN;
                                              end_win_v       <=  1'b1;
                                              end
                                         else
                                             begin
                                                  CNTVALUEIN     <=  CNTVALUEIN+1 ;
                                                  seek_win_state  <=  INIT_DVALUE_SET_PARA ;
                                             end
                              default://error
                                         begin
                                              seek_win_state  <=  IDEL ;
                                              RST_fun;
                                         end
                        endcase

               end
    DETECTOVER:
                   begin
                    seek_win_state  <=SETCLKIDELAY;
                    sum_win_idx     <=  ({1'b0,end_win} + {1'b0,first_win}) ;
                    rec_cnt         <=0;
                    delay_cnt       <=0;
                end
    SETCLKIDELAY     :
                   begin 
                        SETCLKIDELAY_fun;  //得到CNTVALUEIN的值，并进行IOdelay的复位
                        seek_win_state  <=SETCLKIDELAYWAIT; 
                    end 
    SETCLKIDELAYWAIT :
                       begin 
                        SETCLKIDELAYWAIT_fun;  //IOdelay复位结束，重新加载CNTVALUEIN的值
                        seek_win_state  <=SETCLKIDELAY_D;
                    end 
    SETCLKIDELAY_D   :
                  if(delay_cnt<16'd512) //延时保证IOdelay正常工作,ADC采到的数据也已调整正常
                           begin
                           delay_cnt       <=delay_cnt+1; 
                           seek_win_state  <=SETCLKIDELAY_D;
                           end
                       else
                           begin
                           delay_cnt       <=0; 
                           seek_win_state  <=SETCLKIDELAYOVER;
                           end
    SETCLKIDELAYOVER :
                   begin 
                        if(~gclk_sd_locked)
                           begin
                              seek_win_state  <=SETCLKIDELAYOVER;
                           end
                       else
                           begin
                              seek_win_state  <=INIT_SERDES_DELAY_OP;    
                           end                       
                   end 
     INIT_SERDES_DELAY_OP:
                    if(delay_cnt<16'd16) 
                           begin
                           delay_cnt       <=delay_cnt+1; 
                           seek_win_state  <=INIT_SERDES_DELAY_OP;
                           end
                       else
                           begin
                           delay_cnt       <=0; 
                           seek_win_state  <=AD_RESET;
                        win_ok          <=1;
                           end 
     AD_RESET:
                    begin
                        work_mode       <=1'b1;
                        if(delay_cnt<16'd10 ) //4个通道均已经正常
                            begin
                                seek_win_state <= AD_RESET;
                                auto_spi_rstn   <=0;
                                delay_cnt       <=delay_cnt+1; 
                            end
                        else
                            begin
                                seek_win_state <= AD_DELAY;
                                auto_spi_rstn   <=1;
                                delay_cnt       <=0;
                            end
                    end
     //--------调好后还要加上等待AD重新配置完成状态 IODELAY复位状态 复位结束状态 等待状态---
     AD_DELAY:
                   begin 
                       if(adc_ready) //延时等待AD配置完成，接收数据模块复位完成
                           begin
                           seek_win_state  <=LOCKED_DELAY;
                           end
                       else
                           begin 
                           seek_win_state  <=AD_DELAY;
                           end
                   auto_spi_rstn   <=1;
                   end                 
       LOCKED_DELAY:
                   begin 
                        if(~gclk_sd_locked)
                           begin
                           seek_win_state  <=LOCKED_DELAY;
                           end
                       else
                           begin
                           seek_win_state  <=SERDES_DELAY;
                           end                       
                   end 
        SERDES_DELAY:
                   begin 
                       if(delay_cnt>16'd16) //等待IESRDES已经调整完毕
                           begin
                           seek_win_state  <=NORMAL_OP;
                           delay_cnt<=0;
                           end
                       else
                           begin
                           delay_cnt       <=delay_cnt+1; 
                           seek_win_state  <=SERDES_DELAY;
                           end
                   end              
     //------------------------------------
    NORMAL_OP:
                if(delay_cnt<16'd2)
                    begin
                      delay_cnt <= delay_cnt+1; //进入正常工作状态
                    end
                else                           
                    begin 
                      NORMAL_OP_fun;  
                    end  
    default:
        begin
            seek_win_state  <=IDEL;
            RST_fun;
        end
    endcase
//    
//////////////////////////
//:NORMAL_OP_fun
//////////////////////////
    task NORMAL_OP_fun;
        begin 
              auto_seek_rst   <=0;
              CNTVALUEIN      <=CNTVALUEIN;
              
              win_ok_all      <=1; 
              stop_detect_err <=0; // 正常工作模式仍然检测测试数据的正确性，调好后再改为1
              delay_cnt       <=delay_cnt;             
              auto_spi_rstn   <=1; 
//              adc_ddrrst      <=0;
              work_mode       <= work_mode;  
        end    
    endtask     
//////////////////////////
//0:RST_function
//////////////////////////
    task RST_fun;
        begin 
              auto_seek_rst   <=1; //   IOdelay 复位
              CNTVALUEIN      <= 9'd0; 
              win_ok_all      <=0;
              win_ok          <=0;
              stop_detect_err <=1;
              delay_cnt       <=0;
              
              auto_spi_rstn   <=0; //   AD配置模块复位
              work_mode       <=1'b1;   //0: normalwork      1:test mode 
//              adc_ddrrst      <=1; //   接收数据模块复位
              
              rec_cnt         <=0;       
              first_win       <=0;       
              end_win         <=0;       
              first_win_v     <=0;     
              end_win_v       <=0;     
              sum_win_idx     <=0;     
              detectOK        <=0;
//            clk_mode_idx    <=3'd0;
//            clk_ctrl        <=2'd0;   //0: 270度     1:180度    2:90度   3:0度
    
        end    
    endtask     

//////////////////////////
//0:IDEL_function
//////////////////////////
    task IDEL_fun;
        begin
              auto_seek_rst   <=0;   //IOdelay 结束复位
              CNTVALUEIN      <=9'd0;
              win_ok_all      <=0;
              win_ok          <=0;
              stop_detect_err <=1;
//              clk_mode_idx    <=clk_mode_idx;
              delay_cnt       <=0;
              
              auto_spi_rstn   <=0;   //AD配置模块复位
              work_mode       <=0;   //0: normalwork      1:test mode
//              clk_ctrl        <=clk_ctrl;    //0: 270度     1:180度    2:90度   3:0度
//              adc_ddrrst      <=0;   //接收数据复位无效
              
              rec_cnt         <=0;       
              first_win       <=0;       
              end_win         <=0;       
              first_win_v     <=0;     
              end_win_v       <=0;     
              sum_win_idx     <=0;     
              detectOK        <=0;
        end    
    endtask            
//////////////////////////
//1:INIT_CLKMODE_SET_PARA function
//////////////////////////
    task INIT_CLKMODE_SET_PARA_fun;
        begin        
              auto_seek_rst   <=0;
              CNTVALUEIN      <=CNTVALUEIN;
              win_ok_all      <=0;
//              clk_mode_idx    <=clk_mode_idx;
              win_ok          <=0;
              stop_detect_err <=1;
              delay_cnt       <=0;
              
              auto_spi_rstn   <=1;      //AD配置复位无效，开始配置AD芯片
              work_mode       <=1'b1;   //0: normalwork      1:test 
//              clk_ctrl        <=2'd0;   ////0: 270度     1:180度    2:90度   3:0度
//              adc_ddrrst      <=0;
        end    
    endtask    

//////////////////////////
//2:INIT_CLKMODE_WAIT_PARA_fun function
//////////////////////////
    task INIT_CLKMODE_WAIT_PARA_fun;
        begin        
              auto_seek_rst   <=0;    
              CNTVALUEIN      <=CNTVALUEIN;
              win_ok_all      <=0;
//              clk_mode_idx    <=clk_mode_idx;
              win_ok          <=0;
              stop_detect_err <=1;
              delay_cnt       <=0;
              
              auto_spi_rstn   <=1;
//              adc_ddrrst      <=0;
              work_mode       <=1'b1;  
              
              rec_cnt         <=0;       
              first_win       <=0;       
              end_win         <=0;       
              first_win_v     <=0;     
              end_win_v       <=0;      
              sum_win_idx     <=0;     
              detectOK        <=1;   //进入测试模式，可以开始测试
                            
        end    
    endtask    

//////////////////////////
//3:INIT_DVALUE_SET_PARA_fun function
//////////////////////////
    task INIT_DVALUE_SET_PARA_fun;
        begin        
              auto_seek_rst   <=1;              //IOdelay 复位
              CNTVALUEIN      <=CNTVALUEIN;
              win_ok_all      <=0;
//              clk_mode_idx    <=clk_mode_idx;
              win_ok          <=0;
              stop_detect_err <=1;
              delay_cnt       <=0;
              
              auto_spi_rstn   <=1;
              work_mode       <=work_mode;    
//              clk_ctrl        <=clk_ctrl;   //5: delay 4/26T     6:ahead 7/26T    7:ahead  4/26T
//              adc_ddrrst      <=0;
              
              rec_cnt         <=0;       
              first_win       <=first_win;       
              end_win         <=end_win;       
              first_win_v     <=first_win_v;     
              end_win_v       <=end_win_v;     
              sum_win_idx     <=0;     
              detectOK        <=1;
        end    
    endtask    

//////////////////////////
//4:INIT_DVALUE_WAIT_PARA_fun function
//////////////////////////
    task INIT_DVALUE_WAIT_PARA_fun;
        begin        
              auto_seek_rst   <=0;      //结束IOdelay的复位,重新加载了CNTVALUEIN的值
              CNTVALUEIN      <=CNTVALUEIN;
               win_ok_all      <=0;
//              clk_mode_idx    <=clk_mode_idx;
              win_ok          <=0;
              stop_detect_err <=1;
              delay_cnt       <=0;
              
              auto_spi_rstn   <=1;
              work_mode       <=work_mode;   
//              clk_ctrl        <=clk_ctrl;   //5: delay 4/26T     6:ahead 7/26T    7:ahead  4/26T
//              adc_ddrrst      <=0;
              
              //rec_cnt         <=0;       
              first_win       <=first_win;       
              end_win         <=end_win;       
              first_win_v     <=first_win_v;     
              end_win_v       <=end_win_v;     
              //sum_win_idx     <=0;     
              detectOK        <=1;
        end    
    endtask    
//////////////////////////
//5: SETCLKIDELAY function
//////////////////////////
    task SETCLKIDELAY_fun;
        begin        
              auto_seek_rst   <=1;                //set iodelay CNTVALUEIN
              CNTVALUEIN      <=sum_win_idx[9:1]; //除以2
              win_ok_all      <=0;
//              clk_mode_idx    <=clk_mode_idx;
              win_ok          <=0;
              stop_detect_err <=1;
              delay_cnt       <=0;
              
              auto_spi_rstn   <=1;
              work_mode       <=work_mode;   //0: normalwork      1:0s             2:1s             3:55/AA            4:INC 
//              clk_ctrl        <=clk_ctrl;   //5: delay 4/26T     6:ahead 7/26T    7:ahead  4/26T
//              adc_ddrrst      <=0;
              
              rec_cnt         <=0;       
              first_win       <=first_win;       
              end_win         <=end_win;       
              first_win_v     <=first_win_v;     
              end_win_v       <=end_win_v;     
              sum_win_idx     <=sum_win_idx;     
              detectOK        <=detectOK;
        end    
    endtask

//////////////////////////
//6: SETCLKIDELAYWAIT function
//////////////////////////
    task SETCLKIDELAYWAIT_fun;
        begin        
              auto_seek_rst   <=0;      //finish set iodelay CNTVALUEIN
              CNTVALUEIN      <=CNTVALUEIN;
              win_ok_all      <=0;
//              clk_mode_idx    <=clk_mode_idx;
              win_ok          <=0;
              stop_detect_err <=1;
              delay_cnt       <=0;
              
              auto_spi_rstn   <=1;
              work_mode       <=work_mode;   //0: normalwork      1:0s             2:1s             3:55/AA            4:INC 
//              clk_ctrl        <=clk_ctrl;   //5: delay 4/26T     6:ahead 7/26T    7:ahead  4/26T
//              adc_ddrrst      <=0;
              
              rec_cnt         <=0;       
              first_win       <=first_win;       
              end_win         <=end_win;       
              first_win_v     <=first_win_v;     
              end_win_v       <=end_win_v;     
              sum_win_idx     <=sum_win_idx;     
              detectOK        <=detectOK;
        end    
    endtask    

//wire [4:0] list;
//assign  list = seek_win_state_a & seek_win_state_b &seek_win_state_c;
//assign test_sign=detectOK & first_win_v & end_win_v & win_ok & seek_over;//list[0]&list[1]&list[2]&list[3]&list[4];    
 
endmodule
