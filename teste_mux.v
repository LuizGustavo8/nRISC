
module teste_mux;
	reg [7:0] i1, i2;
	reg sel;
	wire [7:0] out;
	
	initial begin
	i1 = 8'b00001111;
	i2 = 8'b00000000;
	#1 sel = 0;
	#1 sel = 1;
	
	end
	initial begin
	$monitor("Time=%0t sel=%0b i1=%0b i2=%0b out=%0b",
	$time, sel, i1, i2, out);
	end
	
	MUX_8bits teste(i1, i2, sel, out);
	
	endmodule
	