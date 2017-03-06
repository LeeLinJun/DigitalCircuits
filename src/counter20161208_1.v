`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:54 12/07/2016 
// Design Name: 
// Module Name:    clocktst 
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
module clocktst(clk,rst,num,cea,ceb,cec,ced,led1,led2);
	 input clk,rst;
	 
    reg [16:0]ctr;
	 reg [26:0]counter;
	 
    	 
	 output [7:0]num;
	 output  cea,ceb,cec,ced,led1,led2;
	 reg cea,ceb,cec,ced,led1,led2;
	 reg [1:0]ce;
	 
    reg num;	
	 
	 reg digits,tens,hundreds;
	 reg num2,num1,num0;
	 

	 
	 always @(posedge clk)
      begin
         if(rst) 
            begin
				   ctr <=0;
			      num <=0;
					counter <=0;
					digits<=0;
					tens<=0;
					hundreds<=0;
					ce <=0;
					led1<=0;
					led2<=0;
				end
				
			if(ctr[16])
			      begin							
						ce<=ce+2'b01;
					   ctr <= 1'b0;
					end
			else 	 ctr<=ctr+1'b1;
			
			if(counter[26])
			      begin
					   led1 <=~led1;
					   counter <=2'b0;
					   digits <= digits+1;		
                  				
					end
		    
			 else counter<=counter+1'b1;

			 
			 
			
			if(digits==4'd10)
			      begin
					   tens <= tens+1'd01;	
					   digits <= 0;
						led2 <= ~led2;
					   				
					end
			if(tens==4'd10)
			      begin
					   tens <= 0;
					   hundreds <= hundreds+'d01;					
					end
			if(hundreds==2'd2&&tens==1'd0&&digits==1'd1)
			      begin
					   hundreds <=0;
						tens <=0;
						digits <=0;

			      end
						
			
			case(digits)
			4'd0:num0 <=8'b10000001;
			4'd1:num0 <=8'b11001111;
			4'd2:num0 <=8'b10010010;
			4'd3:num0 <=8'b10000110;
			4'd4:num0 <=8'b11001100;
			4'd5:num0 <=8'b10100100;
			4'd6:num0 <=8'b10100000;
			4'd7:num0 <=8'b10001111;
			4'd8:num0 <=8'b10000000;
			4'd9:num0 <=8'b10000100;
			default:num0<=8'bx;
			endcase		
			
			case(tens)
			4'd0:num1<=8'b10000001;
			4'd1:num1<=8'b11001111;
			4'd2:num1<=8'b10010010;
			4'd3:num1<=8'b10000110;
			4'd4:num1<=8'b11001100;
			4'd5:num1<=8'b10100100;
			4'd6:num1<=8'b10100000;
			4'd7:num1<=8'b10001111;
			4'd8:num1<=8'b10000000;
			4'd9:num1<=8'b10000100;
			default:num1<=8'bx;
			endcase
			
			case(hundreds)
			4'd0:num2<=8'b10000001;
			4'd1:num2<=8'b11001111;
			4'd2:num2<=8'b10010010;
			4'd3:num2<=8'b10000110;
			4'd4:num2<=8'b11001100;
			4'd5:num2<=8'b10100100;
			4'd6:num2<=8'b10100000;
			4'd7:num2<=8'b10001111;
			4'd8:num2<=8'b10000000;
			4'd9:num2<=8'b10000100;
			default:num2<=8'bx;
			endcase
			
			case (ce)			
         2'b00: begin num<=num0;cea<=1;ceb<=1;cec<=1;ced<=0; end
         2'b01: begin num<=num1; cea<=1;ceb<=1;cec<=0;ced<=1; end
			2'b10: begin num<=num2; cea<=1;ceb<=0;cec<=1;ced<=1; end
			2'b11: begin num<=8'b10000001; cea<=0;ceb<=1;cec<=1;ced<=1; end
         default:num<=8'bx;
			endcase		
			
		end
	 
	      
		 
	   
endmodule
