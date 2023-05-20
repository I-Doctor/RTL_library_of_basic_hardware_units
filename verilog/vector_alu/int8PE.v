`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/10 20:22:27
// Design Name: 
// Module Name: int8PE
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


module int8PE(
    input clk,
    input rst_n,
    input [7:0] A0,input [7:0] B0,
    input [7:0] A1,input [7:0] B1,
    input [7:0] A2,input [7:0] B2,
    input [7:0] A3,input [7:0] B3,
    input [7:0] A4,input [7:0] B4,
    input [7:0] A5,input [7:0] B5,
    input [7:0] A6,input [7:0] B6,
    input [7:0] A7,input [7:0] B7,
    output [31:0] out
    );
    
    wire [15:0] mul_out0;
    wire [15:0] mul_out1;
    wire [15:0] mul_out2;
    wire [15:0] mul_out3;
    wire [15:0] mul_out4;
    wire [15:0] mul_out5;
    wire [15:0] mul_out6;
    wire [15:0] mul_out7;
    
    wire [31:0] acc_out10;
    wire [31:0] acc_out11;
    wire [31:0] acc_out12;
    wire [31:0] acc_out13;
    wire [31:0] acc_out14;
    wire [31:0] acc_out15;
    wire [31:0] acc_out16;
    wire [31:0] acc_out17;
    
    wire [31:0] tree_out;
    
    int8mul mul0(clk,A0,B0,mul_out0);
    int8mul mul1(clk,A1,B1,mul_out1);
    int8mul mul2(clk,A2,B2,mul_out2);
    int8mul mul3(clk,A3,B3,mul_out3);
    int8mul mul4(clk,A4,B4,mul_out4);
    int8mul mul5(clk,A5,B5,mul_out5);
    int8mul mul6(clk,A6,B6,mul_out6);
    int8mul mul7(clk,A7,B7,mul_out7);
    
    int1632acc acc10(clk,rst_n,mul_out0,acc_out10);
    int1632acc acc11(clk,rst_n,mul_out1,acc_out11);
    int1632acc acc12(clk,rst_n,mul_out2,acc_out12);
    int1632acc acc13(clk,rst_n,mul_out3,acc_out13);
    int1632acc acc14(clk,rst_n,mul_out4,acc_out14);
    int1632acc acc15(clk,rst_n,mul_out5,acc_out15);
    int1632acc acc16(clk,rst_n,mul_out6,acc_out16);
    int1632acc acc17(clk,rst_n,mul_out7,acc_out17);
    
    int32addtree8 tree(clk,acc_out10,acc_out11,acc_out12,acc_out13,acc_out14,acc_out15,acc_out16,acc_out17,tree_out);
    
    int32acc acc20(clk,rst_n,tree_out,out);
    
endmodule
