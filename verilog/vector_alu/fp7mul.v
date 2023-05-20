`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 15:13:55
// Design Name: 
// Module Name: fp7mul
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


module fp7mul(
    input clk,
    input [7-1:0]   ain,
	input [7-1:0]   bin,
	output reg [15-1:0] out
);

    wire [14:0]num;

    wire a_sign; 	
    wire b_sign;
    wire c_sign; 	
    wire [2-1:0]  a_exponent; 	
    reg  [5-1:0]  a_mantissa; 	
    wire [2-1:0]  b_exponent; 	
    reg  [5-1:0]  b_mantissa; 	
    wire [10-1:0] c_mantissa; 	
    wire [3-1:0]  c_exponent; 	
    reg  [11-1:0] cc_mantissa; 	
    
    
    // FP MUL get a
	assign a_sign = ain[6];
	assign a_exponent[1:0] = ain[5:4];
    always @ (*) begin
        if (a_exponent == 0) begin
             a_mantissa[4:0] <= {1'b0, ain[3:0]};
        end else begin
             a_mantissa[4:0] <= {1'b1, ain[3:0]};
        end
    end

	// FP MUL get b
	assign b_sign = bin[6];
	assign b_exponent[1:0] = bin[5:4];
    always @ (*) begin
        if (b_exponent == 0) begin
             b_mantissa[4:0] <= {1'b0, bin[3:0]};
        end else begin
             b_mantissa[4:0] <= {1'b1, bin[3:0]};
        end
    end

	// FP MUL get signed cc
    assign c_mantissa = a_mantissa * b_mantissa; 			
    assign c_exponent = a_exponent + b_exponent;
	assign c_sign = a_sign ^~ b_sign;
    always @ (*) begin
        if(c_sign)
            cc_mantissa = (~({1'b0, c_mantissa}) + 1);
	    else
		    cc_mantissa = {1'b0, c_mantissa};
    end

	assign num = cc_mantissa <<< c_exponent;
	
	always@(posedge clk)
    begin
        out<=num;
    end
endmodule

