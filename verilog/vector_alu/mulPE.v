`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/13 23:25:50
// Design Name: 
// Module Name: mulPE
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


module mulPE(
    input clk,
    input [1:0]ctrl,
    input [31:0] scalar,
    input [31:0] A0,input [31:0] B0,
    input [31:0] A1,input [31:0] B1,
    input [31:0] A2,input [31:0] B2,
    input [31:0] A3,input [31:0] B3,
    input [31:0] A4,input [31:0] B4,
    input [31:0] A5,input [31:0] B5,
    input [31:0] A6,input [31:0] B6,
    input [31:0] A7,input [31:0] B7,
    output reg[31:0] out0,
    output reg[31:0] out1,
    output reg[31:0] out2,
    output reg[31:0] out3,
    output reg[31:0] out4,
    output reg[31:0] out5,
    output reg[31:0] out6,
    output reg[31:0] out7
    );
    
    wire [31:0] mul_out0;
    wire [31:0] mul_out1;
    wire [31:0] mul_out2;
    wire [31:0] mul_out3;
    wire [31:0] mul_out4;
    wire [31:0] mul_out5;
    wire [31:0] mul_out6;
    wire [31:0] mul_out7;
    
    fp32mul mul0(clk,A0,B0,mul_out0);
    fp32mul mul1(clk,A1,B1,mul_out1);
    fp32mul mul2(clk,A2,B2,mul_out2);
    fp32mul mul3(clk,A3,B3,mul_out3);
    fp32mul mul4(clk,A4,B4,mul_out4);
    fp32mul mul5(clk,A5,B5,mul_out5);
    fp32mul mul6(clk,A6,B6,mul_out6);
    fp32mul mul7(clk,A7,B7,mul_out7);
    
    wire [31:0] mula_out0;
    wire [31:0] mula_out1;
    wire [31:0] mula_out2;
    wire [31:0] mula_out3;
    wire [31:0] mula_out4;
    wire [31:0] mula_out5;
    wire [31:0] mula_out6;
    wire [31:0] mula_out7;
    
    fp32mul mula0(clk,A0,scalar,mula_out0);
    fp32mul mula1(clk,A1,scalar,mula_out1);
    fp32mul mula2(clk,A2,scalar,mula_out2);
    fp32mul mula3(clk,A3,scalar,mula_out3);
    fp32mul mula4(clk,A4,scalar,mula_out4);
    fp32mul mula5(clk,A5,scalar,mula_out5);
    fp32mul mula6(clk,A6,scalar,mula_out6);
    fp32mul mula7(clk,A7,scalar,mula_out7);
    
    wire [31:0] square_out0;
    wire [31:0] square_out1;
    wire [31:0] square_out2;
    wire [31:0] square_out3;
    wire [31:0] square_out4;
    wire [31:0] square_out5;
    wire [31:0] square_out6;
    wire [31:0] square_out7;
    
    fp32mul square0(clk,A0,A0,square_out0);
    fp32mul square1(clk,A1,A1,square_out1);
    fp32mul square2(clk,A2,A2,square_out2);
    fp32mul square3(clk,A3,A3,square_out3);
    fp32mul square4(clk,A4,A4,square_out4);
    fp32mul square5(clk,A5,A5,square_out5);
    fp32mul square6(clk,A6,A6,square_out6);
    fp32mul square7(clk,A7,A7,square_out7);
    
    always@(posedge clk)
    begin
    if (ctrl==2'b00)
    begin
        out0<=mul_out0;
        out1<=mul_out1;
        out2<=mul_out2;
        out3<=mul_out3;
        out4<=mul_out4;
        out5<=mul_out5;
        out6<=mul_out6;
        out7<=mul_out7;
    end
    else if(ctrl==2'b01)
    begin
        out0<=mula_out0;
        out1<=mula_out1;
        out2<=mula_out2;
        out3<=mula_out3;
        out4<=mula_out4;
        out5<=mula_out5;
        out6<=mula_out6;
        out7<=mula_out7;
    end
    else
    begin
        out0<=square_out0;
        out1<=square_out1;
        out2<=square_out2;
        out3<=square_out3;
        out4<=square_out4;
        out5<=square_out5;
        out6<=square_out6;
        out7<=square_out7;
    end
end  
    
endmodule
