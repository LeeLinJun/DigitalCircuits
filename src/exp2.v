module exp2(key,led);
   input reg [7:0] key;
   output reg [6:0] led;
   always @(key or led)
   begin 
      case(key)
      8'b10000000:led=7'b0110111;
      default:led=7'bx;
      endcase
   end 
endmodule