`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 15:30:32
// Design Name: 
// Module Name: scale
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


module scale(
    input clk,
    input [19:0] in,
    input [1:0] sig,
    input [7:0] exp,
    output reg [31:0] out
    );
    
    wire [31:0]num;
    
    assign num[31]=in[19];
    
    wire [21:0]temp1;
    assign temp1[21:0]={in[18:0],{3{1'b0}}};
    
    reg [21:0]temp2;
    
    always@(*)
    begin
        if (sig==2'b00)
        begin
            temp2={22{1'b0}};
        end
        else if(sig==2'b01)
        begin
            temp2={1'b0,in[18:0],{2{1'b0}}};
        end
        else if(sig==2'b11)
        begin
            temp2={{3{1'b0}},in[18:0]};
        end
    end
    
    assign num[30:23]=exp[7:0];
    assign num[22:0]=temp1[21:0]+temp2[21:0];
    
    always@(posedge clk)
    begin
        out<=num;
    end    
endmodule
