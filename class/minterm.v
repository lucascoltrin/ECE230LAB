module minterm (
    input A, B, C, D,
    output Y
);

assign Y = (B & ~C & ~D) |
           (~A & ~B & D) |
           (C & ~D); // Enter your equation here

endmodule
