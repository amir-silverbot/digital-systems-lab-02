`timescale 1ns/1ns
module Demux(
	input data,
	input [1:0] select,
	output reg p0, p1, p2, p3
);
	always @* begin
		p0 = 0; p1 = 0; p2 = 0; p3 = 0;
		case(select)
			2'd0: p0 = data;
			2'd1: p1 = data;
			2'd2: p2 = data;
			2'd3: p3 = data;
		endcase
	end
endmodule
