module full_add_8bit(CLK,A,B,Ci,SEG,CO,SEL);
input CLK;
input [7:0]A,B;
input Ci;
output[6:0]SEG;
output CO;
output[1:0]SEL;

reg[9:0]count;
reg[1:0]SEL;
wire[7:0]S;
reg[6:0]SEG;

reg clk_reg;
reg state;

initial
begin
count=10'b0;
clk_reg=0;
end



assign{CO,S}=A+B+Ci;

  always@(posedge CLK)
    if(count==10'd1023)
	 begin
	   count<=0;
		clk_reg<=~clk_reg;
		end
		else
		  count<=count+10'b1;
  always@(posedge clk_reg)
    case(state)
	   1'b0:begin
		  SEL[1]<=1;
		  SEL[0]<=0;
		  state<=1'b1;
		  end
		1'b1:begin
		  SEL[1]<=0;
		  SEL[0]<=1;
		  state<=1'b0;
		  end
	    default:state=1'b0;
	  endcase
	  
	always@(posedge CLK)
	  begin
	    if(SEL[1])
		 SEG<=seg7(S[7:4]);
		 if(SEL[0])
		 SEG<=seg7(S[3:0]);
		 end
		 
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
