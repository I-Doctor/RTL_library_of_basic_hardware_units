`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/10 19:02:13
// Design Name: 
// Module Name: int1632acc
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


module int1632acc(
    input clk,
    input rst_n,
    input [15:0] in,
    output reg [31:0] out
    );
    
    wire [31:0] c;
    assign c={16'b0,in[15:0]};
    
    always @ (posedge clk)
    begin 		                  
             if (~rst_n) begin 			
                out <= 31'b0;         
            end else begin                         
                out<=out+ c;
            end  
    end     
        
    
endmodule
