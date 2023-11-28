module ThirtyTwoWayDecoder (A, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire A; 
   input wire [4:0] S;
   output wire [31:0] F;
   
   wire [1:0] B;
   
   TwoWayDecoder premux (.A(A), .S(S[4]), .F(B));
   
   SixteenWayDecoder himux (.A(B[0]), .S(S[3:0]), .F(F[15:0]));
   SixteenWayDecoder lowmux (.A(B[1]), .S(S[3:0]), .F(F[31:16]));
   

endmodule

module SixteenWayDecoder (A, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire A; 
   input wire [3:0] S;
   output wire [15:0] F;
   
   wire [3:0] B;
   
   FourWayDecoder premux (.A(A), .S(S[3:2]), .F(B));
   
   FourWayDecoder himux1 (.A(B[0]), .S(S[1:0]), .F(F[3:0]));
   FourWayDecoder himux2 (.A(B[1]), .S(S[1:0]), .F(F[7:4]));
   
   FourWayDecoder lomux1 (.A(B[2]), .S(S[1:0]), .F(F[11:8]));
   FourWayDecoder lomux2 (.A(B[3]), .S(S[1:0]), .F(F[15:12]));

endmodule

module FourWayDecoder (A, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire A; 
   input wire [1:0] S;
   output wire [3:0] F;
   
   wire [1:0] B;
   
   TwoWayDecoder premux (.A(A), .S(S[1]), .F(B));
   
   TwoWayDecoder himux (.A(B[0]), .S(S[0]), .F(F[1:0]));
   TwoWayDecoder lomux (.A(B[1]), .S(S[0]), .F(F[3:2]));

endmodule

module TwoWayDecoder (A, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire A, S;
   output wire [1:0] F;
   
   wire Sn;
   
   not (Sn, S);
   
   and (F[0], A, Sn);
   and (F[1], A, S);
  
endmodule