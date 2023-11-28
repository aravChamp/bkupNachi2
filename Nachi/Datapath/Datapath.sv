module datapath(input wire clk, reset,
	input wire memToReg, pcSource,
	input wire aluSource, regDst,
	input wire regWrite, jump,
	input wire [2:0] aluControl,
	output wire zero,
	output wire [31:0] pc,
	input wire [31:0] instr,
	output wire [31:0] aluOut, writeData,
	input wire [31:0] readData);


wire [4:0] writeReg;
wire [31:0] pcNext, pcNextBr, pcPlus4, pcBranch;
wire [31:0] signImm, signImmsh;
wire [31:0] srcA, srcB;
wire [31:0] result;

// next PC logic
flopr #(32) pcreg(clk, reset, pcnext, pc);
adder pcadd1(pc, 32'b100, pcplus4);
sl2 immsh(signimm, signimmsh);
adder pcadd2(pcplus4, signimmsh, pcbranch);
mux2 #(32) pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
mux2 #(32) pcmux(pcnextbr, {pcplus4[31:28],
instr[25:0], 2'b00}, jump, pcnext);

// register file logic
regfile rf(clk, regwrite, instr[25:21], instr[20:16],
writereg, result, srca, writedata);
mux2 #(5) wrmux(instr[20:16], instr[15:11],
regdst, writereg);
mux2 #(32) resmux(aluout, readdata, memtoreg, result);
signext se(instr[15:0], signimm);

// ALU logic
mux2 #(32) srcbmux(writedata, signimm, alusrc, srcb);
alu alu(srca, srcb, alucontrol, aluout, zero);

endmodule