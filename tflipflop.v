`timescale 1ns / 1ps
module tff(
    input T, 
    input clk,
    input reset,
    output reg Q 
    );
    
    initial begin
        Q <= 0;
    end
    always @(posedge clk) begin
        if (reset)
            Q <= 1'b0;
        else if(clk)
            Q <= Q ^ T;
    end
    
endmodule
