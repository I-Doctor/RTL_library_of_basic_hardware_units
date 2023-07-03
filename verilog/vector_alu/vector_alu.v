`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/13 22:43:11
// Design Name: 
// Module Name: vectorPE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vector_alu#(parameter ELE_NUM = 8
)(
    input clk,
    input rst,
    input [1:0]ctrl,
    input [32*ELE_NUM-1:0] A,
    input [32*ELE_NUM-1:0] B,
    input [32*ELE_NUM-1:0] C,
    output wire [32*ELE_NUM-1:0] D
    );

    // mode1:add
    wire [32*ELE_NUM-1:0] add_out;
    genvar i;
    generate
        for(i=0;i<ELE_NUM;i=i+1)begin:ADD
            fp32adder adder(clk,A[32*i+31:32*i],B[32*i+31:32*i],add_out[32*i+31:32*i]);
        end
    endgenerate

    reg [32*ELE_NUM-1:0]add_out_reg;
    always @(posedge clk or posedge rst)begin
        if(rst)begin
            add_out_reg <= 0;
        end
        else begin
            add_out_reg <= add_out;
        end
    end

    // mode2:mul
    wire [32*ELE_NUM-1:0] mul_out;
    generate
        for(i=0;i<ELE_NUM;i=i+1)begin:MUL
            fp32mul mul(clk,A[32*i+31:32*i],B[32*i+31:32*i],mul_out[32*i+31:32*i]);
        end
    endgenerate

    reg [32*ELE_NUM-1:0]mul_out_reg;
    always @(posedge clk or posedge rst)begin
        if(rst)begin
            mul_out_reg <= 0;
        end
        else begin
            mul_out_reg <= mul_out;
        end
    end

    //mode3:mul_add
    wire [32*ELE_NUM-1:0] mul_add_out;
    generate
        for(i=0;i<ELE_NUM;i=i+1)begin:MUL_ADD
            fp32adder adder(clk,mul_out[32*i+31:32*i],C[32*i+31:32*i],mul_add_out[32*i+31:32*i]);
        end
    endgenerate

    //choose output and use the right ctrl
    reg [2*2-1:0]ctrl_reg;
    always @(posedge clk or posedge rst)begin
        if(rst)begin
            ctrl_reg <= 0;
        end
        else begin
            ctrl_reg[1:0] <= ctrl;
            ctrl_reg[3:1] <= ctrl_reg[2:0];
        end
    end

    assign D = (ctrl_reg[1:0]==2'b00)?add_out_reg:
               (ctrl_reg[1:0]==2'b01)?mul_out_reg:
               (ctrl_reg[1:0]==2'b10)?mul_add_out:0;
    

endmodule
