module control_unit (opcode, alusrc, aluop, regwrite2, regwrite1, regdst, branch, bnesig, memwrite, memtoreg, memread, jsig, jalsig, nsig, luisig);
    input [5:0] opcode;
    output [1:0] alusrc, aluop;
    output regwrite2, regwrite1;
    output regdst, branch, bnesig;
    output memwrite, memtoreg, memread;
    output jsig, jalsig, nsig, luisig;

    wire lui_op, r_op, jal_op, j_op, lw_op, sw_op, bne_op, beq_op, ori_op;

    equal_6 is_lui(lui_op, opcode, 6'b001111);
    equal_6 is_r(r_op, opcode, 6'b000000);
    equal_6 is_jal(jal_op, opcode, 6'b000011);
    equal_6 is_j(j_op, opcode, 6'b000010);
    equal_6 is_lw(lw_op, opcode, 6'b100011);
    equal_6 is_sw(sw_op, opcode, 6'b101011);
    equal_6 is_bne(bne_op, opcode, 6'b000101);
    equal_6 is_beq(beq_op, opcode, 6'b000100);
    equal_6 is_ori(ori_op, opcode, 6'b001101);

    and luisig_comb(luisig, lui_op, lui_op);
    and nsig_comb(nsig, r_op, r_op);
    and jalsig_comb(jalsig, jal_op, jal_op);
    and jsig_comb(jsig, j_op, j_op);
    and memread_comb(memread, lw_op, lw_op);
    and memtoreg_comb(memtoreg, lw_op, lw_op);
    and memwrite_comb(memwrite, sw_op, sw_op);
    and bnesig_comb(bnesig, bne_op, bne_op);
    and branchsig_comb(branch, beq_op, beq_op);
    and regdst_comb(regdst, r_op, r_op);
    or regwrite1_comb(regwrite1, lw_op, jal_op, r_op, ori_op, lui_op);
    and regwrite2_comb(regwrite2, r_op, r_op);
    or aluop1_comb(aluop[1], r_op, ori_op);
    or aluop0_comb(aluop[0], beq_op, bne_op, ori_op);
    and alusrc1_comb(alusrc[1], ori_op, ori_op);
    or alusrc0_comb(alusrc[0], lw_op, sw_op);
endmodule