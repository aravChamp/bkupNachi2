`timescale 1ns / 1ps
`include "dFlipFLop.v"

module dffTb;

    reg D;
    reg R, Clk, En;
	reg addy;
    wire Q, Qn;
    
    initial
        $monitor ("D = %d, Clk = %b, addy = %b, Q = %b", D, Clk, addy, Q);
    
    initial
    begin
    
        #0
        D = 1'b1;
		R = 1'b0;
		addy = 1'b1;
        Clk = 1'b0;
		
		#10
        D = 1'b1;
		R = 1'b0;
		addy = 1'b1;
        Clk = 1'b1;
        
    end
    
    initial
    begin
        $dumpfile("waveForm.vcd");
        
        $dumpvars(1, dFF);
    end
    
	dFlipFlop dFF (
        .D1(D),
        .Clk(Clk),
        .R(R),
        .Q2(Q),
        .Qn2(Qn)
    );
	
endmodule