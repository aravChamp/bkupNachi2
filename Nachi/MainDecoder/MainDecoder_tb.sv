///////////////////////////////////////////////////////////////////////////////
//
// Main Decoder TESTBENCH module
//
// A testbench module for the Main Decoder
//
// module: MainDecoder_tb
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./MainDecoder.sv"

module MainDecoder_tb;

   reg [5:0] Op; 
   
   wire regWrite;
   
   wire regDst;
   
   wire aluSrc;
   
   wire branch;
   
   wire memWrite;
   
   wire memToReg;
   
   wire jump;
   
   wire [1:0] aluOp;
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   
   initial
   
       $monitor ("Op = %b, regWrite = %b, regDst = %b, aluSrc = %b, branch = %b, memWrite = %b, memToReg = %b, jump = %b, aluOp = %b", Op, regWrite, regDst, aluSrc, branch, memWrite, memToReg, jump, aluOp);

   initial
   begin
   
   	
       #10
       Op = 6'b000000;
	   
	   #10
       Op = 6'b100011;
	   
	   #10
       Op = 6'b101011;
	   
	   #10
       Op = 6'b000100;
	   
	   #10
       Op = 6'b001000;
	   
	   #10
       Op = 6'b000010;
	   
	   #10
       Op = 6'b010110;
	   
    end
	
   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   MainDecoder uut (.Op(Op), .regWrite(regWrite), .regDst(regDst), .aluSrc(aluSrc), .branch(branch), .memWrite(memWrite), .memToReg(memToReg), .jump(jump), .aluOp(aluOp));

endmodule

// `endif // MainDecoder_tb