///////////////////////////////////////////////////////////////////////////////
//
// Left Shift
//
// This module shifts input left by 2 bits
//
// module: shiftLeft
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef shiftLeft
`define shiftLeft

module shiftLeft #(parameter N=32)(A, B);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input [N-1:0] A;
   output [N-1:0] B;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   assign B = {A[29:0], 2'b00};
   
endmodule

`endif // leftShift