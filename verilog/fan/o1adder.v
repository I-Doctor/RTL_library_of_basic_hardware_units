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
    input               clk   ,
    input               rst_n ,
    input      [32-1:0] ain   , 
    input      [32-1:0] bin   ,
    output reg [32-1:0] out   ,
    input      [3 -1:0] ctrl
);

  // combinational logic of FP32 c=ain+bin
  wire [31:0] c;
  fp32adder add(ain,bin,c);

  // select ain or bin or c=ain+bin as the only one output under the control of ctrl.
  wire [31:0] o;
  assign o = ({32{ctrl[2]}}&ain) | ({32{ctrl[1]}}&bin) | ({32{ctrl[0]}}&c);

  always @ (posedge clk or negedge rst_n) begin
      if (~rst_n) begin
          out <= 0;
      end else begin
          out <= o;
      end
  end
  
endmodule
