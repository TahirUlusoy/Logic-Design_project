`timescale 1ns / 1ps


module tb_ripple_carry_adder(

    );
    
    reg [151:0] packet;
    wire [63:0] sum;
    wire Co;
    
    ripple_carry_adder uut(packet,sum,Co);
    
    initial begin
    packet = 152'd100;#5;
    packet = 152'd50;#5;
    packet = 152'd25;#5;
    packet = 152'd36;#5;
    packet = 152'd72;#5;
    
    end
endmodule
