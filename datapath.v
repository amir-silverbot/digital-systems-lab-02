module DataPath(
    input clk, rst, clk_en, serIn, clear,
    input cnt1_en, cnt2_en, cntd_en, ldcntd, sh_en, shd_en,
    output [1:0] portNumOut,
    output p0, p1, p2, p3, cod, co1, co2,
    output [6:0] ssdOut
);
    wire [3:0] dataNumShrOut, dataTransCntOut;

    PortNumShr shrPort(clk, rst, clk_en, sh_en, serIn, clear, portNumOut);
    Demux demux(serIn, portNumOut, p0, p1, p2, p3);
    PortCnt cntPort(clk, rst, clk_en, cnt1_en, clear, co1);
    DataNumCnt cntDataNum(clk, rst, clk_en, cnt2_en, clear, co2);
    DataNumShr shrDataNum(clk, rst, clk_en, shd_en, serIn, clear, dataNumShrOut);
    DataTransCnt cntDataTrans(clk, rst, clk_en, cntd_en, ldcntd, clear, dataNumShrOut, cod, dataTransCntOut);
    SSD ssd(dataTransCntOut, ssdOut);
endmodule