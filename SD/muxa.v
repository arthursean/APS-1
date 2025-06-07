`include "or.v"
`include "not.v"
`include "and.v"
`timescale 1ns/1ps
module mux_4t1a(output wire F, input wire A, B, C, D, input wire [1:0]Sel);
wire inv_s0, inv_s1; 
wire is_A, is_B, is_C, is_D;
wire res_A, res_B, res_C, res_D;
wire U_AB, U_ABC;
nota u1(.F(inv_s0), .A(Sel[0]));
nota u2(.F(inv_s1), .A(Sel[1]));
anda u3(.F(is_A), .A(inv_s1), .B(inv_s0));
anda u4(.F(res_A), .A(A), .B(is_A));
anda u5(.F(is_B), .A(inv_s1), .B(Sel[0]));
anda u6(.F(res_B), .A(B), .B(is_B));
anda u7(.F(is_C), .A(inv_s0), .B(Sel[1]));
anda u8(.F(res_C), .A(C), .B(is_C));
anda u9(.F(is_D), .A(Sel[1]), .B(Sel[0]));
anda u10(.F(res_D), .A(D), .B(is_D));
ora u11(.F(U_AB), .A(res_A), .B(res_B));
ora u12(.F(U_ABC), .A(U_AB), .B(res_C));
ora u13(.F(F), .A(U_ABC), .B(res_D));
endmodule

`timescale 1ns/1ps

module mux_4t1b
	(output wire F,
	input wire A, B, C, D,
	input wire [1:0] Sel);

	assign F = (Sel == 2'b00) ? A :
			   (Sel == 2'b01) ? B :
			   (Sel == 2'b10) ? C :
			   (Sel == 2'b11) ? D :
			   1'bX;
endmodule