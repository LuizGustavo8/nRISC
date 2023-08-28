//ULA
module ALU(ALUcontrol, a, b, ALUout, zero, shamt);
	input  [2:0] ALUcontrol;
	input  [2:0] shamt;
	input  [7:0] a, b;
	output reg [7:0] ALUout;
	output reg zero;


	always @(*)
	begin
		case(ALUcontrol)
			3'b000: ALUout = a + b; //ADD
			
			3'b001: ALUout = a - b; //SUB
			
			3'b010: ALUout = a * b; //MULT
			
			3'b011: ALUout = a / b; //DIV
			
			3'b100: ALUout = ~a;//NOT
			
			3'b101: ALUout = a < b ? 1 : 0; //SLT
			
			3'b110: ALUout = a<<shamt; //SLL
			
			3'b111: ALUout = a>>shamt; //SRL
			
			default: ALUout = 0;
		endcase
		if (a == b)begin
		zero = 1;
		end
		else begin
		zero = 0;
		end
	end 
endmodule
