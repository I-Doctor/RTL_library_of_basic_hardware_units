`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 15:26:05
// Design Name: 
// Module Name: o2adder
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


module o2adder(
  input clk,
  input rst_n,
  input  [31:0] ain, 
  input  [31:0] bin,
  output reg [31:0] aout,
  output reg [31:0] bout,
  input ctrl
  );

  wire [31:0] c;

  fp32adder add(ain,bin,c);

  always @ (posedge clk or negedge rst_n) begin
    if(~rst_n)begin
      aout <= 0;
      bout <= 0;
    end else if (ctrl) begin
      aout <= c;
      bout <= c;
    end else begin
      aout <= ain;
      bout <= bin;
    end
  end
  
endmodule