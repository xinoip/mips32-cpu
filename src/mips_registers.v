module mips_registers (read_data_1, read_data_2, write_data_1, write_data_2, read_reg_1, read_reg_2, write_reg_1, write_reg_2, signal_reg_write_1, signal_reg_write_2, clk);
	input signal_reg_write_1, signal_reg_write_2, clk;
	input [4:0] read_reg_1, read_reg_2, write_reg_1, write_reg_2;
	input [31:0] write_data_1, write_data_2;
	output [31:0] read_data_1, read_data_2;
	
	reg [31:0] registers [31:0];
	
	assign read_data_1 = registers[read_reg_1];
	assign read_data_2 = registers[read_reg_2];

	always @(posedge clk) begin
		if(signal_reg_write_1 == 1'b1 && write_reg_1 != 5'b00000) begin
			registers[write_reg_1] = write_data_1;
		end
		if(signal_reg_write_2 == 1'b1 && write_reg_2 != 5'b00000) begin
			registers[write_reg_2] = write_data_2;
		end
	end
endmodule