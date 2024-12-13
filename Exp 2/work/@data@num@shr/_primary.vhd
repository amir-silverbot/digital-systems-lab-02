library verilog;
use verilog.vl_types.all;
entity DataNumShr is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clk_en          : in     vl_logic;
        enable          : in     vl_logic;
        serIn           : in     vl_logic;
        clear           : in     vl_logic;
        num_data        : out    vl_logic_vector(3 downto 0)
    );
end DataNumShr;
