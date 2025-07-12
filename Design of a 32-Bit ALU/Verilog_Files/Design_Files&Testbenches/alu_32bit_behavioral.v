`timescale 1ns/1ps
module alu_32bit_behavioral (
    input  [31:0] A,
    input  [31:0] B,
    input        CIN,
    input        DL, // For shift left
    input        DR, // For shift right
    input  [3:0] S,
    output reg [31:0] F,
    output reg       COUT
);
    reg [31:0] mux_in;
    reg [32:0] temp_sum;

    always @(*) begin
        case (S[3:2])
            2'b00: begin // Arithmetic
                case (S[1:0])
                    2'b00: mux_in = 32'h00000000;      // Transfer A
                    2'b01: mux_in = B;                 // A + B (+ Cin)
                    2'b10: mux_in = ~B;                // A - B - 1 (+ Cin)
                    2'b11: mux_in = 32'hFFFFFFFF;      // Decrement A / Transfer A
                    default: mux_in = 32'h00000000;
                endcase
                temp_sum = {1'b0, A} + {1'b0, mux_in} + CIN;
                F = temp_sum[31:0];
                COUT = temp_sum[32];
            end

            2'b01: begin // Logic
                case (S[1:0])
                    2'b00: F = A & B;
                    2'b01: F = A | B;
                    2'b10: F = A ^ B;
                    2'b11: F = ~A;
                endcase
                COUT = 1'b0;
            end

            2'b10: begin // Shift Right
                F = {DR, A[31:1]};
                COUT = 1'b0;
            end

            2'b11: begin // Shift Left
                F = {A[30:0], DL};
                COUT = 1'b0;
            end
        endcase
    end
endmodule