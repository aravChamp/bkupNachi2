`include "muxes.sv"

module AluDecoder (F, Op, Ctrl);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire [5:0] F; 
   input wire [1:0] Op;
   output wire [2:0] Ctrl;
   
   wire [2:0] Rtype;
   
   NBitFourWayMux #(.N(3)) CtrlMux (.A(3'b010), .B(3'b110), .C(Rtype), .D(Rtype), .S(Op), .F(Ctrl));
   
     NBitSixtyFourWayMux #(.N(3)) dut (
    .A0(3'bxxx),
    .A1(3'bxxx),
    .A2(3'bxxx),
    .A3(3'bxxx),
    .A4(3'bxxx),
    .A5(3'bxxx),
    .A6(3'bxxx),
    .A7(3'bxxx),
    .A8(3'bxxx),
    .A9(3'bxxx),
    .A10(3'bxxx),
    .A11(3'bxxx),
    .A12(3'bxxx),
    .A13(3'bxxx),
    .A14(3'bxxx),
    .A15(3'bxxx),
    .A16(3'bxxx),
    .A17(3'bxxx),
    .A18(3'bxxx),
    .A19(3'bxxx),
    .A20(3'bxxx),
    .A21(3'bxxx),
    .A22(3'bxxx),
    .A23(3'bxxx),
    .A24(3'bxxx),
    .A25(3'bxxx),
    .A26(3'bxxx),
    .A27(3'bxxx),
    .A28(3'bxxx),
    .A29(3'bxxx),
    .A30(3'bxxx),
    .A31(3'bxxx),
    .A32(3'b010),  //add
    .A33(3'bxxx),
    .A34(3'b110),  //sub
    .A35(3'bxxx),
    .A36(3'b000),  //and
    .A37(3'b001),  //or
    .A38(3'bxxx),
    .A39(3'bxxx),
    .A40(3'bxxx),
    .A41(3'bxxx),
    .A42(3'b111),  //slt
    .A43(3'bxxx),
    .A44(3'bxxx),
    .A45(3'bxxx),
    .A46(3'bxxx),
    .A47(3'bxxx),
    .A48(3'bxxx),
    .A49(3'bxxx),
    .A50(3'bxxx),
    .A51(3'bxxx),
    .A52(3'bxxx),
    .A53(3'bxxx),
    .A54(3'bxxx),
    .A55(3'bxxx),
    .A56(3'bxxx),
    .A57(3'bxxx),
    .A58(3'bxxx),
    .A59(3'bxxx),
    .A60(3'bxxx),
    .A61(3'bxxx),
    .A62(3'bxxx),
    .A63(3'bxxx),
    .S(F),
    .F(Rtype)
  	);

endmodule