`timescale 1ns / 1ps


module tb_ripple_carry_adder(

    );
    
    reg [63:0] number1;
    reg [63:0] number2; 
    wire [63:0] sum;
    wire Co;
    
    ripple_carry_adder uut(number1,number2,sum,Co);
    
    initial begin
   number1 = 64'd1; number2 = 64'd1; #5;
    number1 = 64'd1; number2 = 64'd2; #5;
    number1 = 64'd1; number2 = 64'd3; #5;
    number1 = 64'd1; number2 = 64'd4; #5;
    number1 = 64'd1; number2 = 64'd50; #5;
    number1 = 64'd1; number2 = 64'd55; #5;
    number1 = 64'd10; number2 = 64'd10; #5;
    number1 = 64'd15; number2 = 64'd30; #5;
    number1 = 64'd25; number2 = 64'd52; #5;
    number1 = 64'd60; number2 = 64'd17; #5;
    
    end
endmodule
