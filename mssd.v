`timescale 1ns/1ns
module MSSD (
    input clk, rst, serIn, clkPB,
    output p0, p1, p2, p3, done, seroutvalid,
    output [6:0] ssd
);
    wire clk_en, clear, cnt1_en, cnt2_en, cntd_en, ldcntd, sh_en, shd_en, cod, co1, co2;
    wire [1:0] portNumOut;
    
    DataPath datapath(clk, rst, clk_en, serIn, clear, cnt1_en, cnt2_en, cntd_en, ldcntd, sh_en, shd_en, portNumOut, p0, p1, p2, p3, cod, co1, co2, ssd);
    Controller controller(clk, rst, clk_en, co1, co2, cod, serIn, clear, cnt1_en, cnt2_en, cntd_en, ldcntd, sh_en, shd_en, seroutvalid, done);
    assign clk_en = 1;
    // OnePulser onepulser(clk, rst, clkPB, clk_en);
endmodule