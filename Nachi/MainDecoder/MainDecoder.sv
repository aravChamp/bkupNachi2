`include "muxes.sv"

module MainDecoder (Op, regWrite, regDst, aluSrc, branch, memWrite, memToReg, jump, aluOp);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire [5:0] Op;  //Op code input
   
   //output control sequence
   
   output wire regWrite;  //enables writing to register file
   
   output wire regDst;  //register write address
   
   output wire aluSrc;  //provides source for ALU input B
   
   output wire branch;  //goes to Program Counter Source
   
   output wire memWrite;  //enables write to data memory
   
   output wire memToReg;  //enables write from DM to RF
   
   output wire jump;  //to PC
   
   output wire [1:0] aluOp;  //to ALU
   
   
   
   NBitSixtyFourWayMux #(.N(9)) dut (
    .A0(9'b110000010),  //Rtype
    .A1(9'bxxxxxxxxx),
    .A2(9'b000000100),  //Jump
    .A3(9'bxxxxxxxxx),
    .A4(9'b000100001),  //BEQ
    .A5(9'bxxxxxxxxx),
    .A6(9'bxxxxxxxxx),
    .A7(9'bxxxxxxxxx),
    .A8(9'b101000000),  //ADDI
    .A9(9'bxxxxxxxxx),
    .A10(9'bxxxxxxxxx),
    .A11(9'bxxxxxxxxx),
    .A12(9'bxxxxxxxxx),
    .A13(9'bxxxxxxxxx),
    .A14(9'bxxxxxxxxx),
    .A15(9'bxxxxxxxxx),
    .A16(9'bxxxxxxxxx),
    .A17(9'bxxxxxxxxx),
    .A18(9'bxxxxxxxxx),
    .A19(9'bxxxxxxxxx),
    .A20(9'bxxxxxxxxx),
    .A21(9'bxxxxxxxxx),
    .A22(9'bxxxxxxxxx),
    .A23(9'bxxxxxxxxx),
    .A24(9'bxxxxxxxxx),
    .A25(9'bxxxxxxxxx),
    .A26(9'bxxxxxxxxx),
    .A27(9'bxxxxxxxxx),
    .A28(9'bxxxxxxxxx),
    .A29(9'bxxxxxxxxx),
    .A30(9'bxxxxxxxxx),
    .A31(9'bxxxxxxxxx),
    .A32(9'bxxxxxxxxx),  
    .A33(9'bxxxxxxxxx),
    .A34(9'bxxxxxxxxx),  
    .A35(9'b101001000),  //LW
    .A36(9'bxxxxxxxxx),  //and
    .A37(9'bxxxxxxxxx),  //or
    .A38(9'bxxxxxxxxx),
    .A39(9'bxxxxxxxxx),
    .A40(9'bxxxxxxxxx),
    .A41(9'bxxxxxxxxx),
    .A42(9'bxxxxxxxxx),  
    .A43(9'b001010000),  //SW
    .A44(9'bxxxxxxxxx),
    .A45(9'bxxxxxxxxx),
    .A46(9'bxxxxxxxxx),
    .A47(9'bxxxxxxxxx),
    .A48(9'bxxxxxxxxx),
    .A49(9'bxxxxxxxxx),
    .A50(9'bxxxxxxxxx),
    .A51(9'bxxxxxxxxx),
    .A52(9'bxxxxxxxxx),
    .A53(9'bxxxxxxxxx),
    .A54(9'bxxxxxxxxx),
    .A55(9'bxxxxxxxxx),
    .A56(9'bxxxxxxxxx),
    .A57(9'bxxxxxxxxx),
    .A58(9'bxxxxxxxxx),
    .A59(9'bxxxxxxxxx),
    .A60(9'bxxxxxxxxx),
    .A61(9'bxxxxxxxxx),
    .A62(9'bxxxxxxxxx),
    .A63(9'bxxxxxxxxx),
    .S(Op),
    .F({regWrite, regDst, aluSrc, branch, memWrite, memToReg, jump, aluOp})
  );

endmodule