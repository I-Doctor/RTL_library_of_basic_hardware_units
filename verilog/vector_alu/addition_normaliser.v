`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/12 16:42:25
// Design Name: 
// Module Name: addition_normaliser
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


module addition_normaliser(in_e, in_m, out_e, out_m);
  input [7:0] in_e;
  input [24:0] in_m;
  output [7:0] out_e;
  output [24:0] out_m;

  wire [7:0] in_e;
  wire [24:0] in_m;
  reg [7:0] out_e;
  reg [24:0] out_m;//24?????

  always @ ( * ) begin
  if(in_m[23]==1'b1) begin
    out_e = in_e;
    out_m = in_m;
  end 
  else if (in_m[22] == 1'b1) begin
			out_e = in_e - 1;
			out_m = in_m <<1;
            end else if (in_m[21] == 1'b1) begin
			out_e = in_e - 2;
			out_m = in_m <<2;
            end else if (in_m[20] == 1'b1) begin
			out_e = in_e - 3;
			out_m = in_m <<3;
            end else if (in_m[19] == 1'b1) begin
			out_e = in_e - 4;
			out_m = in_m <<4;
            end else if (in_m[18] == 1'b1) begin/////////////////
			out_e = in_e - 5;
			out_m = in_m <<5;
            end else if (in_m[17] == 1'b1) begin
			out_e = in_e - 6;
			out_m = in_m <<6;
            end else if (in_m[16] == 1'b1) begin
			out_e = in_e - 7;
			out_m = in_m <<7;
            end else if (in_m[15] == 1'b1) begin
			out_e = in_e - 8;
			out_m = in_m <<8;
            end else if (in_m[14] == 1'b1) begin
			out_e = in_e - 9;
			out_m = in_m <<9;
            end else if (in_m[13] == 1'b1) begin
			out_e = in_e - 10;
			out_m = in_m <<10;
            end else if (in_m[12] == 1'b1) begin
			out_e = in_e - 11;
			out_m = in_m <<11;
            end else if (in_m[11] == 1'b1) begin
			out_e = in_e - 12;
			out_m = in_m <<12;
            end else if (in_m[10] == 1'b1) begin
			out_e = in_e - 13;
			out_m = in_m <<13;
            end else if (in_m[9] == 1'b1) begin
			out_e = in_e - 14;
			out_m = in_m <<14;
            end else if (in_m[8] == 1'b1) begin
			out_e = in_e - 15;
			out_m = in_m <<15;
            end else if (in_m[7] == 1'b1) begin
			out_e = in_e - 16;
			out_m = in_m <<16;
            end else if (in_m[6] == 1'b1) begin
			out_e = in_e - 17;
			out_m = in_m <<17;
            end else if (in_m[5] == 1'b1) begin
			out_e = in_e - 18;
			out_m = in_m <<18;
            end else if (in_m[4] == 1'b1) begin
			out_e = in_e - 19;
			out_m = in_m <<19;
            end else if (in_m[3] == 1'b1) begin
			out_e = in_e - 20;
			out_m = in_m <<20;
            end else if (in_m[2] == 1'b1) begin
			out_e = in_e - 21;
			out_m = in_m <<21;
            end else if (in_m[1] == 1'b1) begin
			out_e = in_e - 22;
			out_m = in_m <<22;
            end else begin
            out_e = in_e - 23;
			out_m = in_m <<23;
            end
end
endmodule
