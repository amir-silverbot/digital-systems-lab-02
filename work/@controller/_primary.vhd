library verilog;
use verilog.vl_types.all;
entity Controller is
    generic(
        IDLE            : vl_logic_vector(1 downto 0) := (Hi0, Hi0);
        GETPORT         : vl_logic_vector(1 downto 0) := (Hi0, Hi1);
        DATANUM         : vl_logic_vector(1 downto 0) := (Hi1, Hi0);
        SHOW            : vl_logic_vector(1 downto 0) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clk_en          : in     vl_logic;
        co1             : in     vl_logic;
        co2             : in     vl_logic;
        cod             : in     vl_logic;
        serIn           : in     vl_logic;
        clear           : out    vl_logic;
        cnt1_en         : out    vl_logic;
        cnt2_en         : out    vl_logic;
        cntd_en         : out    vl_logic;
        ldcntd          : out    vl_logic;
        sh_en           : out    vl_logic;
        shd_en          : out    vl_logic;
        seroutvalid     : out    vl_logic;
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 2;
    attribute mti_svvh_generic_type of GETPORT : constant is 2;
    attribute mti_svvh_generic_type of DATANUM : constant is 2;
    attribute mti_svvh_generic_type of SHOW : constant is 2;
end Controller;
