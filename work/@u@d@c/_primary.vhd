library verilog;
use verilog.vl_types.all;
entity UDC is
    port(
        opcode          : in     vl_logic_vector(2 downto 0);
        alu_op          : out    vl_logic_vector(1 downto 0);
        reg_dst         : out    vl_logic;
        mem_to_reg      : out    vl_logic;
        jump            : out    vl_logic;
        branch          : out    vl_logic;
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        alu_src         : out    vl_logic;
        reg_write       : out    vl_logic
    );
end UDC;
