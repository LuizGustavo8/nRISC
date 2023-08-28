library verilog;
use verilog.vl_types.all;
entity MDD is
    port(
        clk             : in     vl_logic;
        mem_access_addr : in     vl_logic_vector(7 downto 0);
        mem_write_data  : in     vl_logic_vector(7 downto 0);
        mem_write_en    : in     vl_logic;
        mem_read        : in     vl_logic;
        mem_read_data   : out    vl_logic_vector(7 downto 0)
    );
end MDD;
