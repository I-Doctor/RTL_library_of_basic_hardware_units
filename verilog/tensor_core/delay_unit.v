`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Orgnization: NICSEFC
// Engineer: Jun Liu
// 
// Create Date: 20230525
// Module Name: delay_unit
// Description: 
// 
// Version 0.1: File created.
// 
//////////////////////////////////////////////////////////////////////////////////


module delay_unit
#(parameter DW_DATA = 32,
  parameter W_SHIFT = 5,
  parameter DW_INT  = 32)
(
  input                   clk,
  input                   reset,
  input                   enable,
  input [DW_DATA-1:0]     in,
  output                  out_valid,
  output [DW_DATA-1:0]    out
);

  integer i;

  reg [DW_DATA-1:0] fifo_data [W_SHIFT-1:0];
  reg               fifo_flag [W_SHIFT-1:0];
  reg signed [DW_INT-1:0]  cnt;

  assign out = fifo_data[0];
  assign out_valid = fifo_flag[0];

  always @(posedge reset or posedge clk) begin
    if (reset) begin : init_block
      for (i=0; i<W_SHIFT; i=i+1) begin
        fifo_data[i] <= 0;
        fifo_flag[i] <= 0;
        cnt <= 0;
      end
    end
    else begin
      if (cnt > 0) begin
        cnt <= cnt - 1;
        for (i=0; i<W_SHIFT-1; i=i+1) begin
          fifo_data[i] <= fifo_data[i+1];
          fifo_flag[i] <= fifo_flag[i+1];
        end
      end
      if (enable) begin
        fifo_data[W_SHIFT-1] <= in;
        fifo_flag[W_SHIFT-1] <= 1'b1;
        cnt <= cnt + 1;
      end
      else begin
        fifo_data[W_SHIFT-1] <= 0;
        fifo_flag[W_SHIFT-1] <= 1'b0;
      end
    end
  end

endmodule