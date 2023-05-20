`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/10 18:49:06
// Design Name: 
// Module Name: int8mul
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


module int8mul(
    input clk,
    input [7:0] in1, 
    input [7:0] in2,
    output reg [15:0] out
    );
    
    wire [15:0]c;
    
    assign c=in1*in2;
    
    always @ (posedge clk)
        begin                                             
             out <= c;    
        end     
    
    
endmodule
