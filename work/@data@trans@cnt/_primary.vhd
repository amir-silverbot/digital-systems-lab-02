library verilog;
use verilog.vl_types.all;
entity DataTransCnt is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clk_en          : in     vl_logic;
        enable          : in     vl_logic;
        load            : in     vl_logic;
        clear           : in     vl_logic;
        num_data        : in     vl_logic_vector(3 downto 0);
        cout            : out    vl_logic;
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end DataTransCnt;
