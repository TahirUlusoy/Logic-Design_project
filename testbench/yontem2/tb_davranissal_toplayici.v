`timescale 1ns / 1ps


module tb_davranissal_toplayici(

    );
    reg [63:0] number1;
    reg [63:0] number2;
    reg [64:0] sum;
    
    davranissal_toplayici uut(number1,number2,sum);
    initial begin
        
        number1=64'd1; number2=64'd2; #5;
        number1=64'd1; number2=64'd3; #5;
        number1=64'd1; number2=64'd4; #5;
        number1=64'd1; number2=64'd5; #5;
    
    end
    
endmodule
