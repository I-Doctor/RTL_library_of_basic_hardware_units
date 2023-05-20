`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/10 21:45:27
// Design Name: 
// Module Name: fp32mul
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


module fp32mul(
  input clk,
  input  [31:0] a, 
  input  [31:0] b,
  output reg [31:0] out
  );
  
  wire [31:0] num;
  
  reg  [7:0] i_e;
  reg  [47:0] i_m;
  wire [7:0] o_e;
  wire [47:0] o_m;
      
  multiplication_normaliser mn(i_e,i_m,o_e,o_m);

  reg a_sign;
  reg [7:0] a_exponent;
  reg [23:0] a_mantissa;
  reg b_sign;
  reg [7:0] b_exponent;
  reg [23:0] b_mantissa;

  reg o_sign;
  reg [7:0] o_exponent;
  reg [22:0] o_mantissa;

	reg [47:0] product;

  assign num[31] = o_sign;
  assign num[30:23] = o_exponent;
  assign num[22:0] = o_mantissa[22:0];

  always @ ( * ) begin
		a_sign = a[31];
		if(a[30:23] == 0) begin
			a_exponent = 8'b00000001;
			a_mantissa = {1'b0, a[22:0]};
		end else begin
			a_exponent = a[30:23];
			a_mantissa = {1'b1, a[22:0]};
		end
		b_sign = b[31];
		if(b[30:23] == 0) begin
			b_exponent = 8'b00000001;
			b_mantissa = {1'b0, b[22:0]};
		end else begin
			b_exponent = b[30:23];
			b_mantissa = {1'b1, b[22:0]};
		end
    o_sign = a_sign ^ b_sign;
    o_exponent = a_exponent + b_exponent - 127;
    product = a_mantissa * b_mantissa;
		// Normalization
    if(product[47] == 1) begin
              o_exponent = o_exponent + 1;
              product = product >> 1;
    end 
    else begin
          i_e = o_exponent;
          i_m = product;
          o_exponent = o_e;
          product = o_m;
        end
            o_mantissa = product[45:23];        //46±»Ê¡ÂÔ
        end
        
   always @ (posedge clk) 
   begin				
            out <= num;	
    end	 

endmodule