module ALU_tb;
    reg [3:0] A, B;    // Test inputs
    reg SELECT;        // Test SELECT line
    wire [3:0] Out;    // Output from ALU
    wire Zero;         // Zero flag from ALU

    // Instantiate the ALU module
    ALU dut (
        .A(A), 
        .B(B), 
        .SELECT(SELECT), 
        .Out(Out), 
        .Zero(Zero)
    );

    initial begin          //test benches for the design ALU 
        // Test case 1: Add A=2, B=3, SELECT=1
        A = 4'b0010; B = 4'b0011; SELECT = 1'b1;
        #10; // Wait for 10 time units
        $display("Test 1: A=%b, B=%b, SELECT=%b, Out=%b, Zero=%b", A, B, SELECT, Out, Zero);

        // Test case 2: A=2, B=3, SELECT=0
        A = 4'b0010; B = 4'b0011; SELECT = 1'b0;
        #10;
        $display("Test 2: A=%b, B=%b, SELECT=%b, Out=%b, Zero=%b", A, B, SELECT, Out, Zero);

        // Test case 3: A=0, B=0, SELECT=1
        A = 4'b0000; B = 4'b0000; SELECT = 1'b1;
        #10;
        $display("Test 3: A=%b, B=%b, SELECT=%b, Out=%b, Zero=%b", A, B, SELECT, Out, Zero);

        // Test case 4: A=0, B=0, SELECT=0
        A = 4'b0000; B = 4'b0000; SELECT = 1'b0;
        #10;
        $display("Test 4: A=%b, B=%b, SELECT=%b, Out=%b, Zero=%b", A, B, SELECT, Out, Zero);

        // End simulation
        $finish;
    end
endmodule
