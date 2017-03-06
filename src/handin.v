module clocktst(clk,rst,quick,num,cea,ceb,cec,ced);
	 input clk,rst,quick;
	 
    reg [16:0]ctr;
	 reg [26:0]counter;
	 
    	 
	 output [7:0]num;
	 output  cea,ceb,cec,ced;
	 reg cea,ceb,cec,ced;
	 reg [1:0]ce;
	 
    reg num;	
	 
	 reg [3:0]digits,tens,hundreds;
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
					
					
				end
				
			if(ctr[16])
			      begin							
						ce<=ce+2'b01;
					   ctr <= 1'b0;
					end
			else 	 ctr<=ctr+1'b1;
			
			if(counter[24]&&(~quick))
			      begin
					   
					   counter <=2'b0;
					   digits <= digits+4'd0001;		
                  				
					end
			else if (counter[20]&&(quick))
			     begin
					   
					   counter <=2'b0;
					   digits <= digits+4'd0001;		
                  				
					end
		    
			 else counter<=counter+1'b1;

			 
			 
			
			if(digits===4'd10)
			      begin
					   tens <= tens+1'd01;	
					   digits <= 0;
						
					   				
					end
			if(tens===4'd10)
			      begin
					   hundreds <= hundreds+1'd01;	
					   tens <= 0;
											   				
					end
			if(hundreds===4'd2&&tens===4'd0&& digits===4'd1)
			      begin
					   hundreds <= 0;	
					   tens <= 0;
						digits<=0;
											   				
					end
					
						
			
					
			
			
		
			
			case (ce)			
         2'b00: begin 
			case(digits)
			4'd0:num <=8'b10000001;
			4'd1:num <=8'b11001111;
			4'd2:num <=8'b10010010;
			4'd3:num <=8'b10000110;
			4'd4:num <=8'b11001100;
			4'd5:num <=8'b10100100;
			4'd6:num <=8'b10100000;
			4'd7:num <=8'b10001111;
			4'd8:num <=8'b10000000;
			4'd9:num <=8'b10000100;
			default:num0=8'bx;
			endcase
			cea<=1;ceb<=1;cec<=1;ced<=0;
			end
         2'b01: begin 
			case(tens)
			4'd0:num <=8'b10000001;
			4'd1:num <=8'b11001111;
			4'd2:num <=8'b10010010;
			4'd3:num <=8'b10000110;
			4'd4:num <=8'b11001100;
			4'd5:num <=8'b10100100;
			4'd6:num <=8'b10100000;
			4'd7:num <=8'b10001111;
			4'd8:num <=8'b10000000;
			4'd9:num <=8'b10000100;
			default:num0=8'bx;
			endcase
			
			cea<=1;ceb<=1;cec<=0;ced<=1; 
			end
			2'b10: begin 
			case(hundreds)
			4'd0:num <=8'b10000001;
			4'd1:num <=8'b11001111;
			4'd2:num <=8'b10010010;
			4'd3:num <=8'b10000110;
			4'd4:num <=8'b11001100;
			4'd5:num <=8'b10100100;
			4'd6:num <=8'b10100000;
			4'd7:num <=8'b10001111;
			4'd8:num <=8'b10000000;
			4'd9:num <=8'b10000100;
			default:num0=8'bx;
			endcase
			cea<=1;ceb<=0;cec<=1;ced<=1;
			end
			
			2'b11: begin num<=8'b10000001; cea<=1;ceb<=1;cec<=1;ced<=1; end
         default:num<=8'bx;
			endcase		
			
		end
	 
	      
		 
	   
endmodule
