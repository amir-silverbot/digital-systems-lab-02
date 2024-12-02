`timescale 1ns/1ns
module DataNumShr (
    input clk, rst, clk_en, enable, serIn, clear,
    output reg [3:0] num_data
);
    always @(posedge clk, posedge rst) begin
		if (rst) num_data = 4'd0;
		else if (clear) num_data = 4'd0;
		else if (enable & clk_en) begin
			num_data = num_data << 1;
			num_data[0] = serIn;
		end
	end
endmodule
