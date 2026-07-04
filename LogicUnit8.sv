module LogicUnit8 (
    input  logic [7:0] A,
    input  logic [7:0] B,
    input  logic [2:0] Op,
    output logic [7:0] Result
);

    always_comb begin
        case (Op)
            3'b010: Result = A & B;   // AND
            3'b011: Result = A | B;   // OR
            3'b100: Result = A ^ B;   // XOR
            3'b101: Result = ~A;      // NOT A
            default: Result = 8'b00000000;
        endcase
    end

endmodule