module top(
    input [7:0]sw,
    output [5:0]led
);
    wire w1;

    light l_inst(
        .A(sw[0]),
        .B(sw[1]),
        .Y(led[0])
    );
    
    adder a_inst(
        .A(sw[2]),
        .B(sw[3]),
        .Y(led[1]),
        .Cout(led[2])
    );

    full_adder lsb_inst(
        .Bit1(sw[4]),
        .Bit2(sw[6]),
        .Cin(0),
        .Y(led[3]),
        .Cout(w1)
        
    );
     full_adder msb_inst(
        .Bit1(sw[5]),
        .Bit2(sw[7]),
        .Cin(w1),
        .Y(led[4]),
        .Cout(led[5])
        
    );
    

endmodule