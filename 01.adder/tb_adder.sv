module adder (
    input  logic [7:0] a,
    input  logic [7:0] b,
    output logic [7:0] y
);

    assign y = a + b;

endmodule


module tb;

    logic [7:0] a;
    logic [7:0] b;
    logic [7:0] y;

    adder dut (
        .a (a),
        .b (b),
        .y (y)
    );

    initial begin
        a = 8'd10;
        b = 8'd20;
        #1;

        if (y == 8'd30)
            $display("TEST 1 PASS");
        else
            $display("TEST 1 FAIL");

        a = 8'd100;
        b = 8'd55;
        #1;

        if (y == 8'd155)
            $display("TEST 2 PASS");
        else
            $display("TEST 2 FAIL");

        $finish;
    end

endmodule