module four_bit_unsinged_multiplier_tb;

timeunit 1ns; timeprecision 1ps;
localparam N = 8;

logic  [3:0] A,B;
logic  [7:0] S;
four_bit_unsigned_multiplier dut(.*);

initial begin
    $dumpfile ("dump.vcd");  $dumpvars(0, dut);

    #10 A = 4'd2; B = 4'd2; //test case 1
    #1 assert (S == A * B); 

    #10 A = 4'd4; B = 4'd5;//test case 2
    #1 assert (S == A * B);

    #10 A = 4'd225; B = 4'd0; //test case 3
    #1 assert (S == A * B);

    #10 A = 4'd15; B = 4'd10; //test case 4
    #1 assert (S == A * B);

    #10 A = 4'd40; B = 4'd8; //test case 5
    #1 assert (S == A * B);

    #10 A = 4'd0; B = 4'd14; //test case 6
    #1 assert (S == A * B);
    
    #10 A = 4'b1001; B = 4'b1011;   //test case 7 in binary format
    #1 assert (S == A * B);
    
    #10 A = 4'b1011; B = 4'b0011;  //test case 8 in binary format
    #1 assert (S == A * B);
    
    #10 A = 4'd1; B = 4'd123;  //test case 9
    #1 assert (S == A * B);
    
    #10 A = 4'd1; B = 4'd50;  //test case 10
    #1 assert (S == A * B);

    $display("finished");

    end
endmodule