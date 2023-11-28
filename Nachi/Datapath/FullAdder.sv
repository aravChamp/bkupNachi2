///////////////////////////////////////////////////////////////////////////////
//
// Full Adder
//
// This module is a full adder with carry in function built with half adders
//
// module: FullAdder
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef FullAdder
`define FullAdder

`include "HalfAdder.sv"

module FullAdder(A, B, Cin, S, Cout);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input A, B, Cin;
   output S, Cout;
   
   wire A, B, Cin;
   wire AplusB, cOut1, cOut2;
   wire S, Cout;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   HalfAdder lowerHalfAdder (.A(A), .B(B), .S(AplusB), .Cout(cOut1));
   HalfAdder upperHalfAdder (.A(Cin), .B(AplusB), .S(S), .Cout(cOut2));
   or (Cout, cOut1, cOut2);
   
   
endmodule

`endif // HalfAdder