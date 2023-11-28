`timescale 1ns / 1ps

module srLatch2 (R, S, Q, Qn);

    input R, S;
    output Q, Qn;
    
    wire R, S, Q, Qn;
    
    nor (Q, R, Qn);
    
    nor (Qn, Q, S);

endmodule