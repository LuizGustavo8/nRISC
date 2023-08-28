library verilog;
use verilog.vl_types.all;
entity MDI is
    port(
        pc              : in     vl_logic_vector(7 downto 0);
        instruction     : out    vl_logic_vector(17 downto 0)
    );
end MDI;
