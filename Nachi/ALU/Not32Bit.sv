///////////////////////////////////////////////////////////////////////////////
//
// 32 Bit NOT Gate
//
// This module is a 32 Bit NOT Gate made from 1 bit NOT gates
//
// module: NOT32Bit
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef Not32Bit
`define Not32Bit

module Not32Bit #(parameter N=32)(A, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input [N-1:0] A;
   output [N-1:0] F;
   
   wire [N-1:0] A;
   wire [N-1:0] F;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   
   genvar i;
   
   generate 
    for (i = 0; i < N; i = i+1) begin: forloop
        not(F[i], A[i]);
    end
   endgenerate
   
endmodule

`endif // Not32Bit