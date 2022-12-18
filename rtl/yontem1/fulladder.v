`timescale 1ns / 1ps


module fulladder(
    input number1,
    input number2,
    input Ci,
    output sum,
    output Co
    );
 
  wire w1,w2,w3;
  
  and G3(w2, w1, Ci);
  and G4(w3, number1, number2);
  or G5(Co, w2, w3);
  xor G1(w1, number1, number2);
  xor G2(sum, w1, Ci);
  
endmodule