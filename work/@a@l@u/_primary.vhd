library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        ALUcontrol      : in     vl_logic_vector(2 downto 0);
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        ALUout          : out    vl_logic_vector(7 downto 0);
        zero            : out    vl_logic;
        shamt           : in     vl_logic_vector(2 downto 0)
    );
end ALU;
