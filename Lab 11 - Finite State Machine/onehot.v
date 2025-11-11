module onehot(
    input w,
    input clk,
    input reset,
    output z,
    output [4:0] outputstate
);

    wire Anext, Bnext, Cnext, Dnext, Enext;
    wire Astate, Bstate, Cstate, Dstate, Estate;
    
    dff Adff(
        .Default(1'b1),
        .D(Anext),
        .clk(clk),
        .reset(reset),
        .Q(Astate)
    );
    
    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .reset(reset),
        .Q(Bstate)
    );
    
    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .reset(reset),
        .Q(Cstate)
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .reset(reset),
        .Q(Dstate)
    );
    
    dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .reset(reset),
        .Q(Estate)
    );

    assign z = Cstate | Estate;
    
    assign Anext = 0;
    assign Bnext = ~w & (Astate | Dstate | Estate);
    assign Cnext = ~w & (Bstate | Cstate);
    assign Dnext = w & (Astate | Bstate | Cstate);
    assign Enext = w & (Dstate | Estate);
    
    assign outputstate = {Estate, Dstate, Cstate, Bstate, Astate};
    
endmodule