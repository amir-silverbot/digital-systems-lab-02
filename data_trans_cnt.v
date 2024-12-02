`timescale 1ns/1ns
module DataTransCnt(
	input clk, rst, clk_en, enable, load, clear,
	input [3:0] num_data,
	output cout,
	output [3:0] out
);
	reg [4:0] count;
	assign cout = (count == 5'd0) ? 1 : 0;
	assign out = count[3:0];
	
	always @(posedge clk, posedge rst) begin
		if (rst) count = 5'd31;
		else if (clear) count = 5'd31;
		else if (load & clk_en) count = {1'b0, num_data};
		else if (cout & enable & clk_en) count = 5'd31;
		else if (enable & clk_en) count = count - 1;
	end
endmodule
