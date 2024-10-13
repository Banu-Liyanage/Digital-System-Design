module ALU(
    input [3:0] A, B,  // 4-bit inputs
    input SELECT,      // Select line
    output [3:0] Out,  // 4-bit output
    output Zero        // Zero flag
);
    wire [3:0] Sum;    // Wire for the sum of A and B

    // 4-bit ripple carry adder as in the diagrm
    assign Sum = A + B;

    // Multiplexer to select between Sum and Zero
    assign Out = (SELECT) ? Sum : 4'b0000;

    // Zero flag to indicate if the output is zero
    assign Zero = (Out == 4'b0000);
endmodule
