module ones_compliment(
    input [3:0] NumA,
    input [3:0] NumB,
    output [3:0] Comp
);

    wire [3:0] sum;
    wire [6:0] carry;
    wire around;
    
    full_adder first_inst(
        .Bit1(NumA[0]),
        .Bit2(NumB[0]),
        .Cin(1'b0),
        .Y(sum[0]),
        .Cout(carry[0])
    );
    
    full_adder second_inst(
        .Bit1(NumA[1]),
        .Bit2(NumB[1]),
        .Cin(carry[0]),
        .Y(sum[1]),
        .Cout(carry[1])
    );
    
    full_adder third_inst(
        .Bit1(NumA[2]),
        .Bit2(NumB[2]),
        .Cin(carry[1]),
        .Y(sum[2]),
        .Cout(carry[2])
    );
    
    full_adder fourth_inst(
        .Bit1(NumA[3]),
        .Bit2(NumB[3]),
        .Cin(carry[2]),
        .Y(sum[3]),
        .Cout(around)
    );
    
       full_adder first2_inst(
        .Bit1(sum[0]),
        .Bit2(0),
        .Cin(around),
        .Y(Comp[0]),
        .Cout(carry[3])
    );
    
    full_adder second2_inst(
        .Bit1(sum[1]),
        .Bit2(0),
        .Cin(carry[3]),
        .Y(Comp[1]),
        .Cout(carry[4])
    );
    
    full_adder third2_inst(
        .Bit1(sum[2]),
        .Bit2(0),
        .Cin(carry[4]),
        .Y(Comp[2]),
        .Cout(carry[5])
    );
    
    full_adder fourth2_inst(
        .Bit1(sum[3]),
        .Bit2(0),
        .Cin(carry[5]),
        .Y(Comp[3]),
        .Cout(carry[6])
    );
    

endmodule