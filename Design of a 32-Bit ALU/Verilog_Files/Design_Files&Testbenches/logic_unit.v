// logic_unit.v
`timescale 1ns/1ps
module logic_unit (
    input Ai,
    input Bi,
    input [1:0] sel,
    output Ei
);
    wire [3:0] mux_inputs;

    and(mux_inputs[0], Ai, Bi);
    or(mux_inputs[1], Ai, Bi);
    xor(mux_inputs[2], Ai, Bi);
    not(mux_inputs[3], Ai);

    mux4to1 MUX_LOGIC (
        .a(mux_inputs[0]),
        .b(mux_inputs[1]),
        .c(mux_inputs[2]),
        .d(mux_inputs[3]),
        .sel(sel),
        .out(Ei)
    );

endmodule