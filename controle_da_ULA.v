//Controle_da_ULA
module controle_da_ULA( z1, fv, funct, z2, ALUOp, ALUcontrol);
						
	input [2:0] z1, fv, z2, funct;
	input [1:0] ALUOp;
	output reg [2:0] ALUcontrol;

	always @(*)
	begin
			case(ALUOp)
				2'b00: ALUcontrol = z1;
				2'b01: ALUcontrol = fv;
				2'b10: ALUcontrol = funct;
				2'b11: ALUcontrol = z2;
			endcase
	end
	
endmodule
	