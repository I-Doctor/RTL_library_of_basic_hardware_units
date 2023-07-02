`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: fan32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.1 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fan32(
    input clk,
    input rst_n,
    // input data
    input [31:0] A0,
    input [31:0] A1,
    input [31:0] A2,
    input [31:0] A3,
    input [31:0] A4,
    input [31:0] A5,
    input [31:0] A6,
    input [31:0] A7,
    input [31:0] A8,
    input [31:0] A9,
    input [31:0] A10,
    input [31:0] A11,
    input [31:0] A12,
    input [31:0] A13,
    input [31:0] A14,
    input [31:0] A15,
    input [31:0] A16,
    input [31:0] A17,
    input [31:0] A18,
    input [31:0] A19,
    input [31:0] A20,
    input [31:0] A21,
    input [31:0] A22,
    input [31:0] A23,
    input [31:0] A24,
    input [31:0] A25,
    input [31:0] A26,
    input [31:0] A27,
    input [31:0] A28,
    input [31:0] A29,
    input [31:0] A30,
    input [31:0] A31,
    // control of adder
    input [30: 0] ctrl_adder,
    // control of level 2 mux 
    input [15:0] ctrl_2_mux,
    // control of level 3 mux 
    input [11:0] ctrl_3_mux,
    // control of level 4 mux 
    input [7 :0] ctrl_4_mux,
    // output
    output [31:0] O0,
    output [31:0] O1,
    output [31:0] O2,
    output [31:0] O3,
    output [31:0] O4,
    output [31:0] O5,
    output [31:0] O6,
    output [31:0] O7,
    output [31:0] O8,
    output [31:0] O9,
    output [31:0] O10,
    output [31:0] O11,
    output [31:0] O12,
    output [31:0] O13,
    output [31:0] O14,
    output [31:0] aO15,
    output [31:0] bO15,
    output [31:0] O16,
    output [31:0] O17,
    output [31:0] O18,
    output [31:0] O19,
    output [31:0] O20,
    output [31:0] O21,
    output [31:0] O22,
    output [31:0] O23,
    output [31:0] O24,
    output [31:0] O25,
    output [31:0] O26,
    output [31:0] O27,
    output [31:0] O28,
    output [31:0] O29,
    output [31:0] O30,
    output [31:0] O31
    );
    
    //left output of each out 2 adder
    wire [31:0] aout0;
    wire [31:0] aout1;
    wire [31:0] aout2;
    wire [31:0] aout3;
    wire [31:0] aout4;
    wire [31:0] aout5;
    wire [31:0] aout6;
    wire [31:0] aout7;
    wire [31:0] aout8;
    wire [31:0] aout9;
    wire [31:0] aout10;
    wire [31:0] aout11;
    wire [31:0] aout12;
    wire [31:0] aout13;
    wire [31:0] aout14;
    wire [31:0] aout15;
    wire [31:0] aout16;
    wire [31:0] aout17;
    wire [31:0] aout18;
    wire [31:0] aout19;
    wire [31:0] aout20;
    wire [31:0] aout21;
    wire [31:0] aout22;
    wire [31:0] aout23;
    wire [31:0] aout24;
    wire [31:0] aout25;
    wire [31:0] aout26;
    wire [31:0] aout27;
    wire [31:0] aout28;
    wire [31:0] aout29;
    wire [31:0] aout30;
    //right output of each out 2 adder
    wire [31:0] bout0;
    wire [31:0] bout1;
    wire [31:0] bout2;
    wire [31:0] bout3;
    wire [31:0] bout4;
    wire [31:0] bout5;
    wire [31:0] bout6;
    wire [31:0] bout7;
    wire [31:0] bout8;
    wire [31:0] bout9;
    wire [31:0] bout10;
    wire [31:0] bout11;
    wire [31:0] bout12;
    wire [31:0] bout13;
    wire [31:0] bout14;
    wire [31:0] bout15;
    wire [31:0] bout16;
    wire [31:0] bout17;
    wire [31:0] bout18;
    wire [31:0] bout19;
    wire [31:0] bout20;
    wire [31:0] bout21;
    wire [31:0] bout22;
    wire [31:0] bout23;
    wire [31:0] bout24;
    wire [31:0] bout25;
    wire [31:0] bout26;
    wire [31:0] bout27;
    wire [31:0] bout28;
    wire [31:0] bout29;
    wire [31:0] bout30;
    // left input of level 2 3 4 adder
    wire [31:0] ain3;
    wire [31:0] ain11;
    wire [31:0] ain19;
    wire [31:0] ain27;
    wire [31:0] ain7;
    wire [31:0] ain23;
    wire [31:0] ain15;
    // right input of level 2 3 4 adder
    wire [31:0] bin3;
    wire [31:0] bin11;
    wire [31:0] bin19;
    wire [31:0] bin27;
    wire [31:0] bin7;
    wire [31:0] bin23;
    wire [31:0] bin15;
    
    // level 0 adder
    o2adder adder0 (clk,rst_n, A0, A1, aout0, bout0, ctrl_adder[0]);
    o2adder adder2 (clk,rst_n, A2, A3, aout2, bout2, ctrl_adder[2]);
    o2adder adder4 (clk,rst_n, A4, A5, aout4, bout4, ctrl_adder[4]);
    o2adder adder6 (clk,rst_n, A6, A7, aout6, bout6, ctrl_adder[6]);
    o2adder adder8 (clk,rst_n, A8, A9, aout8, bout8, ctrl_adder[8]);
    o2adder adder10(clk,rst_n, A10,A11,aout10,bout10,ctrl_adder[10]);
    o2adder adder12(clk,rst_n, A12,A13,aout12,bout12,ctrl_adder[12]);
    o2adder adder14(clk,rst_n, A14,A15,aout14,bout14,ctrl_adder[14]);
    o2adder adder16(clk,rst_n, A16,A17,aout16,bout16,ctrl_adder[16]);
    o2adder adder18(clk,rst_n, A18,A19,aout18,bout18,ctrl_adder[18]);
    o2adder adder20(clk,rst_n, A20,A21,aout20,bout20,ctrl_adder[20]);
    o2adder adder22(clk,rst_n, A22,A23,aout22,bout22,ctrl_adder[22]);
    o2adder adder24(clk,rst_n, A24,A25,aout24,bout24,ctrl_adder[24]);
    o2adder adder26(clk,rst_n, A26,A27,aout26,bout26,ctrl_adder[26]);
    o2adder adder28(clk,rst_n, A28,A29,aout28,bout28,ctrl_adder[28]);
    o2adder adder30(clk,rst_n, A30,A31,aout30,bout30,ctrl_adder[30]);
    // level 1 adder
    o2adder adder1 (clk,rst_n, bout0, aout2, aout1, bout1, ctrl_adder[1]);
    o2adder adder5 (clk,rst_n, bout4, aout6, aout5, bout5, ctrl_adder[5]);
    o2adder adder9 (clk,rst_n, bout8, aout10,aout9, bout9, ctrl_adder[9]);
    o2adder adder13(clk,rst_n, bout12,aout14,aout13,bout13,ctrl_adder[13]);
    o2adder adder17(clk,rst_n, bout16,aout18,aout17,bout17,ctrl_adder[17]);
    o2adder adder21(clk,rst_n, bout20,aout22,aout21,bout21,ctrl_adder[21]);
    o2adder adder25(clk,rst_n, bout24,aout26,aout25,bout25,ctrl_adder[25]);
    o2adder adder29(clk,rst_n, bout28,aout30,aout29,bout29,ctrl_adder[29]);
    // level 2 mux
    assign ain3 = ({32{ctrl_2_mux[15]}}&bout1) | ({32{ctrl_2_mux[14]}}&bout2);
    assign bin3 = ({32{ctrl_2_mux[13]}}&aout4) | ({32{ctrl_2_mux[12]}}&aout5);
    assign ain11= ({32{ctrl_2_mux[11]}}&bout9) | ({32{ctrl_2_mux[10]}}&bout10);
    assign bin11= ({32{ctrl_2_mux[9]}}&aout12) | ({32{ctrl_2_mux[8]}}&aout13);
    assign ain19= ({32{ctrl_2_mux[7]}}&bout17) | ({32{ctrl_2_mux[6]}}&bout18);
    assign bin19= ({32{ctrl_2_mux[5]}}&aout20) | ({32{ctrl_2_mux[4]}}&aout21);
    assign ain27= ({32{ctrl_2_mux[3]}}&bout25) | ({32{ctrl_2_mux[2]}}&bout26);
    assign bin27= ({32{ctrl_2_mux[1]}}&aout28) | ({32{ctrl_2_mux[0]}}&aout29);
    // level 2 adder
    o2adder adder3 (clk,rst_n, ain3, bin3, aout3, bout3, ctrl_adder[3]);
    o2adder adder11(clk,rst_n, ain11,bin11,aout11,bout11,ctrl_adder[11]);
    o2adder adder19(clk,rst_n, ain19,bin19,aout19,bout19,ctrl_adder[19]);
    o2adder adder27(clk,rst_n, ain27,bin27,aout27,bout27,ctrl_adder[27]);
    // level 3 mux
    assign ain7 = ({32{ctrl_3_mux[11]}}&bout3) | ({32{ctrl_3_mux[10]}}&bout5) | ({32{ctrl_3_mux[9]}}&bout6);
    assign bin7 = ({32{ctrl_3_mux[8]}} &aout8) | ({32{ctrl_3_mux[7]}} &aout9) | ({32{ctrl_3_mux[6]}}&aout11);
    assign ain23= ({32{ctrl_3_mux[5]}}&bout19) | ({32{ctrl_3_mux[4]}}&bout21) | ({32{ctrl_3_mux[3]}}&bout22);
    assign bin23= ({32{ctrl_3_mux[2]}}&aout24) | ({32{ctrl_3_mux[1]}}&aout25) | ({32{ctrl_3_mux[0]}}&aout27);
    // level 2 adder
    o2adder adder7 (clk,rst_n, ain7, bin7, aout7, bout7, ctrl_adder[7]);
    o2adder adder23(clk,rst_n, ain23,bin23,aout23,bout23,ctrl_adder[23]);
    // level 4 mux
    assign ain15= ({32{ctrl_4_mux[7]}}&bout7) | ({32{ctrl_4_mux[6]}}&bout11) | ({32{ctrl_4_mux[5]}}&bout13) | ({32{ctrl_4_mux[4]}}&bout14);
    assign bin15= ({32{ctrl_4_mux[3]}}&aout16)| ({32{ctrl_4_mux[2]}}&aout17) | ({32{ctrl_4_mux[1]}}&aout19) | ({32{ctrl_4_mux[0]}}&aout23);
    // level 4 adder
    o2adder adder15(clk,rst_n, ain15,bin15,aout15,bout15,ctrl_adder[15]);
    
    assign O0 = aout0;
    assign O1 = aout1;
    assign O2 = aout2;
    assign O3 = aout3;
    assign O4 = aout4;
    assign O5 = aout5;
    assign O6 = aout6;
    assign O7 = aout7;
    assign O8 = aout8;
    assign O9 = aout9;
    assign O10 = aout10;
    assign O11 = aout11;
    assign O12 = aout12;
    assign O13 = aout13;
    assign O14 = aout14;
    assign aO15 = aout15;
    assign bO15 = bout15;
    assign O16 = bout16;
    assign O17 = bout17;
    assign O18 = bout18;
    assign O19 = bout19;
    assign O20 = bout20;
    assign O21 = bout21;
    assign O22 = bout22;
    assign O23 = bout23;
    assign O24 = bout24;
    assign O25 = bout25;
    assign O26 = bout26;
    assign O27 = bout27;
    assign O28 = bout28;
    assign O29 = bout29;
    assign O30 = bout30;
    
endmodule
