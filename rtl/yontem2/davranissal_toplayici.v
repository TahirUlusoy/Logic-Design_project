`timescale 1ns / 1ps


module davranissal_toplayici(
    input [151:0] packet,
    output reg [64:0] sum
    );
    
    wire [63:0] number1 = packet[135:72];
    wire [63:0] number2 = packet[71:8];
    always@(*) begin
        sum = number1 + number2;
    end
    
endmodule
