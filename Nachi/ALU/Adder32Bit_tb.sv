///////////////////////////////////////////////////////////////////////////////
//
// 32 bit ADDER TESTBENCH module
//
// A testbench module for the 32 bit adder
//
// module: FullAdder_tb
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./Adder32Bit.sv"

module Adder32Bit_tb;

   reg [31:0] a, b;   //inputs are reg for test bench
   wire [31:0] s; 
   wire cOut;     //outputs are wire for test bench
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   
   initial
   
       $monitor ("a = %d, b = %d, s = %d, cOut = %d", a, b, s, cOut);

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
   Adder32Bit #(.N(32)) uut(.A(a), .B(b), .S(s), .Cout(cOut));

endmodule

// `endif // Adder32Bit_tb