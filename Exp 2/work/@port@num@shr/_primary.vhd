library verilog;
use verilog.vl_types.all;
entity PortNumShr is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clk_en          : in     vl_logic;
        enable          : in     vl_logic;
        serIn           : in     vl_logic;
        clear           : in     vl_logic;
        port_num        : out    vl_logic_vector(1 downto 0)
    );
end PortNumShr;
