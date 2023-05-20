`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 15:22:41
// Design Name: 
// Module Name: int1520acc
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


module int1520acc(
    input clk,
	input rst_n,
    input [14:0] in,
	output reg [19:0] out
);

   // INT ACC 	
   wire [19:0] sum; 
   assign sum = out + in;

   always @ (posedge clk) begin 		
        if (~rst_n) begin 			
            out <= 0; 		
        end else begin
            out <= sum;	
        end
    end

endmodule
