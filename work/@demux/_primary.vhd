library verilog;
use verilog.vl_types.all;
entity Demux is
    port(
        data            : in     vl_logic;
        \select\        : in     vl_logic_vector(1 downto 0);
        p0              : out    vl_logic;
        p1              : out    vl_logic;
        p2              : out    vl_logic;
        p3              : out    vl_logic
    );
end Demux;
