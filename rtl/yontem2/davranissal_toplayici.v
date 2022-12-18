`timescale 1ns / 1ps


module davranissal_toplayici(
    input[63:0] number1,
    input [63:0] number2,
    output reg [64:0] sum
    );
    
    always@(*) begin
        sum = number1 + number2;
    end
    
endmodule
