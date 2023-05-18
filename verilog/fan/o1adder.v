`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 15:26:05
// Design Name: 
// Module Name: o1adder
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


module o1adder(
  input clk,
  input rst_n,
  input  [31:0] ain, 
  input  [31:0] bin,
  output reg [31:0] out,
  input  [2 :0] ctrl
  );

  wire [31:0] c;
  fp32adder add(ain,bin,c);

  wire [31:0] o;
  assign o = ({32{ctrl[2]}}&ain) | ({32{ctrl[1]}}&bin) | ({32{ctrl[0]}}&c);

  always @ (posedge clk or negedge rst_n) begin
    if(~rst_n)begin
      out <= 0;
    end else begin
      out <= o;
    end
  end
  
endmodule