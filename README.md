# MIPS-32 CPU

32-bit CPU with MIPS architecture made with Verilog. It also has some new instructions.

## CPU Design

![CPU-Design](https://github.com/xinoip/mips32-cpu/blob/master/resource/cpu-design.png?raw=true)

CPU design with new instructions is a tweaked version of default MIPS design.

## Circuit Design

![Circuit-Design](https://github.com/xinoip/mips32-cpu/blob/master/resource/circuit-design.png?raw=true)

Design uses only Structural Verilog. Behavioral Verilog was not used for educational purposes.

## Instructions

These are the supported instructions of the CPU. Instructions follows the MIPS standart. There are also new instructions. Those instructions and with letter 'n'.

| Name | Instruction | RTL |
|------|-------------|-----|
| Load Upper Imm. | lui |  R[rt] = {imm, 16’b0} |
| Store Word | sw | M[R[rs]+SignExtImm] = R[rt] |
| Load Word | lw | R[rt] = M[R[rs]+SignExtImm] |
| Jump | j | PC=JumpAddr |
| Jump And Link | jal | R[31]=PC+8;PC=JumpAddr |
| Jump Register | jr |  PC=R[rs] |
| Branch On Equal | jr | if(R[rs]==R[rt])<br />&nbsp;&nbsp;&nbsp;&nbsp;PC=PC+4+BranchAddr |
| Branch On Not Equal | bne | if(R[rs]!=R[rt])<br />&nbsp;&nbsp;&nbsp;&nbsp;PC=PC+4+BranchAddr |
| Or Imm. | ori | R[rt] = R[rs] or ZeroExtImm |
| New Add | addn | R[rs] = R[rs] + R[rt];<br />if (R[rs] + R[rt] == 0)<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 1;<br />else if (R[rs] + R[rt] == 1)<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 2;<br />else<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 3; |
| New Sub | subn | R[rs] = R[rs] - R[rt];<br />if (R[rs] - R[rt] == 0)<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 1;<br />else if (R[rs] - R[rt] == 1)<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 2;<br />else<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 3; |
| New Or | orn | R[rs] = R[rs] or R[rt];<br />if (R[rs] or R[rt] == 0)<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 1;<br />else if (R[rs] or R[rt] == 1)<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 2;<br />else<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 3; |
| New Xor | xorn | R[rs] = R[rs] xor R[rt];<br />if (R[rs] xor R[rt] == 0)<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 1;<br />else if (R[rs] xor R[rt] == 1)<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 2;<br />else<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 3; |
| New And | andn | R[rs] = R[rs] and R[rt];<br />if (R[rs] and R[rt] == 0)<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 1;<br />else if (R[rs] and R[rt] == 1)<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 2;<br />else<br />&nbsp;&nbsp;&nbsp;&nbsp;R[rd] = 3; |

## Install Quartus Project

You can install the project as a qar file [here](https://github.com/xinoip/mips32-cpu/releases/tag/1.0)

## Example Program

An example machine code program with commented assembly explanations. This program uses every available instruction that the CPU supports.

```java
// memory test
// sw $7 2($6)
10101100110001110000000000000010
// lw $5 2($6)
10001100110001010000000000000010

// j test
// j 4
00001000000000000000000000000100
// sw $2 2($1) (dummy will jump over)
10101100001000100000000000000010
// lw $3 2($1) (dummy will jump over)
10001100001000110000000000000010
// lw $3 2($1) (dummy will jump over)
10001100001000110000000000000010
// lui $7 1110011100111001
00111100000001111110011100111001

// jal test
// jal 4
00001100000000000000000000000100
// sw $2 2($1) (dummy will jump over)
10101100001000100000000000000010
// lw $3 2($1) (dummy will jump over)
10001100001000110000000000000010
// lw $3 2($1) (dummy will jump over)
10001100001000110000000000000010
// lui $7 1110011100111001
00111100000001111110011100111001

// jr test
// jr $4
00000000100000000000000000001000
// sw $2 2($1) (dummy will jump over)
10101100001000100000000000000010
// lw $3 2($1) (dummy will jump over)
10001100001000110000000000000010
// lw $3 2($1) (dummy will jump over)
10001100001000110000000000000010
// lui $7 1110011100111001
00111100000001111110011100111001

// beq test
// beq $1 $5 to 4th instruction
00010000001001010000000000000011
// sw $2 2($1) (dummy will jump over)
10101100001000100000000000000010
// lw $3 2($1) (dummy will jump over)
10001100001000110000000000000010
// lw $3 2($1) (dummy will jump over)
10001100001000110000000000000010
// lui $7 1110011100111001
00111100000001111110011100111001

// bne test
// bne $1 $5 to 4th instruction
00010100001001010000000000000011
// sw $2 2($1) (dummy will jump over)
10101100001000100000000000000010
// lw $3 2($1) (dummy will jump over)
10001100001000110000000000000010
// lw $3 2($1) (dummy will jump over)
10001100001000110000000000000010
// lui $7 1110011100111001
00111100000001111110011100111001

// ori test
// ori $17 $16 1110001110001110
00110110000100011110001110001110

// addn test
// addn $3 $1 $2
00000000001000100001100000100000

// subn test
// subn $3 $1 $2
00000000001000100001100000100010

// orn test
// orn $3 $1 $2
00000000001000100001100000100101
// xorn $3 $1 $2
00000000001000100001100000100110
// andn $3 $1 $2
00000000001000100001100000100100
```