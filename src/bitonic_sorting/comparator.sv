module comparator #(parameter key_width = 32, parameter value_width = 32)(
  input clk,
  input rst,
  input start,
  input [key_width+value_width:0] data_in_1,
  input [key_width+value_width:0] data_in_2,
  output wire [key_width+value_width:0] data_out_1,
  output wire [key_width+value_width:0] data_out_2
);

  reg [key_width+value_width:0] smaller_data_reg, larger_data_reg;
  reg started;

  always @(posedge clk) begin
    if (rst) begin
      smaller_data_reg <= 0;
      larger_data_reg <= 0;
      started <= 0;
    end else begin
      if (start) begin
        if (!started) begin
          if (data_in_1[key_width+value_width-1:value_width] < data_in_2[key_width+value_width-1:value_width]) begin
            smaller_data_reg <= data_in_1;
            larger_data_reg <= data_in_2;
          end else begin
            smaller_data_reg <= data_in_2;
            larger_data_reg <= data_in_1;
          end
          started <= 1;
        end
      end else begin
        started <= 0;
      end
    end
  end

  assign data_out_1 = smaller_data_reg;
  assign data_out_2 = larger_data_reg;

endmodule
