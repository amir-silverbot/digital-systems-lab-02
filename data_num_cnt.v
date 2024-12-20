`timescale 1ns/1ns
module DataNumCnt(
	input clk, rst, clk_en, enable, clear,
	output cout
);
	reg [2:0] count;
	assign cout = (count == 3'd4) ? 1 : 0;
	
	always @(posedge clk, posedge rst) begin
		if (rst) count = 3'd0;
		else if (clear) count = 3'd0;
		else if (cout & enable & clk_en) count = 3'd0;
		else if (enable & clk_en) count = count + 1;
	end
endmodule
