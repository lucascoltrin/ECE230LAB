module modulo_counter(
    input clock,
    input reset,
    output [2:0] count,
    output out
);

wire [2:0] addO;

wire [1:0] CO;
wire resetWire;
wire restart;
wire nothing;

full_adder add_bit0(
    .Bit1(count[0]),
    .Bit2(1'b1),
    .Cin(1'b0),
    .Y(addO[0]),
    .Cout(CO[0])
);

full_adder add_bit1(
    .Bit1(count[1]),
    .Bit2(CO[0]),
    .Cin(1'b0),
    .Y(addO[1]),
    .Cout(CO[1])
);

full_adder add_bit2(
    .Bit1(count[2]),
    .Bit2(CO[1]),
    .Cin(1'b0),
    .Y(addO[2]),
    .Cout(nothing)
);

dff bit0(
    .D(addO[0]),
    .clk(clock),
    .reset(resetWire),
    .Q(count[0])
);

dff bit1(
    .D(addO[1]),
    .clk(clock),
    .reset(resetWire),
    .Q(count[1])
);

dff bit2(
    .D(addO[2]),
    .clk(clock),
    .reset(resetWire),
    .Q(count[2])
);

    assign resetWire = reset | restart;
    
    assign restart = count[1] & count[2];

dff inst_1(
    .D(restart),
    .clk(clock),
    .reset(reset),
    .Q(out)
);


endmodule

