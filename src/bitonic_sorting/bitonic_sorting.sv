module bitonic_sort #(parameter V = 8, parameter key_width = 32, parameter value_width = 32)
(
  input clk,
  input rst,
  input [key_width+value_width:0] in_data[2*V],
  output wire [key_width+value_width:0] out_data[2*V]
);
  // Internal wires
  wire [key_width + value_width:0]           layers_data_in[$clog2(2*V)][2*V];
  wire [key_width + value_width:0]           layers_data_out[$clog2(2*V)][2*V];


  genvar i,j;
  generate
    for (i=0; i<$clog2(2*V); i=i+1) begin
        for (j=0; j<V; j=j+1) begin
          comparator #(.key_width(key_width), .value_width(value_width)) comparator_inst(
            .clk(clk),
            .rst(rst),
            .start(1'b1),
            .data_in_1(layers_data_in[i][2*j]),
            .data_in_2(layers_data_in[i][2*j+1]),
            .data_out_1(layers_data_out[i][2*j]),
            .data_out_2(layers_data_out[i][2*j+1])
          );
        end
    end
  endgenerate
  // Bitonic sorting network
  genvar k,l,m;
  generate
    for (k=1; k<$clog2(2*V); k=k+1) begin
      for (l=0; l<2**(k-1); l=l+1) begin
        for (m=0; m<V/(2**k); m=m+1) begin
          assign layers_data_in[k][l*2*V/(2**(k-1))+2*m] = layers_data_out[k][l*2*V/(2**(k-1))+2*m];
          assign layers_data_in[k][l*2*V/(2**(k-1))+2*m+1] = layers_data_out[k][l*2*V/(2**(k-1))+2*m+V/(2**(k-1))];
          assign layers_data_in[k][l*2*V/(2**(k-1))+2*m+V/(2**(k-1))] = layers_data_out[k][l*2*V/(2**(k-1))+2*m+1];
          assign layers_data_in[k][l*2*V/(2**(k-1))+2*m+V/(2**(k-1))+1] = layers_data_out[k][l*2*V/(2**(k-1))+2*m+V/(2**(k-1))+1];
        end
      end      
    end
  endgenerate

  // for Synopsys DC
  // genvar k,l,m;
  // generate
  //   for (k=1; k<$clog2(2*V); k=k+1) begin
  //     for (l=0; l<1; l=l+1) begin
  //       for (m=0; m<V/2; m=m+1) begin
  //         assign layers_data_in[k][l*2*V/(2**(k-1))+2*m] = layers_data_out[k][l*2*V/(2**(k-1))+2*m];
  //         assign layers_data_in[k][l*2*V/(2**(k-1))+2*m+1] = layers_data_out[k][l*2*V/(2**(k-1))+2*m+V/(2**(k-1))];
  //         assign layers_data_in[k][l*2*V/(2**(k-1))+2*m+V/(2**(k-1))] = layers_data_out[k][l*2*V/(2**(k-1))+2*m+1];
  //         assign layers_data_in[k][l*2*V/(2**(k-1))+2*m+V/(2**(k-1))+1] = layers_data_out[k][l*2*V/(2**(k-1))+2*m+V/(2**(k-1))+1];
  //       end
  //     end      
  //   end
  // endgenerate




  assign layers_data_in[0][0:2*V-1] = in_data[0:2*V-1];
  assign out_data[0:2*V-1] = layers_data_out[$clog2(2*V)-1][0:2*V-1];

endmodule
