`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 15:57:33
// Design Name: 
// Module Name: fp7PE
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


module fp7PE(
    input clk,
    input rst,
    input [6:0] A0,input [6:0] B0,
    input [6:0] A1,input [6:0] B1,
    input [6:0] A2,input [6:0] B2,
    input [6:0] A3,input [6:0] B3,
    input [6:0] A4,input [6:0] B4,
    input [6:0] A5,input [6:0] B5,
    input [6:0] A6,input [6:0] B6,
    input [6:0] A7,input [6:0] B7,
    input [1:0]sig0,input [1:0]sig1,
    input [1:0]sig2,input [1:0]sig3,
    input [1:0]sig4,input [1:0]sig5,
    input [1:0]sig6,input [1:0]sig7,
    input [7:0]exp0,input [7:0]exp1,
    input [7:0]exp2,input [7:0]exp3,
    input [7:0]exp4,input [7:0]exp5,
    input [7:0]exp6,input [7:0]exp7,
    output [31:0] out
    );
    
    wire [14:0] mul_out0;
    wire [14:0] mul_out1;
    wire [14:0] mul_out2;
    wire [14:0] mul_out3;
    wire [14:0] mul_out4;
    wire [14:0] mul_out5;
    wire [14:0] mul_out6;
    wire [14:0] mul_out7;
    
    wire [19:0] acc_out10;
    wire [19:0] acc_out11;
    wire [19:0] acc_out12;
    wire [19:0] acc_out13;
    wire [19:0] acc_out14;
    wire [19:0] acc_out15;
    wire [19:0] acc_out16;
    wire [19:0] acc_out17;
    
    wire [31:0] scale_out0;
    wire [31:0] scale_out1;
    wire [31:0] scale_out2;
    wire [31:0] scale_out3;
    wire [31:0] scale_out4;
    wire [31:0] scale_out5;
    wire [31:0] scale_out6;
    wire [31:0] scale_out7;
    
    wire [31:0] tree_out;
    
    fp7mul mul0(clk,A0,B0,mul_out0);
    fp7mul mul1(clk,A1,B1,mul_out1);
    fp7mul mul2(clk,A2,B2,mul_out2);
    fp7mul mul3(clk,A3,B3,mul_out3);
    fp7mul mul4(clk,A4,B4,mul_out4);
    fp7mul mul5(clk,A5,B5,mul_out5);
    fp7mul mul6(clk,A6,B6,mul_out6);
    fp7mul mul7(clk,A7,B7,mul_out7);
    
    int1520acc acc10(clk,rst,mul_out0,acc_out10);
    int1520acc acc11(clk,rst,mul_out1,acc_out11);
    int1520acc acc12(clk,rst,mul_out2,acc_out12);
    int1520acc acc13(clk,rst,mul_out3,acc_out13);
    int1520acc acc14(clk,rst,mul_out4,acc_out14);
    int1520acc acc15(clk,rst,mul_out5,acc_out15);
    int1520acc acc16(clk,rst,mul_out6,acc_out16);
    int1520acc acc17(clk,rst,mul_out7,acc_out17);
    
    scale sca0(clk,acc_out10,sig0,exp0,scale_out0);
    scale sca1(clk,acc_out11,sig1,exp1,scale_out1);
    scale sca2(clk,acc_out12,sig2,exp2,scale_out2);
    scale sca3(clk,acc_out13,sig3,exp3,scale_out3);
    scale sca4(clk,acc_out14,sig4,exp4,scale_out4);
    scale sca5(clk,acc_out15,sig5,exp5,scale_out5);
    scale sca6(clk,acc_out16,sig6,exp6,scale_out6);
    scale sca7(clk,acc_out17,sig7,exp7,scale_out7);
    
    
    fp32addtree8 tree(clk,scale_out0,scale_out1,scale_out2,scale_out3,scale_out4,scale_out5,scale_out6,scale_out7,tree_out);
    
    fp32acc acc20(clk,rst,tree_out,out);
    
endmodule
