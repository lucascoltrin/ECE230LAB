module test();

    reg w;
    reg clk;
    reg reset;
    wire z_onehot;
    wire z_binary;
    wire [4:0] onehot_actual;
    wire [2:0] binary_actual;

    top uut(
        .sw(w),
        .btnC(clk),
        .btnU(reset),
        .led({binary_actual, onehot_actual, z_binary, z_onehot})
    );

    task automatic toggle_clock;
        begin
            #1 clk = 1;
            #1 clk = 0;
        end
    endtask

    task automatic check_state_oh(input [2:0] expected_state, input expected_z);
        begin
            if (z_onehot !== expected_z) begin
                $display("FAILED OneHot Check. Expected output %b, found %b", expected_z, z_onehot);
                $finish;
            end
            if (1 << expected_state !== onehot_actual) begin
                $display("FAILED OneHot Check. Expected state %b, found %b", 1 << expected_state, onehot_actual);
                $finish;
            end
        end
    endtask

    task automatic check_state_bn(input [2:0] expected_state, input expected_z);
        begin
            if (z_binary !== expected_z) begin
                $display("FAILED Binary Check. Expected output %b, found %b", expected_z, z_binary);
                $finish;
            end
            if (expected_state !== binary_actual) begin
                $display("FAILED Binary Check. Expected state %b, found %b", expected_state, binary_actual);
                $finish;
            end
        end
    endtask

    task automatic check_state(input [2:0] expected_state, input expected_z);
        begin
            check_state_oh(expected_state, expected_z);
            check_state_bn(expected_state, expected_z);
        end
    endtask

    task automatic do_reset;
        begin
            clk = 0;
            w = 0;
            #1 reset = 1;
            #1 reset = 0;
        end
    endtask

    task automatic next_state(input nextw);
        begin
            w = nextw;
            toggle_clock;
        end
    endtask

    initial begin
        $dumpvars(0,test);

        do_reset;
        check_state('b000, 'b0);

        next_state('b0);
        check_state('b001, 'b0);

        next_state('b0);
        check_state('b010, 'b1);

        next_state('b0);
        check_state('b010, 'b1);

        next_state('b1);
        check_state('b011, 'b0);

        next_state('b1);
        check_state('b100, 'b1);

        next_state('b1);
        check_state('b100, 'b1);

        next_state('b0);
        check_state('b001, 'b0);

        next_state('b1);
        check_state('b011, 'b0);

        next_state('b0);
        check_state('b001, 'b0);

        do_reset;

        next_state('b1);
        check_state('b011, 'b0);

	$display("Test passed!");
	$finish;
    end

endmodule
