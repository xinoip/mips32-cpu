module left_shift_16 (result, a);
    input [31:0] a;
    output [31:0] result;

    left_shift_2 n1(result, a);
    left_shift_2 n2(result, a);
    left_shift_2 n3(result, a);
    left_shift_2 n4(result, a);
    left_shift_2 n5(result, a);
    left_shift_2 n6(result, a);
    left_shift_2 n7(result, a);
    left_shift_2 n8(result, a);
endmodule