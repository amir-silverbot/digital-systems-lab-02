library verilog;
use verilog.vl_types.all;
entity PortCnt is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clk_en          : in     vl_logic;
        enable          : in     vl_logic;
        clear           : in     vl_logic;
        cout            : out    vl_logic
    );
end PortCnt;
