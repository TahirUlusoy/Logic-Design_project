`timescale 1ns / 1ps

module tb_Carry_Lookahead_Adder( );

 reg cintb;
 reg [31:0] Atb;
 reg [31:0] Btb;
 wire coutb;
 wire [31:0] sumtb;


Carry_Lookahead_Adder uut(
         .sum (sumtb[31:0]),
         .cout (coutb),
         .A (Atb[31:0]),
         .B (Btb[31:0]),
         .cin (cintb));

initial begin

  cintb = 1'b0;
  end

 initial begin

   Atb = 32'd10;
   Btb = 32'd10;
    #100;
    Atb = 32'd20;
    Btb = 32'd0;
    #100;
     Atb = 32'd14;
    Btb = 32'd13;
    #100;
    Atb = 32'd4;
    Btb = 32'd6;
    #100;
    Atb = 32'd7;
    Btb = 32'd1;
    #100;
    Atb = 32'd2;
   Btb = 32'd4;
    #100;
     Atb = 32'd6;
    Btb = 32'd13;
    #100;
    Atb = 32'd11;
    Btb = 32'd12;
    #100;
     #100;
     Atb = 32'd8;
    Btb = 32'd11;
    #100;
    Atb = 32'd6;
    Btb = 32'd3;
    #100;
  end

   
endmodule
