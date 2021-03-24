module program_counter_register (in, out, clk);
    input [31:0] in;
    output reg [31:0] out;
    input clk;

    initial begin
        out = 32'b0;
    end

    always @(negedge clk) begin
		out = in;
	end
endmodule