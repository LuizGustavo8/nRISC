`timescale 1ns / 1ps
`include "nRisc.v"
//Dentro da MemÃ³ria de InstruÃ§Ãµes jÃ¡ estÃ¡ o cÃ³digo do programa teste
 
 module simulacao;  
      // Inputs  
      reg clock;  
      reg reset;  
      // Outputs  
      wire [7:0] pc_out;  
      wire [7:0] resultado_ula;
		wire [7:0] valorlido;
		wire [7:0] valorescrito;
		wire [17:0] endereco;
		wire [0:1] alu_op_controle;
		wire reg_dst_controle;
		wire mem_to_reg_controle;
		wire jump_controle;
		wire branch_controle;
		wire mem_read_controle;
		wire mem_write_controle;
		wire alu_src_controle;
		wire reg_write_controle;
		integer i;

		/* Declaracao do contador de estagios */
		reg[15:0] counter;
		
      nRISC nrisc (clock, reset, pc_out, resultado_ula, valorlido, valorescrito, endereco, alu_op_controle, reg_dst_controle,mem_to_reg_controle,jump_controle,branch_controle,mem_read_controle,mem_write_controle,alu_src_controle,reg_write_controle);
		initial
			begin
			//nrisc.pc_current = 0;
			clock = 0;
			
			end
      initial 
			begin  
			  counter = 1;
           forever 
				begin 
				#1; 
				clock = ~clock;  
				end
			end

      initial begin
				forever
				begin
				
					$display("pc_out=%h | resultado_ula=%b | valorlido=%b | valorescrito=%b | endereco=%h", nrisc.pc_out, nrisc.resultado_ula, nrisc.valorlido, nrisc.valorescrito, nrisc.endereco);
					$display("Sinas de Controle");
					$display("alu_op=%h|reg_dst=%h|mem_to_reg=%h|jump=%h|branch=%h|mem_read=%h|mem_write=%h|alu_src=%h|reg_write=%h",alu_op_controle, reg_dst_controle,mem_to_reg_controle,jump_controle,branch_controle,mem_read_controle,mem_write_controle,alu_src_controle,reg_write_controle);
					$display("reg_read_addr_1=%b | reg_read_data_1=%b | reg_read_addr_2=%b | reg_read_data_2=%b",nrisc.reg_read_addr_1, nrisc.reg_read_data_1, nrisc.reg_read_addr_1, nrisc.reg_read_data_2);
					$display("reg_write_dest=%b | B_ULA=%b",nrisc.reg_write_dest, nrisc.B_ULA);
					$display("Clock = %b",clock);
					$display("Estagio : %d", counter);
					#1;
				  end
				end
		always@(posedge (clock == 0))
		begin
		  counter = counter + 1;
		  if(counter == 30)
			$stop;
		end
		      initial begin  
           // Initialize Inputs  
           //$monitor ("register 3=%d, register 4=%d", reg3,reg4);  
           reset = 1;  
           // Wait 100 ns for global reset to finish  
           #200;  
     reset = 0;  
           // Add stimulus here  
      end


 endmodule
 