		module teste_mdd;
		reg clock;
		reg [7:0] address; //Imediato+rs
		reg [7:0] write_data;//rt
		reg mem_write;
		reg mem_read;
		wire [7:0] mem_data;
		
		initial  begin 
		//Informacoes Zeradas
      clock = 0;
		address = 8'h00;
		write_data = 8'h00;
		mem_write = 0;
		mem_read = 0;
		#1 
		clock = 1;//Clock Habilitado
		address = 8'h01;//Endereço 01
		write_data = 8'h05; //Dado a ser escrita
		mem_write = 1; //Escrita Habilitada
		mem_read = 0;//Leitura Desabilitada
		#1 
		clock = 1;//Clock Habilitado
		address = 8'h01;//Endereço 01
		write_data = 8'h05; 
		mem_write = 0;
		mem_read = 1;//Leitura Desabilitada
		
      end
		initial begin
		$monitor("Time=%0t \n clock = %0b \n address = %0h \n write_data = %0h \n mem_write = %0b \n mem_read = %0h \n mem_data = %0h",
		$time, clock, address, write_data, mem_write, mem_read, mem_data);
		end
		
		MDD a(clock, address, write_data, mem_write, mem_read, mem_data);
		endmodule
		
