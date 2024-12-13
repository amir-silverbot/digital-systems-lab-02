`timescale 1ns/1ns
module PWM (
    input clk, rst, in,
    output out
);
    reg counter = 8'b0;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter = 8'b0;
        end
        else counter = counter + 1;
    end

    assign out = (in > counter) ? 1 : 0;
endmodule