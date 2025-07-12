`timescale 1ns/1ps

module mult_unsigned_tb;

  // Parameters (Match the DUT's parameters)
  parameter WIDTHA = 16;
  parameter WIDTHB = 24;

  // Signals
  reg clk;
  reg [WIDTHA-1:0] A;
  reg [WIDTHB-1:0] B;
  wire [WIDTHA+WIDTHB-1:0] RES;

  // Instantiate the Unit Under Test (UUT)
  mult_unsigned #(
      .WIDTHA(WIDTHA),
      .WIDTHB(WIDTHB)
  ) dut (
      .clk(clk),
      .A(A),
      .B(B),
      .RES(RES)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns clock period
  end

  // Test stimulus
  initial begin
    // Initialize inputs
    A = 0;
    B = 0;
    #10;  // Wait for a few clock cycles to ensure reset (if any) is complete

    // Test case 1:  Zero inputs
    $display("Test Case 1: A=0, B=0");
    #10; // wait one cycle.
    // Note: you'll need 4 cycles after changing inputs for the final result.
    repeat (4) @(posedge clk); // Wait for pipeline to fill and result to propagate
    if (RES !== 0) begin
      $display("ERROR: Test Case 1 Failed.  RES = %h, Expected = 0", RES);
      $finish;
    end
     $display("Test Case 1: passed");

    // Test case 2:  Small values
    $display("Test Case 2: A=10, B=5");
    A = 10;
    B = 5;
    repeat (5) @(posedge clk);
    if (RES !== 50) begin
      $display("ERROR: Test Case 2 Failed.  RES = %h, Expected = 50", RES);
      $finish;
    end
	 $display("Test Case 2: passed");

    // Test case 3:  Larger values (within range)
    $display("Test Case 3: A=255, B=127");
    A = 255;
    B = 127;
    repeat (5) @(posedge clk);  //Give time for signal to propagate, more than enough.
    if (RES !== 32385) begin
      $display("ERROR: Test Case 3 Failed.  RES = %h, Expected = 32385", RES);
      $finish;
    end
	 $display("Test Case 3: passed");

    // Test case 4:  Maximum values for A and B.
    $display("Test Case 4: A=max, B=max");
    A = {WIDTHA{1'b1}};  // All ones for WIDTHA bits
    B = {WIDTHB{1'b1}};  // All ones for WIDTHB bits
    repeat (5) @(posedge clk);  // Give Time.
    if (RES != {{WIDTHA-1{1'b0}},{1'b1}, {WIDTHB-1{1'b0}} }) // expected is (2^WIDTHA-1) * (2^WIDTHB-1)
      begin
          $display("ERROR: Test case 4 failed. RES = %b, Expected = %b",RES, {{WIDTHA-1{1'b0}},{1'b1}, {WIDTHB-1{1'b0}} });
          $finish;
      end
	 $display("Test Case 4: passed");

    // Test case 5:  A = 0, B = max
    $display("Test Case 5: A=0, B=max");
    A = 0;
    B = {WIDTHB{1'b1}};  // All ones for WIDTHB bits
    repeat (5) @(posedge clk);
    if (RES !== 0) begin
      $display("ERROR: Test Case 5 Failed.  RES = %h, Expected = 0", RES);
      $finish;
    end
    $display("Test Case 5: passed");

    // Test case 6:  A = max, B = 0
    $display("Test Case 6: A=max, B=0");
    A = {WIDTHA{1'b1}};
    B = 0;
    repeat (5) @(posedge clk);
    if (RES !== 0) begin
      $display("ERROR: Test Case 6 Failed.  RES = %h, Expected = 0", RES);
      $finish;
    end
	 $display("Test Case 6: passed");

      // Test case 7: a power of two.
    $display("Test Case 7: A = 2**8, B= 2**4");
    A = 16'h0100; // 2^8
    B = 24'h000010; // 2^4
    repeat (5) @(posedge clk);  //Give time for signal to propagate, more than enough.
    if (RES !== 4096) begin
      $display("ERROR: Test Case 7 Failed.  RES = %h, Expected = 4096", RES);
      $finish;
    end
	 $display("Test Case 7: passed");

    $display("All tests completed.");
    $finish;
  end

endmodule
