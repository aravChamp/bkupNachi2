///////////////////////////////////////////////////////////////////////////////
//
// 32 Bit Adder
//
// This module is a 32 Bit Adder made from half and full adders
//
// module: Adder32Bit
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef Adder32Bit
`define Adder32Bit

`include "FullAdder.sv"

module Adder32Bit #(parameter N=2)(A, B, cIn, S, Cout);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input [N-1:0] A, B;
   input cIn;
   output [N-1:0] S;
   output Cout;
   
   wire cIn;
   wire [N-1:0] A, B;
   wire [N-1:0] S;
   wire Cout;
   wire [N-2:0] carrys;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   FullAdder Adder1 (.A(A[0]), .B(B[0]), .Cin(cIn), .S(S[0]), .Cout(carrys[0]));
   
   genvar i;
   
   generate 
    for (i = 1; i < N-1; i = i+1) begin: forloop
        FullAdder adder_i (.A(A[i]), .B(B[i]), .Cin(carrys[i-1]), .S(S[i]), .Cout(carrys[i]));
    end
   endgenerate
   
   FullAdder adder_i (.A(A[N-1]), .B(B[N-1]), .Cin(carrys[N-2]), .S(S[N-1]), .Cout(Cout));
   
endmodule

`endif // Adder32Bit