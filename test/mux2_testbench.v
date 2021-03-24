`define DELAY 20
module mux2_testbench();
	reg i0, i1, select;
	reg expected_result;
    wire result;
	wire pass;
	
    mux2 test_mux2(result, i0, i1, select);
	xnor is_pass(pass, expected_result, result);
	
initial begin
	i0 = 1'b0; i1 = 1'b0; select=1'b0;
	expected_result = 1'b0;
#`DELAY;
	i0 = 1'b0; i1 = 1'b0; select=1'b1;
	expected_result = 1'b0;
#`DELAY;
	i0 = 1'b1; i1 = 1'b0; select=1'b0;
	expected_result = 1'b1;
#`DELAY;
	i0 = 1'b1; i1 = 1'b0; select=1'b1;
	expected_result = 1'b0;
#`DELAY;
	i0 = 1'b1; i1 = 1'b1; select=1'b0;
	expected_result = 1'b1;
#`DELAY;
	i0 = 1'b1; i1 = 1'b1; select=1'b1;
	expected_result = 1'b1;
#`DELAY;
	i0 = 1'b0; i1 = 1'b1; select=1'b0;
	expected_result = 1'b0;
#`DELAY;
	i0 = 1'b0; i1 = 1'b1; select=1'b1;
	expected_result = 1'b1;
end

initial begin
	$monitor("time=%2d, i0=%1b, i1=%1b, select=%1b, result=%1b, pass=%1b", $time, i0, i1, select, result, pass);
end

endmodule
	