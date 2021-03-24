module instruction_memory (instruction, read_address, clk);
    input [31:0] read_address;
    input clk;
    output reg[31:0] instruction;

    reg [31:0] memory[0:31];

    always @(posedge clk) begin
        instruction <= memory[read_address];
    end
endmodule