`timescale 1ns/1ps
module alu_1bit (
    input Ai,
    input Bi,
    input A_prev,    // For shift right
    input A_next,    // For shift left
    input Cini,
    input [3:0] sel,
    output Fi,
    output Couti
);
    wire Di, Ei;
    wire shift_right, shift_left;
    wire n_sel2;
    wire and_right, and_left;

    not (n_sel2, sel[2]);

    // If sel=10xx shift_right = A[i-1] (A_prev)
    and (and_right, sel[3], n_sel2);
    and (shift_right, and_right, A_prev);

    // If sel=11xx shift_left = A[i+1] (A_next)
    and (and_left, sel[3], sel[2]);
    and (shift_left, and_left, A_next);

    // Instantiate Arithmetic Unit
    arithmetic_unit U_ARITH (
        .Ai(Ai),
        .Bi(Bi),
        .Cini(Cini),
        .sel(sel[1:0]),
        .Di(Di),
        .Couti(Couti)
    );

    // Instantiate Logic Unit
    logic_unit U_LOGIC (
        .Ai(Ai),
        .Bi(Bi),
        .sel(sel[1:0]),
        .Ei(Ei)
    );

   
    // 4-to-1 MUX to select final output Fi
    mux4to1 U_MUX (
        .a(Di),          // Arithmetic result
        .b(Ei),          // Logic result
        .c(shift_right), // Shift right
        .d(shift_left),  // Shift left
        .sel(sel[3:2]),
        .out(Fi)
    );

endmodule