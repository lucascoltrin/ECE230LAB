module circuit_a(
    input A,B,C,D,
    output Y
);

    assign Y = ~A & D;

endmodule
