`timescale 1ns/1ns
module Controller (
    input clk, rst, clk_en, co1, co2, cod, serIn,
    output reg clear, cnt1_en, cnt2_en, cntd_en, ldcntd, sh_en, shd_en, seroutvalid, done
);
    parameter [1:0] IDLE = 2'd0, GETPORT = 2'd1, DATANUM = 2'd2, SHOW = 2'd3;
	reg [1:0] ps, ns = 2'd0;

    always @* begin
        ns = IDLE;
        case (ps)
            IDLE: ns = serIn ? IDLE : GETPORT;
            GETPORT: ns = co1 ? DATANUM : GETPORT;
            DATANUM: ns = co2 ? SHOW : DATANUM;
            SHOW: ns = cod ? IDLE : SHOW;
            default: ns = IDLE;
        endcase
    end

    always @* begin
        cnt1_en = 0;
        cnt2_en = 0;
        cntd_en = 0;
        ldcntd = 0;
        sh_en = 0;
        shd_en = 0;
        seroutvalid = 0;
        done = 0;
        clear = 0;
        case (ps)
            IDLE: begin
                done = 1;
                clear = 1;
            end
            GETPORT: begin
                sh_en = 1;
                cnt1_en = 1;
            end
            DATANUM: begin
                cnt2_en = 1;
                ldcntd = 1;
                shd_en = 1;
            end
            SHOW: begin
                cntd_en = 1;
                seroutvalid = 1;
            end
        endcase
    end

    always @(posedge clk, posedge rst) begin
		if (rst) ps <= 2'b0;
		else if (clk_en) ps <= ns;
	end
endmodule
