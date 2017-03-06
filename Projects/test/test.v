`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:06:17 12/07/2016 
// Design Name: 
// Module Name:    test 
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
module test(
    C0, A,B,C1,S
    );
	
	
	 input C0;
    input [3:0] A;
    input [3:0] B;
	 output [3:0] S;
	 output C1;
	 reg[3:0] S;
	 reg C1;
	
	 always @(A or B or C0)
	 begin
			S = A + B + C0;
			if(A + B + C0 > 15)
				C1 = 1;
			else
				C1 = 0;
	 end


endmodule