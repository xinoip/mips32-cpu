module zero_extend (result, shifted16, a);
    input [15:0] a;
    output [31:0] result, shifted16;
    assign result[31:16] = 16'b0000000000000000;
    assign result[15:0] = a;

    assign shifted16[31:16] = a;
    assign shifted16[15:0] = 16'b0000000000000000;
endmodule