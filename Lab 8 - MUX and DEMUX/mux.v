`timescale 1ns / 1ps
module mux(
    input [3:0] CEO, [3:0] You, [3:0] Fred, [3:0] Jill,
    input [1:0] Sel, 
    input Enable,
    output [3:0] data
    );
    
    assign data = {Enable, Enable, Enable, Enable} & (Sel == 'b00 ? CEO :
                       Sel == 'b01 ? You :
                       Sel == 'b10 ? Fred : Jill);
endmodule
