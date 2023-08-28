library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pc_next         : in     vl_logic_vector(7 downto 0);
        pc_current      : out    vl_logic_vector(7 downto 0)
    );
end PC;
