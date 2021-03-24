module mux4 (result, i0, i1, i2, i3, select);
    input i0, i1, i2, i3;
    input [1:0] select;
    output result;

    wire n1, n2;

    mux2 mux_1(n1, i0, i1, select[0]);
    mux2 mux_2(n2, i2, i3, select[0]);
    mux2 mux_result(result, n1, n2, select[1]);
endmodule