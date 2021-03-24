module pc_address_bus (result, pc_part, address_part);
    input [31:26] pc_part;
    input [25:0] address_part;
    output [31:0] result;

    assign result[31:26] = pc_part;
    assign result[25:0] = address_part;
endmodule