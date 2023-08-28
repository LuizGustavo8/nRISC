library verilog;
use verilog.vl_types.all;
entity PC_Reg is
    port(
        PCOut           : out    vl_logic_vector(31 downto 0);
        PCin            : in     vl_logic_vector(31 downto 0);
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end PC_Reg;
