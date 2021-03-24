module xnor_6x2 (result, a, b);
    input [5:0] a, b;
    output [5:0] result;
    
    xnor m0(result[0], a[0], b[0]);
    xnor m1(result[1], a[1], b[1]);
    xnor m2(result[2], a[2], b[2]);
    xnor m3(result[3], a[3], b[3]);
    xnor m4(result[4], a[4], b[4]);
    xnor m5(result[5], a[5], b[5]);
endmodule