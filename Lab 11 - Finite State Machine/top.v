module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    onehot inst_oh(
        .w(sw),
        .clk(btnC),
        .z(led[0]),
        .outputstate(led[6:2]),
        .reset(btnU)
    );
    binary inst_b(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(led[1]),
        .cState(led[9:7])
    );

endmodule