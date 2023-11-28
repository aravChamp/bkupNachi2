///////////////////////////////////////////////////////////////////////////////
//
// Half Adder
//
// This module recieves two bits and produces a sum as well as a carry out
//
// module: HalfAdder
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef HalfAdder
`define HalfAdder

module HalfAdder(A, B, S, Cout);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input A, B;
   output S, Cout;
   
   wire A, B;
   wire S, Cout;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   xor (S, A, B);
   and (Cout, A, B);
   
   
endmodule

`endif // HalfAdder