///////////////////////////////////////////////////////////////////////////////
//
// ALU
//
// This module is a 32 Bit ALU
//
// module: ALU
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef ALU
`define ALU

`include "Or32Bit.sv"
`include "And32Bit.sv"
`include "Not32Bit.sv"
`include "Adder32Bit.sv"
`include "muxes.sv"


module ALU #(parameter N=32)(A, B, F, Cout, Y, zf);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input [N-1:0] A, B;
   input [2:0] F;
   output [N-1:0] Y;
   output Cout, zf;
   
   wire [N-1:0] A, B;
   wire [2:0] F;
   wire [N-1:0] Y;
   wire Cout, zf;
   
   wire [N-1:0] Bnot, BB;
   
   
   wire [N-1:0] andY, orY, sumDiffY, U;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   Not32Bit #(.N(N)) altB (.A(B), .F(Bnot));
   
   NBitTwoWayMux #(.N(N)) chooseBB (.A(B), .B(Bnot), .S(F[2]), .F(BB));
   
   And32Bit #(.N(N)) Yand (.A(A), .B(BB), .F(andY));
   
   Or32Bit #(.N(N)) Yor (.A(A), .B(BB), .F(orY));
   
   Adder32Bit #(.N(N)) YSumDiff (.A(A), .B(BB), .cIn(F[2]), .S(sumDiffY), .Cout(Cout));
   
   assign U[N-1:1] = 0;
   assign U[0] = sumDiffY[N-1];
   
   NBitFourWayMux #(.N(N)) muxY (.A(andY), .B(orY), .C(sumDiffY), .D(U), .S(F[1:0]), .F(Y));
   
   assign zf = Y==0; //zero flag
   
endmodule

`endif // ALU