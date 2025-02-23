module eight_bit_adder_tb;
  timeunit 1ns;
  timeprecision 1ps;
  localparam N = 8;
    logic signed [N-1:0] A=0, B=0, S;
    logic ci=0, co;

    eight_bit_adder #(.N(N)) dut(.*);

initial begin
    $dumpfile("dumb.vcd");
    $dumpvars(0, dut);
    #10 A = 8'd5; B = 8'd10; ci = 0;
    #1 assert ({co, S} == A + B + ci) else $error("Test Case 1 Failed");
	
    #10 A = 8'd5; B = 8'd10; ci = 1;
    #1 assert ({co, S} == A + B + ci) else $error("Test Case 2 Failed");

    #10 A = 8'd255; B = 8'd0; ci = 0;
    #1 assert ({co, S} == A + B + ci) else $error("Test Case 3 Failed");

    #10 A = 8'd255; B = 8'd0; ci = 1;
    #1 assert ({co, S} == A + B + ci) else $error("Test Case 4 Failed");

    #10 A = 8'd200; B = 8'd100; ci = 0;
    #1 assert ({co, S} == A + B + ci) else $error("Test Case 5 Failed");

    #10 A = 8'd255; B = 8'd100; ci = 1;
    #1 assert ({co, S} == A + B + ci) else $error("Test Case 6 Failed");

    #10 A = 8'b00000000; B = 8'b00000000; ci = 0;
    #1 assert ({co, S} == A + B + ci) else $error("Test Case 7 Failed");

    #10 A = 8'b11110000; B = 8'b00001111; ci = 1;
    #1 assert ({co, S} == A + B + ci) else $error("Test Case 8 Failed");

    #10 A = 8'b10101010; B = 8'b01010101; ci = 0;
    #1 assert ({co, S} == A + B + ci) else $error("Test Case 9 Failed");

    #10 A = 8'b11111111; B = 8'b11111111; ci = 1;
    #1 assert ({co, S} == A + B + ci) else $error("Test Case 10 Failed");

    $display("All test cases passed!");
    $finish;
end

endmodule    