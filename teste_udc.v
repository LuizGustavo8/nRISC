
module teste_udc;

		reg[2:0]opcode;
		
		wire[1:0]alu_op;
		wire reg_dst,mem_to_reg,jump,branch,mem_read,mem_write,alu_src,reg_write;
		
		initial  begin
		
		#1 opcode = 3'b000;
      #1 opcode = 3'b001;
		#1 opcode = 3'b010;
		#1 opcode = 3'b011;
		#1 opcode = 3'b100;
		#1 opcode = 3'b111;
                  
      end
		initial begin
		$monitor("Time=%0t opcode= %0b AluOp= %0b RegDst= %0b MemToReg= %0b Jump= %0b Branch= %0b MemRead= %0b MemWrite= %0b AluSrc= %0b RegWrite= %0b",
		$time, opcode, alu_op, reg_dst, mem_to_reg, jump, branch, mem_read, mem_write, alu_src, reg_write);
		end
		
		UDC teste(opcode, alu_op, reg_dst, mem_to_reg, jump, branch, mem_read, mem_write, alu_src, reg_write);
		endmodule
		
		