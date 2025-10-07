module half_sub(
    input A,M,
    output Y,B
    );
    
    assign Y = A^M;
    assign B = ~A & M;
    
    
endmodule    