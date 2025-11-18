`timescale 1ns/1ps

module test();

    reg clk;
    reg rst;
    wire [2:0] mc_state;
    wire [2:0] rc_state;
    assign rc_out = rc_state[2];
    wire mc_out;

    integer i;

    top uut(
        .btnC(clk),
        .btnU(rst),
        .led({mc_out, mc_state, rc_state})
    );

    initial begin
        $dumpvars(0,test);
        clk = 0;
        rst = 1;
        #10;
        rst = 0;
        #10;

        for (i = 0; i < 14; i = i + 1) begin
            #1 clk = ~clk;
        end
        #1;
        // We should have toggled the /6 modulo counter
        if (mc_out !== 1'b1) begin
            $display("Failed to trigger the modulo counter");
        end

        for (i = 0; i < 2; i = i + 1) begin
            #1 clk = ~clk;
        end
        #1;
        // We should have toggled the /8 ring counter
        if (rc_state[2] !== 1'b0) begin
            $display("Failed to toggle final bit of the ring counter output off");
        end

        for (i = 0; i < 14; i = i + 1) begin
            #1 clk = ~clk;
        end
        #1;
        // We should have toggled the /6 modulo counter
        if (mc_out !== 1'b0) begin
            $display("Reset logic in modulo counter is wrong");
        end
    end

endmodule