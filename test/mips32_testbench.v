module mips32_testbench ();

reg clk,clk2;

always #100 clk=~clk;
always #100 clk2=~clk2;

mips32 test_mips32(clk);

initial begin
    clk = 1;
    clk2 = 1;
    // initialize register values from register.mem
    // load instructions into memory
    // if needed, increase size of imemory, it currently can hold 32 instruction.
    // but limit is arbitrial, since limit increase also increases synthesis time, i stayed with 32
    $readmemb("instruction.mem", test_mips32.imemory.memory); 
    $readmemb("registers.mem", test_mips32.registers.registers);
end

always @(negedge clk2) begin
    $writememb("data.mem", test_mips32.main_memory.memory);
    $writememb("registers.mem", test_mips32.registers.registers);
end


endmodule