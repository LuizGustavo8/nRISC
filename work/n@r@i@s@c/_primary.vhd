library verilog;
use verilog.vl_types.all;
entity nRISC is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        pc_out          : out    vl_logic_vector(7 downto 0);
        resultado_ula   : out    vl_logic_vector(7 downto 0);
        valorlido       : out    vl_logic_vector(7 downto 0);
        valorescrito    : out    vl_logic_vector(7 downto 0);
        endereco        : out    vl_logic_vector(17 downto 0);
        alu_op_controle : out    vl_logic_vector(0 to 1);
        reg_dst_controle: out    vl_logic;
        mem_to_reg_controle: out    vl_logic;
        jump_controle   : out    vl_logic;
        branch_controle : out    vl_logic;
        mem_read_controle: out    vl_logic;
        mem_write_controle: out    vl_logic;
        alu_src_controle: out    vl_logic;
        reg_write_controle: out    vl_logic
    );
end nRISC;
