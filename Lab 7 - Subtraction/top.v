module top(
    input [9:0]sw,
    output [13:0]led
    );
    
    half_sub s_inst(
        .A(sw[0]),
        .M(sw[1]),
        .Y(led[0]),
        .B(led[1])
    );
    
    ones_compliment o_inst(
        .NumA(sw[5:2]),
        .NumB(sw[9:6]),
        .Comp(led[5:2])
    );
    
    twos_compliment two_inst(
        .Bit(sw[9:2]),
        .Comp(led[13:6])
    );
    
endmodule