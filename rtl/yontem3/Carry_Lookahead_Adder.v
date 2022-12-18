`timescale 1ns / 1ps


module Carry_Lookahead_Adder(
    input [151:0] packet,
    output [63:0] sum,
    output cout
);
    wire [63:0] A = packet[135:72];
    wire [63:0] B = packet[71:8];


wire [63:0] k;
wire [63:0] m;
wire [64:0] c;

genvar j, i;
generate

     for(j = 0; j < 64; j = j + 1)
     begin
     assign k[j] = A[j] & B[j];
     assign m[j] = A[j] | B[j];
     assign c[j+1] = k[j] | m[j] & c[j];
     end
    
     assign cout = c[64];
    
     for(i = 0; i < 64; i = i+1)
     begin
     assign sum[i] = A[i] ^ B[i] ^ c[i];
     end
    endgenerate


endmodule
