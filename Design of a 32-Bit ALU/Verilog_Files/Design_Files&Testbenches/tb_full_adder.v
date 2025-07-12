`timescale 1ns/1ps
module tb_full_adder;

    reg Ai, Bi, Cini;
    wire Di, Couti;

    reg expected_Di, expected_Couti;

    integer i;

    // Instantiate DUT
    full_adder uut (
        .Ai(Ai),
        .Bi(Bi),
        .Cini(Cini),
        .Di(Di),
        .Couti(Couti)
    );

    initial begin
        $display("\n================ Functional Verification of Full Adder =================\n");

        for (i = 0; i < 8; i = i + 1) begin
            {Ai, Bi, Cini} = i[2:0];

            // Compute expected output
            expected_Di = Ai ^ Bi ^ Cini;
            expected_Couti = (Ai & Bi) | (Ai & Cini) | (Bi & Cini);

            #5;
            $display("----------------------------------------------");
            $display("Inputs: Ai=%b Bi=%b Cini=%b", Ai, Bi, Cini);
            $display("Expected → Di=%b Couti=%b | Obtained → Di=%b Couti=%b",
                     expected_Di, expected_Couti, Di, Couti);

            if ((Di === expected_Di) && (Couti === expected_Couti))
                $display("[PASS]");
            else
                $display("[FAIL]");
            $display("----------------------------------------------\n");
        end

        $display("\nAll Full Adder functional verification tests completed.\n");
        $finish;
    end

endmodule