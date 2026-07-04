module Multiplexer8 (
    input  logic [7:0] ArithmeticResult,
    input  logic [7:0] LogicResult,
    input  logic [2:0] Op,
    output logic [7:0] Result
);
    always_comb begin
        case (Op)
            // Arithmetic Operations
            3'b000: Result = ArithmeticResult;   // ADD
            3'b001: Result = ArithmeticResult;   // SUB

            // Logic Operations
            3'b010: Result = LogicResult;        // AND
            3'b011: Result = LogicResult;        // OR
            3'b100: Result = LogicResult;        // XOR
            3'b101: Result = LogicResult;        // NOT

            default: Result = 8'b00000000;
        endcase
    end

endmodule
