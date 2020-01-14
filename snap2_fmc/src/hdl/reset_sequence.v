`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/06 11:40:05
// Design Name: 
// Module Name: reset_sequence
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reset_sequence(
        sys_rst_n,
        clk10m,
        iodelay_rdy,
        rst_IDELAYCTRL,
        rst_IODELAY,
        rst_SERDES,
        rst_pro       
    );
   
   input   sys_rst_n;
   input   clk10m;
   input   iodelay_rdy;
   output reg rst_IDELAYCTRL;
   output reg rst_IODELAY;
   output reg rst_SERDES;
   output reg rst_pro;
   
   reg [2:0] state;
   reg [9:0] cnt;
   
   always@(posedge clk10m or negedge sys_rst_n)
   begin
       if(~sys_rst_n)
         begin
             rst_IODELAY <= 1'b1;
             rst_SERDES  <= 1'b1;  
             rst_IDELAYCTRL <= 1'b1;
             rst_pro  <= 1'b1; 
             state    <= 3'd0;
             cnt      <= 10'd0;
         end
        else case(state)
        3'd0:
           begin
                if(cnt < 10'd100)
                    begin
                       cnt <= cnt +1; 
                       state <= 3'd0;
                    end
                else
                    begin
                       cnt <= 10'd0; 
                       state <= 3'd1;
                       rst_IODELAY <= 1'b0;
                    end   
            end
        3'd1:
            begin
               if(cnt < 10'd100)
                   begin
                       cnt <= cnt +1; 
                       state <= 3'd1;
                   end
               else
                   begin
                       cnt <= 10'd0; 
                       state <= 3'd2;
                       rst_SERDES <= 1'b0;
                   end   
             end
        3'd2:
             begin
                if(cnt < 10'd100)
                    begin
                        cnt <= cnt +1; 
                        state <= 3'd2;
                    end
                else
                    begin
                        cnt <= 10'd0; 
                        state <= 3'd3;
                        rst_IDELAYCTRL <= 1'b0;
                    end   
             end 
        3'd3:
            begin
                if(iodelay_rdy)
                    state <= 3'd4;
                else
                    state <= 3'd3;
            end        
        3'd4:
             begin
                if(cnt < 10'd100)
                    begin
                        cnt <= cnt +1; 
                        state <= 3'd4;
                    end
                else
                    begin
                        cnt <= 10'd0; 
                        state <= 3'd5;
                        rst_pro <= 1'b0;
                    end   
             end
         3'd5:
             begin
                state <= 3'd5;
             end 
         default:
             begin
                rst_IODELAY <= 1'b1;
                rst_SERDES  <= 1'b1;  
                rst_IDELAYCTRL <= 1'b1;
                rst_pro  <= 1'b1; 
                state    <= 3'd0;
                cnt      <= 10'd0;
             end
       endcase                                                  
   end
   
endmodule
