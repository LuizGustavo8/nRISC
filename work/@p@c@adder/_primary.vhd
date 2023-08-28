library verilog;
use verilog.vl_types.all;
entity PCAdder is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        PCResult        : in     vl_logic_vector(7 downto 0);
        PCAddResult     : out    vl_logic_vector(7 downto 0)
    );
end PCAdder;
