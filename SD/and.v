module anda(output wire F, input wire A, input wire B);
wire inverter;
nand(inverter, A, B);
nand(F, inverter, inverter);
endmodule