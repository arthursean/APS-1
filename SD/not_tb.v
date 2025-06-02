`timescale 1ns/1ps

module not_tb;
  reg A;
  wire F_sys1;
  nota DUT(.A(A), .F(F_sys1));  
  initial begin
    $display("A | F - Test");
    A = 0;
    #10;
    $write("%b | %b", A, F_sys1);
    if(F_sys1 == 1) $display(" - PASS"); else $display(" FAIL");
    A = 1;
    #10;
    $write("%b | %b", A, F_sys1);
    if(F_sys1 == 0) $display(" - PASS"); else $display(" FAIL");
    $finish;
  end
    
endmodule






