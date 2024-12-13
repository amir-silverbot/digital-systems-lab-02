`timescale 1ns/1ns
module DDS (
    input clk, rst,
    output [8:0] ddsOut
);
    reg phasePos, signBit;
    
    reg [7:0] lut [0:63];
    initial begin
        $readmemb("sine.mem", lut);
    end

    reg [5:0] counter = 6'b0;
    wire cout;
    assign cout = (counter == 6'd63);
    always @(posedge clk or posedge rst) begin
        if (rst) counter = 0;
        else counter = counter + 1;
    end

    wire [5:0] lutAddr;
    assign lutAddr = (phasePos) ? ~counter + 1 : counter;
    
    wire norOut;
    assign norOut = ~(|counter);

    wire muxSelect;
    assign muxSelect = norOut & phasePos;

    wire [7:0] sineValue;
    assign sineValue = (muxSelect) ? 8'b11111111 : lut[lutAddr];

    assign ddsOut = (signBit) ? ~sineValue + 1'b1 + 8'd255 : {1'b0, sineValue};

    reg [1:0] ps, ns;
    always @* begin
        if (rst) ns = 2'b0;
        else begin
            case (ps)
                2'b00: begin
                    ns = (cout) ? 2'b01 : 2'b00;
                    phasePos = 0;
                    signBit = 0;
                end
                2'b01: begin
                    ns = (cout) ? 2'b10 : 2'b01;
                    phasePos = 1;
                    signBit = 0;
                end
                2'b10: begin
                    ns = (cout) ? 2'b11 : 2'b10;
                    phasePos = 0;
                    signBit = 1;
                end
                2'b11: begin
                    ns = (cout) ? 2'b00 : 2'b11;
                    phasePos = 1;
                    signBit = 1;
                end
            endcase
        end
    end

    always @(posedge clk) begin
        ps = ns;
    end
endmodule