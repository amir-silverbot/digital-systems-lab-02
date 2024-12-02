library verilog;
use verilog.vl_types.all;
entity DataPath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clk_en          : in     vl_logic;
        serIn           : in     vl_logic;
        clear           : in     vl_logic;
        cnt1_en         : in     vl_logic;
        cnt2_en         : in     vl_logic;
        cntd_en         : in     vl_logic;
        ldcntd          : in     vl_logic;
        sh_en           : in     vl_logic;
        shd_en          : in     vl_logic;
        portNumOut      : out    vl_logic_vector(1 downto 0);
        p0              : out    vl_logic;
        p1              : out    vl_logic;
        p2              : out    vl_logic;
        p3              : out    vl_logic;
        cod             : out    vl_logic;
        co1             : out    vl_logic;
        co2             : out    vl_logic;
        ssdOut          : out    vl_logic_vector(6 downto 0)
    );
end DataPath;
