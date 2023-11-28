///////////////////////////////////////////////////////////////////////////////
//
// 32 Bit OR Gate
//
// This module is a 32 Bit OR Gate made from 1 bit OR gates
//
// module: Or32Bit
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef Or32Bit
`define Or32Bit

module Or32Bit #(parameter N=32)(A, B, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input [N-1:0] A, B;
   output [N-1:0] F;
   
   wire [N-1:0] A, B;
   wire [N-1:0] F;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   genvar i;
   
   generate 
    for (i = 0; i < N; i = i+1) begin: forloop
        or(F[i], A[i], B[i]);
    end
   endgenerate
   
endmodule

`endif // Or32Bit