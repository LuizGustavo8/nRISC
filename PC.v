
 // PC 
module PC(clk,rst, pc_next, pc_current);
	 input          clk;  
    input          rst;
    input   [7:0]  pc_next;

    output reg [7:0]  pc_current;

 always @(posedge clk or posedge rst)  
 begin   
      if(rst)   
           pc_current <= 8'b0;  
      else  
           pc_current <= pc_next;  
 end  
 // PC + 1   
 assign pc1 = pc_current + 8'b1;

endmodule

