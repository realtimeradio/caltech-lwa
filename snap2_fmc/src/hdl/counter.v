`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2020 04:43:08 AM
// Design Name: 
// Module Name: counter
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


module counter(
    input wire rst,
    input wire clk,
    input wire trig,
    output reg [31:0] count_out
    );
    
    reg [31:0] ctr = 32'b0;
    
    always @(posedge clk) begin
        if (rst) begin
            ctr <= 32'b0;
        end else begin
            ctr <= ctr + 1'b1;
        end
    end
    
    // won't meet timing
    always @(posedge trig) begin
       count_out <= ctr;
    end
endmodule
