`timescale 1ns/1ns
module OnePulser(
	input clk, rst, lp,
	output reg sp
);
	parameter [1:0] A = 2'd0, B = 2'd1, C = 2'd2;
	reg [1:0] ps, ns = 2'd0;
	
	always @* begin
		case(ps)
			A: ns = lp ? B : A;
			B: ns = C;
			C: ns = lp ? C : A;
			default ns = A;
		endcase
	end
	
	always @* begin
		case(ps)
			A: sp = 0;
			B: sp = 1;
			C: sp = 0;
			default: sp = 0;
		endcase
	end
	
	always @(posedge clk, posedge rst) begin
		if (rst) ps <= 2'b0;
		else ps <= ns;
	end
endmodule
