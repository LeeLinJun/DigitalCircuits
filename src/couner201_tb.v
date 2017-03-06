module counter_tb;
reg nreset = 1;
reg clk = 0;
wire [7:0] out;


initial begin
nreset = 0; #10;
nreset = 1; #100;
$stop;
#300;
$finish;
end


always begin #1; clk = !clk; end
count_201 counter_test(.nreset(nreset),.clk(clk),.out(out));
initial
begin
$dumpfile("c201.vcd");
$dumpvars(0, counter_test);
#1000
$finish;
end
endmodule