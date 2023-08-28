		module teste_pc;
		reg clk, rst;
		reg [7:0] in;
		wire [7:0] out;
		
		initial  begin  
		in = 8'h02;
      #1 clk = 8'b1;
		#1 rst = 8'h1;
                  
      end
		initial begin
		$monitor("Time=%0t clk= %0h rst= %0h in= %0h out= %0h",
		$time, clk, rst, in, out);
		end
		
		PC a(clk, rst, in, out);
		endmodule
		
