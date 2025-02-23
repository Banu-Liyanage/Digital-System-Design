module seven_segment_decoder_tb;

timeunit 1ns; timeprecision 1ps;
logic [3:0] num;
logic [6:0] seg;
seven_segment_decoder dut(.*);

initial begin
    $dumpfile ("dump.vcd"); $dumpvars(0, dut);
    #9 num = 4'b0000;
    #1 assert (seg == 7'b0111111) else $error("Test Case 1 Failed");   
    #9 num = 4'b0001;
    #1 assert (seg == 7'b0000110) else $error("Test Case 2 Failed");
    #9 num = 4'b0010;
    #1 assert (seg == 7'b1011011) else $error("Test Case 3 Failed");
    #9 num = 4'b0011;
    #1 assert (seg == 7'b1001111) else $error("Test Case 4 Failed");
    #9 num = 4'b0100;
    #1 assert (seg == 7'b1100110) else $error("Test Case 5 Failed");
    #9 num = 4'b0101;
    #1 assert (seg == 7'b1101101) else $error("Test Case 6 Failed");
    #9 num = 4'b0110;
    #1 assert (seg == 7'b1111101) else $error("Test Case 7 Failed");
    #9 num = 4'b0111;
    #1 assert (seg == 7'b0000111) else $error("Test Case 8 Failed");
    #9 num = 4'b1000;
    #1 assert (seg == 7'b1111111) else $error("Test Case 9 Failed");
    #9 num = 4'b1001;
    #1 assert (seg == 7'b1101111) else $error("Test Case 10 Failed");
    #9 num = 4'b1010;
    #1 assert (seg == 7'b0000000) else $error("Test default case Failed");

    $display("All test cases passed!");
    $finish;
end

endmodule



    