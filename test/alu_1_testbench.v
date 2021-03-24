`define DELAY 20
module alu_1_testbench();
	reg a, b, carry_in;
    reg [2:0] alu_op;
	reg expected_result, expected_carry_out;
    wire result, carry_out;
	wire pass, eq1, eq2;
	
    alu_1 test_alu1(result, carry_out, a, b, carry_in, alu_op);
	xnor equal_result(eq1, expected_result, result);
    xnor equal_carry_out(eq2, expected_carry_out, carry_out);
    and is_pass(pass, eq1, eq2);
	
initial begin
// AND tests, start
	a = 1'b0; b = 1'b0; carry_in = 1'b0; alu_op = 3'b000;
    expected_result = 1'b0;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b0; carry_in = 1'b1; alu_op = 3'b000;
    expected_result = 1'b0;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b1; carry_in = 1'b0; alu_op = 3'b000;
    expected_result = 1'b0;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b1; carry_in = 1'b1; alu_op = 3'b000;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b0; carry_in = 1'b0; alu_op = 3'b000;
    expected_result = 1'b0;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b1; b = 1'b0; carry_in = 1'b1; alu_op = 3'b000;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b1; carry_in = 1'b0; alu_op = 3'b000;
    expected_result = 1'b1;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b1; carry_in = 1'b1; alu_op = 3'b000;
    expected_result = 1'b1;
    expected_carry_out = 1'b1;
#`DELAY;
// AND tests, end.

// OR tests, start
	a = 1'b0; b = 1'b0; carry_in = 1'b0; alu_op = 3'b001;
    expected_result = 1'b0;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b0; carry_in = 1'b1; alu_op = 3'b001;
    expected_result = 1'b0;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b1; carry_in = 1'b0; alu_op = 3'b001;
    expected_result = 1'b1;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b1; carry_in = 1'b1; alu_op = 3'b001;
    expected_result = 1'b1;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b0; carry_in = 1'b0; alu_op = 3'b001;
    expected_result = 1'b1;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b1; b = 1'b0; carry_in = 1'b1; alu_op = 3'b001;
    expected_result = 1'b1;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b1; carry_in = 1'b0; alu_op = 3'b001;
    expected_result = 1'b1;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b1; carry_in = 1'b1; alu_op = 3'b001;
    expected_result = 1'b1;
    expected_carry_out = 1'b1;
#`DELAY;
// OR tests, end.

// ADD tests, start
	a = 1'b0; b = 1'b0; carry_in = 1'b0; alu_op = 3'b010;
    expected_result = 1'b0;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b0; carry_in = 1'b1; alu_op = 3'b010;
    expected_result = 1'b1;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b1; carry_in = 1'b0; alu_op = 3'b010;
    expected_result = 1'b1;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b1; carry_in = 1'b1; alu_op = 3'b010;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b0; carry_in = 1'b0; alu_op = 3'b010;
    expected_result = 1'b1;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b1; b = 1'b0; carry_in = 1'b1; alu_op = 3'b010;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b1; carry_in = 1'b0; alu_op = 3'b010;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b1; carry_in = 1'b1; alu_op = 3'b010;
    expected_result = 1'b1;
    expected_carry_out = 1'b1;
#`DELAY;
// ADD tests, end.

// SUBSTRACT tests, start
	a = 1'b0; b = 1'b0; carry_in = 1'b0; alu_op = 3'b110;
    expected_result = 1'b0;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b0; carry_in = 1'b1; alu_op = 3'b110;
    expected_result = 1'b1;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b1; carry_in = 1'b0; alu_op = 3'b110;
    expected_result = 1'b1;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b1; carry_in = 1'b1; alu_op = 3'b110;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b0; carry_in = 1'b0; alu_op = 3'b110;
    expected_result = 1'b1;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b1; b = 1'b0; carry_in = 1'b1; alu_op = 3'b110;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b1; carry_in = 1'b0; alu_op = 3'b110;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b1; carry_in = 1'b1; alu_op = 3'b110;
    expected_result = 1'b1;
    expected_carry_out = 1'b1;
#`DELAY;
// SUBSTRACT tests, end.

// XOR tests, start
	a = 1'b0; b = 1'b0; carry_in = 1'b0; alu_op = 3'b011;
    expected_result = 1'b0;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b0; carry_in = 1'b1; alu_op = 3'b011;
    expected_result = 1'b0;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b1; carry_in = 1'b0; alu_op = 3'b011;
    expected_result = 1'b1;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b0; b = 1'b1; carry_in = 1'b1; alu_op = 3'b011;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b0; carry_in = 1'b0; alu_op = 3'b011;
    expected_result = 1'b1;
    expected_carry_out = 1'b0;
#`DELAY;
    a = 1'b1; b = 1'b0; carry_in = 1'b1; alu_op = 3'b011;
    expected_result = 1'b1;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b1; carry_in = 1'b0; alu_op = 3'b011;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
    a = 1'b1; b = 1'b1; carry_in = 1'b1; alu_op = 3'b011;
    expected_result = 1'b0;
    expected_carry_out = 1'b1;
#`DELAY;
// XOR tests, end.

end

initial begin
	$monitor("time=%2d, a=%1b, b=%1b, carry_in=%1b, alu_op=%2b, result=%1b, carry_out=%1b, pass=%1b",
             $time, a, b, carry_in, alu_op, result, carry_out, pass);
end

endmodule
	