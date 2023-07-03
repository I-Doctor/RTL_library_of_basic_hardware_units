`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/5/25
// Design Name: mac_tree
// Module Name: mac_tree
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 两个8元素的向量，每个元素是32位浮点数。首先进行8个乘法，然后8个结果分别累加，输出进入8位加法树，并行合并后最终的一个结果进入输出累加器。
// 
//////////////////////////////////////////////////////////////////////////////////


module mac_tree#(parameter VEC_LEN=8
)(
    input clk,
    input rst,
    input [32*VEC_LEN-1:0] A,
    input [32*VEC_LEN-1:0] B,
    output [31:0] out
    );

    genvar i,j;

    // Multipliers
    wire [32*VEC_LEN-1:0] mul_out;
    generate
        for (i = 0; i < VEC_LEN; i = i + 1) begin: mul
            fp32mul mul0(clk,A[i*32+31:i*32],B[i*32+31:i*32],mul_out[i*32+31:i*32]);
        end
    endgenerate

    //Adder tree
    wire [31:0] adder_tree_out;

    generate
        for (i = 0; i < clog2(VEC_LEN); i = i + 1) begin: adder_tree_layer
            wire [32*(1<<(clog2(VEC_LEN)-i))-1:0] adder_tree_layer_in;
            wire [32*(1<<(clog2(VEC_LEN)-i-1))-1:0] adder_tree_layer_out;
            for (j = 0; j < (1<<(clog2(VEC_LEN)-i-1)); j = j + 1) begin: adders
                fp32adder adder(clk,adder_tree_layer_in[j*32*2+31:j*32*2],adder_tree_layer_in[j*32*2+63:j*32*2+32],adder_tree_layer_out[j*32+31:j*32]);
            end
        end
    endgenerate

    //Connect adder tree
    assign adder_tree_layer[0].adder_tree_layer_in = mul_out;

    generate
        for (i = 0; i < clog2(VEC_LEN)-1; i = i + 1) begin
            assign adder_tree_layer[i+1].adder_tree_layer_in = adder_tree_layer[i].adder_tree_layer_out;
        end
    endgenerate

    assign adder_tree_out = adder_tree_layer[clog2(VEC_LEN)-1].adder_tree_layer_out;

    //Final accumulator
    fp32acc acc(clk,rst,adder_tree_out,out);




function integer clog2;
    input integer value;
          integer temp;
    begin
        temp = value - 1;
        for (clog2 = 0; temp > 0; clog2 = clog2 + 1) begin
            temp = temp >> 1;
        end
    end
endfunction


endmodule
