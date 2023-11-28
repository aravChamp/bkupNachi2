///////////////////////////////////////////////////////////////////////////////
//
// 32 bit NOT TESTBENCH module
//	
// A testbench module for the 32 bit NOT
//
// module: Not32Bit_tb
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./Not32Bit.sv"

module Not32Bit_tb;

   reg [31:0] a;   //inputs are reg for test bench
   wire [31:0] s; 
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   
   initial
   
       $monitor ("a = %b, s = %b", a, s);

   initial
   begin
   
       #10
       a = 0;
      
       
       #10
       a = 14;
      
       
       #10
       a = 1;
      
       
       #10
       a = 180;
      
       
       #10
       a = 1543;
       
       
       
    end
   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   Not32Bit #(.N(32)) uut (.A(a), .F(s));

endmodule

// `endif // Not32Bit_tb