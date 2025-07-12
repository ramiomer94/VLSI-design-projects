`timescale 1ns/1ps
module full_adder (
    input Ai,
    input Bi,
    input Cini,
    output Di,
    output Couti
);
    wire xor1, and1, and2, and3;

    xor (xor1, Ai, Bi);
    xor (Di, xor1, Cini);

    and (and1, Ai, Bi);
    and (and2, Ai, Cini);
    and (and3, Bi, Cini);
    or (Couti, and1, and2, and3);
endmodule