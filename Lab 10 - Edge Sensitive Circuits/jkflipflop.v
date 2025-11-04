module jkflipflop(
    input J, K, store,
    output Q, 
    output notQ
);
    wire memory;
    
    dflipflop inst_e(
        .D(memory),
        .store(store),
        .Q(Q),
        .notQ(notQ)
    );
    
    assign memory = (J & ~Q) | (~K & Q);

endmodule