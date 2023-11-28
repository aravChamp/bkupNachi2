///////////////////////////////////////////////////////////////////////////////
//
// 32 bit OR TESTBENCH module
//	
// A testbench module for the 32 bit OR
//
// module: Or32Bit_tb
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./Or32Bit.sv"

module Or32Bit_tb;

   reg [31:0] a, b;   //inputs are reg for test bench
   wire [31:0] s; 
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   
   initial
   
       $monitor ("a = %b, b = %b, s = %b", a, b, s);

   initial
   begin
   
       #10
       a = 0;
       b = 0;
       
       #10
       a = 14;
       b = 2;
       
       #10
       a = 1;
       b = 2;
       
       #10
       a = 180;
       b = 267;
       
       #10
       a = 1543;
       b = 23;
       
       
    end
   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   Or32Bit #(.N(32)) uut (.A(a), .B(b), .F(s));

endmodule

// `endif // Or32Bit_tb