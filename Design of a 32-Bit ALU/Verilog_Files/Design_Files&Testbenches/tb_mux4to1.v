`timescale 1ns/1ps
module tb_mux4to1;

    reg a, b, c, d;
    reg [1:0] sel;
    wire out;
    reg expected_out;

    // Instantiate DUT
    mux4to1 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .out(out)
    );

    initial begin
        $display("\n================== Functional Verification of 4-to-1 MUX ==================\n");

        // Strategic Functional Tests

        // Test Case 1: Select input a (sel=00)
        apply_test(0, 1, 1, 1, 2'b00, 0, "Select input a");
        apply_test(1, 0, 0, 0, 2'b00, 1, "Select input a");

        // Test Case 2: Select input b (sel=01)
        apply_test(1, 0, 1, 1, 2'b01, 0, "Select input b");
        apply_test(0, 1, 0, 0, 2'b01, 1, "Select input b");

        // Test Case 3: Select input c (sel=10)
        apply_test(1, 1, 0, 1, 2'b10, 0, "Select input c");
        apply_test(0, 0, 1, 0, 2'b10, 1, "Select input c");

        // Test Case 4: Select input d (sel=11)
        apply_test(1, 1, 1, 0, 2'b11, 0, "Select input d");
        apply_test(0, 0, 0, 1, 2'b11, 1, "Select input d");

        // Edge Case: All inputs 0
        apply_test(0, 0, 0, 0, 2'b00, 0, "All inputs zero");
        apply_test(0, 0, 0, 0, 2'b01, 0, "All inputs zero");
        apply_test(0, 0, 0, 0, 2'b10, 0, "All inputs zero");
        apply_test(0, 0, 0, 0, 2'b11, 0, "All inputs zero");

        // Edge Case: All inputs 1
        apply_test(1, 1, 1, 1, 2'b00, 1, "All inputs one");
        apply_test(1, 1, 1, 1, 2'b01, 1, "All inputs one");
        apply_test(1, 1, 1, 1, 2'b10, 1, "All inputs one");
        apply_test(1, 1, 1, 1, 2'b11, 1, "All inputs one");

        $display("\n All strategic functional verification tests completed.\n");
        $finish;
    end

    // ==================== Task ====================
    task apply_test;
        input a_in, b_in, c_in, d_in;
        input [1:0] sel_in;
        input expected;
        input [255:0] test_name;
    begin
        a = a_in; b = b_in; c = c_in; d = d_in; sel = sel_in;
        expected_out = expected;
        #5;
        $display("----------------------------------------------");
        $display("%s", test_name);
        $display("a=%b b=%b c=%b d=%b sel=%b → Expected out=%b | Obtained out=%b",
                 a, b, c, d, sel, expected_out, out);
        if (out === expected_out)
            $display("[PASS]");
        else
            $display("[FAIL]");
        $display("----------------------------------------------\n");
    end
    endtask

endmodule