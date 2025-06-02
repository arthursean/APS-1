`timescale 1ns/1ps

module or_tb;
  reg A, B;
  wire F_sys1;
  ora DUT(.A(A), .B(B), .F(F_sys1));  
  initial begin
    $dumpfile("graph.vcd");
    $dumpvars(0, DUT.A);
  	$dumpvars(0, DUT.B);
  	$dumpvars(0, DUT.F);
  end
  initial begin
    $display("A B | F - Test");
    A = 0;
    B = 0;
    #10;
    $write("%b %b | %b", A, B, F_sys1);
    if(F_sys1 == 0) $display(" - PASS"); else $display(" FAIL");
    A = 0;
    B = 1;
    #10;
    $write("%b %b | %b", A, B, F_sys1);
    if(F_sys1 == 1) $display(" - PASS"); else $display(" FAIL");
    A = 1;
    B = 0;
    #10;
    $write("%b %b | %b", A, B, F_sys1);
    if(F_sys1 == 1) $display(" - PASS"); else $display(" FAIL");
    A = 1;
    B = 1;
    #10;
    $write("%b %b | %b", A, B, F_sys1);
    if(F_sys1 == 1) $display(" - PASS"); else $display(" FAIL");
    $finish;

  end
    
endmodule






