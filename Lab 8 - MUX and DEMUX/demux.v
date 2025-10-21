`timescale 1ns / 1ps
module demux(
    input [3:0] data,
    input [1:0] Sel, 
    input Enable,
    output [3:0] local_lib, fire, school,rib
    );

                            
    assign local_lib = Enable ? (Sel =='b00 ? data : 'b0): 'b0;
    assign fire = Enable ? (Sel =='b01 ? data : 'b0): 'b0;
    assign school = Enable ? (Sel =='b10 ? data : 'b0): 'b0;
    assign rib = Enable ? (Sel =='b11 ? data : 'b0): 'b0;    

endmodule
