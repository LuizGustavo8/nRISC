library verilog;
use verilog.vl_types.all;
entity MUX_3bits is
    port(
        i1              : in     vl_logic_vector(2 downto 0);
        i2              : in     vl_logic_vector(2 downto 0);
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end MUX_3bits;
