`timescale 1ns/1ps
module tb_alu_1bit;

    reg Ai, Bi, A_prev, A_next, Cini;
    reg [3:0] sel;
    wire Fi, Couti;

    reg expected_Fi, expected_Couti;
    integer a, b, cin, ap, an, s;

    // Instantiate DUT
    alu_1bit uut (
        .Ai(Ai),
        .Bi(Bi),
        .A_prev(A_prev),
        .A_next(A_next),
        .Cini(Cini),
        .sel(sel),
        .Fi(Fi),
        .Couti(Couti)
    );

    initial begin
        $display("==================== Functional Verification: 1-bit ALU ====================");

        // 1. ARITHMETIC TESTS
        $display("\n--- Arithmetic Tests ---");
        for (a = 0; a <= 1; a = a + 1) begin
            for (b = 0; b <= 1; b = b + 1) begin
                for (cin = 0; cin <= 1; cin = cin + 1) begin
                    for (s = 0; s < 4; s = s + 1) begin
                        Ai = a; Bi = b; Cini = cin; A_prev = 0; A_next = 0;
                        sel = {2'b00, s[1:0]};

                        case ({sel[1:0], Cini})
                            3'b000: $display("\nTest: Transfer A (sel=0000, cin=0)");
                            3'b001: $display("\nTest: Increment A (sel=0000, cin=1)");
                            3'b010: $display("\nTest: Addition A+B (sel=0001, cin=0)");
                            3'b011: $display("\nTest: Addition with carry A+B+1 (sel=0001, cin=1)");
                            3'b100: $display("\nTest: Subtraction with borrow A-B-1 (sel=0010, cin=0)");
                            3'b101: $display("\nTest: Subtraction A-B (sel=0010, cin=1)");
                            3'b110: $display("\nTest: Decrement A-1 (sel=0011, cin=0)");
                            3'b111: $display("\nTest: Transfer A (sel=0011, cin=1)");
                        endcase

                        compute_expected;
                        #5 check_result;
                    end
                end
            end
        end

        // 2. LOGIC TESTS
        $display("\n--- Logic Operation Tests ---");
        for (a = 0; a <= 1; a = a + 1) begin
            for (b = 0; b <= 1; b = b + 1) begin
                for (s = 0; s < 4; s = s + 1) begin
                    Ai = a; Bi = b; Cini = 0; A_prev = 0; A_next = 0;
                    sel = {2'b01, s[1:0]};

                    case (sel[1:0])
                        2'b00: $display("\nTest: Logic AND (sel=0100)");
                        2'b01: $display("\nTest: Logic OR (sel=0101)");
                        2'b10: $display("\nTest: Logic XOR (sel=0110)");
                        2'b11: $display("\nTest: Logic NOT (sel=0111)");
                    endcase

                    compute_expected;
                    #5 check_result;
                end
            end
        end

        // 3. SHIFT TESTS
        $display("\n--- Shift Operation Tests ---");
        for (ap = 0; ap <= 1; ap = ap + 1) begin
            for (an = 0; an <= 1; an = an + 1) begin
                Ai = 0; Bi = 0; Cini = 0;
                A_prev = ap; A_next = an;

                sel = 4'b1000;
                $display("\nTest: Shift Right Operation (sel=10xx)");
                compute_expected;
                #5 check_result;

                sel = 4'b1100;
                $display("\nTest: Shift Left Operation (sel=11xx)");
                compute_expected;
                #5 check_result;
            end
        end

        $display("\nAll functional verification tests completed.");
        $finish;
    end

    // ============== Expected Value Calculation ==============
    task compute_expected;
        reg mux_in;
        reg sum, carry, logic_out, shift_out;
    begin
        // Arithmetic
        case (sel[1:0])
            2'b00: mux_in = 1'b0;
            2'b01: mux_in = Bi;
            2'b10: mux_in = ~Bi;
            2'b11: mux_in = 1'b1;
        endcase

        sum = Ai ^ mux_in ^ Cini;
        carry = (Ai & mux_in) | (Ai & Cini) | (mux_in & Cini);

        // Logic
        case (sel[1:0])
            2'b00: logic_out = Ai & Bi;
            2'b01: logic_out = Ai | Bi;
            2'b10: logic_out = Ai ^ Bi;
            2'b11: logic_out = ~Ai;
        endcase

        // Shift
        shift_out = (sel[3:2] == 2'b10) ? A_prev :
                    (sel[3:2] == 2'b11) ? A_next : 1'b0;

        // Final Output
        case (sel[3:2])
            2'b00: begin
                expected_Fi = sum;
                expected_Couti = carry;
            end
            2'b01: begin
                expected_Fi = logic_out;
                expected_Couti = 1'bx;
            end
            default: begin
                expected_Fi = shift_out;
                expected_Couti = 1'bx;
            end
        endcase
    end
    endtask

    // =================== Check Result ============================
    task check_result;
    begin
        $display("sel=%b Ai=%b Bi=%b Cin=%b A_prev=%b A_next=%b → Expected Fi=%b Couti=%b | Obtained Fi=%b Couti=%b",
                 sel, Ai, Bi, Cini, A_prev, A_next, expected_Fi, expected_Couti, Fi, Couti);

        if (sel[3:2] == 2'b00) begin
            if ((Fi !== expected_Fi) || (Couti !== expected_Couti))
                $display("[FAIL] Arithmetic");
            else
                $display("[PASS] Arithmetic");
        end else begin
            if (Fi !== expected_Fi)
                $display("[FAIL] Logic/Shift");
            else
                $display("[PASS] Logic/Shift");
        end
        $display("----------------------------------------------\n");
    end
    endtask

endmodule