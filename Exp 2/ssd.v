`timescale 1ns/1ns
module SSD(
    input [3:0] dataTransCntOut,
    output reg [6:0] ssdOut
);
    always @* begin
        case (dataTransCntOut)
            4'h0: ssdOut = 7'h40;
            4'h1: ssdOut = 7'h79;
            4'h2: ssdOut = 7'h24;
            4'h3: ssdOut = 7'h30;
            4'h4: ssdOut = 7'h19;
            4'h5: ssdOut = 7'h12;
            4'h6: ssdOut = 7'h02;
            4'h7: ssdOut = 7'h78;
            4'h8: ssdOut = 7'h00;
            4'h9: ssdOut = 7'h10;
            4'ha: ssdOut = 7'h08;
            4'hb: ssdOut = 7'h03;
            4'hc: ssdOut = 7'h46;
            4'hd: ssdOut = 7'h21;
            4'he: ssdOut = 7'h06;
            4'hf: ssdOut = 7'h0e;
        endcase
    end
endmodule