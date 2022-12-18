`timescale 1ns / 1ps


module tb_davranissal_toplayici(

    );
    reg [63:0] number1;
    reg [63:0] number2;
    reg [64:0] sum;
    
    davranissal_toplayici uut(number1,number2,sum);
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
