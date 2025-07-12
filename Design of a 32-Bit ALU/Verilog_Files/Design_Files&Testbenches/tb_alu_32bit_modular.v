`timescale 1ns/1ps
module tb_alu_32bit_modular;

    reg [31:0] A, B;
    reg Cin, DinL, DinR;
    reg [3:0] sel;
    wire [31:0] F;
    wire Cout;

    reg [31:0] expected_F;
    reg expected_Cout;

    integer i;

    alu_32bit_modular uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .DinL(DinL),
        .DinR(DinR),
        .sel(sel),
        .F(F),
        .Cout(Cout)
    );

    initial begin
        $display("\n================ Functional Verification of 32-bit Modular ALU ================");

        // --- Arithmetic Tests ---
        $display("\n--- Arithmetic Operation Tests ---");

        // Transfer A & Increment A
        A = 32'h00000000; B = 32'h00000000; sel = 4'h0; Cin = 0; DinL = 0; DinR = 0;
        compute_expected; #5 check_result("Transfer A");

        A = 32'hFFFFFFFF; B = 32'h00000000; sel = 4'h0; Cin = 1;
        compute_expected; #5 check_result("Increment A");

        // Addition
        A = 32'hFFFFFFFF; B = 32'hFFFFFFFF; sel = 4'h1; Cin = 0;
        compute_expected; #5 check_result("Addition A+B");

        A = 32'h00000001; B = 32'h00000001; sel = 4'h1; Cin = 1;
        compute_expected; #5 check_result("Addition A+B+1");

        // Subtraction (A > B)
        A = 32'h00000004; B = 32'h00000003; sel = 4'h2; Cin = 0;
        compute_expected; #5 check_result("Subtraction A-B-1");

        A = 32'h00000004; B = 32'h00000003; sel = 4'h2; Cin = 1;
        compute_expected; #5 check_result("Subtraction A-B");

        // Subtraction (B > A)
        A = 32'h00000003; B = 32'h00000004; sel = 4'h2; Cin = 0;
        compute_expected; #5 check_result("Subtraction A-B-1 (B>A)");

        A = 32'h00000003; B = 32'h00000004; sel = 4'h2; Cin = 1;
        compute_expected; #5 check_result("Subtraction A-B (B>A)");

        // Decrement & Transfer
        A = 32'h00000000; sel = 4'h3; Cin = 0;
        compute_expected; #5 check_result("Decrement A");

        A = 32'h00000001; sel = 4'h3; Cin = 0;
        compute_expected; #5 check_result("Decrement A");

        A = 32'hFFFFFFFF; sel = 4'h3; Cin = 1;
        compute_expected; #5 check_result("Transfer A");

        // Overflow case
        A = 32'h80000000; B = 32'h7FFFFFFF; sel = 4'h1; Cin = 0;
        compute_expected; #5 check_result("Addition Overflow Case");

        // --- Logic Tests ---
        $display("\n--- Logic Operation Tests ---");

        A = 32'h0F0F0F0F; B = 32'hF0F0F0F0; Cin = 0; DinL = 0; DinR = 0;
        sel = 4'h4; compute_expected; #5 check_result("AND Operation");

        sel = 4'h5; compute_expected; #5 check_result("OR Operation");

        A = 32'hAAAAAAAA; B = 32'h55555555; sel = 4'h6;
        compute_expected; #5 check_result("XOR Operation");

        A = 32'h00000000; B = 32'h00000000; sel = 4'h7;
        compute_expected; #5 check_result("NOT A Operation");

        // --- Shift Tests ---
        $display("\n--- Shift Operation Tests ---");

        A = 32'h12345678; B = 32'h00000000; Cin = 0;

        for (i = 0; i < 4; i = i + 1) begin
            DinL = i[1];
            DinR = i[0];

            sel = 4'b1000; compute_expected; #5 check_result("Shift Right Operation");
            sel = 4'b1011; compute_expected; #5 check_result("Shift Right Operation");
            sel = 4'b1100; compute_expected; #5 check_result("Shift Left Operation");
            sel = 4'b1101; compute_expected; #5 check_result("Shift Left Operation");
        end

        // --- Random Strategic Tests ---
        $display("\n--- Random Directed Tests ---");
        repeat (20) begin
            A = $random;
            B = $random;
            Cin = $random % 2;
            DinL = $random % 2;
            DinR = $random % 2;
            sel = $random % 16;
            compute_expected;
            #5 check_result("Random Test");
        end

        $display("\nAll functional verification tests completed.");
        $finish;
    end

    // =================== Expected Value Computation ==================
    task compute_expected;
        reg [32:0] temp_sum;
        reg [31:0] logic_out, shift_out;
    begin
        if (sel[3:2] == 2'b00) begin // Arithmetic
            case ({sel[1:0], Cin})
                3'b000: temp_sum = {1'b0, A};                    // Transfer A
                3'b001: temp_sum = {1'b0, A} + 1;                // Increment A
                3'b010: temp_sum = {1'b0, A} + {1'b0, B};        // A+B
                3'b011: temp_sum = {1'b0, A} + {1'b0, B} + 1;    // A+B+1
                3'b100: temp_sum = {1'b0, A} + {1'b0, ~B};       // A-B-1
                3'b101: temp_sum = {1'b0, A} + {1'b0, ~B} + 1;   // A-B
                3'b110: temp_sum = {1'b0, A} + 33'hFFFFFFFF;     // Decrement A
                3'b111: temp_sum = {1'b1, A};                    // Transfer A
                default: temp_sum = 33'h0;
            endcase
            expected_F = temp_sum[31:0];
            expected_Cout = temp_sum[32]; // Correct carry-out or borrow-out
        end else if (sel[3:2] == 2'b01) begin // Logic
            case (sel[1:0])
                2'b00: logic_out = A & B;
                2'b01: logic_out = A | B;
                2'b10: logic_out = A ^ B;
                2'b11: logic_out = ~A;
            endcase
            expected_F = logic_out;
            expected_Cout = 1'b0;
        end else if (sel[3:2] == 2'b10) begin // Shift Right
            expected_F = {DinR, A[31:1]};
            expected_Cout = 1'b0;
        end else if (sel[3:2] == 2'b11) begin // Shift Left
            expected_F = {A[30:0], DinL};
            expected_Cout = 1'b0;
        end
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
        $display("Expected → F=0x%08h (%0d) Cout=%b", expected_F, expected_F, expected_Cout);
        $display("Obtained → F=0x%08h (%0d) Cout=%b", F, F, Cout);

        if (sel[3:2] == 2'b00) begin
            if ((F !== expected_F) || (Cout !== expected_Cout))
                $display("[FAIL] Arithmetic");
            else
                $display("[PASS] Arithmetic");
        end else begin
            if (F !== expected_F)
                $display("[FAIL] Logic/Shift");
            else
                $display("[PASS] Logic/Shift");
        end
        $display("----------------------------------------------\n");
    end
    endtask

endmodule