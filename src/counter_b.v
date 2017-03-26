module counter_b(clk,reset,mode,DS1,a,b,c,d,e,f,g,h);
output a,b,c,d,e,f,g,h;
output DS1;
input clk,reset;
input mode;
wire DS1;
wire a,b,c,d,e,f,g,h;
reg [3:0] count;
reg clk_reg;
reg [31:0] count_reg1;
initial
begin
count_reg1=0;
end
  assign DS1=1'b0;
  always@(posedge clk)
    if(count_reg1==32'd250000000)
      begin
      clk_reg<=~clk_reg;
		count_reg1<=32'd0;
		end
		else 
		begin
		count_reg1<=count_reg1+32'd1;
		end
		
		
	always@(posedge clk_reg or negedge reset)
	  if(!reset)
	    count<=4'd0;
	  else
		 begin
		 if(mode)
		 count<=count+4'b1;
		 else
		 count<=count-4'b1;
		 end
assign{a,b,c,d,e,f,g,h}=(DS1)?8'bx:{seg7(count),1'b0};
  function reg[6:0] seg7;
    input [3:0] in;
	 case(in)
	   4'b0000 :seg7=7'b1111110;
		4'b0001 :seg7=7'b0110000;
		4'b0010 :seg7=7'b1101101;
		4'b0011 :seg7=7'b1111001;
		4'b0100 :seg7=7'b0110011;
		4'b0101 :seg7=7'b1011011;
		4'b0110 :seg7=7'b1011111;
		4'b0111 :seg7=7'b1110000;
		4'b1000 :seg7=7'b1111111;
		4'b1001 :seg7=7'b1111011;
		4'b1010 :seg7=7'b1110111;
		4'b1011 :seg7=7'b0011111;
		4'b1100 :seg7=7'b1001110;
		4'b1101 :seg7=7'b0111101;
		4'b1110 :seg7=7'b1001111;
		4'b1111 :seg7=7'b1000111;
		default :seg7=7'bx;
	 endcase
  endfunction
 endmodule 
