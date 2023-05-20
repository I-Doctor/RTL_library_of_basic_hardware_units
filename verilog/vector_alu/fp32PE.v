`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/10 22:59:56
// Design Name: 
// Module Name: fp32PE
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


module fp32PE(
    input clk,
    input rst,
    input [31:0] A0,input [31:0] B0,
    input [31:0] A1,input [31:0] B1,
    input [31:0] A2,input [31:0] B2,
    input [31:0] A3,input [31:0] B3,
    input [31:0] A4,input [31:0] B4,
    input [31:0] A5,input [31:0] B5,
    input [31:0] A6,input [31:0] B6,
    input [31:0] A7,input [31:0] B7,
    output [31:0] out
    );
    
    wire [31:0] mul_out0;
    wire [31:0] mul_out1;
    wire [31:0] mul_out2;
    wire [31:0] mul_out3;
    wire [31:0] mul_out4;
    wire [31:0] mul_out5;
    wire [31:0] mul_out6;
    wire [31:0] mul_out7;
    
    wire [31:0] acc_out10;
    wire [31:0] acc_out11;
    wire [31:0] acc_out12;
    wire [31:0] acc_out13;
    wire [31:0] acc_out14;
    wire [31:0] acc_out15;
    wire [31:0] acc_out16;
    wire [31:0] acc_out17;
    
    wire [31:0] tree_out;
    
    fp32mul mul0(clk,A0,B0,mul_out0);
    fp32mul mul1(clk,A1,B1,mul_out1);
    fp32mul mul2(clk,A2,B2,mul_out2);
    fp32mul mul3(clk,A3,B3,mul_out3);
    fp32mul mul4(clk,A4,B4,mul_out4);
    fp32mul mul5(clk,A5,B5,mul_out5);
    fp32mul mul6(clk,A6,B6,mul_out6);
    fp32mul mul7(clk,A7,B7,mul_out7);
    
    fp32acc acc10(clk,rst,mul_out0,acc_out10);
    fp32acc acc11(clk,rst,mul_out1,acc_out11);
    fp32acc acc12(clk,rst,mul_out2,acc_out12);
    fp32acc acc13(clk,rst,mul_out3,acc_out13);
    fp32acc acc14(clk,rst,mul_out4,acc_out14);
    fp32acc acc15(clk,rst,mul_out5,acc_out15);
    fp32acc acc16(clk,rst,mul_out6,acc_out16);
    fp32acc acc17(clk,rst,mul_out7,acc_out17);
    
    fp32addtree8 tree(clk,acc_out10,acc_out11,acc_out12,acc_out13,acc_out14,acc_out15,acc_out16,acc_out17,tree_out);
    
    fp32acc acc20(clk,rst,tree_out,out);
endmodule
