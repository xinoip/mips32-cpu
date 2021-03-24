`define DELAY 20
module mux4_testbench();
	reg i0, i1, i2, i3;
    reg [1:0] select;
	reg expected_result;
    wire result;
	wire pass;
	
    mux4 test_mux4(result, i0, i1, i2, i3, select);
	xnor is_pass(pass, expected_result, result);
	
initial begin
	i0 = 1'b1; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0; select=2'b00;
	expected_result = 1'b1;
#`DELAY;
    i0 = 1'b1; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0; select=2'b01;
	expected_result = 1'b0;
#`DELAY;
    i0 = 1'b1; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0; select=2'b10;
	expected_result = 1'b1;
#`DELAY;
    i0 = 1'b1; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0; select=2'b11;
	expected_result = 1'b0;
#`DELAY;
end

initial begin
	$monitor("time=%2d, i0=%1b, i1=%1b, i2=%1b, i3=%1b, select=%2b, result=%1b, pass=%1b", $time, i0, i1, i2, i3, select, result, pass);
end

endmodule
	