///////////////////////////////////////////////////////////////////////////////
//
// Left Shift TESTBENCH module
//	
// A testbench module for the shiftLeft
//
// module: shiftLeft_tb
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./shiftLeft.sv"

module shiftLeft_tb;

   reg [31:0] a;   //inputs are reg for test bench
   wire [31:0] b; 
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   
   initial
   
       $monitor ("a = %b, b = %b", a, b);

   initial
   begin
   
       #10
       a = 0;
	   
	   #10
       a = 45;
	   
	   #10
       a = 290;
       
       
       
    end
   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   shiftLeft #(.N(32)) uut (.A(a), .B(b));

endmodule

// `endif // shiftLeft_tb