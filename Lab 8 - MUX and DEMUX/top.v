`timescale 1ns / 1ps
module top(
    input [15:0]sw,
    input btnL, btnU, btnD, btnR, btnC,
    output [15:0]led
    );
    
    wire [1:0] muxSel;
    wire [1:0] demuxSel;
    wire [3:0]w1;
    
    assign muxSel = {btnU, btnL};
    assign demuxSel = {btnR, btnD};
    
    mux m_inst(
        .CEO(sw[3:0]),
        .You(sw[7:4]),
        .Fred(sw[11:8]),
        .Jill(sw[15:12]),
        .Sel(muxSel),
        .Enable(btnC),
        .data(w1)
    );
    
    demux d_inst(
        .data(w1),
        .Sel(demuxSel),
        .Enable(btnC),
        .local_lib(led[3:0]),
        .fire(led[7:4]),
        .school(led[11:8]),
        .rib(led[15:12])
    );
endmodule
