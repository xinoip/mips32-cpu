module compare_to_zero_32 (greater, equal, lesser, a);
    input [31:0] a;
    output greater, equal, lesser;

    wire positive, negative, not_equal;

    equal_32 zero_equal(equal, a, 32'b00000000000000000000000000000000);

    not sign_check_pos(positive, a[31]);
    not sign_check_neg(negative, positive);

    not g1(not_equal, equal);
    and g2(greater, positive, not_equal);

    and l1(lesser, negative, not_equal);
endmodule