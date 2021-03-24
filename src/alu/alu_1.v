module alu_1 (result, carry_out, a, b, carry_in, alu_op);
    input a, b, carry_in;
    input [2:0] alu_op;
    output result, carry_out;
    
    wire n1, n2, n3, n4, n5, n6, n7, not_n3, not_n5;

    xor(n1, b, alu_op[2]);
    or(n2, a, n1);
    and(n3, a, n1);
    not(not_n3, n3);
    and(n4, n2, not_n3);
    and(n5, n4, carry_in);
    or(carry_out, n5, n3);
    not(not_n5, n5);
    or(n6, carry_in, n4);
    and(n7, not_n5, n6);

    mux4 mux_result(result, n3, n2, n7, n4, alu_op[1:0]);
endmodule