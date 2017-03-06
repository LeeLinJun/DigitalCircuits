module count_201(out,nreset,clk,a,b,c,d,e,f,g);
   output reg [7:0] out; 
   
   input nreset,clk;

   
   always @(posedge clk)//clk上升沿触发 
      if(!nreset)
         out<=8'b00000000;     
      else if(out == 201)
         out<=8'b00000000; 
      else
         out <= out+1'b1;                
endmodule 