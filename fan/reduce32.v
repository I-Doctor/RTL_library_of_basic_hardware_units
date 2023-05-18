`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: reduce32
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


module reduce32(
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
    input [92: 0] ctrl_1_adder,
    input [89: 0] ctrl_2_adder,
    input [83: 0] ctrl_3_adder,
    input [71: 0] ctrl_4_adder,
    input [47: 0] ctrl_5_adder,
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
    output [31:0] O15,
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
    
    //level 1
    wire [31:0] l1out0;
    wire [31:0] l1out1;
    wire [31:0] l1out2;
    wire [31:0] l1out3;
    wire [31:0] l1out4;
    wire [31:0] l1out5;
    wire [31:0] l1out6;
    wire [31:0] l1out7;
    wire [31:0] l1out8;
    wire [31:0] l1out9;
    wire [31:0] l1out10;
    wire [31:0] l1out11;
    wire [31:0] l1out12;
    wire [31:0] l1out13;
    wire [31:0] l1out14;
    wire [31:0] l1out15;
    wire [31:0] l1out16;
    wire [31:0] l1out17;
    wire [31:0] l1out18;
    wire [31:0] l1out19;
    wire [31:0] l1out20;
    wire [31:0] l1out21;
    wire [31:0] l1out22;
    wire [31:0] l1out23;
    wire [31:0] l1out24;
    wire [31:0] l1out25;
    wire [31:0] l1out26;
    wire [31:0] l1out27;
    wire [31:0] l1out28;
    wire [31:0] l1out29;
    wire [31:0] l1out30;
    reg  [31:0] l1out31;
    //level 2
    wire [31:0] l2out0;
    wire [31:0] l2out1;
    wire [31:0] l2out2;
    wire [31:0] l2out3;
    wire [31:0] l2out4;
    wire [31:0] l2out5;
    wire [31:0] l2out6;
    wire [31:0] l2out7;
    wire [31:0] l2out8;
    wire [31:0] l2out9;
    wire [31:0] l2out10;
    wire [31:0] l2out11;
    wire [31:0] l2out12;
    wire [31:0] l2out13;
    wire [31:0] l2out14;
    wire [31:0] l2out15;
    wire [31:0] l2out16;
    wire [31:0] l2out17;
    wire [31:0] l2out18;
    wire [31:0] l2out19;
    wire [31:0] l2out20;
    wire [31:0] l2out21;
    wire [31:0] l2out22;
    wire [31:0] l2out23;
    wire [31:0] l2out24;
    wire [31:0] l2out25;
    wire [31:0] l2out26;
    wire [31:0] l2out27;
    wire [31:0] l2out28;
    wire [31:0] l2out29;
    reg  [31:0] l2out30;
    reg  [31:0] l2out31;
    //level 3
    wire [31:0] l3out0;
    wire [31:0] l3out1;
    wire [31:0] l3out2;
    wire [31:0] l3out3;
    wire [31:0] l3out4;
    wire [31:0] l3out5;
    wire [31:0] l3out6;
    wire [31:0] l3out7;
    wire [31:0] l3out8;
    wire [31:0] l3out9;
    wire [31:0] l3out10;
    wire [31:0] l3out11;
    wire [31:0] l3out12;
    wire [31:0] l3out13;
    wire [31:0] l3out14;
    wire [31:0] l3out15;
    wire [31:0] l3out16;
    wire [31:0] l3out17;
    wire [31:0] l3out18;
    wire [31:0] l3out19;
    wire [31:0] l3out20;
    wire [31:0] l3out21;
    wire [31:0] l3out22;
    wire [31:0] l3out23;
    wire [31:0] l3out24;
    wire [31:0] l3out25;
    wire [31:0] l3out26;
    wire [31:0] l3out27;
    reg  [31:0] l3out28;
    reg  [31:0] l3out29;
    reg  [31:0] l3out30;
    reg  [31:0] l3out31;
    //level 4
    wire [31:0] l4out0;
    wire [31:0] l4out1;
    wire [31:0] l4out2;
    wire [31:0] l4out3;
    wire [31:0] l4out4;
    wire [31:0] l4out5;
    wire [31:0] l4out6;
    wire [31:0] l4out7;
    wire [31:0] l4out8;
    wire [31:0] l4out9;
    wire [31:0] l4out10;
    wire [31:0] l4out11;
    wire [31:0] l4out12;
    wire [31:0] l4out13;
    wire [31:0] l4out14;
    wire [31:0] l4out15;
    wire [31:0] l4out16;
    wire [31:0] l4out17;
    wire [31:0] l4out18;
    wire [31:0] l4out19;
    wire [31:0] l4out20;
    wire [31:0] l4out21;
    wire [31:0] l4out22;
    wire [31:0] l4out23;
    reg  [31:0] l4out24;
    reg  [31:0] l4out25;
    reg  [31:0] l4out26;
    reg  [31:0] l4out27;
    reg  [31:0] l4out28;
    reg  [31:0] l4out29;
    reg  [31:0] l4out30;
    reg  [31:0] l4out31;
    //level 5
    wire [31:0] l5out0;
    wire [31:0] l5out1;
    wire [31:0] l5out2;
    wire [31:0] l5out3;
    wire [31:0] l5out4;
    wire [31:0] l5out5;
    wire [31:0] l5out6;
    wire [31:0] l5out7;
    wire [31:0] l5out8;
    wire [31:0] l5out9;
    wire [31:0] l5out10;
    wire [31:0] l5out11;
    wire [31:0] l5out12;
    wire [31:0] l5out13;
    wire [31:0] l5out14;
    wire [31:0] l5out15;
    reg  [31:0] l5out16;
    reg  [31:0] l5out17;
    reg  [31:0] l5out18;
    reg  [31:0] l5out19;
    reg  [31:0] l5out20;
    reg  [31:0] l5out21;
    reg  [31:0] l5out22;
    reg  [31:0] l5out23;
    reg  [31:0] l5out24;
    reg  [31:0] l5out25;
    reg  [31:0] l5out26;
    reg  [31:0] l5out27;
    reg  [31:0] l5out28;
    reg  [31:0] l5out29;
    reg  [31:0] l5out30;
    reg  [31:0] l5out31;
    
    // level 1 adder
    o1adder l1adder0 (clk,rst_n, A0, A1, l1out0, ctrl_1_adder[2 : 0]);
    o1adder l1adder1 (clk,rst_n, A1, A2, l1out1, ctrl_1_adder[5 : 3]);
    o1adder l1adder2 (clk,rst_n, A2, A3, l1out2, ctrl_1_adder[8 : 6]);
    o1adder l1adder3 (clk,rst_n, A3, A4, l1out3, ctrl_1_adder[11: 9]);
    o1adder l1adder4 (clk,rst_n, A4, A5, l1out4, ctrl_1_adder[14:12]);
    o1adder l1adder5 (clk,rst_n, A5, A6, l1out5, ctrl_1_adder[17:15]);
    o1adder l1adder6 (clk,rst_n, A6, A7, l1out6, ctrl_1_adder[20:18]);
    o1adder l1adder7 (clk,rst_n, A7, A8, l1out7, ctrl_1_adder[23:21]);
    o1adder l1adder8 (clk,rst_n, A8, A9, l1out8, ctrl_1_adder[26:24]);
    o1adder l1adder9 (clk,rst_n, A9, A10,l1out9, ctrl_1_adder[29:27]);
    o1adder l1adder10(clk,rst_n, A10,A11,l1out10,ctrl_1_adder[32:30]);
    o1adder l1adder11(clk,rst_n, A11,A12,l1out11,ctrl_1_adder[35:33]);
    o1adder l1adder12(clk,rst_n, A12,A13,l1out12,ctrl_1_adder[38:36]);
    o1adder l1adder13(clk,rst_n, A13,A14,l1out13,ctrl_1_adder[41:39]);
    o1adder l1adder14(clk,rst_n, A14,A15,l1out14,ctrl_1_adder[44:42]);
    o1adder l1adder15(clk,rst_n, A15,A16,l1out15,ctrl_1_adder[47:45]);
    o1adder l1adder16(clk,rst_n, A16,A17,l1out16,ctrl_1_adder[50:48]);
    o1adder l1adder17(clk,rst_n, A17,A18,l1out17,ctrl_1_adder[53:51]);
    o1adder l1adder18(clk,rst_n, A18,A19,l1out18,ctrl_1_adder[56:54]);
    o1adder l1adder19(clk,rst_n, A19,A20,l1out19,ctrl_1_adder[59:57]);
    o1adder l1adder20(clk,rst_n, A20,A21,l1out20,ctrl_1_adder[62:60]);
    o1adder l1adder21(clk,rst_n, A21,A22,l1out21,ctrl_1_adder[65:63]);
    o1adder l1adder22(clk,rst_n, A22,A23,l1out22,ctrl_1_adder[68:66]);
    o1adder l1adder23(clk,rst_n, A23,A24,l1out23,ctrl_1_adder[71:69]);
    o1adder l1adder24(clk,rst_n, A24,A25,l1out24,ctrl_1_adder[74:72]);
    o1adder l1adder25(clk,rst_n, A25,A26,l1out25,ctrl_1_adder[77:75]);
    o1adder l1adder26(clk,rst_n, A26,A27,l1out26,ctrl_1_adder[80:78]);
    o1adder l1adder27(clk,rst_n, A27,A28,l1out27,ctrl_1_adder[83:81]);
    o1adder l1adder28(clk,rst_n, A28,A29,l1out28,ctrl_1_adder[86:84]);
    o1adder l1adder29(clk,rst_n, A29,A30,l1out29,ctrl_1_adder[89:87]);
    o1adder l1adder30(clk,rst_n, A30,A31,l1out30,ctrl_1_adder[92:90]);
    always@(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            l1out31 <= 0;
        end else begin
            l1out31 <= A31;
        end
    end
    // level 2 adder
    o1adder l2adder0 (clk,rst_n, l1out0, l1out2, l2out0, ctrl_2_adder[2:0]);
    o1adder l2adder1 (clk,rst_n, l1out1, l1out3, l2out1, ctrl_2_adder[5:3]);
    o1adder l2adder2 (clk,rst_n, l1out2, l1out4, l2out2, ctrl_2_adder[8:6]);
    o1adder l2adder3 (clk,rst_n, l1out3, l1out5, l2out3, ctrl_2_adder[11:9]);
    o1adder l2adder4 (clk,rst_n, l1out4, l1out6, l2out4, ctrl_2_adder[14:12]);
    o1adder l2adder5 (clk,rst_n, l1out5, l1out7, l2out5, ctrl_2_adder[17:15]);
    o1adder l2adder6 (clk,rst_n, l1out6, l1out8, l2out6, ctrl_2_adder[20:18]);
    o1adder l2adder7 (clk,rst_n, l1out7, l1out9, l2out7, ctrl_2_adder[23:21]);
    o1adder l2adder8 (clk,rst_n, l1out8, l1out10, l2out8, ctrl_2_adder[26:24]);
    o1adder l2adder9 (clk,rst_n, l1out9, l1out11, l2out9, ctrl_2_adder[29:27]);
    o1adder l2adder10 (clk,rst_n, l1out10, l1out12, l2out10, ctrl_2_adder[32:30]);
    o1adder l2adder11 (clk,rst_n, l1out11, l1out13, l2out11, ctrl_2_adder[35:33]);
    o1adder l2adder12 (clk,rst_n, l1out12, l1out14, l2out12, ctrl_2_adder[38:36]);
    o1adder l2adder13 (clk,rst_n, l1out13, l1out15, l2out13, ctrl_2_adder[41:39]);
    o1adder l2adder14 (clk,rst_n, l1out14, l1out16, l2out14, ctrl_2_adder[44:42]);
    o1adder l2adder15 (clk,rst_n, l1out15, l1out17, l2out15, ctrl_2_adder[47:45]);
    o1adder l2adder16 (clk,rst_n, l1out16, l1out18, l2out16, ctrl_2_adder[50:48]);
    o1adder l2adder17 (clk,rst_n, l1out17, l1out19, l2out17, ctrl_2_adder[53:51]);
    o1adder l2adder18 (clk,rst_n, l1out18, l1out20, l2out18, ctrl_2_adder[56:54]);
    o1adder l2adder19 (clk,rst_n, l1out19, l1out21, l2out19, ctrl_2_adder[59:57]);
    o1adder l2adder20 (clk,rst_n, l1out20, l1out22, l2out20, ctrl_2_adder[62:60]);
    o1adder l2adder21 (clk,rst_n, l1out21, l1out23, l2out21, ctrl_2_adder[65:63]);
    o1adder l2adder22 (clk,rst_n, l1out22, l1out24, l2out22, ctrl_2_adder[68:66]);
    o1adder l2adder23 (clk,rst_n, l1out23, l1out25, l2out23, ctrl_2_adder[71:69]);
    o1adder l2adder24 (clk,rst_n, l1out24, l1out26, l2out24, ctrl_2_adder[74:72]);
    o1adder l2adder25 (clk,rst_n, l1out25, l1out27, l2out25, ctrl_2_adder[77:75]);
    o1adder l2adder26 (clk,rst_n, l1out26, l1out28, l2out26, ctrl_2_adder[80:78]);
    o1adder l2adder27 (clk,rst_n, l1out27, l1out29, l2out27, ctrl_2_adder[83:81]);
    o1adder l2adder28 (clk,rst_n, l1out28, l1out30, l2out28, ctrl_2_adder[86:84]);
    o1adder l2adder29 (clk,rst_n, l1out29, l1out31, l2out29, ctrl_2_adder[89:87]);
    always@(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            l2out31 <= 0;
            l2out30 <= 0;
        end else begin
            l2out31 <= l1out31;
            l2out30 <= l1out30;
        end
    end
    //level 3 adder
    o1adder l3adder0 (clk,rst_n, l2out0, l2out4, l3out0, ctrl_3_adder[2:0]);
    o1adder l3adder1 (clk,rst_n, l2out1, l2out5, l3out1, ctrl_3_adder[5:3]);
    o1adder l3adder2 (clk,rst_n, l2out2, l2out6, l3out2, ctrl_3_adder[8:6]);
    o1adder l3adder3 (clk,rst_n, l2out3, l2out7, l3out3, ctrl_3_adder[11:9]);
    o1adder l3adder4 (clk,rst_n, l2out4, l2out8, l3out4, ctrl_3_adder[14:12]);
    o1adder l3adder5 (clk,rst_n, l2out5, l2out9, l3out5, ctrl_3_adder[17:15]);
    o1adder l3adder6 (clk,rst_n, l2out6, l2out10, l3out6, ctrl_3_adder[20:18]);
    o1adder l3adder7 (clk,rst_n, l2out7, l2out11, l3out7, ctrl_3_adder[23:21]);
    o1adder l3adder8 (clk,rst_n, l2out8, l2out12, l3out8, ctrl_3_adder[26:24]);
    o1adder l3adder9 (clk,rst_n, l2out9, l2out13, l3out9, ctrl_3_adder[29:27]);
    o1adder l3adder10 (clk,rst_n, l2out10, l2out14, l3out10, ctrl_3_adder[32:30]);
    o1adder l3adder11 (clk,rst_n, l2out11, l2out15, l3out11, ctrl_3_adder[35:33]);
    o1adder l3adder12 (clk,rst_n, l2out12, l2out16, l3out12, ctrl_3_adder[38:36]);
    o1adder l3adder13 (clk,rst_n, l2out13, l2out17, l3out13, ctrl_3_adder[41:39]);
    o1adder l3adder14 (clk,rst_n, l2out14, l2out18, l3out14, ctrl_3_adder[44:42]);
    o1adder l3adder15 (clk,rst_n, l2out15, l2out19, l3out15, ctrl_3_adder[47:45]);
    o1adder l3adder16 (clk,rst_n, l2out16, l2out20, l3out16, ctrl_3_adder[50:48]);
    o1adder l3adder17 (clk,rst_n, l2out17, l2out21, l3out17, ctrl_3_adder[53:51]);
    o1adder l3adder18 (clk,rst_n, l2out18, l2out22, l3out18, ctrl_3_adder[56:54]);
    o1adder l3adder19 (clk,rst_n, l2out19, l2out23, l3out19, ctrl_3_adder[59:57]);
    o1adder l3adder20 (clk,rst_n, l2out20, l2out24, l3out20, ctrl_3_adder[62:60]);
    o1adder l3adder21 (clk,rst_n, l2out21, l2out25, l3out21, ctrl_3_adder[65:63]);
    o1adder l3adder22 (clk,rst_n, l2out22, l2out26, l3out22, ctrl_3_adder[68:66]);
    o1adder l3adder23 (clk,rst_n, l2out23, l2out27, l3out23, ctrl_3_adder[71:69]);
    o1adder l3adder24 (clk,rst_n, l2out24, l2out28, l3out24, ctrl_3_adder[74:72]);
    o1adder l3adder25 (clk,rst_n, l2out25, l2out29, l3out25, ctrl_3_adder[77:75]);
    o1adder l3adder26 (clk,rst_n, l2out26, l2out30, l3out26, ctrl_3_adder[80:78]);
    o1adder l3adder27 (clk,rst_n, l2out27, l2out31, l3out27, ctrl_3_adder[83:81]);
    always@(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            l3out31 <= 0;
            l3out30 <= 0;
            l3out29 <= 0;
            l3out28 <= 0;
        end else begin
            l3out31 <= l2out31;
            l3out30 <= l2out30;
            l3out29 <= l2out29;
            l3out28 <= l2out28;
        end
    end
    //level 4 adder
    o1adder l4adder0 (clk,rst_n, l3out0, l3out8, l4out0, ctrl_4_adder[2:0]);
    o1adder l4adder1 (clk,rst_n, l3out1, l3out9, l4out1, ctrl_4_adder[5:3]);
    o1adder l4adder2 (clk,rst_n, l3out2, l3out10, l4out2, ctrl_4_adder[8:6]);
    o1adder l4adder3 (clk,rst_n, l3out3, l3out11, l4out3, ctrl_4_adder[11:9]);
    o1adder l4adder4 (clk,rst_n, l3out4, l3out12, l4out4, ctrl_4_adder[14:12]);
    o1adder l4adder5 (clk,rst_n, l3out5, l3out13, l4out5, ctrl_4_adder[17:15]);
    o1adder l4adder6 (clk,rst_n, l3out6, l3out14, l4out6, ctrl_4_adder[20:18]);
    o1adder l4adder7 (clk,rst_n, l3out7, l3out15, l4out7, ctrl_4_adder[23:21]);
    o1adder l4adder8 (clk,rst_n, l3out8, l3out16, l4out8, ctrl_4_adder[26:24]);
    o1adder l4adder9 (clk,rst_n, l3out9, l3out17, l4out9, ctrl_4_adder[29:27]);
    o1adder l4adder10 (clk,rst_n, l3out10, l3out18, l4out10, ctrl_4_adder[32:30]);
    o1adder l4adder11 (clk,rst_n, l3out11, l3out19, l4out11, ctrl_4_adder[35:33]);
    o1adder l4adder12 (clk,rst_n, l3out12, l3out20, l4out12, ctrl_4_adder[38:36]);
    o1adder l4adder13 (clk,rst_n, l3out13, l3out21, l4out13, ctrl_4_adder[41:39]);
    o1adder l4adder14 (clk,rst_n, l3out14, l3out22, l4out14, ctrl_4_adder[44:42]);
    o1adder l4adder15 (clk,rst_n, l3out15, l3out23, l4out15, ctrl_4_adder[47:45]);
    o1adder l4adder16 (clk,rst_n, l3out16, l3out24, l4out16, ctrl_4_adder[50:48]);
    o1adder l4adder17 (clk,rst_n, l3out17, l3out25, l4out17, ctrl_4_adder[53:51]);
    o1adder l4adder18 (clk,rst_n, l3out18, l3out26, l4out18, ctrl_4_adder[56:54]);
    o1adder l4adder19 (clk,rst_n, l3out19, l3out27, l4out19, ctrl_4_adder[59:57]);
    o1adder l4adder20 (clk,rst_n, l3out20, l3out28, l4out20, ctrl_4_adder[62:60]);
    o1adder l4adder21 (clk,rst_n, l3out21, l3out29, l4out21, ctrl_4_adder[65:63]);
    o1adder l4adder22 (clk,rst_n, l3out22, l3out30, l4out22, ctrl_4_adder[68:66]);
    o1adder l4adder23 (clk,rst_n, l3out23, l3out31, l4out23, ctrl_4_adder[71:69]);
    always@(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            l4out31 <= 0;
            l4out30 <= 0;
            l4out29 <= 0;
            l4out28 <= 0;
            l4out27 <= 0;
            l4out26 <= 0;
            l4out25 <= 0;
            l4out24 <= 0;
        end else begin
            l4out31 <= l3out31;
            l4out30 <= l3out30;
            l4out29 <= l3out29;
            l4out28 <= l3out28;
            l4out27 <= l3out27;
            l4out26 <= l3out26;
            l4out25 <= l3out25;
            l4out24 <= l3out24;
        end
    end
    //level 5 adder
    o1adder l5adder0 (clk,rst_n, l4out0, l4out16, l5out0, ctrl_5_adder[2:0]);
    o1adder l5adder1 (clk,rst_n, l4out1, l4out17, l5out1, ctrl_5_adder[5:3]);
    o1adder l5adder2 (clk,rst_n, l4out2, l4out18, l5out2, ctrl_5_adder[8:6]);
    o1adder l5adder3 (clk,rst_n, l4out3, l4out19, l5out3, ctrl_5_adder[11:9]);
    o1adder l5adder4 (clk,rst_n, l4out4, l4out20, l5out4, ctrl_5_adder[14:12]);
    o1adder l5adder5 (clk,rst_n, l4out5, l4out21, l5out5, ctrl_5_adder[17:15]);
    o1adder l5adder6 (clk,rst_n, l4out6, l4out22, l5out6, ctrl_5_adder[20:18]);
    o1adder l5adder7 (clk,rst_n, l4out7, l4out23, l5out7, ctrl_5_adder[23:21]);
    o1adder l5adder8 (clk,rst_n, l4out8, l4out24, l5out8, ctrl_5_adder[26:24]);
    o1adder l5adder9 (clk,rst_n, l4out9, l4out25, l5out9, ctrl_5_adder[29:27]);
    o1adder l5adder10 (clk,rst_n, l4out10, l4out26, l5out10, ctrl_5_adder[32:30]);
    o1adder l5adder11 (clk,rst_n, l4out11, l4out27, l5out11, ctrl_5_adder[35:33]);
    o1adder l5adder12 (clk,rst_n, l4out12, l4out28, l5out12, ctrl_5_adder[38:36]);
    o1adder l5adder13 (clk,rst_n, l4out13, l4out29, l5out13, ctrl_5_adder[41:39]);
    o1adder l5adder14 (clk,rst_n, l4out14, l4out30, l5out14, ctrl_5_adder[44:42]);
    o1adder l5adder15 (clk,rst_n, l4out15, l4out31, l5out15, ctrl_5_adder[47:45]);
    always@(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            l5out31 <= 0;
            l5out30 <= 0;
            l5out29 <= 0;
            l5out28 <= 0;
            l5out27 <= 0;
            l5out26 <= 0;
            l5out25 <= 0;
            l5out24 <= 0;
            l5out23 <= 0;
            l5out22 <= 0;
            l5out21 <= 0;
            l5out20 <= 0;
            l5out19 <= 0;
            l5out18 <= 0;
            l5out17 <= 0;
            l5out16 <= 0;
        end else begin
            l5out31 <= l4out31;
            l5out30 <= l4out30;
            l5out29 <= l4out29;
            l5out28 <= l4out28;
            l5out27 <= l4out27;
            l5out26 <= l4out26;
            l5out25 <= l4out25;
            l5out24 <= l4out24;
            l5out23 <= l4out23;
            l5out22 <= l4out22;
            l5out21 <= l4out21;
            l5out20 <= l4out20;
            l5out19 <= l4out19;
            l5out18 <= l4out18;
            l5out17 <= l4out17;
            l5out16 <= l4out16;
        end
    end

    assign O0  = l5out0;
    assign O1  = l5out1;
    assign O2  = l5out2;
    assign O3  = l5out3;
    assign O4  = l5out4;
    assign O5  = l5out5;
    assign O6  = l5out6;
    assign O7  = l5out7;
    assign O8  = l5out8;
    assign O9  = l5out9;
    assign O10 = l5out10;
    assign O11 = l5out11;
    assign O12 = l5out12;
    assign O13 = l5out13;
    assign O14 = l5out14;
    assign O15 = l5out15;
    assign O15 = l5out15;
    assign O16 = l5out16;
    assign O17 = l5out17;
    assign O18 = l5out18;
    assign O19 = l5out19;
    assign O20 = l5out20;
    assign O21 = l5out21;
    assign O22 = l5out22;
    assign O23 = l5out23;
    assign O24 = l5out24;
    assign O25 = l5out25;
    assign O26 = l5out26;
    assign O27 = l5out27;
    assign O28 = l5out28;
    assign O29 = l5out29;
    assign O30 = l5out30;
    assign O31 = l5out31;
    
endmodule
