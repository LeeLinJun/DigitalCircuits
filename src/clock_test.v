module clock_test(clk,count,rst,led);
   input clk,rst,count;
   output [7:0] led;
   reg [2:0]count;
   always @(clk)
      begin
         if(rst) 
         count<=3'b000;
         count=count+1'b1;
      end
   always @(count[2])
      led=!led;
endmodule