module dflipflop(
    input D, store,
    output reg Q, 
    output notQ
);

    initial begin
        Q <= 0;
    end
    always @(posedge store) begin
        if(store)
            Q <= D;
    end
    
    assign notQ = ~Q;

endmodule