library verilog;
use verilog.vl_types.all;
entity MSSD is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        serIn           : in     vl_logic;
        clkPB           : in     vl_logic;
        p0              : out    vl_logic;
        p1              : out    vl_logic;
        p2              : out    vl_logic;
        p3              : out    vl_logic;
        done            : out    vl_logic;
        seroutvalid     : out    vl_logic;
        ssd             : out    vl_logic_vector(6 downto 0)
    );
end MSSD;
