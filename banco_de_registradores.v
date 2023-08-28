
//Banco de Registradores
 module BDR  
 (  
      input                    clock,  
      input                    reset,  
      // write port  
      input                    reg_write_enable, //Escrever habilitado
      input          [2:0]     reg_write_dest,   //Em qual registrador escrever
      input          [7:0]     reg_write_data,  //Conteúdo a ser escrito
      //read port 1  
      input          [2:0]     reg_read_addr_1, //Read Register 1 (rs) determina qual reg ler
      output         [7:0]     reg_read_data_1, //Valor do Reg lido 
      //read port 2  
      input          [2:0]     reg_read_addr_2, //Read Register 2 (rt ou rd) determina qual reg ler
      output         [7:0]     reg_read_data_2  //Valor do Reg lido 
 );  
      reg[7:0] reg_array [7:0];  

      always @ (posedge clock or posedge reset) begin
			  if(clock) begin
			  reg_array[3'b000] <= 8'b0;
			  end
           if(reset) begin  
                reg_array[3'b000] <= 8'b0;  
                reg_array[3'b001] <= 8'b0;  
                reg_array[3'b010] <= 8'b0;  
                reg_array[3'b011] <= 8'b0;  
                reg_array[3'b100] <= 8'b0;  
                reg_array[3'b101] <= 8'b0;  
                reg_array[3'b110] <= 8'b0;  
                reg_array[3'b111] <= 8'b0;       
           end  
           else 
					begin  
                if(reg_write_enable) begin  
                     reg_array[reg_write_dest] <= reg_write_data;  
                end  
           end  
      end  
      assign reg_read_data_1 = reg_array[reg_read_addr_1];  
      assign reg_read_data_2 = reg_array[reg_read_addr_2];
		
 endmodule
 