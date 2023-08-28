`include "banco_de_registradores.v"
`include "memoria_de_instrucoes.v"
`include "memoria_de_dados.v"
`include "PC.v"
`include "ULA.v"
`include "unidade_de_controle.v"
`include "Mux_3bits.v"
`include "Mux_8bits.v"
`include "controle_da_ULA.v"

module nRISC(input clock, reset,
				output[7:0]pc_out, resultado_ula,
				output[7:0]valorlido,
				output[7:0]valorescrito,
				output[17:0]endereco,
				output[0:1] alu_op_controle,
				output reg_dst_controle,
				output mem_to_reg_controle,
				output jump_controle,
				output branch_controle,
				output mem_read_controle,
				output mem_write_controle,
				output alu_src_controle,
				output reg_write_controle);

reg [7:0] pc_current;
wire[7:0] pc1;
wire [17:0] instruction;
wire [1:0] alu_op;
wire reg_dst,mem_to_reg,jump,branch,mem_read,mem_write,alu_src,reg_write;
wire [2:0] reg_write_dest;
wire [7:0] reg_write_data;  
wire [2:0] reg_read_addr_1;  
wire [7:0] reg_read_data_1;  
wire [2:0] reg_read_addr_2;  
wire [7:0] reg_read_data_2;
wire [7:0] B_ULA;
wire [2:0] z1, fv, z2;//0,5,0
wire [2:0] ALUcontrol;
wire [7:0] ALU_out;
wire [7:0] PC_4beq,PC_beq, PC_jump;
wire [7:0] mem_read_data;
wire beq_control;
// PC + 1
assign pc1 = pc_current + 1;
assign z1 = 3'b000; 
assign fv = 3'b101; 
assign z2 = 3'b000;
//PC pc(clock,reset, pc_next, pc_current);
always @(posedge clock or posedge reset)  
 begin   
      if(beq_control==1'b1)   
           pc_current = PC_beq;  
      if(jump == 1'b1)  
            pc_current = PC_jump;
		if(reset)
				pc_current = 0;
		if(clock)
				pc_current = pc1;
 end	

//Memoria_de_instrucoes
MDI mem_de_instrucoes(pc_current, instruction);
//Unidade_de_controle
UDC unidade_de_controle(instruction[17:15],alu_op,reg_dst,mem_to_reg,jump,branch,mem_read,mem_write,alu_src,reg_write);
//Mux RegDst
assign reg_write_dest = (reg_dst  == 1'b1) ? instruction[8:6] : instruction[11:9];
assign reg_read_addr_1 = instruction[14:12];
assign reg_read_addr_2 = instruction[11:9];
//Banco_de_registradores
BDR banco_de_registradores(clock,reset,reg_write,reg_write_dest,reg_write_data,instruction[14:12],reg_read_data_1,instruction[11:9],reg_read_data_2);
//Mux AluSrc
assign B_ULA = (alu_src  == 1'b1) ? instruction[7:0] : reg_read_data_2;
//Controle_da_ULA
controle_da_ULA CDU(z1, fv, instruction[2:0], z2, alu_op, ALUcontrol);
//ULA
ALU ULA(ALUcontrol, reg_read_data_1, B_ULA, ALU_out, zero, instruction[5:3]);
//Beq e Jump Control
assign PC_beq = instruction[7:0];
assign PC_jump = instruction[7:0];
assign beq_control = branch & zero;

//Memoria_de_Dados
MDD mem_de_dados(clock, ALU_out, reg_read_data_2,mem_write,mem_read,mem_read_data);
//Mux MemToReg -> Write Back
assign reg_write_data = (mem_to_reg == 1'b1) ? mem_read_data : ALU_out;
//Output
assign pc_out = pc_current;  
assign resultado_ula = ALU_out;
assign endereco = instruction;
assign valorlido = reg_write_data;
assign valorescrito = reg_read_data_2;

assign alu_op_controle = alu_op;
assign reg_dst_controle = reg_dst;
assign mem_to_reg_controle = mem_to_reg;
assign jump_controle = jump;
assign branch_controle = branch;
assign mem_read_controle = mem_read;
assign mem_write_controle = mem_write;
assign alu_src_controle = alu_src;
assign reg_write_controle = reg_write;
endmodule
