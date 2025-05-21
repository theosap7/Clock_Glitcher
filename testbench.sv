

module tb_top;

    // Inputs to the top module
    reg clk_in1;      // Main system clock (FPGA clock)
    reg rst; 
    reg [3:0] a;      // 4-bit input A
    reg [3:0] b;      // 4-bit input B

    // Output from the top module
    wire [4:0] finout;   // 5-bit sum (LED output)

    // Instantiate the top module
    top uut (
        .clk_in1(clk_in1),
        .rst(rst),
        .a(a),
        .b(b),
        .finout(finout)
    );

    // Clock generation for clk_in1
    always begin
        #5 clk_in1 = ~clk_in1;  // Generate a 100MHz clock (10ns period)
    end

    // Test stimulus
    initial begin
        // Initialize signals
        clk_in1 = 0;
        rst = 0;
        a = 4'b0000;
        b = 4'b0000;

        // Apply reset
        $display("Applying reset...");
        rst = 0;
        #5;  // Wait for 10ns to assert reset
        rst = 1;  // Release reset
        #10;  // Wait for a clock cycle
        #400
        // Test 1: Add 4'b0101 + 4'b0011
        a = 4'b0101;  // 5
        b = 4'b0011;  // 3
        $display("Test 1: a = %b, b = %b, finout= %b", a, b, finout);
        #10;  // Wait for two clock cycles

        // Test 2: Add 4'b1111 + 4'b0001
        a = 4'b1111;  // 15
        b = 4'b0001;  // 1
        $display("Test 2: a = %b, b = %b, finout= %b", a, b, finout);
        #10;  // Wait for two clock cycles

        // Test 3: Add 4'b0000 + 4'b0000
        a = 4'b0000;  // 0
        b = 4'b0000;  // 0
       $display("Test 3: a = %b, b = %b, finout= %b", a, b, finout);
        #10;  // Wait for two clock cycles

        // Test 4: Add 4'b1010 + 4'b0101
        a = 4'b1010;  // 10
        b = 4'b0101;  // 5
        $display("Test 4: a = %b, b = %b, finout = %b", a, b, finout);
        #10;  // Wait for two clock cycles

        // Test 5: Add 4'b1110 + 4'b0001
        a = 4'b1110;  // 14
        b = 4'b0001;  // 1
        $display("Test 5: a = %b, b = %b, finout= %b", a, b, finout);
        #10;  // Wait for two clock cycles

        // Test 6: Add 4'b0111 + 4'b1100
        a = 4'b0111;  // 7
        b = 4'b1100;  // 12
        $display("Test 6: a = %b, b = %b, finout = %b", a, b, finout);
        #10;  // Wait for two clock cycles

        // Test 7: Add 4'b0001 + 4'b0001
        a = 4'b0001;  // 1
        b = 4'b0001;  // 1
        $display("Test 7: a = %b, b = %b, finout= %b", a, b, finout);
        #10;  // Wait for two clock cycles

        // Test 8: Add 4'b1000 + 4'b1000
        a = 4'b1000;  // 8
        b = 4'b1000;  // 8
        $display("Test 8: a = %b, b = %b, finout = %b", a, b, finout);
        #10;  // Wait for two clock cycles

        // Test 9: Add 4'b1111 + 4'b1111
        a = 4'b1111;  // 15
        b = 4'b1111;  // 15
        $display("Test 9: a = %b, b = %b, finout= %b", a, b, finout);
        #10;  // Wait for two clock cycles

        // Test 10: Add 4'b0100 + 4'b0010
        a = 4'b0100;  // 4
        b = 4'b0010;  // 2
        $display("Test 10: a = %b, b = %b, finout = %b", a, b, finout);
        #10;  // Wait for two clock cycles

        // End of simulation
        $finish;
    end

endmodule
