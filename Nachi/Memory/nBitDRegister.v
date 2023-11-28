`include "dFlipFlop.v"


module nBitDRegister #(parameter N=1) (En, D, Clk, R, Q, Qn);

	input En;
    input [N-1:0] D;
    input R, Clk;
    output [N-1:0] Q, Qn;
    
    wire [N-1:0] D;
    wire R, Clk;
    wire [N-1:0] Q, Qn;
	
	and (Clk2, En, Clk); //enables it
	
   genvar i;
   
   generate
    for (i = 0; i < N; i = i + 1) begin
        dFlipFlop dFF (
        .D1(D[i]),
        .Clk(Clk2),
        .R(R),
        .Q2(Q[i]),
        .Qn2(Qn[i])
    	);
    end
	
   endgenerate
	
endmodule
