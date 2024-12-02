`timescale 1ns/1ns
module TestBench;
    reg clk = 0, rst = 0, serIn = 1, clkPB;
    wire p0, p1, p2, p3, done, seroutvalid;
    wire [6:0] ssd;

    MSSD mssd(clk, rst, serIn, clkPB, p0, p1, p2, p3, done, seroutvalid, ssd);

    always begin
        #20 clk = ~clk;
    end

    initial begin
        #5 rst = 1;
        #20 rst = 0;
        #5 serIn = 0;
        #40 serIn = 1;
        #40 serIn = 1;
        #40 serIn = 0;
        #40 serIn = 1;
        #40 serIn = 1;
        #40 serIn = 1;
        #40 serIn = 0;
        #40 serIn = 0;
        #40 serIn = 1;
        #40 serIn = 0;
        #40 serIn = 1;
        #40 serIn = 1;
        #40 serIn = 0;
        #50 $stop;
    end
endmodule
