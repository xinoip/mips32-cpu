module equal_6 (result, a, b);
    input [5:0] a, b;
    output result;

    wire [5:0] r;

    xnor_6x2 xnor_result(r, a, b);

    and(result, r[0], r[1], r[2], r[3], r[4], r[5]);
endmodule