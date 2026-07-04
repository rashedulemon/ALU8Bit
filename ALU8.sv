module ALU8 (
    input  logic [7:0] A,
    input  logic [7:0] B,
    input  logic [2:0] Op,

    output logic [7:0] Result,
    output logic Carry,
    output logic Zero,
    output logic Negative,
    output logic Overflow
);

    // Internal Signals
    logic [7:0] ArithmeticResult;
    logic [7:0] LogicResult;
    logic CarryOut;

    //=============================
    // Adder / Subtractor
    //=============================
    AdderSubtractor8 AS8 (
        .A(A),
        .B(B),
        .Sub(Op[0]),          // 000=ADD, 001=SUB
        .Result(ArithmeticResult),
        .Cout(CarryOut)
    );

    //=============================
    // Logic Unit
    //=============================
    LogicUnit8 LU8 (
        .A(A),
        .B(B),
        .Op(Op),
        .Result(LogicResult)
    );

    //=============================
    // Multiplexer
    //=============================
    Multiplexer8 MUX8 (
        .ArithmeticResult(ArithmeticResult),
        .LogicResult(LogicResult),
        .Op(Op),
        .Result(Result)
    );

    //=============================
    // Flags
    //=============================
    assign Carry = CarryOut;

    // Zero Flag
    assign Zero = (Result == 8'b00000000);

    // Negative Flag (MSB)
    assign Negative = Result[7];

    // Overflow Flag
    assign Overflow =
           (Op == 3'b000) ?
           ((A[7] == B[7]) && (Result[7] != A[7])) :

           (Op == 3'b001) ?
           ((A[7] != B[7]) && (Result[7] != A[7])) :

           1'b0;

endmodule
