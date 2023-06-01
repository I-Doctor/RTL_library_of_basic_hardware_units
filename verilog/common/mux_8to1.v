`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Orgnization: NICSEFC
// Engineer: Jun Liu
// 
// Create Date: 20230601
// Module Name: crossbar
// Description: 
// 
// Version 0.1: File created.
// 
//////////////////////////////////////////////////////////////////////////////////



module mux_8to1
#(parameter DW_DATA = 32*4)
(
  input                             clk,
  input                             rst,
  input                             en,
  input signed [8*DW_DATA-1: 0]     in,
  input [2:0]                       sel,
  output reg signed [DW_DATA-1: 0]  out
);

wire signed [DW_DATA-1:0] in_data [7:0];
genvar gi;
generate
  for (gi=0; gi<8; gi=gi+1) begin
    assign in_data[gi] = in[gi*DW_DATA+:DW_DATA];
  end
endgenerate

always @(posedge rst or posedge clk) begin
  if (rst) begin : init_block
    out <= 0;
  end
  else if (en) begin : execute_block
    case(sel)
      3'b000: out <= in_data[0];
      3'b001: out <= in_data[1];
      3'b010: out <= in_data[2];
      3'b011: out <= in_data[3];
      3'b100: out <= in_data[4];
      3'b101: out <= in_data[5];
      3'b110: out <= in_data[6];
      3'b111: out <= in_data[7];
    endcase
  end
end

endmodule