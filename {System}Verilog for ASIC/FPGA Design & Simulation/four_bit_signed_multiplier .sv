module four_bit_signed_multiplier (
    input  logic signed [3:0] A,
    input  logic signed [3:0] B, 
    output logic signed [7:0] S  
);
  logic signed [7:0] A_sgnext, B_sgnext; // Signed extension of A and B
  logic signed [7:0] Partial[3:0];     // Partial products
  logic signed [7:0] sum_1, sum_2, sum_3 ; // Sum of partial products

  assign A_sgnext = {{4{A[3]}},A}; //extend the sign of A to make it 8 bits, here 4{A[3]} means 4 times A[3]
  assign B_sgnext = {{4{B[3]}},B}; //extend the sign of B to make it 8 bits, here 4{B[3]} means 4 times B[3]

    assign Partial[0] = B[0] ? A_sgnext : 8'b00000000;
    assign Partial[1] = B[1] ? (A_sgnext << 1) : 8'b00000000;
    assign Partial[2] = B[2] ? (A_sgnext << 2) : 8'b00000000;
    assign Partial[3] = B[3] ? (-(A_sgnext << 3)) : 8'b00000000; //need to take the 2s complement in the 3rd partial product

    eight_bit_adder #(8) adder1 (.A(Partial[0]), .B(Partial[1]), .ci(1'b0), .S(sum_1), .co());
    eight_bit_adder #(8) adder2 (.A(Partial[2]), .B(Partial[3]), .ci(1'b0), .S(sum_2), .co());
    eight_bit_adder #(8) adder3 (.A(sum_1), .B(sum_2), .ci(1'b0), .S(sum_3), .co());

    //result
    assign S = sum_3;

endmodule