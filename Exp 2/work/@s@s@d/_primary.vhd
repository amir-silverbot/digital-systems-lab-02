library verilog;
use verilog.vl_types.all;
entity SSD is
    port(
        dataTransCntOut : in     vl_logic_vector(3 downto 0);
        ssdOut          : out    vl_logic_vector(6 downto 0)
    );
end SSD;
