`timescale 1ns/1ns
module DDSTB;
    reg clk, rst;
    wire [8:0] out;
    DDS dds(clk, rst, out);

    initial begin
        clk = 1'b0;
        repeat(1000) #5 clk = ~clk;
    end

    initial begin
        #3 rst = 1;
        #10 rst = 0;
    end

endmodule