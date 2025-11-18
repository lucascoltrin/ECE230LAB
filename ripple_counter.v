`timescale 1ns / 1ps
module ripple_counter(
    input clock,
    input reset,
    output [2:0] count
    );
    
    tff tff_Bit0(
        .T(1'b1),
        .clk(clock),
        .reset(reset),
        .Q(count[0])
    );
    
    tff tff_Bit1(
        .T(1'b1),
        .clk(count[0]),
        .reset(reset),
        .Q(count[1])
    );
    
    tff tff_Bit2(
        .T(1'b1),
        .clk(count[1]),
        .reset(reset),
        .Q(count[2])
    );
endmodule
