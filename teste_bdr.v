		module teste_bdr;
		reg clock; 
		reg reset;
		
		reg reg_write;
		reg [2:0] write_dest; 
		reg [7:0] write_data;
		
		reg [2:0] read1;
		wire[7:0] read_data1;
		
		reg [2:0] read2;
		wire[7:0] read_data2;
		
		initial begin
		//Informacoes zeradas
		//clock = 0; 
		//reset = 0; 
		//reg_write = 0;
		//write_dest = 3'h0;
		//write_data = 8'h00;
		//read1 = 3'h0;
		//read2 = 3'h0;
		
		#1 
		clock = 1;//Clock habilitado
		reset = 0; 
		reg_write = 1;//Escrita permitida
		write_dest = 3'b101;//Escrevendo em R1;;
		write_data = 8'h08;//...O valor "8"
		read1 = 3'h2;//Lendo R2
		read2 = 3'h3;//Lendo R3
		
		#1
		clock = 1;//Clock habilitado
		reset = 0;//Reset habilitado => Todos os reg = 0
		reg_write = 0;//Não há escrita
		write_dest = 3'b110;
		write_data = 8'h08;
		read1 = 3'b000;
		read2 = 3'b000;

		
		end
		
		initial begin
		$monitor("Time=%0t \n clock = %0b \n reset = %0b \n reg_write = %0b \n write_dest = %0h \n write_data = %0h \n read1 = %0h \n read_data1 = %0b \n read2 = %0h \n read_data2 = %0b",
		$time, clock, reset,reg_write, write_dest, write_data, read1, read_data1, read2, read_data2);
		end
		
		BDR a(clock, reset, reg_write, write_dest, write_data, read1, read_data1, read2, read_data2);
		endmodule
