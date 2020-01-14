`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:59 04/24/2014 
// Design Name: 
// Module Name:    data_process 
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
module data_process
#(
     parameter DATA_FORMAT = "SIGNED",
	 parameter SERDES_RATIO = 8
 )
   (
		rst,
		clk_div_a, //156.25M
		clk10m,
		dataA,
		dataB,
		dataC,
		dataD,
		//----OUTPUT----
		dataA_out,
		dataB_out,
		dataC_out,
		dataD_out,
		flag
    );
	 
	 input  rst; //active high
	 input  clk10m;
	 input  clk_div_a;
	 input  [79:0] dataA;
	 input  [79:0] dataB;
	 input  [79:0] dataC;
	 input  [79:0] dataD;
//-------------------for debug---------------
	 output  flag;
	 output  [79:0] dataA_out;
	 output  [79:0] dataB_out;
	 output  [79:0] dataC_out;
	 output  [79:0] dataD_out;
	 
///////////////////transform data format////////////////////
	 
(*keep="true"*)	reg [79:0] dataA_signed;
(*keep="true"*)	reg [79:0] dataB_signed;
(*keep="true"*)	reg [79:0] dataC_signed;
(*keep="true"*)	reg [79:0] dataD_signed;
	
	genvar i;
 //------------channel A-----------	 
   generate if(DATA_FORMAT == "SIGNED")
     for(i=0;i<SERDES_RATIO;i=i+1)
       begin : format_A
			  always @(posedge clk_div_a)
				 begin
					 dataA_signed[(i+1)*10-1:i*10] <= dataA[(i+1)*10-1:i*10]-10'sd512;
				 end
       end
   else //don't change
     always @(posedge clk_div_a)
       begin
					 dataA_signed	<= dataA;
       end
   endgenerate	 
//------------channel B-----------	 
   generate if(DATA_FORMAT == "SIGNED")
     for(i=0;i<SERDES_RATIO;i=i+1)
       begin : format_B
			  always @(posedge clk_div_a)
				 begin
					 dataB_signed[(i+1)*10-1:i*10] <= dataB[(i+1)*10-1:i*10]-10'sd512;
				 end
       end
   else //don't change
     always @(posedge clk_div_a)
       begin
					 dataB_signed	<= dataB;
       end
   endgenerate	 
//------------channel C-----------	 
   generate if(DATA_FORMAT == "SIGNED")
     for(i=0;i<SERDES_RATIO;i=i+1)
       begin : format_C
			  always @(posedge clk_div_a)
				 begin
					 dataC_signed[(i+1)*10-1:i*10] <= dataC[(i+1)*10-1:i*10]-10'sd512;
				 end
       end
   else //don't change
     always @(posedge clk_div_a)
       begin
					 dataC_signed	<= dataC;
       end
   endgenerate	 	
//------------channel D-----------	 
   generate if(DATA_FORMAT == "SIGNED")
     for(i=0;i<SERDES_RATIO;i=i+1)
       begin : format_D
			  always @(posedge clk_div_a)
				 begin
					 dataD_signed[(i+1)*10-1:i*10] <= dataD[(i+1)*10-1:i*10]-10'sd512;
				 end
       end
   else //don't change
     always @(posedge clk_div_a)
       begin
					 dataD_signed	<= dataD;
       end
   endgenerate	 		
	
///////////////////register/////////////////////////
(*keep="true"*)	reg [79:0] dataA_reg;
(*keep="true"*)   reg [79:0] dataB_reg;
(*keep="true"*)	reg [79:0] dataC_reg;
(*keep="true"*)	reg [79:0] dataD_reg; 
	always@(posedge clk_div_a)
	begin
		dataA_reg <= dataA_signed;
		dataB_reg <= dataB_signed;
	   dataC_reg <= dataC_signed;
	   dataD_reg <= dataD_signed;
	end
	
(*keep="true"*)	reg [79:0] dataA_reg1;
(*keep="true"*)   reg [79:0] dataB_reg1;
(*keep="true"*)	reg [79:0] dataC_reg1;
(*keep="true"*)	reg [79:0] dataD_reg1; 
	always@(posedge clk_div_a)
	begin
		dataA_reg1 <= dataA_reg;
		dataB_reg1 <= dataB_reg;
	   dataC_reg1 <= dataC_reg;
	   dataD_reg1 <= dataD_reg;
	end

//-----------data valid---------
//reg rst_r1;
//reg rst_r2;
//reg rst_r3;
//always@(posedge clk_div_a)
//begin
//    rst_r1 <= rst;
//    rst_r2 <= rst_r1;
//    rst_r3 <= rst_r2;
//end

reg valid;
always@(posedge clk10m or posedge rst)
	if(rst)
		valid <= 1'b0;
	else
		valid <= 1'b1;
		
reg valid1;
reg valid2;
reg valid3;
reg valid4;
always@(posedge clk10m)
begin
	valid1 <= valid;
	valid2 <= valid1;
	valid3 <= valid2;
	valid4 <= valid3;
end


//data output order: A C B D
//------------------just for debug------------------
	assign  dataA_out = dataA_reg1;
	assign  dataB_out = dataB_reg1;
	assign  dataC_out = dataC_reg1;
	assign  dataD_out = dataD_reg1;
	assign  flag = valid4;
//-------------------end----------------------------

endmodule
