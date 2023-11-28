///////////////////////////////////////////////////////////////////////////////
//
// 32 Bit And Gate
//
// This module is a 32 Bit AND Gate made from 1 bit AND gates
//
// module: And32Bit
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef And32Bit
`define And32Bit

module And32Bit #(parameter N=32)(A, B, F);
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
        and(F[i], A[i], B[i]);
    end
   endgenerate
   
endmodule

`endif // And32Bit