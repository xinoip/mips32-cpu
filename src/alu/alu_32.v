module alu_32 (result, zero, n, a, b, alu_op);
    input [31:0] a, b;
    input [2:0] alu_op;
    output [31:0] result;
    output [31:0] n;
    output zero;

    wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31,c32;
    wire greater, equal, lesser;

    alu_1 m0(result[0], c1, a[0], b[0], alu_op[2], alu_op);
    alu_1 m1(result[1], c2, a[1], b[1], c1, alu_op);
    alu_1 m2(result[2], c3, a[2], b[2], c2, alu_op);
    alu_1 m3(result[3], c4, a[3], b[3], c3, alu_op);
    alu_1 m4(result[4], c5, a[4], b[4], c4, alu_op);
    alu_1 m5(result[5], c6, a[5], b[5], c5, alu_op);
    alu_1 m6(result[6], c7, a[6], b[6], c6, alu_op);
    alu_1 m7(result[7], c8, a[7], b[7], c7, alu_op);
    alu_1 m8(result[8], c9, a[8], b[8], c8, alu_op);
    alu_1 m9(result[9], c10, a[9], b[9], c9, alu_op);
    alu_1 m10(result[10], c11, a[10], b[10], c10, alu_op);
    alu_1 m11(result[11], c12, a[11], b[11], c11, alu_op);
    alu_1 m12(result[12], c13, a[12], b[12], c12, alu_op);
    alu_1 m13(result[13], c14, a[13], b[13], c13, alu_op);
    alu_1 m14(result[14], c15, a[14], b[14], c14, alu_op);
    alu_1 m15(result[15], c16, a[15], b[15], c15, alu_op);
    alu_1 m16(result[16], c17, a[16], b[16], c16, alu_op);
    alu_1 m17(result[17], c18, a[17], b[17], c17, alu_op);
    alu_1 m18(result[18], c19, a[18], b[18], c18, alu_op);
    alu_1 m19(result[19], c20, a[19], b[19], c19, alu_op);
    alu_1 m20(result[20], c21, a[20], b[20], c20, alu_op);
    alu_1 m21(result[21], c22, a[21], b[21], c21, alu_op);
    alu_1 m22(result[22], c23, a[22], b[22], c22, alu_op);
    alu_1 m23(result[23], c24, a[23], b[23], c23, alu_op);
    alu_1 m24(result[24], c25, a[24], b[24], c24, alu_op);
    alu_1 m25(result[25], c26, a[25], b[25], c25, alu_op);
    alu_1 m26(result[26], c27, a[26], b[26], c26, alu_op);
    alu_1 m27(result[27], c28, a[27], b[27], c27, alu_op);
    alu_1 m28(result[28], c29, a[28], b[28], c28, alu_op);
    alu_1 m29(result[29], c30, a[29], b[29], c29, alu_op);
    alu_1 m30(result[30], c31, a[30], b[30], c30, alu_op);
    alu_1 m31(result[31], c32, a[31], b[31], c31, alu_op);

    compare_to_zero_32 ncheck(greater, equal, lesser, result);
    or n0_check(n[0], greater, equal);
    or n1_check(n[1], greater, lesser);
    and ns2(n[2], 1'b0, 1'b0);
    and ns3(n[3], 1'b0, 1'b0);
    and ns4(n[4], 1'b0, 1'b0);
    and ns5(n[5], 1'b0, 1'b0);
    and ns6(n[6], 1'b0, 1'b0);
    and ns7(n[7], 1'b0, 1'b0);
    and ns8(n[8], 1'b0, 1'b0);
    and ns9(n[9], 1'b0, 1'b0);
    and ns10(n[10], 1'b0, 1'b0);
    and ns11(n[11], 1'b0, 1'b0);
    and ns12(n[12], 1'b0, 1'b0);
    and ns13(n[13], 1'b0, 1'b0);
    and ns14(n[14], 1'b0, 1'b0);
    and ns15(n[15], 1'b0, 1'b0);
    and ns16(n[16], 1'b0, 1'b0);
    and ns17(n[17], 1'b0, 1'b0);
    and ns18(n[18], 1'b0, 1'b0);
    and ns19(n[19], 1'b0, 1'b0);
    and ns20(n[20], 1'b0, 1'b0);
    and ns21(n[21], 1'b0, 1'b0);
    and ns22(n[22], 1'b0, 1'b0);
    and ns23(n[23], 1'b0, 1'b0);
    and ns24(n[24], 1'b0, 1'b0);
    and ns25(n[25], 1'b0, 1'b0);
    and ns26(n[26], 1'b0, 1'b0);
    and ns27(n[27], 1'b0, 1'b0);
    and ns28(n[28], 1'b0, 1'b0);
    and ns29(n[29], 1'b0, 1'b0);
    and ns30(n[30], 1'b0, 1'b0);
    and ns31(n[31], 1'b0, 1'b0);

    equal_32 mzero(zero, result, 32'b00000000000000000000000000000000);
endmodule