`timescale 1ns / 1ps
module full_adder(
    input Bit1,Bit2,Cin,
    output Y,Cout
);
    
    assign Y = Bit1 ^ Bit2 ^ Cin;
    assign Cout = (Bit1 & Bit2) | ( Bit1 & Cin) | (Bit2 & Cin);
    
    
endmodule
