`timescale 1ns / 1ps


module tb_davranissal_toplayici(

    );
     reg [151:0] packet;
    wire [64:0] sum;
    
    davranissal_toplayici uut(packet,sum);
    initial begin
        
    packet = 152'd100;#5;
    packet = 152'd50;#5;
    packet = 152'd25;#5;
    packet = 152'd36;#5;
    packet = 152'd72;#5;
    end
    
endmodule
