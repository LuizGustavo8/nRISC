
module teste_mux2;
	reg [2:0] i1, i2;
	reg sel;
	wire [2:0] out;
	
	initial begin
	i1 = 3'b111;
	i2 = 3'b000;
	#1 sel = 0;
	#1 sel = 1;
	
	end
	initial begin
	$monitor("Time=%0t sel=%0b i1=%0b i2=%0b out=%0b",
	$time, sel, i1, i2, out);
	end
	
	MUX_3bits teste(i1, i2, sel, out);
	
	endmodule
	