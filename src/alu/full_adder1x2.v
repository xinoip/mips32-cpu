module full_adder1x2(a,b,cin,sum,cout);
    input a,b,cin;
    output sum,cout;
    wire s1,c1,c2,c3;
    xor t1(s1,a,b);
    xor t2(sum,s1,cin);
    and t3(c1,a,b);
    and t4(c2,b,cin);
    and t5(c3,a,cin);
    or t6(cout,c1,c2,c3);
endmodule