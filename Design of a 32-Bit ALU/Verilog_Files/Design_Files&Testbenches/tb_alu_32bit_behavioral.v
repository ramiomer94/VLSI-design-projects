`timescale 1ns/1ps
module tb_alu_32bit_behavioral;

    reg [31:0] A, B;
    reg Cin, DinL, DinR;
    reg [3:0] sel;
    wire [31:0] F;
    wire Cout;

    reg [31:0] expected_F;
    reg expected_Cout;

    integer i;

    // Instantiate DUT
    alu_32bit_behavioral uut (
        .A(A),
        .B(B),
        .CIN(Cin),
        .DL(DinL),
        .DR(DinR),
        .S(sel),
        .F(F),
        .COUT(Cout)
    );

    initial begin
        $display("\n================== Functional Verification of Behavioral 32-bit ALU ==================\n");

        // --- Arithmetic Tests ---
        $display("\n--- Arithmetic Operation Tests ---");

        run_arithmetic_test(32'h00000000, 32'h00000000, 4'h0, 0, 0, 0, "Transfer A");
        run_arithmetic_test(32'hFFFFFFFF, 32'h00000000, 4'h0, 1, 0, 0, "Increment A");
        run_arithmetic_test(32'hFFFFFFFF, 32'hFFFFFFFF, 4'h1, 0, 0, 0, "Addition A+B (Max values)");
        run_arithmetic_test(32'h00000001, 32'h00000001, 4'h1, 1, 0, 0, "Addition A+B+1");

        run_arithmetic_test(32'h00000004, 32'h00000003, 4'h2, 0, 0, 0, "Subtraction A-B-1");
        run_arithmetic_test(32'h00000004, 32'h00000003, 4'h2, 1, 0, 0, "Subtraction A-B");
        run_arithmetic_test(32'h00000003, 32'h00000004, 4'h2, 0, 0, 0, "Subtraction A-B-1 (B>A)");
        run_arithmetic_test(32'h00000003, 32'h00000004, 4'h2, 1, 0, 0, "Subtraction A-B (B>A)");

        run_arithmetic_test(32'h00000000, 32'h00000000, 4'h3, 0, 0, 0, "Decrement A (underflow)");
        run_arithmetic_test(32'h00000001, 32'h00000000, 4'h3, 0, 0, 0, "Decrement A");
        run_arithmetic_test(32'hFFFFFFFF, 32'h00000000, 4'h3, 1, 0, 0, "Transfer A (sel=0011, Cin=1)");

        run_arithmetic_test(32'h80000000, 32'h7FFFFFFF, 4'h1, 0, 0, 0, "Addition Overflow Case");

        // --- Logic Tests ---
        $display("\n--- Logic Operation Tests ---");
        run_logic_test(32'h0F0F0F0F, 32'hF0F0F0F0, 4'h4, "AND Operation");
        run_logic_test(32'h0F0F0F0F, 32'hF0F0F0F0, 4'h5, "OR Operation");
        run_logic_test(32'hAAAAAAAA, 32'h55555555, 4'h6, "XOR Operation");
        run_logic_test(32'h00000000, 32'h00000000, 4'h7, "NOT A Operation");

        // --- Shift Tests ---
        $display("\n--- Shift Operation Tests ---");
        run_shift_test(32'h12345678, 4'b10_00, 0, 0, "Shift Right Operation");
        run_shift_test(32'h12345678, 4'b10_01, 0, 1, "Shift Right Operation");
        run_shift_test(32'h12345678, 4'b10_10, 1, 0, "Shift Right Operation");
        run_shift_test(32'h12345678, 4'b10_11, 1, 1, "Shift Right Operation");

        run_shift_test(32'h12345678, 4'b11_00, 0, 0, "Shift Left Operation");
        run_shift_test(32'h12345678, 4'b11_01, 0, 1, "Shift Left Operation");
        run_shift_test(32'h12345678, 4'b11_10, 1, 0, "Shift Left Operation");
        run_shift_test(32'h12345678, 4'b11_11, 1, 1, "Shift Left Operation");

        // --- Random Directed Tests ---
        $display("\n--- Random Directed Tests ---");
        for (i = 0; i < 15; i = i + 1) begin
            A = $random;
            B = $random;
            Cin = $random % 2;
            DinL = $random % 2;
            DinR = $random % 2;
            sel = $random % 16;

            if (sel[3:2] == 2'b00) begin
                run_arithmetic_test(A, B, sel, Cin, DinL, DinR, "Random Arithmetic Test");
            end else if (sel[3:2] == 2'b01) begin
                run_logic_test(A, B, sel, "Random Logic Test");
            end else begin
                run_shift_test(A, sel, DinL, DinR, "Random Shift Test");
            end
        end

        $display("\nAll functional verification tests completed.");
        $finish;
    end

    // ================== Arithmetic Test ==================
    task run_arithmetic_test;
        input [31:0] a, b;
        input [3:0] s;
        input c, dl, dr;
        input [255:0] test_name;
        reg [32:0] temp_sum;
        reg [31:0] mux_in;
    begin
        A = a; B = b; sel = s; Cin = c; DinL = dl; DinR = dr;

        // Compute expected output
        case (sel[1:0])
            2'b00: mux_in = 32'h00000000;
            2'b01: mux_in = B;
            2'b10: mux_in = ~B;
            2'b11: mux_in = 32'hFFFFFFFF;
        endcase
        temp_sum = {1'b0, A} + {1'b0, mux_in} + Cin;
        expected_F = temp_sum[31:0];
        expected_Cout = temp_sum[32];

        #5;
        $display("----------------------------------------------");
        $display("%s", test_name);
        $display("sel=0x%0h A=0x%08h B=0x%08h Cin=%0d → Expected F=0x%08h Cout=%b | Obtained F=0x%08h Cout=%b",
                 sel, A, B, Cin, expected_F, expected_Cout, F, Cout);

        if ((F === expected_F) && (Cout === expected_Cout))
            $display("[PASS]");
        else
            $display("[FAIL]");
        $display("----------------------------------------------\n");
    end
    endtask

    // ================== Logic Test ==================
    task run_logic_test;
        input [31:0] a, b;
        input [3:0] s;
        input [255:0] test_name;
    begin
        A = a; B = b; sel = s; Cin = 0; DinL = 0; DinR = 0;

        // Expected
        case (sel[1:0])
            2'b00: expected_F = A & B;
            2'b01: expected_F = A | B;
            2'b10: expected_F = A ^ B;
            2'b11: expected_F = ~A;
        endcase
        expected_Cout = 1'b0;

        #5;
        $display("----------------------------------------------");
        $display("%s", test_name);
        $display("sel=0x%0h A=0x%08h B=0x%08h → Expected F=0x%08h | Obtained F=0x%08h",
                 sel, A, B, expected_F, F);

        if (F === expected_F)
            $display("[PASS]");
        else
            $display("[FAIL]");
        $display("----------------------------------------------\n");
    end
    endtask

    // ================== Shift Test ==================
    task run_shift_test;
        input [31:0] a;
        input [3:0] s;
        input dl, dr;
        input [255:0] test_name;
    begin
        A = a; B = 32'h00000000; sel = s; Cin = 0; DinL = dl; DinR = dr;

        if (sel[3:2] == 2'b10)
            expected_F = {DinR, A[31:1]};
        else
            expected_F = {A[30:0], DinL};

        expected_Cout = 1'b0;

        #5;
        $display("----------------------------------------------");
        $display("%s", test_name);
        $display("sel=0x%0h A=0x%08h DinL=%0d DinR=%0d → Expected F=0x%08h | Obtained F=0x%08h",
                 sel, A, DinL, DinR, expected_F, F);

        if (F === expected_F)
            $display("[PASS]");
        else
            $display("[FAIL]");
        $display("----------------------------------------------\n");
    end
    endtask

endmodule