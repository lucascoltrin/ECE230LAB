module twos_compliment(
    input [7:0]Bit,
    output [7:0]Comp
);

    wire [7:0]w;
    wire [7:0]carry;
    assign w[7:0] = ~Bit[7:0];
    
    full_adder first_inst(
        .Bit1(w[0]),
        .Bit2(1),
        .Cin(0),
        .Y(Comp[0]),
        .Cout(carry[0])
    );
    
    full_adder second_inst(
        .Bit1(w[1]),
        .Bit2(0),
        .Cin(carry[0]),
        .Y(Comp[1]),
        .Cout(carry[1])
    );
    full_adder third_inst(
        .Bit1(w[2]),
        .Bit2(0),
        .Cin(carry[1]),
        .Y(Comp[2]),
        .Cout(carry[2])
    );
    full_adder fourth_inst(
        .Bit1(w[3]),
        .Bit2(0),
        .Cin(carry[2]),
        .Y(Comp[3]),
        .Cout(carry[3])
    );
    full_adder fifth_inst(
        .Bit1(w[4]),
        .Bit2(0),
        .Cin(carry[3]),
        .Y(Comp[4]),
        .Cout(carry[4])
    );
     full_adder sixth_inst(
        .Bit1(w[5]),
        .Bit2(0),
        .Cin(carry[4]),
        .Y(Comp[5]),
        .Cout(carry[5])
    );
     full_adder seventh_inst(
        .Bit1(w[6]),
        .Bit2(0),
        .Cin(carry[5]),
        .Y(Comp[6]),
        .Cout(carry[6])
    );
     full_adder eighth_inst(
        .Bit1(w[7]),
        .Bit2(0),
        .Cin(carry[6]),
        .Y(Comp[7]),
        .Cout(carry[7])
    );
    
    
    
    


endmodule