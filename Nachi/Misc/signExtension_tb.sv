///////////////////////////////////////////////////////////////////////////////
//
// Sign Extension TESTBENCH module
//	
// A testbench module for the signExtension
//
// module: signExtension_tb
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./signExtension.sv"

module signExtension_tb;

   reg [15:0] a;   //inputs are reg for test bench
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
       a = 29;
       
	   #10
       a = -29;
       
	   
	   #10
       a = -69;
       
    end
   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   signExtension uut (.A(a), .B(b));

endmodule

// `endif // signExtension_tb