module mips32(clk);
    input clk;

    //! instruction field splitting
    wire [31:0] instruction;
    wire [5:0] opcode;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [5:0] funct;
    wire [15:0] imm;
    wire [25:0] address;
    split_instruction_fields instruction_fields(opcode, rs, rt, rd, funct, imm, address, instruction);

    //! Forward declarations
    wire [31:0] rsdata, rtdata;
    wire [31:0] alu_result, alu_n;
    wire [31:0] memory_read_data;
    wire alu_zero;

    //! Main control
    wire [1:0] alusrc, aluop;
    wire regwrite2, regwrite1, regdst, branch, bnesig, memwrite, memtoreg, memread, jsig, jalsig, nsig, luisig;
    control_unit main_control(
        opcode,
        alusrc,
        aluop,
        regwrite2,
        regwrite1,
        regdst,
        branch,
        bnesig,
        memwrite,
        memtoreg,
        memread,
        jsig,
        jalsig,
        nsig,
        luisig
    );

    //!ALU control
    wire jrsig;
    wire [2:0] alu_control_result;
    alu_control alu_control_unit(
        aluop,
        funct,
        alu_control_result, 
        jrsig
    );

    //! needed immediate values, signex, zero, signextshift, zeroextshift16
    wire [31:0] signext_imm, zeroext_imm, signext_shift_imm, zeroext_shift_imm;
    // sign extend the immediate value
    sign_extend sign_extender(signext_imm, imm);
    // zero extend the immediate value
    zero_extend zero_extender(zeroext_imm, zeroext_shift_imm, imm);
    // zero extended and shifted immediate value
    // left_shift_16 zeroext_shift16(zeroext_shift_imm, zeroext_imm);
    left_shift_2 signext_shift2(signext_shift_imm, signext_imm);

    //! next pc logic
    wire [31:0] pc, pc_next_address;
    wire [31:0] pc_plus_4, next_branch_address, branch_value_1, branch_value_final, address_bus_result;
    wire pc_plus_4_cout, next_branch_address_cout;
    wire not_alu_zero, do_beq, do_bne, do_branch, pc_mux_select;
    full_adder32x2 pc_plus_4_adder(pc, 32'b00000000000000000000000000000001, 1'b0, pc_plus_4, pc_plus_4_cout);
    full_adder32x2 next_branch_address_adder(pc_plus_4, signext_imm, 1'b0, next_branch_address, next_branch_address_cout);
    not(not_alu_zero, alu_zero);
    and beq_comb(do_beq, branch, alu_zero);
    and bne_comb(do_bne, bnesig, not_alu_zero);
    or do_branch_comb(do_branch, do_beq, do_bne);
    mux32x2 branch_mux_1(branch_value_1, pc_plus_4, next_branch_address, do_branch);
    mux32x2 branch_mux_final(branch_value_final, branch_value_1, rsdata, jrsig);
    pc_address_bus address_bus(address_bus_result, pc[31:26], address);
    or pc_mux_comb(pc_mux_select, jsig, jalsig);
    mux32x2 pc_mux(pc_next_address, branch_value_final, address_bus_result, pc_mux_select);

    //! pc register
    program_counter_register pc_register(pc_next_address, pc, clk);

    //! instruction memory
    instruction_memory imemory(
        instruction,
        pc,
        clk
    );

    wire [4:0] writereg_regdst_mux_result, writereg_jal_mux_result;
    //! input of write register #1
    mux5x2 writereg_regdst_mux(
        writereg_regdst_mux_result,
        rt,
        rd,
        regdst
    );
    mux5x2 writereg_jal_mux(
        writereg_jal_mux_result,
        writereg_regdst_mux_result,
        5'b11111,
        jalsig
    );

    //! Registers
    wire [31:0] memtoreg_mux_result, luisig_mux_result, nsig_mux_result, writedata_jalsig_mux_result;
    wire not_jrsig, final_regwrite_1, final_regwrite_2;
    // memtoreg mux between alu result and memory read data
    mux32x2 memtoreg_mux(memtoreg_mux_result, alu_result, memory_read_data, memtoreg);
    // luisig mux between alu result and zero extend shift immediate
    mux32x2 luisig_mux(luisig_mux_result, memtoreg_mux_result, zeroext_shift_imm, luisig);
    // nsig mux between alu n result and luimux result
    mux32x2 nsig_mux(nsig_mux_result, luisig_mux_result, alu_n, nsig);
    // jalsig mux between alu n and pc bus address
    mux32x2 writedata_jalsig_mux(writedata_jalsig_mux_result, nsig_mux_result, address_bus_result, jalsig);
    not(not_jrsig, jrsig);
    and jr_prevent_write_1(final_regwrite_1, regwrite1, not_jrsig);
    and jr_prevent_write_2(final_regwrite_2, regwrite2, not_jrsig);

    mips_registers registers(
        .read_reg_1(rs),
        .read_reg_2(rt),
        .write_reg_1(writereg_jal_mux_result),
        .write_data_1(writedata_jalsig_mux_result),
        .write_reg_2(rs),
        .write_data_2(memtoreg_mux_result),
        .read_data_1(rsdata),
        .read_data_2(rtdata),
        .signal_reg_write_1(final_regwrite_1),
        .signal_reg_write_2(final_regwrite_2),
        .clk(clk)
    );

    wire [31:0] alu_input_mux_result;
    //! input of alu
    mux32x4 alu_input_mux(
        alu_input_mux_result,
        rtdata,
        signext_imm,
        zeroext_imm,
        32'b0,
        alusrc
    );

    //! main alu
    alu_32 alu(
        alu_result,
        alu_zero,
        alu_n,
        rsdata,
        alu_input_mux_result,
        alu_control_result
    );

    //! main data memory
    data_memory main_memory(
        .read_data(memory_read_data),
        .address(alu_result),
        .write_data(rtdata),
        .mem_write(memwrite),
        .mem_read(memread),
        .clk(clk)
    );
endmodule