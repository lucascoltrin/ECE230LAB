module test();
    reg [3:0] sw;
    reg btnC;
    wire [5:0] led;

    top uut(
        .sw(sw),
        .led(led),
        .btnC(btnC)
    );

    task automatic toggle_clock;
        begin
            #1 btnC = 1;
            #1 btnC = 0;
        end
    endtask

    task automatic set_check_dff(input D, input ExpectedQ);
        begin
            sw[0] = D;
            toggle_clock();
            if (led[0] != ExpectedQ || led[1] == ExpectedQ) begin
                $display("D FF test failed: expected Q = %b, ~Q = %b got %b | %b", ExpectedQ, ~ExpectedQ, led[0], led[1]);
                $finish;
            end
        end
    endtask

    task automatic set_check_jkff(input J, input K, input ExpectedQ);
        begin
            sw[1] = J;
            sw[2] = K;
            toggle_clock();
            if (led[2] != ExpectedQ || led[3] == ExpectedQ) begin
                $display("JK FF test failed: expected Q = %b, ~Q = %b got %b | %b", ExpectedQ, ~ExpectedQ, led[2], led[3]);
                $finish;
            end
        end
    endtask

    task automatic set_check_tff(input T, input ExpectedQ);
        begin
            sw[3] = T;
            toggle_clock();
            if (led[4] != ExpectedQ || led[5] == ExpectedQ) begin
                $display("T FF test failed: expected Q = %b, ~Q = %b got %b | %b", ExpectedQ, ~ExpectedQ, led[4], led[5]);
                $finish;
            end
        end
    endtask

    initial begin
        $dumpvars(0,test);
        btnC = 0;
        sw = 4'b0;
        toggle_clock();
        
        set_check_dff(0, 0);
        set_check_dff(1, 1);

        set_check_jkff(0, 1, 0);
        set_check_jkff(0, 0, 0);
        set_check_jkff(1, 0, 1);
        set_check_jkff(0, 0, 1);
        set_check_jkff(1, 1, 0);
        set_check_jkff(1, 1, 1);

        set_check_tff(0, 0);
        set_check_tff(1, 1);
        set_check_tff(0, 1);
        set_check_tff(1, 0);
    
        $display("Test passed!!");
        $finish;
    end

endmodule