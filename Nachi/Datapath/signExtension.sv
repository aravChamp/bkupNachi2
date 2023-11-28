///////////////////////////////////////////////////////////////////////////////
//
// Sign Extension
//
// This module sign extends 16 bit input to 32 bits
//
// module: signExtension
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef signExtension
`define signExtension

module signExtension (A, B);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input [15:0] A;
   output [31:0] B;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   assign B = {{16{A[15]}}, A};
   
endmodule

`endif // leftShift