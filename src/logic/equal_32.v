module equal_32 (result, a, b);
    input [31:0] a, b;
    output result;

    wire [31:0] r;

    xnor_32x2 xnor_result(r, a, b);

    and(result, r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7],
        r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15], 
        r[16], r[17], r[18], r[19], r[20], r[21], r[22], r[23], 
        r[24], r[25], r[26], r[27], r[28], r[29], r[30], r[31]);
endmodule