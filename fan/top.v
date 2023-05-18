`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/13 19:36:20
// Design Name: 
// Module Name: top
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

module top(
    input clk,
    input rst_n,
    // input data
    input [31:0] fA0,
    input [31:0] fA1,
    input [31:0] fA2,
    input [31:0] fA3,
    input [31:0] fA4,
    input [31:0] fA5,
    input [31:0] fA6,
    input [31:0] fA7,
    input [31:0] fA8,
    input [31:0] fA9,
    input [31:0] fA10,
    input [31:0] fA11,
    input [31:0] fA12,
    input [31:0] fA13,
    input [31:0] fA14,
    input [31:0] fA15,
    input [31:0] fA16,
    input [31:0] fA17,
    input [31:0] fA18,
    input [31:0] fA19,
    input [31:0] fA20,
    input [31:0] fA21,
    input [31:0] fA22,
    input [31:0] fA23,
    input [31:0] fA24,
    input [31:0] fA25,
    input [31:0] fA26,
    input [31:0] fA27,
    input [31:0] fA28,
    input [31:0] fA29,
    input [31:0] fA30,
    input [31:0] fA31,
    // control of adder
    input [30: 0] ctrl_adder,
    // control of level 2 mux 
    input [15: 0] ctrl_2_mux,
    // control of level 3 mux 
    input [11: 0] ctrl_3_mux,
    // control of level 4 mux 
    input [7 : 0] ctrl_4_mux,
    // output
    output [31:0] fO0,
    output [31:0] fO1,
    output [31:0] fO2,
    output [31:0] fO3,
    output [31:0] fO4,
    output [31:0] fO5,
    output [31:0] fO6,
    output [31:0] fO7,
    output [31:0] fO8,
    output [31:0] fO9,
    output [31:0] fO10,
    output [31:0] fO11,
    output [31:0] fO12,
    output [31:0] fO13,
    output [31:0] fO14,
    output [31:0] faO15,
    output [31:0] fbO15,
    output [31:0] fO16,
    output [31:0] fO17,
    output [31:0] fO18,
    output [31:0] fO19,
    output [31:0] fO20,
    output [31:0] fO21,
    output [31:0] fO22,
    output [31:0] fO23,
    output [31:0] fO24,
    output [31:0] fO25,
    output [31:0] fO26,
    output [31:0] fO27,
    output [31:0] fO28,
    output [31:0] fO29,
    output [31:0] fO30,
    output [31:0] fO31,

    // input data
    input [31:0] rA0,
    input [31:0] rA1,
    input [31:0] rA2,
    input [31:0] rA3,
    input [31:0] rA4,
    input [31:0] rA5,
    input [31:0] rA6,
    input [31:0] rA7,
    input [31:0] rA8,
    input [31:0] rA9,
    input [31:0] rA10,
    input [31:0] rA11,
    input [31:0] rA12,
    input [31:0] rA13,
    input [31:0] rA14,
    input [31:0] rA15,
    input [31:0] rA16,
    input [31:0] rA17,
    input [31:0] rA18,
    input [31:0] rA19,
    input [31:0] rA20,
    input [31:0] rA21,
    input [31:0] rA22,
    input [31:0] rA23,
    input [31:0] rA24,
    input [31:0] rA25,
    input [31:0] rA26,
    input [31:0] rA27,
    input [31:0] rA28,
    input [31:0] rA29,
    input [31:0] rA30,
    input [31:0] rA31,
    input [92: 0] ctrl_1_adder,
    input [89: 0] ctrl_2_adder,
    input [83: 0] ctrl_3_adder,
    input [71: 0] ctrl_4_adder,
    input [47: 0] ctrl_5_adder,
    //output
    output [31:0] rO0,
    output [31:0] rO1,
    output [31:0] rO2,
    output [31:0] rO3,
    output [31:0] rO4,
    output [31:0] rO5,
    output [31:0] rO6,
    output [31:0] rO7,
    output [31:0] rO8,
    output [31:0] rO9,
    output [31:0] rO10,
    output [31:0] rO11,
    output [31:0] rO12,
    output [31:0] rO13,
    output [31:0] rO14,
    output [31:0] rO15,
    output [31:0] rO16,
    output [31:0] rO17,
    output [31:0] rO18,
    output [31:0] rO19,
    output [31:0] rO20,
    output [31:0] rO21,
    output [31:0] rO22,
    output [31:0] rO23,
    output [31:0] rO24,
    output [31:0] rO25,
    output [31:0] rO26,
    output [31:0] rO27,
    output [31:0] rO28,
    output [31:0] rO29,
    output [31:0] rO30,
    output [31:0] rO31
    
);

fan32 fan_1(
    clk,
    rst_n,
    fA0,
    fA1,
    fA2,
    fA3,
    fA4,
    fA5,
    fA6,
    fA7,
    fA8,
    fA9,
    fA10,
    fA11,
    fA12,
    fA13,
    fA14,
    fA15,
    fA16,
    fA17,
    fA18,
    fA19,
    fA20,
    fA21,
    fA22,
    fA23,
    fA24,
    fA25,
    fA26,
    fA27,
    fA28,
    fA29,
    fA30,
    fA31,
    ctrl_adder,
    ctrl_2_mux,
    ctrl_3_mux,
    ctrl_4_mux,
    fO0,
    fO1,
    fO2,
    fO3,
    fO4,
    fO5,
    fO6,
    fO7,
    fO8,
    fO9,
    fO10,
    fO11,
    fO12,
    fO13,
    fO14,
    faO15,
    fbO15,
    fO16,
    fO17,
    fO18,
    fO19,
    fO20,
    fO21,
    fO22,
    fO23,
    fO24,
    fO25,
    fO26,
    fO27,
    fO28,
    fO29,
    fO30,
    fO31
);

reduce32 reduce_1(
    clk,
    rst_n,
    rA0,
    rA1,
    rA2,
    rA3,
    rA4,
    rA5,
    rA6,
    rA7,
    rA8,
    rA9,
    rA10,
    rA11,
    rA12,
    rA13,
    rA14,
    rA15,
    rA16,
    rA17,
    rA18,
    rA19,
    rA20,
    rA21,
    rA22,
    rA23,
    rA24,
    rA25,
    rA26,
    rA27,
    rA28,
    rA29,
    rA30,
    rA31,
    ctrl_1_adder,
    ctrl_2_adder,
    ctrl_3_adder,
    ctrl_4_adder,
    ctrl_5_adder,
    rO0,
    rO1,
    rO2,
    rO3,
    rO4,
    rO5,
    rO6,
    rO7,
    rO8,
    rO9,
    rO10,
    rO11,
    rO12,
    rO13,
    rO14,
    rO15,
    rO16,
    rO17,
    rO18,
    rO19,
    rO20,
    rO21,
    rO22,
    rO23,
    rO24,
    rO25,
    rO26,
    rO27,
    rO28,
    rO29,
    rO30,
    rO31
);

endmodule