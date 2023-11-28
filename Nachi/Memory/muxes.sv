module NBitThirtyTwoWayMux #(parameter N=1) (A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31, S, F);

	input wire [N-1:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19, A20, A21, A22, A23, A24, A25, A26, A27, A28, A29, A30, A31;

	wire [N-1:0] B0, B1;
	
	input wire [4:0] S;
	
	output wire [N-1:0] F;
	
	NBitSixteenWayMux #(.N(N)) lowMux (.A0(A0), .A1(A1), .A2(A2), .A3(A3), .A4(A4), .A5(A5), .A6(A6), .A7(A7), .A8(A8), .A9(A9), .A10(A10), .A11(A11), .A12(A12), .A13(A13), .A14(A14), .A15(A15), .S(S[3:0]), .F(B0));
	
	NBitSixteenWayMux #(.N(N)) highMux (.A0(A16), .A1(A17), .A2(A18), .A3(A19), .A4(A20), .A5(A21), .A6(A22), .A7(A23), .A8(A24), .A9(A25), .A10(A26), .A11(A27), .A12(A28), .A13(A29), .A14(A30), .A15(A31), .S(S[3:0]), .F(B1));
	
	NBitTwoWayMux #(.N(N)) finMux(.A(B0), .B(B1), .S(S[4]), .F(F));

endmodule

module NBitSixteenWayMux #(parameter N=1) (A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire [N-1:0] A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15;
   
   wire [N-1:0] B0, B1, B2, B3;
   
   input wire [3:0] S;
   
   output wire [N-1:0] F;
   
   NBitFourWayMux #(.N(N)) mux1 (.A(A0), .B(A1), .C(A2), .D(A3), .S(S[1:0]), .F(B0));
   
   NBitFourWayMux #(.N(N)) mux2 (.A(A4), .B(A5), .C(A6), .D(A7), .S(S[1:0]), .F(B1));
   
   NBitFourWayMux #(.N(N)) mux3 (.A(A8), .B(A9), .C(A10), .D(A11), .S(S[1:0]), .F(B2));
   
   NBitFourWayMux #(.N(N)) mux4 (.A(A12), .B(A13), .C(A14), .D(A15), .S(S[1:0]), .F(B3));
   
   NBitFourWayMux #(.N(N)) muxF (.A(B0), .B(B1), .C(B2), .D(B3), .S(S[3:2]), .F(F));
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
        
   
endmodule

module NBitFourWayMux #(parameter N=1)(A, B, C, D, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input wire [N-1:0] A, B, C, D;
   input wire [1:0] S;
   output wire [N-1:0] F;
   
   wire [N-1:0] lowMuxOut, highMuxOut;
   
   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
        NBitTwoWayMux #(.N(N)) lowMux(.A(A), .B(B), .S(S[0]), .F(lowMuxOut));
        NBitTwoWayMux #(.N(N)) highMux(.A(C), .B(D), .S(S[0]), .F(highMuxOut));
        NBitTwoWayMux #(.N(N)) finMux(.A(lowMuxOut), .B(highMuxOut), .S(S[1]), .F(F));
   
endmodule

module NBitTwoWayMux #(parameter N=1)(A, B, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire [N-1:0] A, B;
   input wire S;
   wire [N-1:0] Sn, AS, BS;
   output wire [N-1:0] F;
   
   genvar i;
   
   generate
    for (i = 0; i < N; i = i + 1) begin
        
        not n_i (Sn[i], S);
        and a1_i (AS[i], Sn[i], A[i]);
        and a2_i (BS[i], S, B[i]);
        or o2_i (F[i], AS[i], BS[i]);
    
        //and g_i (F[i], A[i], B[i]);
    end
   endgenerate

endmodule
