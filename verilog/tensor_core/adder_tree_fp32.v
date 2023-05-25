`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Orgnization: NICSEFC
// Engineer: Jun Liu
// 
// Create Date: 20230525
// Module Name: adder_tree_fp32
// Description: 
// 
// Version 0.1: File created.
// 
//////////////////////////////////////////////////////////////////////////////////



module adder_tree_fp32
#(parameter NUM_IN = 8,

  parameter DW_DATA = 32,
  parameter DW_IN = NUM_IN * DW_DATA)
(
  input                         clk,
  input                         rst,
  input signed [DW_IN-1:0]      in,
  output signed [DW_DATA-1:0]   out
);

  localparam NUM_ADDER = NUM_IN - 1;
  localparam ADDER_IN_BEG = (NUM_IN/2) - 1;
  integer i;
  genvar gi;

  wire signed [DW_DATA-1:0] wire_adder_in [NUM_IN-1:0];
  reg signed [DW_DATA-1:0]  reg_adder_o   [NUM_ADDER-1:0];
  wire [DW_DATA-1:0] wire_add_result [NUM_ADDER-1:0];
  wire [NUM_ADDER-1:0] s_axis_a_tready, s_axis_b_tready, m_axis_result_tvalid;

  assign out = reg_adder_o[0];
  generate
    for (gi=0; gi<NUM_IN; gi=gi+1) begin
      assign wire_adder_in[gi] = in[DW_DATA*gi+: DW_DATA];
    end
  endgenerate

  always @(posedge rst or posedge clk) begin
    if (rst) begin : init_block
      for (i=0; i<NUM_ADDER; i=i+1) begin
        reg_adder_o[i]  <= 0;
      end
    end
    else begin : calc_block
      // adder tree for input level
      for (i=0; i<NUM_IN/2; i=i+1) begin
        // reg_adder_o[i+ADDER_IN_BEG] <= wire_adder_in[2*i] + wire_adder_in[2*i+1];
        reg_adder_o[i+ADDER_IN_BEG] <= wire_add_result[i+ADDER_IN_BEG];
      end
      // adder tree for other level
      for (i=0; i<ADDER_IN_BEG; i=i+1) begin
        // reg_adder_o[i] <= reg_adder_o[2*i+1] + reg_adder_o[2*i+2];
        reg_adder_o[i] <= wire_add_result[i];
      end
    end
  end

  generate
    for (gi=0; gi<NUM_IN/2; gi=gi+1) begin: fp32_adder_0_u
      fp32_adder fp32_adder_inst (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(1'b1),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(s_axis_a_tready[gi+ADDER_IN_BEG]),            // output wire s_axis_a_tready
        .s_axis_a_tdata(wire_adder_in[2*gi]),              // input wire [31 : 0] s_axis_a_tdata
        .s_axis_b_tvalid(1'b1),            // input wire s_axis_b_tvalid
        .s_axis_b_tready(s_axis_b_tready[gi+ADDER_IN_BEG]),            // output wire s_axis_b_tready
        .s_axis_b_tdata(wire_adder_in[2*gi+1]),              // input wire [31 : 0] s_axis_b_tdata
        .m_axis_result_tvalid(m_axis_result_tvalid[gi+ADDER_IN_BEG]),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(1'b1),  // input wire m_axis_result_tready
        .m_axis_result_tdata(wire_add_result[gi+ADDER_IN_BEG])    // output wire [31 : 0] m_axis_result_tdata
      );
    end
    for (gi=0; gi<ADDER_IN_BEG; gi=gi+1) begin: fp32_adder_1_u
      fp32_adder fp32_adder_inst (
        .aclk(clk),                                  // input wire aclk
        .s_axis_a_tvalid(1'b1),            // input wire s_axis_a_tvalid
        .s_axis_a_tready(s_axis_a_tready[gi]),            // output wire s_axis_a_tready
        .s_axis_a_tdata(reg_adder_o[2*gi+1]),              // input wire [31 : 0] s_axis_a_tdata
        .s_axis_b_tvalid(1'b1),            // input wire s_axis_b_tvalid
        .s_axis_b_tready(s_axis_b_tready[gi]),            // output wire s_axis_b_tready
        .s_axis_b_tdata(reg_adder_o[2*gi+2]),              // input wire [31 : 0] s_axis_b_tdata
        .m_axis_result_tvalid(m_axis_result_tvalid[gi]),  // output wire m_axis_result_tvalid
        .m_axis_result_tready(1'b1),  // input wire m_axis_result_tready
        .m_axis_result_tdata(wire_add_result[gi])    // output wire [31 : 0] m_axis_result_tdata
      );
    end
  endgenerate

endmodule