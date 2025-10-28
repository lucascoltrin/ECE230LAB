`timescale 1ns / 1ps



module byte_memory(
    input [7:0] data,
    input store,
    output reg [7:0] memory
    );
    
    always @(store) begin
        if (store)
            memory <= data;
    end
endmodule
