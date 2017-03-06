module count_212(out,data,load,reset,clk);
   output [8:0] out; 
   input [8:0] data;
   inputload,reset,clk;
   reg [8:0] out;
   always @(posedgeclk)//clk上升沿触发 
   begin  
      if(!reset)out=9'h000;          //同步清零，低电平有效  
      else if (load)out=data;         //同步预置   
      else if (out>=211)out=9'h000;   //计数最大值为211，超过清零   
      else out=out+1;              //计数  
   end 
endmodule 