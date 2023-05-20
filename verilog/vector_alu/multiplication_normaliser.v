`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/12 14:28:17
// Design Name: 
// Module Name: multiplication_normaliser
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


module multiplication_normaliser(in_e, in_m, out_e, out_m);
  input [7:0] in_e;
  input [47:0] in_m;
  output reg [7:0] out_e;
  output reg [47:0] out_m;



always @ ( * ) begin
  if(in_m[46]==1'b1) begin
  out_e = in_e;
  out_m = in_m;
end 
else if (in_m[45] == 1'b1) begin
          out_e = in_e - 1;
          out_m = in_m <<1;
          end else if (in_m[44] == 1'b1) begin
          out_e = in_e - 2;
          out_m = in_m <<2;
          end else if (in_m[43] == 1'b1) begin
          out_e = in_e - 3;
          out_m = in_m <<3;
          end else if (in_m[42] == 1'b1) begin
          out_e = in_e - 4;
          out_m = in_m <<4;
          end else if (in_m[41] == 1'b1) begin/////////////////
          out_e = in_e - 5;
          out_m = in_m <<5;
          end else if (in_m[40] == 1'b1) begin
          out_e = in_e - 6;
          out_m = in_m <<6;
          end else if (in_m[39] == 1'b1) begin
          out_e = in_e - 7;
          out_m = in_m <<7;
          end else if (in_m[38] == 1'b1) begin
          out_e = in_e - 8;
          out_m = in_m <<8;
          end else if (in_m[37] == 1'b1) begin
          out_e = in_e - 9;
          out_m = in_m <<9;
          end else if (in_m[36] == 1'b1) begin
          out_e = in_e - 10;
          out_m = in_m <<10;
          end else if (in_m[35] == 1'b1) begin
          out_e = in_e - 11;
          out_m = in_m <<11;
          end else if (in_m[34] == 1'b1) begin
          out_e = in_e - 12;
          out_m = in_m <<12;
          end else if (in_m[33] == 1'b1) begin
          out_e = in_e - 13;
          out_m = in_m <<13;
          end else if (in_m[32] == 1'b1) begin
          out_e = in_e - 14;
          out_m = in_m <<14;
          end else if (in_m[31] == 1'b1) begin
          out_e = in_e - 15;
          out_m = in_m <<15;
          end else if (in_m[30] == 1'b1) begin
          out_e = in_e - 16;
          out_m = in_m <<16;
          end else if (in_m[29] == 1'b1) begin
          out_e = in_e - 17;
          out_m = in_m <<17;
          end else if (in_m[28] == 1'b1) begin
          out_e = in_e - 18;
          out_m = in_m <<18;
          end else if (in_m[27] == 1'b1) begin
          out_e = in_e - 19;
          out_m = in_m <<19;
          end else if (in_m[26] == 1'b1) begin
          out_e = in_e - 20;
          out_m = in_m <<20;
          end else if (in_m[25] == 1'b1) begin
          out_e = in_e - 21;
          out_m = in_m <<21;
          end else if (in_m[24] == 1'b1) begin
          out_e = in_e - 22;
          out_m = in_m <<22;
          end else begin
          out_e = in_e - 23;
          out_m = in_m <<23;
          end
end
endmodule
