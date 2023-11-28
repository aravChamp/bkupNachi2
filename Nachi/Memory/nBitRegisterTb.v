`timescale 1ns / 1ps
`include "thrityTwoBitRegisterFile.sv"

module nBitDRegisterTb;

    reg [31:0] D;
    reg R, Clk, En;
	reg [4:0] addy;
    wire [31:0] Q, Qn;
    
    initial
        $monitor ("D = %d, Clk = %b, addy = %b, Q = %b", D, Clk, addy, Q);
    
    initial
    begin
    
        #0
        D = 8'd7;
		addy = 1;
        Clk = 1'b0;
		
		#10
        D = 8'd7;
		addy = 1;
        Clk = 1'b1;
		
		#10
        D = 8'd7;
		addy = 1;
        Clk = 1'b0;
		
		#10
        D = 8'd7;
		addy = 1;
        Clk = 1'b1;
        
    end
    
    initial
    begin
        $dumpfile("waveForm.vcd");
        
        $dumpvars(1, register1);
    end
    
	nBitDRegister #(.N(32)) register1 (
			.En(b1), 
			.D(D), 
			.Clk(Clk), 
			.R(1'b0), 
			.Q(Q), 
			.Qn(Qn)
	);

endmodule