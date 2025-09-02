`timescale 10ns/1ns

module test;

    // Set up signals that match to
    // your module under test
    // In this case, that is top
    // So we have to match up sw and led
    // with that in top.v
    reg [15:0] sw;
    wire [15:0] led;

    // We will talk about this later :)
    pulldown(led[0]);

    // "plug" in a top.v
    // you can think of this not as function calls
    // but instead as clicking in a discrete circuit
    // on a breadboard.
    // We will actually do this!
    top dut(
        .sw(sw),
        .led(led)
    );

    // Begins the test process
    initial begin
        // Dump out to a waveform file
        $dumpvars(0, test);

        // Turn off switch 0
        sw[0] = 0;
        
        // Make sure LED 0 is off
        if (led[0] != 0) begin
            $display("Test failed!");
            $finish;
        end

        // Wait 20 ns
        #20;
        // Turn on switch 0
        sw[0] = 1;

        // Wait 20 ns
        #20;

        // Make sure LED 0 is on
        if (led[0] != 1) begin
            $display("Test failed!");
            $finish;
        end
        
        // Wait 20 ns
        #20;

        // Test pased!
        $display("Test passed!");
        $finish;
    end
endmodule
