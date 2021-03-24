module mux5x2 (result, i0, i1, select);
    input [4:0] i0, i1;
    output [4:0] result;
    input select;

    mux2 m1(result[0], i0[0], i1[0], select);
    mux2 m2(result[1], i0[1], i1[1], select);
    mux2 m3(result[2], i0[2], i1[2], select);
    mux2 m4(result[3], i0[3], i1[3], select);
    mux2 m5(result[4], i0[4], i1[4], select);
endmodule