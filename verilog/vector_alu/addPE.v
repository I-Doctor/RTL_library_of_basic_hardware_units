`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/13 23:15:49
// Design Name: 
// Module Name: addPE
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


module addPE(
    input clk,
    input ctrl,
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
    
    wire [31:0] add_out0;
    wire [31:0] add_out1;
    wire [31:0] add_out2;
    wire [31:0] add_out3;
    wire [31:0] add_out4;
    wire [31:0] add_out5;
    wire [31:0] add_out6;
    wire [31:0] add_out7;

    fp32adder add0(clk,A0,B0,add_out0);
    fp32adder add1(clk,A1,B1,add_out1);
    fp32adder add2(clk,A2,B2,add_out2);
    fp32adder add3(clk,A3,B3,add_out3);
    fp32adder add4(clk,A4,B4,add_out4);
    fp32adder add5(clk,A5,B5,add_out5);
    fp32adder add6(clk,A6,B6,add_out6);
    fp32adder add7(clk,A7,B7,add_out7);
    
    wire [31:0] adda_out0;
    wire [31:0] adda_out1;
    wire [31:0] adda_out2;
    wire [31:0] adda_out3;
    wire [31:0] adda_out4;
    wire [31:0] adda_out5;
    wire [31:0] adda_out6;
    wire [31:0] adda_out7;
    
    fp32adder adda0(clk,A0,scalar,adda_out0);
    fp32adder adda1(clk,A1,scalar,adda_out1);
    fp32adder adda2(clk,A2,scalar,adda_out2);
    fp32adder adda3(clk,A3,scalar,adda_out3);
    fp32adder adda4(clk,A4,scalar,adda_out4);
    fp32adder adda5(clk,A5,scalar,adda_out5);
    fp32adder adda6(clk,A6,scalar,adda_out6);
    fp32adder adda7(clk,A7,scalar,adda_out7);
    
    always@(posedge clk)
    begin if(ctrl==1'b0)
    begin
        out0<=add_out0;
        out1<=add_out1;
        out2<=add_out2;
        out3<=add_out3;
        out4<=add_out4;
        out5<=add_out5;
        out6<=add_out6;
        out7<=add_out7;
    end
    else
    begin
        out0<=adda_out0;
        out1<=adda_out1;
        out2<=adda_out2;
        out3<=adda_out3;
        out4<=adda_out4;
        out5<=adda_out5;
        out6<=adda_out6;
        out7<=adda_out7;
    end
end
    
endmodule
