`timescale 1ns / 1ps

// Top level of test, think of this like
// top.v but for simulation
module test();
    reg [9:0] sw;
    wire [13:0] leds;

    // Instantiate the Unit Under Test (UUT)
    // This is our code being "plugged in"
    // to the simulation
    // We are wiring up fake switches and
    // LEDs
    top uut (
        .sw(sw),
        .led(leds)
    );
    
    // Tasks are like onto functions
    // We have spent this whole time talking about
    // how Verilog isn't a programming language
    // However, there is an aspect to it that is,
    // and that is simulation.
    // Simulations do have actual flow and programming,
    // but still use the Verilog syntax
    
    // Task to test half_sub module
    task test_half_sub(input a, input b);
        reg expected_y;
        reg expected_b_out;
        begin
            // Assign inputs
            sw[0] = a;
            sw[1] = b;
            #10; // Wait for some time for output to settle
            
            expected_y =  a ^ b;
            expected_b_out = ~a & b;
            #10; // Wait for some time for output to settle

            // Check results
            if (leds[0] === expected_y && leds[1] === expected_b_out) 
                $display("half_sub Test Passed: A=%b, B=%b => Y=%b, B_out=%b", a, b, leds[0], leds[1]);
            else 
                $display("half_sub Test Failed: A=%b, B=%b => Y=%b, B_out=%b (Expected Y=%b, B_out=%b)", 
                         a, b, leds[0], leds[1], expected_y, expected_b_out);
        end
    endtask

    // Task to test ones_complement module
    task test_ones_compliment(input [3:0] a, input [3:0] b, input [3:0] expected_y);
        begin
            // Assign inputs
            sw[5:2] = a;
            sw[9:6] = b;
            #10; // Wait for some time for output to settle
            
            // Check results
            if (leds[5:2] === expected_y) 
                $display("ones_compliment Test Passed: A=%b, B=%b => Y=%b", a, b, leds[5:2]);
            else 
                $display("ones_compliment Test Failed: A=%b, B=%b => Y=%b (Expected Y=%b)", 
                         a, b, leds[5:2], expected_y);
        end
    endtask
    
    // Task to test twos_complement module
    task test_twos_compliment(input [7:0] a);
        reg [7:0] expected_y;
        begin
            // Assign input
            sw[9:2] = a;
            #10; // Wait for some time for output to settle
            expected_y =~a+1;
            #10; // Wait for some time for output to settle
            // Check results
            if (leds[13:6] === expected_y) 
                $display("twos_compliment Test Passed: A=%b => Y=%b", a, leds[13:6]);
            else 
                $display("twos_compliment Test Failed: A=%b => Y=%b (Expected Y=%b)", 
                         a, leds[13:6], expected_y);
        end
    endtask

    // Main test sequence
    initial begin
        // Test Half Sub 
        test_half_sub(1, 1); // 0 - 1 = 0, Borrow = 1

        // Test One's Complement 
        //                     +7      -5
        test_ones_compliment(4'b0111, 4'b0101, 4'b0010);
        //                      +10      -7     
        test_ones_compliment(4'b1010, 4'b0111, 4'b0011);

        // Test twos_complement
        test_twos_compliment(8'b01010111);
        test_twos_compliment(8'b00000001);
        test_twos_compliment(8'b00000010); 
        test_twos_compliment(8'b00001000); 
        #50 $finish;
    end
endmodule
