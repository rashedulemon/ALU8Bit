module AdderSubtractor8 (
    input  logic [7:0] A,
    input  logic [7:0] B,
    input  logic Sub,          // 0 = Add, 1 = Subtract
    output logic [7:0] Result,
    output logic Cout
);
    logic [7:0] B_temp;

    // if Sub = 1, invert B. If Sub = 0, B remains unchanged.
    assign B_temp = B ^ {8{Sub}};

    // Ripple Carry Adder
    RippleCarryAdder8 RCA8 (
        .A(A),
        .B(B_temp),
        .Cin(Sub),
        .Sum(Result),
        .Cout(Cout)
    );
endmodule