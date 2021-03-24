module equal_2 (result, a, b);
    input [1:0] a, b;
    output result;

    wire [1:0] r;
    
    xnor n0(r[0], a[0], b[0]);
    xnor n1(r[1], a[1], b[1]);

    and(result, r[0], r[1]);
endmodule