`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Orgnization: NICSEFC
// Engineer: Jun Liu
// 
// Create Date: 20230525
// Module Name: tc_pe
// Description: 
// 
// Version 0.1: File created.
// 
//////////////////////////////////////////////////////////////////////////////////

module tc_pe
#(parameter N_MUL = 8,
  parameter DW_MUL = 32, DW_ADD = 32,

  parameter DW_IN = DW_MUL * N_MUL)
(
  input                       clk,
  input                       rst,
  input signed [DW_IN-1:0]    in_a,
  input signed [DW_IN-1:0]    in_b,
  output signed [DW_ADD-1:0]  out
);

  integer i;

  reg signed [DW_ADD-1:0] reg_multiplier_o [N_MUL-1:0];
  wire [DW_ADD-1:0] reg_multi_result [N_MUL-1:0];
  wire signed [DW_MUL-1:0] in_a_wire [N_MUL-1:0];
  wire signed [DW_MUL-1:0] in_b_wire [N_MUL-1:0];
  wire signed [DW_ADD*N_MUL-1:0] multiplier_o;
  wire [N_MUL-1:0] s_axis_a_tready, s_axis_b_tready, m_axis_result_tvalid;

  genvar gi;
  generate
    for (gi=0; gi<N_MUL; gi=gi+1) begin
      assign multiplier_o[DW_ADD*gi+: DW_ADD] = reg_multiplier_o[gi];
      assign in_a_wire[gi] =  in_a[DW_ADD*gi+: DW_ADD];
      assign in_b_wire[gi] =  in_b[DW_ADD*gi+: DW_ADD];
    end
  endgenerate

  always @(posedge rst or posedge clk) begin
    if (rst) begin : init_block
      for (i=0; i<N_MUL; i=i+1) begin
        reg_multiplier_o[i] <= 0;
      end
    end
    else begin : excute_block
      for (i=0; i<N_MUL; i=i+1) begin
        // reg_multiplier_o[i] <= in_a_wire[i] * in_b_wire[i];
        reg_multiplier_o[i] <= reg_multi_result[i];
      end
    end
  end

  generate
    for (gi=0; gi<N_MUL; gi=gi+1) begin: fp32_multiplier_u
      fp32_multiplier fp32_multiplier_inst (
        .aclk(clk),                                  // input wire aclk
      //  .aresetn(aresetn),                            // input wire aresetn(active low)
        .s_axis_a_tvalid(1'b1),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(s_axis_a_tready[gi]),
        .s_axis_a_tdata(in_a_wire[gi]),              // input wire [31 : 0] s_axis_a_tdata
      
        .s_axis_b_tvalid(1'b1),            // input wire s_axis_b_tvalid
        .s_axis_b_tready(s_axis_b_tready[gi]),
        .s_axis_b_tdata(in_b_wire[gi]),              // input wire [31 : 0] s_axis_b_tdata
      
        .m_axis_result_tready(1'b1),            // input wire s_axis_c_tvalid
        .m_axis_result_tvalid(m_axis_result_tvalid[gi]),
        .m_axis_result_tdata(reg_multi_result[gi])           // input wire [31 : 0] s_axis_c_tdata
      );
    end
  endgenerate

  adder_tree_fp32 #(
    .NUM_IN(8)
  )
  adder_tree_fp32_u (
    .clk(clk),
    .rst(rst),
    .in(multiplier_o),
    .out(out)
  );

endmodule