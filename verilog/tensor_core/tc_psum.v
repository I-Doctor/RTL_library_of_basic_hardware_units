`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Orgnization: NICSEFC
// Engineer: Jun Liu
// 
// Create Date: 20230525
// Module Name: tc_psum
// Description: accumulate the partial sum
// 
// Version 0.1: File created.
// 
//////////////////////////////////////////////////////////////////////////////////



module tc_psum
#(parameter M = 16, K = 16, N = 16,
  parameter M_TILE = 4, K_TILE = 4, N_TILE = 4,
  parameter DW_ADD = 32,
  parameter DW_INT = 32,

  parameter DW_IN = DW_ADD * M_TILE * N_TILE,
  parameter DW_OUT = DW_ADD * N     // 每次一行输出
)
(
  input                           clk,
  input                           reset,
  input                           enable,
  input [DW_INT-1:0]              ptr_row, ptr_col,
  input signed [DW_IN-1:0]        in,
  input                           in_add_valid,
  output reg signed [DW_OUT-1:0]  out,
  // 00: idle, 01: valid, 10: none, 11: finish
  output reg [1:0]                out_flag
);

  integer iter_m = $ceil(M/M_TILE);
  integer iter_k = $ceil(K/K_TILE);
  integer iter_n = $ceil(N/N_TILE);

  integer i, j;

  /*--------- global buffer ---------*/
  reg signed [DW_ADD-1:0] global_buffer [M*N-1:0];
  reg [DW_INT-1:0]        cnt_col;
  reg [DW_INT-1:0]        row_done, row_cur;

  always @(posedge reset or posedge clk) begin
    if (reset) begin : init_block
      // top
      out <= 0;
      out_flag <= 0;
      // buffer
      for (i=0; i<M*N; i=i+1) begin
        global_buffer[i] <= 0;
      end
      cnt_col <= 0;
      row_done <= 0;
      row_cur <= 0;
    end
    else begin
      if (enable) begin
        // input computing
        if (in_add_valid) begin : execute_block
          // accumulate
          for (i=0; i<M_TILE; i=i+1) begin
            for (j=0; j<N_TILE; j=j+1) begin
              global_buffer[(ptr_row*M_TILE+i)*N+(ptr_col*N_TILE+j)] <= in[DW_ADD*(i*N_TILE+j)+:DW_ADD] + global_buffer[(ptr_row*M_TILE+i)*N+(ptr_col*N_TILE+j)];
            end
          end
        end

        // change row_done
        if (ptr_col == (iter_n - 1)) begin
          cnt_col <= cnt_col + 1;
        
          if (cnt_col == iter_k-1) begin
            cnt_col <= 0;
            row_done <= row_done + M_TILE;
          end
        end

        // output partical matrix
        if (row_cur < row_done) begin
          for (i=0; i<N; i=i+1) begin
            out[DW_ADD*i+:DW_ADD] <= global_buffer[row_cur*N+i];
          end
          row_cur <= row_cur + 1;
          out_flag <= 2'b01;
        end
        else begin
          if (row_done == M) begin
            out_flag <= 2'b11;
            row_done <= 0;
            row_cur <= 0;
          end
          else begin
            out_flag <= 2'b00;
          end
        end
      end
    end
  end



endmodule