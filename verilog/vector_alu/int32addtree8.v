`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/10 20:09:16
// Design Name: 
// Module Name: int32addtree8
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


module int32addtree8(
    input clk,
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    input [31:0] in4,
    input [31:0] in5,
    input [31:0] in6,
    input [31:0] in7,
    output [31:0] out
    );
    
    wire [31:0] l1 [0:3];
    wire [31:0] l2 [0:1];
    
    int32adder add1(clk,in0,in1,l1[0][31:0]);
    int32adder add2(clk,in2,in3,l1[1][31:0]);
    int32adder add3(clk,in4,in5,l1[2][31:0]);
    int32adder add4(clk,in6,in7,l1[3][31:0]);
    
    int32adder add5(clk,l1[0][31:0],l1[1][31:0],l2[0][31:0]);
    int32adder add6(clk,l1[2][31:0],l1[3][31:0],l2[1][31:0]);
    
    int32adder add7(clk,l2[0][31:0],l2[1][31:0],out);

endmodule
