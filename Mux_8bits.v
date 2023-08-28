
module MUX_8bits( i1, i2, sel, out);
						
	input [7:0] i1, i2;
	input sel;
	output reg [7:0] out;

	always @(*)
	begin
			case(sel)
				0:out = i1;
				1:out = i2;
			endcase
	end
	
endmodule
	