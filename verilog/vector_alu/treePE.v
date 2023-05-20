`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/13 23:44:25
// Design Name: 
// Module Name: treePE
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


module treePE(
    input clk,
    input rst,
    input [31:0] A0,
    input [31:0] A1,
    input [31:0] A2,
    input [31:0] A3,
    input [31:0] A4,
    input [31:0] A5,
    input [31:0] A6,
    input [31:0] A7,
    output [31:0] out
    );
    
    wire [31:0]tree_out;
    
    fp32addtree8 tree(clk,A0,A1,A2,A3,A4,A5,A6,A7,tree_out);
    
    fp32acc acc(clk,rst,tree_out,out);
    
endmodule
