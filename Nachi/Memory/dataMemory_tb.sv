`timescale 1ns / 1ps
`include "dataMemory.sv"

module dataMemory_tb;

    reg [31:0] D;
    reg r, Clk, En;
	reg [4:0] addy;
    wire [31:0] Q;
	
	reg [5:0] count;
    
    initial
        $monitor ("D = %d, Clk = %b, addy = %b, Q = %b", D, Clk, addy, Q);
    
    initial
    begin
    
        #0
		r = 1'b1; //reset at start up
		
		#10
		r = 1'b0;
		En = 1;
        D = 7;
		addy = 1;
        Clk = 1'b0;
		
		for (count = 0; count <= 31; count = count + 1) begin
   			
			#10
			En = 1;
        	D = count;
			addy = count;
        	Clk = 1'b0;
			
			#10
			En = 1;
        	D = count;
			addy = count;
        	Clk = 1'b1;
   		end
		
		#10
			En = 1;
        	D = 2147483647;
			addy = 1;
        	Clk = 1'b0;
			
			#10
			En = 1;
        	D = 2147483647;
			addy = 1;
        	Clk = 1'b1;
			
			#10
			En = 1;
        	D = -2147483648;
			addy = count;
        	Clk = 1'b0;
			
			#10
			En = 1;
        	D = -2147483648;
			addy = count;
        	Clk = 1'b1;
		
        
    end
    
    initial
    begin
        $dumpfile("waveForm.vcd");
        
        $dumpvars(1, regF);
    end
	
	dataMemory regF (
		.R(r),  
		.Clock(Clk), 
		.WriteEn(En),
		.Addy(addy),
		.WriteData(D),
		.ReadData(Q)
	);

endmodule