`include "decoders.sv"
`include "nBitDRegister.v"
`include "muxes.sv"

module dataMemory (R, Clock, WriteEn, Addy, WriteData, ReadData);


	input wire [4:0] Addy; //read/write address
	input wire R, WriteEn, Clock;
	input wire [31:0] WriteData;
	
	wire [1023:0] Q;
	wire [1023:0] Qn;
	wire [31:0] enables;
	
	output wire [31:0] ReadData;
	
	
	ThirtyTwoWayDecoder dechode (
		.A(WriteEn), 
		.S(Addy), 
		.F(enables)
	);
	
	genvar i;
	
	generate
	
    for (i = 0; i < 32; i = i + 1) begin
	
		nBitDRegister #(.N(32)) register1 (
			.En(enables[i]), 
			.D(WriteData), 
			.Clk(Clock), 
			.R(R),   //df reset
			.Q(Q[32*i+31:32*i]), 
			.Qn(Qn[32*i+31:32*i])
		);
		
	end
	
	endgenerate
	
	
	NBitThirtyTwoWayMux #(.N(32)) readMux (
    .A0(Q[31:0]),
    .A1(Q[63:32]),
    .A2(Q[95:64]),
    .A3(Q[127:96]),
    .A4(Q[159:128]),
    .A5(Q[191:160]),
    .A6(Q[223:192]),
    .A7(Q[255:224]),
    .A8(Q[287:256]),
    .A9(Q[319:288]),
    .A10(Q[351:320]),
    .A11(Q[383:352]),
    .A12(Q[415:384]),
    .A13(Q[447:416]),
    .A14(Q[479:448]),
    .A15(Q[511:480]),
    .A16(Q[543:512]),
    .A17(Q[575:544]),
    .A18(Q[607:576]),
    .A19(Q[639:608]),
    .A20(Q[671:640]),
    .A21(Q[703:672]),
    .A22(Q[735:704]),
    .A23(Q[767:736]),
    .A24(Q[799:768]),
    .A25(Q[831:800]),
    .A26(Q[863:832]),
    .A27(Q[895:864]),
    .A28(Q[927:896]),
    .A29(Q[959:928]),
    .A30(Q[991:960]),
    .A31(Q[1023:992]),
    .S(Addy),
    .F(ReadData));
	
endmodule