`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/13 22:43:11
// Design Name: 
// Module Name: vectorPE
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


module vectorPE(
    input clk,
    input rst,
    input [2:0]ctrl,
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
    
    wire [31:0] mul_acc_out0;
    wire [31:0] mul_acc_out1;
    wire [31:0] mul_acc_out2;
    wire [31:0] mul_acc_out3;
    wire [31:0] mul_acc_out4;
    wire [31:0] mul_acc_out5;
    wire [31:0] mul_acc_out6;
    wire [31:0] mul_acc_out7;
    
    fp32mul mul0(clk,A0,B0,mul_out0);
    fp32mul mul1(clk,A1,B1,mul_out1);
    fp32mul mul2(clk,A2,B2,mul_out2);
    fp32mul mul3(clk,A3,B3,mul_out3);
    fp32mul mul4(clk,A4,B4,mul_out4);
    fp32mul mul5(clk,A5,B5,mul_out5);
    fp32mul mul6(clk,A6,B6,mul_out6);
    fp32mul mul7(clk,A7,B7,mul_out7);
    
    fp32acc mul_acc0(clk,rst,mul_out0,mul_acc_out0);
    fp32acc mul_acc1(clk,rst,mul_out1,mul_acc_out1);
    fp32acc mul_acc2(clk,rst,mul_out2,mul_acc_out2);
    fp32acc mul_acc3(clk,rst,mul_out3,mul_acc_out3);
    fp32acc mul_acc4(clk,rst,mul_out4,mul_acc_out4);
    fp32acc mul_acc5(clk,rst,mul_out5,mul_acc_out5);
    fp32acc mul_acc6(clk,rst,mul_out6,mul_acc_out6);
    fp32acc mul_acc7(clk,rst,mul_out7,mul_acc_out7);
    
    wire [31:0] add_out0;
    wire [31:0] add_out1;
    wire [31:0] add_out2;
    wire [31:0] add_out3;
    wire [31:0] add_out4;
    wire [31:0] add_out5;
    wire [31:0] add_out6;
    wire [31:0] add_out7;

    
    fp32adder add0()
    
    always@(*)
    begin 
    if(ctrl==3'b000)
    begin
        
    
    
    
endmodule
