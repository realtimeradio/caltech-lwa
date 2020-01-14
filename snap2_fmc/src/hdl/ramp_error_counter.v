`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2020 02:59:17 AM
// Design Name: 
// Module Name: ramp_error_counter
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


module ramp_error_counter(
    input wire clk,
    input wire rst,
    input wire [80-1:0] din,
    output reg [64-1:0] err_out,
    output reg [64-1:0] ok_out
    );
    
    reg [80-1:0] dinR;   
    
    // Register the last data value to check for counting
    always @(posedge clk) begin
        dinR <= din;
    end
    
    // Add 8 to previous values for comparison
    wire [8-1:0] serial_ok;
    genvar i;
    for (i=0; i<8; i=i+1) begin: wordnum
        assign serial_ok[i] = (din[10*(i+1) - 1: 10*i] == (dinR[10*(i+1) - 1: 10*i] + 10'd8));
    end
    // compare parallel words
    wire [7-1:0] parallel_ok;
    for (i=0; i<8-1; i=i+1) begin: wordnum1
        assign parallel_ok[i] = (din[10*(i+2) - 1: 10*(i+1)] == (din[10*(i+1) - 1: 10*i] + 10'd1));
    end
        
    always @(posedge clk) begin
        if (rst) begin
            err_out <= 64'b0;
            ok_out <= 64'b0;
        end else begin
            if ((serial_ok != 8'b11111111) && (parallel_ok != 7'b1111111)) begin
                err_out <= err_out + 1'b1;
            end else begin
                ok_out <= ok_out + 1'b1;
            end
        end
    end
endmodule

