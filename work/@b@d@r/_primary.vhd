library verilog;
use verilog.vl_types.all;
entity BDR is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        reg_write_enable: in     vl_logic;
        reg_write_dest  : in     vl_logic_vector(2 downto 0);
        reg_write_data  : in     vl_logic_vector(7 downto 0);
        reg_read_addr_1 : in     vl_logic_vector(2 downto 0);
        reg_read_data_1 : out    vl_logic_vector(7 downto 0);
        reg_read_addr_2 : in     vl_logic_vector(2 downto 0);
        reg_read_data_2 : out    vl_logic_vector(7 downto 0)
    );
end BDR;
