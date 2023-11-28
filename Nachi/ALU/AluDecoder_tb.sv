///////////////////////////////////////////////////////////////////////////////
//
// ALU Decoder TESTBENCH module
//
// A testbench module for the ALU Decoder
//
// module: AluDecoder_tb
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./AluDecoder.sv"

module AluDecoder_tb;

   reg [5:0] func;   //inputs are reg for test bench
   reg [1:0] aluop; 
   wire [2:0] aluctrl;
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   
   initial
   
       $monitor ("func = %b, aluop = %b, aluctrl = %b", func, aluop, aluctrl);

   initial
   begin
   
   		//I-type
       #10
       func = 6'b100010;
       aluop = 2'b00;
	   
	   #10
       func = 6'b101011;
       aluop = 2'b01;
	   
	   //R-Type
	   #10
       func = 6'b100000;
       aluop = 2'b10;
	   
	   #10
       func = 6'b100010;
       aluop = 2'b10;
	   
	   #10
       func = 6'b100100;
       aluop = 2'b11;
	   
	   #10
       func = 6'b100101;
       aluop = 2'b10;
	   
	   #10
       func = 6'b101010;
       aluop = 2'b11;
     
	   
    end
   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   AluDecoder uut (.F(func), .Op(aluop), .Ctrl(aluctrl));

endmodule

// `endif // ALU_tb