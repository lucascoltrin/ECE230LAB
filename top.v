`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 09:03:49 AM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input btnU,
    input btnC,
    output [6:0] led

    );
   
    modulo_counter inst_mc(
        .clock(btnC),
        .reset(btnU),
        .count(led[5:3]),
        .out(led[6])
    );
    
    ripple_counter inst_rc(
        .clock(btnC),
        .reset(btnU),
        .count(led[2:0])
    );
endmodule
