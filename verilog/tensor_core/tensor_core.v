`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Orgnization: NICSEFC
// Engineer: Jun Liu
// 
// Create Date: 20230525
// Module Name: tensor_core
// Description: a complete tensor core
// 
// Version 0.1: File created.
// 
//////////////////////////////////////////////////////////////////////////////////



module tensor_core
#(parameter M = 16, K = 16, N = 16,
  parameter M_TILE = 4, K_TILE = 4, N_TILE = 4,
  parameter DW_MUL = 8, DW_ADD = 32, DW_INT = 32,
  parameter W_SHIFT = 5,

  parameter DW_MEM_OUT_A = DW_MUL * M_TILE * K_TILE,
  parameter DW_MEM_OUT_B = DW_MUL * K_TILE * N_TILE,
  parameter DW_MEM_IN_S = DW_ADD * N,
  parameter DW_MEM_IN_I = DW_MUL * K)
(
  /*--------- connnect to testbench ---------*/
  input                             clk,
  input                             reset,
  input                             enable,
  input signed [DW_MEM_IN_I-1:0]   	in_i,     // init memory
  // 0: A, 1: B
  input                             in_type,
  // 0: none, 1: change
  input                             in_state,

  output reg signed [DW_ADD-1:0]    out_i,    // for debug
  // 00: idle, 01: loading, 10: computing, 11: all_send
  output reg [1:0]                  out_state
);

  integer iter_m = $ceil(M/M_TILE);
  integer iter_k = $ceil(K/K_TILE);
  integer iter_n = $ceil(N/N_TILE);
  localparam DW_CORE_OUT = DW_ADD*M_TILE*N_TILE;

  integer i;
  integer mi, ki, ni;

  /*--------- connnect to core ---------*/
  reg signed [DW_MEM_OUT_A-1:0]   core_in_a;
  reg signed [DW_MEM_OUT_B-1:0]   core_in_b;
  reg [1:0]                       core_in_valid;
  wire signed [DW_CORE_OUT-1:0]   core_psum;
  /*--------- connnect to delay unit ---------*/
  wire [DW_INT-1:0]               delay_m, delay_n;

  /*--------- connnect to tc_psum ---------*/
  // todo
  wire                            add_in_valid;
  wire signed [DW_MEM_IN_S-1:0]   in_s;			// computed partical matrix
  reg [DW_INT-1:0]	              ptr_s;
  // 00: idle, 01: valid, 10: none, 11: finish
  wire [1:0]                      run_flag;
  /*--------- inside memory ---------*/
  reg [DW_INT-1:0]	              ptr_m, ptr_k, ptr_n;
  // reg [DW_INT-1:0]	              ptr_md, ptr_kd, ptr_nd;
  reg signed [DW_MUL-1:0] A_matrix [M*K-1:0];
  reg signed [DW_MUL-1:0] B_matrix [K*N-1:0];
  reg signed [DW_ADD-1:0] S_matrix [M*N-1:0];
  reg [DW_INT:0]                  ptr_a, ptr_b;

  // debug
  reg [DW_INT-1:0]                ti;


  always @(posedge reset or posedge clk) begin
    if (reset) begin : init_block
      // testbench
      out_i <= 0;
      out_state <= 2'b00;
      // module
      core_in_a <= 0;
      core_in_b <= 0;
      core_in_valid <= 0;
      ptr_s <= 0;
      // inside memory
      ptr_m <= 0;
      ptr_k <= 0;
      ptr_n <= 0;
      for (i=0; i<M*K; i=i+1) begin
        A_matrix[i] <= 0;
      end
      for (i=0; i<K*N; i=i+1) begin
        B_matrix[i] <= 0;
      end
      for (i=0; i<M*N; i=i+1) begin
        S_matrix[i] <= 0;
      end
      ptr_a <= 0;
      ptr_b <= 0;
      ti <= 0;

    end
    else begin
      if (enable) begin : execute_block
        // state: idle
        if (out_state == 2'b00) begin
          if (in_state == 1'b1) begin
            out_state <= 2'b01;
          end
        end

        // state: load initial data to memory
        if (out_state == 2'b01) begin
          if (in_state == 1'b1) begin
            out_state <= 2'b10;
            ptr_a <= 0;
            ptr_b <= 0;
          end
          else begin
            if (in_type == 1'b0) begin
              for (i=0; i<K; i=i+1) begin
                A_matrix[ptr_a*K+i] <= in_i[DW_MUL*i+:DW_MUL];
              end
              ptr_a <= ptr_a + 1;
            end
            if (in_type == 1'b1) begin
              for (i=0; i<K; i=i+1) begin
                B_matrix[ptr_b*K+i] <= in_i[DW_MUL*i+:DW_MUL];
              end
              ptr_b <= ptr_b + 1;
            end
          end
        end

        // state: computing with send data
        if (out_state == 2'b10) begin
          if (ptr_m == iter_m) begin
            out_state <= 2'b11;
            core_in_valid <= 2'b00;
            core_in_a <= 0;
            core_in_b <= 0;
          end
          else begin
            // circular order: m->k->n
            if (ptr_n < iter_n-1) begin
              ptr_n <= ptr_n + 1;
            end
            else begin
              ptr_n <= 0;
              if (ptr_k < iter_k-1) begin
                ptr_k <= ptr_k + 1;
              end
              else begin
                ptr_k <= 0;
                if (ptr_m < iter_m) begin
                  ptr_m <= ptr_m + 1;
                end
              end
            end

            // output B
            for (ni=0; ni<N_TILE; ni=ni+1) begin
              for (ki=0; ki<K_TILE; ki=ki+1) begin
                core_in_b[DW_MUL*(ni*K_TILE+ki)+:DW_MUL] <= B_matrix[(ptr_n*N_TILE+ni)*K+ptr_k*K_TILE+ki];
              end
            end
            // output A
            if (ptr_n == 0) begin
              core_in_valid = 2'b11;
              for (mi=0; mi<M_TILE; mi=mi+1) begin
                for (ki=0; ki<K_TILE; ki=ki+1) begin
                  core_in_a[DW_MUL*(mi*K_TILE+ki)+:DW_MUL] <= A_matrix[(ptr_m*M_TILE+mi)*K+ptr_k*K_TILE+ki];
                end
              end
            end
            else begin
              core_in_valid = 2'b01;
            end
          end
        end

        // state: computing without send data
        if (out_state == 2'b11) begin
          if (run_flag == 2'b11) begin
            // out_state <= 2'b00;
            // debug
            out_i <= S_matrix[ti];
            ti <= ti + 1;
          end
        end

        // task: write result to memory
        if (out_state == 2'b10 || out_state == 2'b11) begin
          if (run_flag == 2'b01) begin
            for (i=0; i<N; i=i+1) begin
              S_matrix[ptr_s*N+i] <= in_s[DW_ADD*i+:DW_ADD];
            end
            ptr_s <= ptr_s + 1;
          end
        end

      end   // end enable
    end
  end

/*--------- instance module ---------*/
tc_array #(
  .N_GROUP  (M_TILE),
  .N_UNIT   (N_TILE),
  .N_MUL    (K_TILE),
  .DW_MUL   (DW_MUL),
  .DW_ADD   (DW_ADD)
)
tc_array_u (
  .clk      (clk),
  .reset    (reset),
  .enable   (enable),
  .in_a     (core_in_a),
  .in_b     (core_in_b),
  .in_valid (core_in_valid),

  .out      (core_psum)
);

delay_unit #(
  .DW_DATA  (DW_INT + DW_INT),
  .W_SHIFT  (W_SHIFT)
)
delay_unit_u (
  .clk      (clk),
  .reset    (reset),
  .enable   (core_in_valid != 2'b00),
  .in       ({ptr_m, ptr_n}),

  .out      ({delay_m, delay_n}),
  .out_valid(add_in_valid)
);

tc_psum #(
  .M        (M),
  .K        (K),
  .N        (N),
  .M_TILE   (M_TILE),
  .K_TILE   (K_TILE),
  .N_TILE   (N_TILE),
  .DW_ADD   (DW_ADD),
  .DW_INT   (DW_INT)
)
tc_psum_u (
  .clk      (clk),
  .reset    (reset),
  .enable   (enable),
  .ptr_row  (delay_m),
  .ptr_col  (delay_n),
  .in       (core_psum),
  .in_add_valid (add_in_valid),

  .out      (in_s),
  .out_flag (run_flag)
);

endmodule