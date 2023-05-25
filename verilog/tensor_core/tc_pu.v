`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Orgnization: NICSEFC
// Engineer: Jun Liu
// 
// Create Date: 20230525
// Module Name: tc_pu
// Description: 
// 
// Version 0.1: File created.
// 
//////////////////////////////////////////////////////////////////////////////////


module tc_pu
#(parameter N_UNIT = 4, N_MUL = 4,
  parameter DW_MUL = 8, DW_ADD = 32,

  parameter DW_UNIT_IN = DW_MUL * N_MUL)
(
  input                                 clk,
  input                                 reset,
  input                                 enable,
  input signed [DW_UNIT_IN-1:0]         in_a,
  input signed [N_UNIT*DW_UNIT_IN-1:0]  in_b,
  input [1:0]                           in_valid,
  output signed [N_UNIT*DW_ADD-1:0]     out
);

  genvar i;
  generate
    for (i=0; i<N_UNIT; i=i+1) begin: tc_pe_u
      tc_pe #(
        .N_MUL      (N_MUL),
        .DW_MUL     (DW_MUL),
        .DW_ADD     (DW_ADD)
      )
      tc_pe_inst(
        .clk        (clk),
        .reset      (reset),
        .enable     (enable),
        .in_a       (in_a),
        .in_b       (in_b[DW_UNIT_IN*i+:DW_UNIT_IN]),
        .in_valid   (in_valid),
        .out        (out[DW_ADD*i+:DW_ADD])
      );
    end
  endgenerate

endmodule