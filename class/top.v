module top(
    input [3:0] sw,
    output [2:0] led
);

    naive naive_inst(
        .A(sw[3]),
        .B(sw[2]),
        .C(sw[1]),
        .D(sw[0]),
        .Y(led[0])
    );

    minterm minterm_inst(
        .A(sw[3]),
        .B(sw[2]),
        .C(sw[1]),
        .D(sw[0]),
        .Y(led[1])
    );

    maxterm maxterm_inst(
        .A(sw[3]),
        .B(sw[2]),
        .C(sw[1]),
        .D(sw[0]),
        .Y(led[2])
    );

endmodule
