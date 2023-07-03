`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Orgnization: CCC
// Engineer: Hao Xia
// 
// Create Date: 20230703
// Module Name: crossbar
// Description: n-to-n distribute network, support multicast
// 
// Version 0.1: File created.
// 
//////////////////////////////////////////////////////////////////////////////////


module crossbar #(
    parameter N       = 8,
    parameter DW_DATA = 32
) (
    input                      clk,
    input                      rst,
    input      [N*DW_DATA-1:0] in,
    input       [N*DW_IDX-1:0] idx, // the corresponding output position of each input
    output reg [N*DW_DATA-1:0] out
);

    reg  [DW_DATA-1:0] reg_in   [N-1:0][N-1:0][1:0];
    wire [DW_DATA-1:0] wire_out [N-1:0][N-1:0][1:0];
    reg                reg_ctrl [N-1:0][N-1:0];
    wire [DW_IDX-1:0]  wire_idx [N-1:0];
    integer i, j;
    genvar gi, gj;

    generate
        for (gi=0; gi<N; gi=gi+1) begin
            assign wire_idx[gi] = idx[gi*DW_IDX +: DW_IDX];
        end
    endgenerate

    always @(posedge clk) begin
        for (i=0; i<N; i=i+1) begin
            for (j=0; j<N; j=j+1) begin
                if (i == wire_idx[j])
                    reg_ctrl[i][j] = 1;
                else 
                    reg_ctrl[i][j] = 0;
            end
        end
    end

    // set connection
    always @(*) begin
        //up-left corner
        reg_in[0][0][0] <= in[0 +:DW_DATA];
        reg_in[0][0][1] <= 0;
        //left edge
        for (i=1; i<N; i=i+1) begin
            reg_in[i][0][0] <= in[i*DW_DATA +:DW_DATA];
            reg_in[i][0][1] <= wire_out[i-1][0][1];
        end
        // up edge
        for (j=1; j<N; j=j+1) begin
            reg_in[0][j][0] <= wire_out[0][j-1][0];
            reg_in[0][j][1] <= 0;
        end
        // left
        for (i=1; i<N; i=i+1) begin
            for (j=1; j<N; j=j+1) begin
                reg_in[i][j][1] <= wire_out[i-1][j][1]; // up-down
                reg_in[i][j][0] <= wire_out[i][j-1][0]; // left-right
            end
        end
        // output at down edge
        for (j=0; j<N; j=j+1) begin
            out[j*DW_DATA +:DW_DATA] <= wire_out[N-1][j][1];
        end
    end

    generate
        for (gi=0; gi<N; gi=gi+1) begin: gen_row
            for (gj=0; gj<N; gj=gj+1) begin: gen_sw
                crossbar_switch #(
                    .DW_DATA(DW_DATA)
                ) x_sw_u (
                    .clk    (clk),
                    .rst    (rst),
                    .ctrl   (reg_ctrl[gi][gj]),
                    .in     ({reg_in[gi][gj][1], reg_in[gi][gj][0]}),
                    .out    ({wire_out[gi][gj][1], wire_out[gi][gj][0]})
                );
            end
        end
    endgenerate

endmodule

module crossbar_switch #(
    parameter DW_DATA = 8
) (
    input                      clk,
    input                      rst,
    input                      ctrl,
    input      [2*DW_DATA-1:0] in, // 0 is left input, 1 is up input
    output reg [2*DW_DATA-1:0] out // 0 is right output, 1 is down output
);

    always @(*) begin 
        if (rst) begin
            out <= 0;
        end
        else if (ctrl) begin
            out <= {in[0 +:DW_DATA], in[0 +:DW_DATA]};
        end
        else begin
            out <= in;
        end
    end

endmodule