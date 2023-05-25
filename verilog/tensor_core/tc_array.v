`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Orgnization: NICSEFC
// Engineer: Jun Liu
// 
// Create Date: 20230525
// Module Name: tc_array
// Description: 
// 
// Version 0.1: File created.
// 
//////////////////////////////////////////////////////////////////////////////////


module tc_array
#(parameter N_GROUP = 4, N_UNIT = 4, N_MUL = 4,
  parameter DW_MUL = 8, DW_ADD = 32,

  parameter DW_CORE_IN_A = DW_MUL * N_MUL * N_GROUP,
  parameter DW_CORE_IN_B = DW_MUL * N_MUL * N_UNIT,
  parameter DW_CORE_OUT = DW_ADD * N_UNIT * N_GROUP,
  parameter DW_UNIT_IN = DW_MUL * N_MUL)
(
  input                               clk,
  input                               reset,
  input                               enable,
  input signed [DW_CORE_IN_A-1:0]     in_a,
  input signed [DW_CORE_IN_B-1:0]     in_b,
  input [1:0]                         in_valid,
  output signed [DW_CORE_OUT-1:0]     out
);

  genvar i;
  generate
    for (i=0; i<N_GROUP; i=i+1) begin: tc_pu_u
      tc_pu #(
        .N_UNIT       (N_UNIT),
        .N_MUL        (N_MUL),
        .DW_MUL       (DW_MUL),
        .DW_ADD       (DW_ADD)
      )
      tc_pu_inst(
        .clk          (clk),
        .reset        (reset),
        .enable       (enable),
        .in_a         (in_a[DW_UNIT_IN*i+:DW_UNIT_IN]),   // todo
        .in_b         (in_b),    // different for struct
        .in_valid     (in_valid),
        .out          (out[DW_ADD*N_UNIT*i+:DW_ADD*N_UNIT])
      );
    end
  endgenerate

endmodule