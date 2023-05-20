`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 15:24:50
// Design Name: 
// Module Name: fp32acc
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


module fp32acc(
    input clk,
	input rst_n,
    input [31:0] in,
	output reg [31:0] out
);
    wire [31:0] sum;

   // fp ACC 	 
   fp32adder adder(clk,in,out,sum);
   
   always @ (posedge clk)
     begin
     if (~rst_n) begin             
           out <= 0;         
     end else begin                         
           out <= sum;    
     end  
   end       

endmodule


