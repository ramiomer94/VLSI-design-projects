`timescale 1ns/1ps
module tb_modular_VS_behavioral;

    reg [31:0] A, B;
    reg Cin, DinL, DinR;
    reg [3:0] sel;
    wire [31:0] F_mod, F_beh;
    wire Cout_mod, Cout_beh;

    integer i;

    alu_32bit_modular uut_mod (
        .A(A),
        .B(B),
        .Cin(Cin),
        .DinL(DinL),
        .DinR(DinR),
        .sel(sel),
        .F(F_mod),
        .Cout(Cout_mod)
    );

    alu_32bit_behavioral uut_beh (
        .A(A),
        .B(B),
        .CIN(Cin),
        .DL(DinL),
        .DR(DinR),
        .S(sel),
        .F(F_beh),
        .COUT(Cout_beh)
    );

    initial begin
        $display("\n================= Modular vs Behavioral 32-bit ALU Comparison =================\n");

        // --- Arithmetic Tests ---
        $display("\n--- Arithmetic Operation Tests ---");

        // Transfer A & Increment A
        run_test(32'h00000000, 32'h00000000, 0, 0, 0, 4'h0, "Transfer A");
        run_test(32'hFFFFFFFF, 32'h00000000, 1, 0, 0, 4'h0, "Increment A");

        // Addition
        run_test(32'hFFFFFFFF, 32'hFFFFFFFF, 0, 0, 0, 4'h1, "Addition A+B");
        run_test(32'h00000001, 32'h00000001, 1, 0, 0, 4'h1, "Addition A+B+1");

        // Subtraction (A > B)
        run_test(32'h00000004, 32'h00000003, 0, 0, 0, 4'h2, "Subtraction A-B-1");
        run_test(32'h00000004, 32'h00000003, 1, 0, 0, 4'h2, "Subtraction A-B");

        // Subtraction (B > A)
        run_test(32'h00000003, 32'h00000004, 0, 0, 0, 4'h2, "Subtraction A-B-1 (B>A)");
        run_test(32'h00000003, 32'h00000004, 1, 0, 0, 4'h2, "Subtraction A-B (B>A)");

        // Decrement & Transfer
        run_test(32'h00000000, 32'h00000004, 0, 0, 0, 4'h3, "Decrement A (underflow)");
        run_test(32'h00000001, 32'h00000004, 0, 0, 0, 4'h3, "Decrement A");
        run_test(32'hFFFFFFFF, 32'h00000004, 1, 0, 0, 4'h3, "Transfer A (sel=3, Cin=1)");

        // Overflow case
        run_test(32'h80000000, 32'h7FFFFFFF, 0, 0, 0, 4'h1, "Addition Overflow Case");

        // --- Logic Tests ---
        $display("\n--- Logic Operation Tests ---");
        run_test(32'h0F0F0F0F, 32'hF0F0F0F0, 0, 0, 0, 4'h4, "AND Operation");
        run_test(32'h0F0F0F0F, 32'hF0F0F0F0, 0, 0, 0, 4'h5, "OR Operation");
        run_test(32'hAAAAAAAA, 32'h55555555, 0, 0, 0, 4'h6, "XOR Operation");
        run_test(32'h00000000, 32'h00000000, 0, 0, 0, 4'h7, "NOT A Operation");

        // --- Shift Tests ---
        $display("\n--- Shift Operation Tests ---");
        A = 32'h12345678; B = 0; Cin = 0;
        for (i = 0; i < 4; i = i + 1) begin
            DinL = i[1]; DinR = i[0];
            run_test(A, B, Cin, DinL, DinR, 4'h8, "Shift Right");
            run_test(A, B, Cin, DinL, DinR, 4'hA, "Shift Right (sel=10xx)");
            run_test(A, B, Cin, DinL, DinR, 4'hC, "Shift Left");
            run_test(A, B, Cin, DinL, DinR, 4'hD, "Shift Left (sel=11xx)");
        end

      /*  // --- Random Tests ---
        $display("\n--- Random Directed Tests ---");
        repeat (20) begin
            A = $random;
            B = $random;
            Cin = $random % 2;
            DinL = $random % 2;
            DinR = $random % 2;
            sel = $random % 16;
            run_test(A, B, Cin, DinL, DinR, sel, "Random Test");
        end
        */
        $display("\nAll functional verification tests completed.\n");
        $finish;
    end

    // =================== Test Execution ==================
    task run_test;
        input [31:0] tA, tB;
        input tCin, tDinL, tDinR;
        input [3:0] tSel;
        input [255:0] test_name;
    begin
        A = tA;
        B = tB;
        Cin = tCin;
        DinL = tDinL;
        DinR = tDinR;
        sel = tSel;
        #5;
        check_result(test_name);
    end
    endtask

    // =================== Result Checking ==================
    task check_result;
        input [255:0] test_name;
    begin
        $display("----------------------------------------------");
        $display("%s", test_name);
        $display("sel=0x%0h A=0x%08h (%0d) B=0x%08h (%0d) Cin=%0d DinL=%0d DinR=%0d",
                 sel, A, A, B, B, Cin, DinL, DinR);

        if (sel[3:2] == 2'b00) begin // Arithmetic
            $display("Modular   → F=0x%08h (%0d) Cout=%b", F_mod, F_mod, Cout_mod);
            $display("Behavioral→ F=0x%08h (%0d) Cout=%b", F_beh, F_beh, Cout_beh);
            if ((F_mod !== F_beh) || (Cout_mod !== Cout_beh))
                $display("[FAIL] Arithmetic Mismatch");
            else
                $display("[PASS] Arithmetic Match");
        end else begin // Logic/Shift
            $display("Modular   → F=0x%08h (%0d)", F_mod, F_mod);
            $display("Behavioral→ F=0x%08h (%0d)", F_beh, F_beh);
            if (F_mod !== F_beh)
                $display("[FAIL] Logic/Shift Mismatch (Cout ignored)");
            else
                $display("[PASS] Logic/Shift Match (Cout ignored)");
        end
        $display("----------------------------------------------\n");
    end
    endtask

endmodule