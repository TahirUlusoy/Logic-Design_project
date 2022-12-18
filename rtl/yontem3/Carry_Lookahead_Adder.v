`timescale 1ns / 1ps


module Carry_Lookahead_Adder(


input [31:0] A,
input [31:0] B,
input cin,
output [31:0] sum,
output cout
);



wire [31:0] k;
wire [31:0] m;
wire [32:0] c;

genvar j, i;
generate

 assign c[0] = cin;

 for(j = 0; j < 32; j = j + 1)
 begin
 assign k[j] = A[j] & B[j];
 assign m[j] = A[j] | B[j];
 assign c[j+1] = k[j] | m[j] & c[j];
 end

 assign cout = c[32];

 for(i = 0; i < 32; i = i+1)
 begin
 assign sum[i] = A[i] ^ B[i] ^ c[i];
 end
endgenerate


endmodule
