module alu_control (aluop, funct, result, jrsig);
    input [1:0] aluop;
    input [5:0] funct;
    output [2:0] result;
    output jrsig;

    wire jr_op, add_op, sub_op, xor_op, and_op, or_op;
    wire jr_funct, add_funct, sub_funct, xor_funct, and_funct, or_funct;
    wire aluop00, aluop01, aluop10, aluop11;

    // check alu op
    equal_2 is_aluop00(aluop00, aluop, 2'b00);
    equal_2 is_aluop01(aluop01, aluop, 2'b01);
    equal_2 is_aluop10(aluop10, aluop, 2'b10);
    equal_2 is_aluop11(aluop11, aluop, 2'b11);

    // check funct codes
    equal_6 funct_jr(jr_funct, funct, 6'b001000);
    equal_6 funct_add(add_funct, funct, 6'b100000);
    equal_6 funct_sub(sub_funct, funct, 6'b100010);
    equal_6 funct_xor(xor_funct, funct, 6'b100110);
    equal_6 funct_and(and_funct, funct, 6'b100100);
    equal_6 funct_or(or_funct, funct, 6'b100101);
    
    // check operation type for R types
    and is_jr(jr_op, jr_funct, aluop10);
    and is_add(add_op, add_funct, aluop10);
    and is_sub(sub_op, sub_funct, aluop10);
    and is_xor(xor_op, xor_funct, aluop10);
    and is_and(and_op, and_funct, aluop10);
    and is_or(or_op, or_funct, aluop10);

    // combinational results
    or result_0_comb(result[0], xor_op, or_op, aluop11);
    or result_1_comb(result[1], aluop00, aluop01, add_op, sub_op, xor_op);
    or result_2_comb(result[2], aluop01, sub_op);
    and jrsig_comb(jrsig, jr_op, jr_op);
endmodule