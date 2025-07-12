module alu_32bit_modular (
    input  [31:0] A,
    input  [31:0] B,
    input        Cin,
    input        DinL,
    input        DinR,
    input  [3:0] sel,
    output [31:0] F,
    output       Cout
);
    wire [31:0] carryin;
    wire cout_temp;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : ALU_BITS
            wire a_prev, a_next;
            
            assign a_prev = (i == 31) ? DinR : A[i + 1];
            assign a_next = (i == 0)  ? DinL : A[i - 1];

            alu_1bit U_ALU (
                .Ai(A[i]),
                .Bi(B[i]),
                .A_prev(a_prev),
                .A_next(a_next),
                .Cini(i == 0 ? Cin : carryin[i-1]),
                .sel(sel),
                .Fi(F[i]),
                .Couti(carryin[i])
            );
        end
    endgenerate

    // Corrected Cout logic
    assign cout_temp = carryin[31];
    assign Cout = (sel[3:2] == 2'b00) ? cout_temp : 1'b0; // Only arithmetic uses carry
endmodule