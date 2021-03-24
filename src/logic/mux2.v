module mux2 (result, i0, i1, select);
    input i0, i1, select;
    output result;
    wire n1, n2, not_select;

    not(not_select, select);
    and(n1, i0, not_select);
    and(n2, i1, select);
    or(result, n1, n2);
endmodule