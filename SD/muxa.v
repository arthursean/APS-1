`include "or.v"
`include "not.v"
`include "and.v"
`include "xor.v"
module xora(output wire F, input wire A, B, C, D, [1:0]sel);
wire inv_s0, inv_s1; 
wire is_A, is_B, is_C, is_D;
wire res_A, res_B, res_C, res_D
wire U_AB, U_ABC
nota(.F(inv_s0), .A(sel[0]));
nota(.F(inv_s1), .A(sel[1]));
anda(.F(is_A), .A(inv_s1), .B(inv_s0));
anda(.F(res_A), .A(A), .B(is_A));
anda(.F(is_B), .A(inv_s1), .B(sel[0]));
anda(.F(res_B), .A(B), .B(is_B));
anda(.F(is_C), .A(inv_s0), .B(sel[1]));
anda(.F(res_C), .A(C), .B(is_C));
anda(.F(is_D), .A(sel[1]), .B(sel[0]));
anda(.F(res_D), .A(D), .B(is_D));
ora(.F(U_AB), .A(res_A), .B(res_B));
ora(.F(U_ABC), .A(U_AB), .B(res_C));
ora(.F(F), .A(U_ABC), .B(res_D));
endmodule
