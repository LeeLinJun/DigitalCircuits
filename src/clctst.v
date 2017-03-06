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
module clocktst(clk,rst,led);
	 input clk,rst;
	 
    reg [25:0]ctr;
    	 
	 output led;
    reg led;	

	 
	 always @(clk)
      begin
         if(rst) 
            begin
				   ctr=1'b0;
			      led=1'b0;
				end
			else if(ctr[24]&&ctr[23])
			      begin
					   
						led = led+ 1'b1;
					   ctr = 1'b0;
					end
			else ctr=ctr+1'b1;
			
			
		end
	 
	      
		 
	   
endmodule
