///////////////////////////////////////////////////////////////////////////////
//
// Control Unit TESTBENCH module
//
// A testbench module for the Control Unit
//
// module: ControlUnit_tb
// hdl: Verilog
//
// author: Arav Sharma <arav.sharma@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./ControlUnit.sv"

module ControlUnit_tb;

   reg [5:0] Op, funct;
   
   reg zero;
   
   wire memToReg, memWrite, pcSource, aluSource, regDst, regWrite, jump;
   
   wire [2:0] aluControl;
   
   wire [1:0] aluOp;
   
   wire branch;
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   
   initial
   
       $monitor ("Op = %b, funct = %b, zero = %b, memToReg = %b, memWrite = %b, pcSource = %b, aluSource = %b, regDst = %b, regWrite = %b, jump = %b, aluControl = %b", Op, funct, zero, memToReg, memWrite, pcSource, aluSource, regDst, regWrite, jump, aluControl);

   initial
   begin
   
   //R-type
   
   		//ADD 0/20
       #10
       Op = 6'h0;
	   funct = 6'h20;
	   zero = 0;
	   
	   //SUB 0/22
       #10
       Op = 6'h0;
	   funct = 6'h22;
	   zero = 0;
	   
	   //AND 0/24
       #10
       Op = 6'h0;
	   funct = 6'h24;
	   zero = 0;
	   
	   //OR 0/25
       #10
       Op = 6'h0;
	   funct = 6'h25;
	   zero = 0;
	   
	   //SLT 0/2a
       #10
       Op = 6'h0;
	   funct = 6'h2a;
	   zero = 0;
	   
	//I-type
	   
	   //LW 23
       #10
       Op = 6'h23;
	   funct = 6'bxxxxxx;
	   zero = 0;
	   
	   //SW 2b
       #10
       Op = 6'h2b;
	   funct = 6'bxxxxxx;
	   zero = 0;
	   
	   //ADDi 8
       #10
       Op = 6'h8;
	   funct = 6'bxxxxxx;
	   zero = 0;
	   
	   //BEQ 4
       #10
       Op = 6'h4;
	   funct = 6'bxxxxxx;
	   zero = 0;
	   
	//J-type
	
		//J 2
       #10
       Op = 6'h2;
	   funct = 6'bxxxxxx;
	   zero = 0;
	   
     
	   
    end
   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   ControlUnit champ (.Op(Op), .funct(funct), .zero(zero), .memToReg(memToReg), .memWrite(memWrite), .pcSource(pcSource), .aluSource(aluSource), .regDst(regDst), .regWrite(regWrite), .jump(jump), .aluControl(aluControl));

endmodule

// `endif // ALU_tb