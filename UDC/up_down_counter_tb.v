`timescale 1ns/1ps

module up_down_counter_tb;

    parameter WIDTH = 4;

    reg             clk;
    reg             reset;
    reg             enable;
    reg             up_down;
    wire [WIDTH-1:0] count;

    // Instantiate DUT
    up_down_counter #(
        .WIDTH(WIDTH)
    ) dut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation: 10 ns period
    always #5 clk = ~clk;

    // Test procedure
    initial begin
        // Initialize signals
        clk      = 0;
        reset    = 1;
        enable   = 0;
        up_down  = 1;

        // Create waveform file
        $dumpfile("up_down_counter.vcd");
        $dumpvars(0, up_down_counter_tb);

        // -------------------------
        // Test 1: Reset
        // -------------------------
        #10;
        if (count !== 4'd0)
            $display("TEST 1 FAILED: Reset");
        else
            $display("TEST 1 PASSED: Reset");

        reset = 0;
        enable = 1;

        // -------------------------
        // Test 2: UP counting
        // -------------------------
        up_down = 1;

        #10;
        if (count !== 4'd1)
            $display("TEST 2 FAILED: UP count");
        else
            $display("TEST 2 PASSED: UP count");

        #10;
        if (count !== 4'd2)
            $display("TEST 2 FAILED: UP count");
        else
            $display("TEST 2 PASSED: UP count");

        #10;
        if (count !== 4'd3)
            $display("TEST 2 FAILED: UP count");
        else
            $display("TEST 2 PASSED: UP count");

        // -------------------------
        // Test 3: DOWN counting
        // -------------------------
        up_down = 0;

        #10;
        if (count !== 4'd2)
            $display("TEST 3 FAILED: DOWN count");
        else
            $display("TEST 3 PASSED: DOWN count");

        #10;
        if (count !== 4'd1)
            $display("TEST 3 FAILED: DOWN count");
        else
            $display("TEST 3 PASSED: DOWN count");

        // -------------------------
        // Test 4: Enable OFF
        // -------------------------
        enable = 0;

        #10;
        if (count !== 4'd1)
            $display("TEST 4 FAILED: Enable OFF");
        else
            $display("TEST 4 PASSED: Enable OFF");

        // -------------------------
        // Test 5: Enable ON
        // -------------------------
        enable = 1;
        up_down = 1;

        #10;
        if (count !== 4'd2)
            $display("TEST 5 FAILED: Enable ON");
        else
            $display("TEST 5 PASSED: Enable ON");

        // -------------------------
        // Test 6: Reset again
        // -------------------------
        reset = 1;

        #10;
        if (count !== 4'd0)
            $display("TEST 6 FAILED: Reset again");
        else
            $display("TEST 6 PASSED: Reset again");

        reset = 0;

        // -------------------------
        // Finish simulation
        // -------------------------
        #10;

        $display("--------------------------------");
        $display("All tests completed.");
        $display("--------------------------------");

        $finish;
    end

endmodule
