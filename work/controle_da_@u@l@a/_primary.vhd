library verilog;
use verilog.vl_types.all;
entity controle_da_ULA is
    port(
        z1              : in     vl_logic_vector(2 downto 0);
        fv              : in     vl_logic_vector(2 downto 0);
        funct           : in     vl_logic_vector(2 downto 0);
        z2              : in     vl_logic_vector(2 downto 0);
        ALUOp           : in     vl_logic_vector(1 downto 0);
        ALUcontrol      : out    vl_logic_vector(2 downto 0)
    );
end controle_da_ULA;
