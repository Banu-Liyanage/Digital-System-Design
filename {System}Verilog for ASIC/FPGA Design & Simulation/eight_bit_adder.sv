module eight_bit_adder #(parameter N=8)(
	input logic signed [N-1:0]  A,B,
	input logic ci,
	output logic signed [N-1:0]  S,
	output logic co
	);

logic C[N:0];
assign C[0] = ci;
assign co = C[N];

genvar i;
for (i=0;i<N;i=i+1) begin:add
	eight_bit_adder fa(
		.a  (A[i  ]),
		.b  (B[i  ]),
		.ci (C[i  ]),
		.co (C[i+1]),
		.s(S[i  ])
	);
	end
endmodule