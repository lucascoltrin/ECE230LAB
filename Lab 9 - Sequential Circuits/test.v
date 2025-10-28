`timescale 1ns/1ps

module test();

reg D, E;
reg [7:0] data;
reg [1:0] addr;
reg [15:0] sw;
wire [15:0] led;
wire Q, NotQ;
wire [7:0] memory;

top uut(
    .sw(sw),
    .btnC(E),
    .led(led)
);

assign Q = led[0];
assign NotQ = led[1];
assign memory = led[15:8];

always @(*) begin
    sw <= {data, addr, 5'b0, D};
end

initial begin
    $dumpvars(0,test);
    data = 0;
    addr = 0;
    D = 0;
    E = 0;
    #1;
    E = 1;
    #1;
    E = 0;
    #1;
    if (Q || ~NotQ) begin
        $display("FAILED test. We should be in the unset state");
        $finish;
    end
    #1;
    D = 1;
    #1;
    if (Q || ~NotQ) begin
        $display("FAILED test. We should be in the unset state");
        $finish;
    end
    #1;
    E = 1;
    #1;
    E = 0;
    #1;
    if (~Q || NotQ) begin
        $display("FAILED test. We should be in the set state");
        $finish;
    end
    #1;
    D = 0;
    #1;
    if (~Q || NotQ) begin
        $display("FAILED test. We should be in the set state");
        $finish;
    end
    #1;
    data = 'b00000011;
    addr = 0;
    #1;
    E = 1;
    #1;
    E = 0;
    #1;
    data = 'b00001100;
    addr = 1;
    #1;
    E = 1;
    #1;
    E = 0;
    #1;
    data = 'b00110000;
    addr = 2;
    #1;
    E = 1;
    #1;
    E = 0;
    #1;
    data = 'b11000000;
    addr = 3;
    #1;
    E = 1;
    #1;
    E = 0;
    #1;
    data = 0;
    addr = 0;
    #1;
    if (memory != 'b00000011) begin
        $display("FAILED test. Should retain previous value");
        $finish;
    end
    #1;
    addr = 1;
    #1;
    if (memory != 'b00001100) begin
        $display("FAILED test. Should retain previous value");
        $finish;
    end
    #1;
    addr = 2;
    #1;
    if (memory != 'b00110000) begin
        $display("FAILED test. Should retain previous value");
        $finish;
    end
    #1;
    addr = 3;
    #1;
    if (memory != 'b11000000) begin
        $display("FAILED test. Should retain previous value");
        $finish;
    end
    #1;
    $display("PASSED test");
    $finish;
end

endmodule
