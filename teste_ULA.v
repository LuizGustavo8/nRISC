
		module teste_ULA;
		reg clock;
		reg [2:0] ALUcontrol;
		reg [2:0] shamt;
		reg [7:0] a;
		reg [7:0] b;
		
		wire [7:0] ALUout;
		wire zero;
		
		initial  begin
		clock = 1;
		shamt = 3'b001;
		a = 8'h02;
		b = 8'h02;
		
		#1 ALUcontrol = 8'h00;
      #1 ALUcontrol = 8'h01;
		#1 ALUcontrol = 8'h02;
		#1 ALUcontrol = 8'h03;
		#1 ALUcontrol = 8'h04;
		#1 ALUcontrol = 8'h05;
		#1 ALUcontrol = 8'h06;
		#1 ALUcontrol = 8'h07;
                  
      end
		initial begin
		$monitor("Time=%0t ALUcontrol= %0h ALUout= %0b zero=%0b",
		$time, ALUcontrol, ALUout, zero);
		end
		
		ALU teste(ALUcontrol, a, b, ALUout, zero, shamt, clock);
		endmodule
		
