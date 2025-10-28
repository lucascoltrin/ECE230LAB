`timescale 1ns / 1ps
module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output reg [7:0] memory
    );
    
    reg [7:0] data_trans[3:0];
    wire[7:0] mem_trans[3:0];
    reg [3:0] store_trans;    
    always @(*) begin 
        case(addr)
            2'b00: data_trans[0] <= data; 
            2'b01: data_trans[1] <= data;
            2'b10: data_trans[2] <= data;
            2'b11: data_trans[3] <= data;
        endcase
    end
        
    always @(*) begin 
        case(addr)
            2'b00: store_trans[0] <= store; 
            2'b01: store_trans[1] <= store;
            2'b10: store_trans[2] <= store;
            2'b11: store_trans[3] <= store;
        endcase
    end
    
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            byte_memory inst(
              .data(data_trans[i]),
              .store(store_trans[i]),
              .memory(mem_trans[i])
            ); 
        end
    endgenerate
    
    always @(*) begin 
        case(addr)
            2'b00: memory <= mem_trans[0]; 
            2'b01: memory <= mem_trans[1];
            2'b10: memory <= mem_trans[2];
            2'b11: memory <= mem_trans[3];
        endcase
    end
       
endmodule
