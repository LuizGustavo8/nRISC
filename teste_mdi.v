		module teste_mdi;
		reg [7:0] in;
		wire [17:0] out;
		
		initial  begin  
		in = 8'd0;
      #1 in = 8'h01;
		#1 in = 8'h02;
		#1 in = 8'h03;
                  
      end
		initial begin
		$monitor("Time=%0t in= %0h out= %0h",
		$time, in, out);
		end
		
		MDI a(in, out);
		endmodule
		