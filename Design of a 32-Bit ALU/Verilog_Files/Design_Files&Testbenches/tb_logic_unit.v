`timescale 1ns/1ps
module tb_logic_unit;

    reg Ai, Bi;
    reg [1:0] sel;
    wire Ei;
    reg expected_Ei;

    // Instantiate DUT
    logic_unit uut (
        .Ai(Ai),
        .Bi(Bi),
        .sel(sel),
        .Ei(Ei)
    );

    initial begin
        $display("==================== Functional Verification: Logic Unit ====================");

        // ---- Test Case 1: AND operation ----
        $display("\n--- Logic AND Tests (sel=00) ---");
        Ai = 1; Bi = 1; sel = 2'b00;
        compute_expected;
        #5 check_result;

        Ai = 1; Bi = 0; sel = 2'b00;
        compute_expected;
        #5 check_result;

        Ai = 0; Bi = 1; sel = 2'b00;
        compute_expected;
        #5 check_result;

        Ai = 0; Bi = 0; sel = 2'b00;
        compute_expected;
        #5 check_result;

        // ---- Test Case 2: OR operation ----
        $display("\n--- Logic OR Tests (sel=01) ---");
        Ai = 1; Bi = 0; sel = 2'b01;
        compute_expected;
        #5 check_result;

        Ai = 0; Bi = 1; sel = 2'b01;
        compute_expected;
        #5 check_result;

        Ai = 0; Bi = 0; sel = 2'b01;
        compute_expected;
        #5 check_result;

        Ai = 1; Bi = 1; sel = 2'b01;
        compute_expected;
        #5 check_result;

        // ---- Test Case 3: XOR operation ----
        $display("\n--- Logic XOR Tests (sel=10) ---");
        Ai = 1; Bi = 0; sel = 2'b10;
        compute_expected;
        #5 check_result;

        Ai = 0; Bi = 1; sel = 2'b10;
        compute_expected;
        #5 check_result;

        Ai = 0; Bi = 0; sel = 2'b10;
        compute_expected;
        #5 check_result;

        Ai = 1; Bi = 1; sel = 2'b10;
        compute_expected;
        #5 check_result;

        // ---- Test Case 4: NOT A operation ----
        $display("\n--- Logic NOT Tests (sel=11) ---");
        Ai = 0; Bi = 0; sel = 2'b11;
        compute_expected;
        #5 check_result;

        Ai = 1; Bi = 1; sel = 2'b11;
        compute_expected;
        #5 check_result;

        $display("\nAll functional verification tests for Logic Unit completed.");
        $finish;
    end

    // =================== Expected Value Calculation ==================
    task compute_expected;
    begin
        case (sel)
            2'b00: expected_Ei = Ai & Bi;
            2'b01: expected_Ei = Ai | Bi;
            2'b10: expected_Ei = Ai ^ Bi;
            2'b11: expected_Ei = ~Ai;
        endcase
    end
    endtask

    // =================== Check Result ============================
    task check_result;
    begin
        $display("----------------------------------------------");
        case (sel)
            2'b00: $display("Logic Operation: A AND B (sel=00)");
            2'b01: $display("Logic Operation: A OR B  (sel=01)");
            2'b10: $display("Logic Operation: A XOR B (sel=10)");
            2'b11: $display("Logic Operation: NOT A   (sel=11)");
        endcase
        $display("Inputs: Ai=%b, Bi=%b", Ai, Bi);
        $display("Expected → Ei=%b", expected_Ei);
        $display("Obtained → Ei=%b", Ei);

        if (Ei !== expected_Ei) begin
            $display("[FAIL]");
        end else begin
            $display("[PASS]");
        end
        $display("----------------------------------------------\n");
    end
    endtask

endmodule