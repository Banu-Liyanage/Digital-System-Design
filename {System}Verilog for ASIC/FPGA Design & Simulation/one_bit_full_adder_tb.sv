module one_bit_full_adder_tb;

  timeunit 10ns; timeprecision 1ns;

  logic a=0, ci=0, b, s, co; 

  one_bit_full_adder dut(.*);

  initial begin
    $dumpfile("dumb.vcd");
    $dumpvars(0, dut);
    #10 a=0; ci=0; b=0;
    #10 a=0; ci=0; b=1;
    #10 a=0; ci=1; b=0;
    #10 a=0; ci=1; b=1;
    #10 a=1; ci=0; b=0;
    #10 a=1; ci=0; b=1;
    #10 a=1; ci=1; b=0;
    #10 a=1; ci=1; b=1;
    $finish;
  end
endmodule
   