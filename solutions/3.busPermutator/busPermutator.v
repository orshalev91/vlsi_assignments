`timescale 1ns / 1ns

module busPermutator(
    input [7:0] din,
    input [15:0] select,
    output reg [7:0] dout
);


always @(din, select) begin
    case (din)
        
