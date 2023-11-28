///////////////////////////////////////////////////////////////////////////////
//
// 32 bit ALU TESTBENCH module
//
// A testbench module for the 32 bit ALU
//
// module: ALU_tb
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./ALU.sv"

module ALU_tb;

   reg [31:0] a, b;   //inputs are reg for test bench
   reg [2:0] func; 
   wire cOut;     //outputs are wire for test bench
   wire [31:0] y;
   wire ZF;
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   
   initial
   
       $monitor ("a = %b, b = %b, func = %b, c0ut = %d, y = %b, ZF = %b", a, b, func, cOut, y, ZF);

   initial
   begin
   
   		//And
       #10
       a = 34;
       b = 26;
	   func = 3'b000;
       
	   //or
       #10
       a = 14;
       b = 2;
	   func = 3'b001;
       
	   //Add
       #10
       a = 1;
       b = 2;
	   func = 3'b010;
       
	   //And not
       #10
       a = 180;
       b = 267;
	   func = 3'b100;
       
	   //or not
       #10
       a = 1543;
       b = 23;
	   func = 3'b101;
       
       //subtract
       #10
       a = 1543;
       b = 23;
	   func = 3'b110;
	   
	   //slt
       #10
       a = 143;
       b = 23;
	   func = 3'b111;
	   
	   //slt
       #10
       a = 1;
       b = 223;
	   func = 3'b111;
	   
    end
   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   ALU #(.N(32)) uut(.A(a), .B(b), .F(func), .Cout(cOut), .Y(y), .zf(ZF));

endmodule

// `endif // ALU_tb