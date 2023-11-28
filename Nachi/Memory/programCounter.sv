`include "nBitDRegister.v"

module programCounter (R, PC, PCnot, Clk);

	input wire [31:0] PCnot;
	input wire R, Clk;
	
	output wire [31:0] PC;
	
	wire [31:0] Qn;
	
	nBitDRegister #(.N(32)) pc (
			.En(1'b1), 
			.D(PCnot),
			.Clk(Clk), 
			.R(R), 
			.Q(PC), 
			.Qn(Qn)
	);

endmodule