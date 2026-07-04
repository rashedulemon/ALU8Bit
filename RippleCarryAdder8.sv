module RippleCarryAdder8 (
    	input  logic [7:0] A,
    	input  logic [7:0] B,
    	input  logic Cin,
    	output logic [7:0] Sum,
    	output logic Cout
);
    	// Internal carry signals
    	logic [6:0] Carry;
    
	// Bit 0
	FullAdder FA0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Sum(Sum[0]),
        .Cout(Carry[0])
    	);

    // Bit 1
    FullAdder FA1 (
        .A(A[1]),
        .B(B[1]),
        .Cin(Carry[0]),
        .Sum(Sum[1]),
        .Cout(Carry[1])
    );

    // Bit 2
    FullAdder FA2 (
        .A(A[2]),
        .B(B[2]),
        .Cin(Carry[1]),
        .Sum(Sum[2]),
        .Cout(Carry[2])
    );

    // Bit 3
    FullAdder FA3 (
        .A(A[3]),
        .B(B[3]),
        .Cin(Carry[2]),
        .Sum(Sum[3]),
        .Cout(Carry[3])
    );
    // Bit 4
    FullAdder FA4 (
        .A(A[4]),
        .B(B[4]),
        .Cin(Carry[3]),
        .Sum(Sum[4]),
        .Cout(Carry[4])
    );

    // Bit 5
    FullAdder FA5 (
        .A(A[5]),
        .B(B[5]),
        .Cin(Carry[4]),
        .Sum(Sum[5]),
        .Cout(Carry[5])
    );

    // Bit 6
    FullAdder FA6 (
        .A(A[6]),
        .B(B[6]),
        .Cin(Carry[5]),
        .Sum(Sum[6]),
        .Cout(Carry[6])
    );

    // Bit 7
    FullAdder FA7 (
        .A(A[7]),
        .B(B[7]),
        .Cin(Carry[6]),
        .Sum(Sum[7]),
        .Cout(Cout)
    );

endmodule