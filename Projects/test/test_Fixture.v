`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:07:23 12/07/2016
// Design Name:   test
// Module Name:   C:/Users/llj96/Desktop/verilog/test/test_Fixture.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Fixture;

	// Inputs
	reg C0;
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire C1;
	wire [3:0] S;

	// Instantiate the Unit Under Test (UUT)
	test uut (
		.C0(C0), 
		.A(A), 
		.B(B), 
		.C1(C1), 
		.S(S)
	);

	initial begin
		C0 = 0;
		A = 4'b0001;
		B = 4'b0100;
		#100;
		C0 = 0;
		A = 4'b0101;
		B = 4'b1010;
		#100;
		
		C0 = 1;
		A = 4'b0101;
		B = 4'b1010;
		#100;
		
		C0 = 0;
		A = 4'b0001;
		B = 4'b1111;
		#100;

	end
      
endmodule

