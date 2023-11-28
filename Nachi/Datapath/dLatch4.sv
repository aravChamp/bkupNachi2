`timescale 1ns / 1ps
`include "srLatch2.v"

module dLatch4 (D, Clk, R, Q, Qn);

    input D, Clk, R;
    output Q, Qn;
    
    wire D, Clk;
    wire Dn, R, S, R2, R3;
    wire Q, Qn;
    
    srLatch2 srOne (
        .R(R3),
        .S(S),
        .Q(Q),
        .Qn(Qn)
    );
    
    or (R3, R, R2);
    
    and (R2, Clk, Dn);
    
    and (S, Clk, D);
    
    not (Dn, D);

endmodule