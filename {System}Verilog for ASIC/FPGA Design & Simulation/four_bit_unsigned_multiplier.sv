module four_bit_unsigned_multiplier (
     input logic [3:0] A,
     input logic [3:0] B,
     output logic [7:0] S
    );

    logic [7:0] Partial[3:0];     // Partial products
    logic [7:0] sum_1, sum_2, sum_3 ; // Sum of partial products

    always_comb begin
        // Partial products initialization
        Partial[0]=8'b00000000;
        Partial[1]=8'b00000000;
        Partial[2]=8'b00000000;
        Partial[3]=8'b00000000;
        
        // Partial products calculation
        if (B[0] == 1) begin
       Partial[0] = {4'b0000, A}; //0th place 
    end else begin
        Partial[0] = 8'b00000000;
    end

    if (B[1] == 1) begin
       Partial[1] = {4'b0000, A} << 1;//1st place 
    end else begin
        Partial[1] =8'b00000000;
    end
    if (B[2] == 1) begin
        Partial[2] = {4'b0000, A} << 2;//2nd place 
    end else begin
        Partial[2] = 8'b00000000;
    end

    if (B[3] == 1) begin
        Partial[3] = {4'b0000, A} << 3;//3rd place 
    end else begin
        Partial[3] =8'b00000000;
    end
end

    eight_bit_adder #(8) adder1 (.A(Partial[0]), .B(Partial[1]), .ci(1'b0), .S(sum_1), .co());
    eight_bit_adder #(8) adder2 (.A(Partial[2]), .B(Partial[3]), .ci(1'b0), .S(sum_2), .co());
    eight_bit_adder #(8) adder3 (.A(sum_1), .B(sum_2), .ci(1'b0), .S(sum_3), .co());

   //result 
    assign S = sum_3;

endmodule