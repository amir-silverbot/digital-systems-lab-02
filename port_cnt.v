`timescale 1ns/1ns
module PortCnt(
	input clk, rst, clk_en, enable, clear,
	output cout
);
	reg [1:0] count;
	assign cout = (count == 2'd2) ? 1 : 0;
	
	always @(posedge clk, posedge rst) begin
		if (rst) count = 2'd0;
		else if (clear) count = 2'd0;
		else if (cout & enable & clk_en) count = 2'd0;
		else if (enable & clk_en) count = count + 1;
	end
endmodule
