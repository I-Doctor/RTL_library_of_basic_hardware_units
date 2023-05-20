`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/10 20:20:29
// Design Name: 
// Module Name: int32acc
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


module int32acc(
    input clk,
    input rst_n,
    input [31:0] in,
    output reg [31:0] out
    );
    
    always @ (posedge clk) 
    begin 		                 
             if (~rst_n) begin 			
                out <= 0;         
            end else begin
                out <= out+in;
            end    
    end
endmodule
