module top(
    input [3:0] sw,
    input btnC,
    output [5:0]led
);

    dflipflop inst_d(
        .D(sw[0]),
        .store(btnC),
        .Q(led[0]),
        .notQ(led[1])
    );

    jkflipflop inst_jk(
        .J(sw[1]),
        .K(sw[2]),
        .store(btnC),
        .Q(led[2]),
        .notQ(led[3])
    );
    
    tflipflop inst_t(
        .T(sw[3]),
        .store(btnC),
        .Q(led[4]),
        .notQ(led[5])
    );


endmodule