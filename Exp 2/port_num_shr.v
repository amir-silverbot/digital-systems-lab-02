`timescale 1ns/1ns
module PortNumShr(
	input clk, rst, clk_en, enable, serIn, clear,
	output reg [1:0] port_num
);
	always @(posedge clk, posedge rst) begin
		if (rst) port_num = 2'd0;
		else if (clear) port_num = 2'd0;
		else if (enable & clk_en) begin
			port_num = port_num << 1;
			port_num[0] = serIn;
		end
	end
endmodule
