module ora(output F, input A, B);
wire inv_1;
wire inv_2;
nand(inv_1, A, A);
nand(inv_2, B, B);
nand(F, inv_1, inv_2);
endmodule