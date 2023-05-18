# Verilog Code Style
Using verilog syntax.

## tab
Replace tab with 4 spaces.

## head info
```
//////////////////////////////////////////////////////////////////////////////////
// Orgnization: NICSEFC
// Engineer: 
// 
// Create Date: 20230511
// Module Name: fan
// Description: flexible add net, which can Add up any number of adjacent P inputs
// 
// Version 0.1: File created.
// 
//////////////////////////////////////////////////////////////////////////////////
```

## time step for simulation
```
`timescale 1ns / 10ps
```

## module defination and utilization examples
Define xx module in xx.v:
```
module xx #(
    parameter AAA   = x,
    parameter CCCC  = "cccc" // "cccc", "dddd", "eeee"
)(
    input           aaa,
    input  [x -1:0] bbb,
    output          ccc,
    output reg      ddd
);
```

Utilize module with '\_u' label:
```
xx #(
    .AAA  (x     ),
    .CCCC ("dddd")
) xx_u (
    .aaa      (a    ),
    .bbb      (bbbbb),
    .ccc      (cc   ),
    .ddd      (d    )
);
```

## block and indentation examples

Always block of register, reset,rst are posedge reset, reset_n,rst_n are negedge reset:
```
always @(posedge reset or posedge clk)
    if (reset)
        PC <= 32'h0000_0000;
    else
        PC <= PC_next;
assign PC_next = xxxxxxxxxxxx;
```

Or using begin end in the block:
```
always @(posedge reset or posedge clk) begin
    if (reset) begin
        PC <= 32'h0000_0000;
    end else begin
        PC <= PC_next;
    end
end
```

Assign with '?' : 
```
assign out[3 -1:0] = 
    (code == 6'h00)? 3'b010: 
    (code == 6'h04)? 3'b001: 
    (code == 6'h0c)? 3'b100: 
    (code == 6'h0a || OpCode == 6'h0b)? 3'b101: 
    3'b000;
````
