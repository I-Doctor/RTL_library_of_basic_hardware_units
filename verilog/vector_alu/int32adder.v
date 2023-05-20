`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/12 10:08:08
// Design Name: 
// Module Name: int32adder
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


module int32adder(
    input clk,
    input [31:0] in1,
    input [31:0] in2,
    output reg [31:0] out
    );
    
    wire [31:0]c;
        
        assign c=in1+in2;
        
        always @ (posedge clk)
            begin                                
               out <= c;    
            end         
    
endmodule
