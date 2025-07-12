`timescale 1ns/1ps
module tb_arithmetic_unit;

    reg Ai, Bi, Cini;
    reg [1:0] sel;
    wire Di, Couti;

    reg expected_Di, expected_Couti;
    reg [255:0] operation_name;
    integer a, b, cin, s;

    // Instantiate DUT
    arithmetic_unit uut (
        .Ai(Ai),
        .Bi(Bi),
        .Cini(Cini),
        .sel(sel),
        .Di(Di),
        .Couti(Couti)
    );

    initial begin
        $display("====================== Functional Verification: Arithmetic Unit ======================");

        for (a = 0; a <= 1; a = a + 1) begin
            for (b = 0; b <= 1; b = b + 1) begin
                for (cin = 0; cin <= 1; cin = cin + 1) begin
                    for (s = 0; s < 4; s = s + 1) begin
                        Ai = a; Bi = b; Cini = cin; sel = s[1:0];
                        set_operation_name; // <<< YOU FORGOT THIS LINE BEFORE
                        compute_expected;
                        #5 check_result;
                    end
                end
            end
        end

        $display("\nAll functional verification tests completed.");
        $finish;
    end

    // ================= Expected Computation =================
    task compute_expected;
        reg mux_out;
    begin
        case (sel)
            2'b00: mux_out = 1'b0;
            2'b01: mux_out = Bi;
            2'b10: mux_out = ~Bi;
            2'b11: mux_out = 1'b1;
        endcase

        expected_Di = Ai ^ mux_out ^ Cini;
        expected_Couti = (Ai & mux_out) | (Ai & Cini) | (mux_out & Cini);
    end
    endtask

    // ================= Operation Name =================
    task set_operation_name;
    begin
        case ({sel, Cini})
            3'b000: operation_name = "Transfer A (sel=00, Cin=0)";
            3'b001: operation_name = "Increment A (sel=00, Cin=1)";
            3'b010: operation_name = "Addition A+B (sel=01, Cin=0)";
            3'b011: operation_name = "Addition A+B+1 (sel=01, Cin=1)";
            3'b100: operation_name = "Subtraction A-B-1 (sel=10, Cin=0)";
            3'b101: operation_name = "Subtraction A-B (sel=10, Cin=1)";
            3'b110: operation_name = "Decrement A (sel=11, Cin=0)";
            3'b111: operation_name = "Transfer A (sel=11, Cin=1)";
            default: operation_name = "Unknown Operation";
        endcase
    end
    endtask

    // ================= Result Checking =================
    task check_result;
    begin
        $display("-----------------------------------------------------------------------------------");
        $display("Operation: %s", operation_name);
        $display("Ai=%b, Bi=%b, Cini=%b, sel=%b → Expected Di=%b, Couti=%b | Obtained Di=%b, Couti=%b",
                 Ai, Bi, Cini, sel, expected_Di, expected_Couti, Di, Couti);

        if ((Di !== expected_Di) || (Couti !== expected_Couti))
            $display("[FAIL]");
        else
            $display("[PASS]");
    end
    endtask

endmodule