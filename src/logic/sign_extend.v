module sign_extend (result, a);
    input [15:0] a;
    output [31:0] result;

    assign result[15:0] = a;
    assign result[16] = a[15];
    assign result[17] = a[15];
    assign result[18] = a[15];
    assign result[19] = a[15];
    assign result[20] = a[15];
    assign result[21] = a[15];
    assign result[22] = a[15];
    assign result[23] = a[15];
    assign result[24] = a[15];
    assign result[25] = a[15];
    assign result[26] = a[15];
    assign result[27] = a[15];
    assign result[28] = a[15];
    assign result[29] = a[15];
    assign result[30] = a[15];
    assign result[31] = a[15];
endmodule