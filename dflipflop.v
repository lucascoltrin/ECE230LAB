`timescale 1ns / 1ps

module dff(
    input D,
    input clk,
    input reset,
    output reg Q
);

    initial begin
        Q <= 1'b0;
    end

    always @(posedge clk, posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else if(clk)
            Q <= D;
    end

endmodule