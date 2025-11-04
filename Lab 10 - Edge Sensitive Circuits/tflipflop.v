`timescale 1ns / 1ps

module tflipflop(
    input T, store,
    output reg Q, 
    output notQ

    );
    
    initial begin
        Q <= 0;
    end
    always @(posedge store) begin
        if(store)
            Q <= Q ^ T;
    end
    
    assign notQ = ~Q;
endmodule
