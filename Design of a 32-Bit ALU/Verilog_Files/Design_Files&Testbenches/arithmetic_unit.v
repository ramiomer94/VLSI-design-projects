// arithmetic_unit.v
`timescale 1ns/1ps
module arithmetic_unit (
    input Ai,
    input Bi,
    input Cini,
    input [1:0] sel,
    output Di,
    output Couti
);
    wire mux_out;
    wire [3:0] mux_inputs;

    // 4:1 MUX input logic
    assign mux_inputs[0] = 1'b0;   // For sel = 00
    assign mux_inputs[1] = Bi;     // For sel = 01 → Addition
    not (mux_inputs[2], Bi);    // For sel = 10 → Subtraction
    assign mux_inputs[3] = 1'b1;   // For sel = 11

    // 4:1 MUX instance to select second operand
    mux4to1 MUX_B (
        .a(mux_inputs[0]),
        .b(mux_inputs[1]),
        .c(mux_inputs[2]),
        .d(mux_inputs[3]),
        .sel(sel),
        .out(mux_out)
    );

    // Full Adder instance
    full_adder FA (
        .Ai(Ai),
        .Bi(mux_out),
        .Cini(Cini),
        .Di(Di),
        .Couti(Couti)
    );

endmodule



