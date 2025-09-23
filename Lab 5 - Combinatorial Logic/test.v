`timescale 1ns/1ps

module test;
    // 4‑bit stimulus (A,B,C,D) will count from 0 to 15
    reg  [3:0] stimulus;
    wire       a_y, b_y;

    // Connect stimulus bits to module ports
    wire A = stimulus[3];
    wire B = stimulus[2];
    wire C = stimulus[1];
    wire D = stimulus[0];

    // Instantiate the two circuits under test
    circuit_a uut_a (
        .A(A), .B(B), .C(C), .D(D),
        .Y(a_y)
    );

    circuit_b uut_b (
        .A(A), .B(B), .C(C), .D(D),
        .Y(b_y)
    );

    // Expected‑output vectors (16‑bit each)
    // Replace the literals below with the values from your truth table
    // Bit 15 corresponds to the stimulus = 4'b1111, bit 0 to 4'b0000
    localparam [15:0] EXPECTED_A = 16'b0000000010101010; // expected Y for circuit_a
    localparam [15:0] EXPECTED_B = 16'b1111000101010001; // expected Y for circuit_b

    integer i;
    initial begin
        $dumpvars(0, test);
        $display("Stim  A B C D | Y_a Y_b | Exp_a Exp_b");
        for (i = 0; i < 16; i = i + 1) begin
            stimulus = i[3:0];
            #1; // small delay for combinational logic to settle
            $display("%b %b %b %b |  %b   %b |   %b    %b",
                     A, B, C, D,
                     a_y, b_y,
                     EXPECTED_A[i], EXPECTED_B[i]);
            // Simple check – flag a mismatch
            if (a_y !== EXPECTED_A[i]) $error("Mismatch in circuit_a at %0d", i);
            if (b_y !== EXPECTED_B[i]) $error("Mismatch in circuit_b at %0d", i);
        end
        $finish;
    end
endmodule

