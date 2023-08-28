
module teste_cdu;
	reg [2:0] z1, fv, funct, z2;
	reg [1:0] ALUOp;
	wire [2:0] ALUcontrol;
	
	initial begin
	z1 = 3'b000;
	z2 = 3'b000;
	fv = 3'b101;
	funct = 3'b001;
	
	#1 ALUOp = 2'b00;
	#1 ALUOp = 2'b01;
	#1 ALUOp = 2'b10;
	#1 ALUOp = 2'b11;
	
	end
	initial begin
	$monitor("Time=%0t ALUcontrol=%0b",
	$time, ALUcontrol);
	end
	
	controle_da_ULA teste(z1, fv, funct, z2, ALUOp, ALUcontrol);
	
endmodule
	