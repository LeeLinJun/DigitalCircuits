`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:52 12/07/2016 
// Design Name: 
// Module Name:    exp2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//old
/*module exp2(key,led);
   input  [7:0] key;
   output  [6:0] led;
	
	reg led;
   always @(key)
   begin 
      case(key)
      8'b00000001:led=7'b0001001;
		8'b00000010:led=7'b1111001;
		8'b00000100:led=7'b1001110;
		8'b00001000:led=7'b1000000;
		8'b00010000:led=7'b0011001;
		8'b00100000:led=7'b1111001;
		8'b01000000:led=7'b1000000;
		8'b10000000:led=7'b0100100;		
      default:led=7'bx;
      endcase
   end 
endmodule





*/



module disp(print,rst,key,clk,led,cea,ceb,cec,ced);
   output  [6:0] led;	
	input print;
	input  [7:0] key;
	input rst,clk;
	output cea,ceb,cec,ced;
	reg cea,ceb,cec,ced;
	reg [16:0]ctr;
	reg [26:0]counter;
	reg [1:0]ce;
	reg [2:0]roll;
	reg led;
	
	always @(posedge clk)
      begin
         if(rst) 
            begin
				   ctr <=0;			      
					counter<=0;					
					ce <=0;		
					
				end
				
			if(ctr[16])
			      begin							
						ce<=ce+2'b01;
					   ctr <= 1'b0;
					end
			else 	 begin ctr<=ctr+1'b1;counter<=counter+1'b1;end
			
			if(counter['d26])
			      begin
					   
					   counter <=2'b0;
						if (roll===3'b111)
						roll<= 3'b000;
					   else begin roll <= roll+3'b001;	end					
                  				
					end
			
	      end
			
	
   always@(ce,key,print)
	
	begin
	
	case (ce)			
         2'b00: begin 
		case(roll+3'b000)
		4'b000:led<=7'b0001001;
		4'b001:led<=7'b1111001;
		4'b010:led<=7'b1001110;
		4'b011:led<=7'b1000000;
		4'b100:led<=7'b0011001;
		4'b101:led<=7'b1111001;
		4'b110:led<=7'b1000000;
		4'b111:led<=7'b0100100;
      4'b100:led<=7'b0001001;
		4'b1001:led<=7'b1111001;
		4'b1010:led<=7'b1001110;		
      default:led<=7'bx;
			endcase
			cea<=0;ceb<=1;cec<=1;ced<=1;
			end
			
			  2'b01: begin 
		case(roll+3'b001)
		4'b000:led<=7'b0001001;
		4'b001:led<=7'b1111001;
		4'b010:led<=7'b1001110;
		4'b011:led<=7'b1000000;
		4'b100:led<=7'b0011001;
		4'b101:led<=7'b1111001;
		4'b110:led<=7'b1000000;
		4'b111:led<=7'b0100100;
      4'b100:led<=7'b0001001;
		4'b1001:led<=7'b1111001;
		4'b1010:led<=7'b1001110;		
      default:led<=7'bx;
			endcase
			cea<=1;ceb<=0;cec<=1;ced<=1;
			end
			
			
			  2'b10: begin 
		case(roll+3'b010)
		4'b000:led<=7'b0001001;
		4'b001:led<=7'b1111001;
		4'b010:led<=7'b1001110;
		4'b011:led<=7'b1000000;
		4'b100:led<=7'b0011001;
		4'b101:led<=7'b1111001;
		4'b110:led<=7'b1000000;
		4'b111:led<=7'b0100100;
      4'b100:led<=7'b0001001;
		4'b1001:led<=7'b1111001;
		4'b1010:led<=7'b1001110;		
      default:led<=7'bx;
			endcase
			cea<=1;ceb<=1;cec<=0;ced<=1;
			end
			
			  2'b11: begin 
		case(roll+3'b011)
		4'b000:led<=7'b0001001;
		4'b001:led<=7'b1111001;
		4'b010:led<=7'b1001110;
		4'b011:led<=7'b1000000;
		4'b100:led<=7'b0011001;
		4'b101:led<=7'b1111001;
		4'b110:led<=7'b1000000;
		4'b111:led<=7'b0100100;
      4'b100:led<=7'b0001001;
		4'b1001:led<=7'b1111001;
		4'b1010:led<=7'b1001110;		
      default:led<=7'bx;
			endcase
			cea<=1;ceb<=1;cec<=1;ced<=0;
			end
			endcase
	   
		
		if(print)
	begin 
      case(key)
      8'b00000001:led<=7'b0001001;
		8'b00000010:led<=7'b1111001;
		8'b00000100:led<=7'b1001110;
		8'b00001000:led<=7'b1000000;
		8'b00010000:led<=7'b0011001;
		8'b00100000:led<=7'b1111001;
		8'b01000000:led<=7'b1000000;
		8'b10000000:led<=7'b0100100;		
      default:led<=7'bx;
      endcase
	end
	   
	
	
  end
  	
	
endmodule
 