`timescale 1ns/1ps
module mux4to1(
    input a,
    input b,
    input c,
    input d,
    input [1:0] sel,
    output out
);
    wire n0, n1;
    wire and0, and1, and2, and3;

    not (n0, sel[0]);
    not (n1, sel[1]);

    and (and0, a, n1, n0);
    and (and1, b, n1, sel[0]);
    and (and2, c, sel[1], n0);
    and (and3, d, sel[1], sel[0]);

    or (out, and0, and1, and2, and3);
endmodule