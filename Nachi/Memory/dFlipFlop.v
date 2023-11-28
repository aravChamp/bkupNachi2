`timescale 1ns / 1ps
`include "dLatch4.v"

module dFlipFlop (D1, Clk, R, Q2, Qn2);

    input D1, Clk, R;
    output Q2, Qn2;
    
    wire D1, R, Clk, ClkN;
    wire Q1, Qn1, Q2, Qn2;
    
    
    not (ClkN, Clk);
    
    dLatch4 Master (
        .D(D1),
        .Clk(ClkN),
        .R(R),
        .Q(Q1),
        .Qn(Qn1)
    );
    
    dLatch4 Slave (
        .D(Q1),
        .Clk(Clk),
        .R(R),
        .Q(Q2),
        .Qn(Qn2)
    );

endmodule