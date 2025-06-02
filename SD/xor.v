module xora(output wire F, input wire A, B);
wire not_A;
wire not_B;
nand(not_A, A, A);
nand(not_B, B, B);
wire A_notB;
nand(A_notB, A, not_B);
wire B_notA;
nand(B_notA, B, not_A);
nand(F, B_notA, A_notB);
endmodule