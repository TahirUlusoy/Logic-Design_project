`timescale 1ns / 1ps


module ripple_carry_adder (
    input [63:0] number1,
    input [63:0] number2, 
    output [63:0] sum, 
    output Co
    );
    wire w[64:0];
    genvar i;

  
      for (i = 0; i < 64; i = i + 1) begin
        fulladder u(number1[i], number2[i], i == 0 ? 1'b0 : w[i-1], sum[i], w[i]);
      end

  
  assign Co = w[64];
endmodule


