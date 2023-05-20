`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 10:25:34
// Design Name: 
// Module Name: fp8mul
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


module fp8mul(
    input clk,
    input [8:0] ain,
	input [8:0] bin,
	output reg[31:0] out
);

    wire [31:0]num;

    wire a_sign; 	
    wire b_sign; 	
    wire [5-1:0] a_exponent; 	
    reg  [4-1:0] a_mantissa; 	
    wire [5-1:0] b_exponent; 	
    reg  [4-1:0] b_mantissa; 	
    wire [6-1:0] c_exponent; 	
    wire [8-1:0] c_mantissa; 	
    
    
    // FP MUL get a
	assign a_sign = ain[8];
	assign a_exponent[5-1:0] = ain[7:3];
    always @ (*) begin
        if (a_exponent == 0) begin
             a_mantissa[4-1:0] <= {1'b0, ain[3-1:0]};
        end else begin
             a_mantissa[4-1:0] <= {1'b1, ain[3-1:0]};
        end
    end

	// FP MUL get b
	assign b_sign = bin[8];
	assign b_exponent[5-1:0] = bin[7:3];
    always @ (*) begin
        if (b_exponent == 0) begin
             b_mantissa[4-1:0] <= {1'b0, bin[3-1:0]};
        end else begin
             b_mantissa[4-1:0] <= {1'b1, bin[3-1:0]};
        end
    end

    //
    wire o_sign;
    //wire [9-1:0] o_mantissa;
    //wire [7-1:0] o_exponent;	
    assign o_sign = a_sign ^~ b_sign;
    assign c_mantissa = a_mantissa * b_mantissa; 			     
    assign c_exponent = a_exponent + b_exponent;
    //assign o_mantissa = { c_mantissa, 1'b0 };
    //assign o_exponent = { 1'b0, c_exponent };

    reg [8-1:0] o_man;     
    reg [6-1:0] o_exp;
    
    always @(*) begin
        if(c_mantissa[8-1] == 1) begin
            o_exp = c_exponent + 1;
            o_man = c_mantissa;
        end else if ((c_mantissa[8-1] != 1) && (c_exponent != 0)) begin
            if (c_mantissa[8-1:3] == 5'b00001) begin
                o_exp = c_exponent - 3;
                o_man = c_mantissa << 4;
            end else if (c_mantissa[8-1:4] == 4'b0001) begin
                o_exp = c_exponent - 2;
                o_man = c_mantissa << 3;
            end else if (c_mantissa[8-1:5] == 3'b001) begin
                o_exp = c_exponent - 1;
                o_man = c_mantissa << 2;
            end else begin
                o_exp = c_exponent;
                o_man = c_mantissa << 1;
            end 
        end else begin
            o_exp = c_exponent;
            o_man = c_mantissa << 1;
        end
    end

    wire [23-1:0] o_m;
    wire [8-1:0]  o_e;
    assign o_m = { o_man[7-1:0], {16{1'b0}} };
    assign o_e = {  2'b00,      o_exp };

	assign num = {o_sign, o_e, o_m };
	
	always@(posedge clk)
	begin
	   out<=num;
	end

endmodule
