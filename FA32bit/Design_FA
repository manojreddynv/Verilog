module top_module (
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum
);
    wire carry;

    // Lower 16 bits
    add16 lower (
        .a   (a[15:0]),
        .b   (b[15:0]),
        .cin (1'b0),
        .sum (sum[15:0]),
        .cout(carry)
    );

    // Upper 16 bits
    add16 upper (
        .a   (a[31:16]),
        .b   (b[31:16]),
        .cin (carry),
        .sum (sum[31:16]),
        .cout()
    );
endmodule


module add16 (
    input  [15:0] a,
    input  [15:0] b,
    input         cin,
    output [15:0] sum,
    output        cout
);
    wire [15:0] carry;  // carry between bits

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : adder_bits
            if (i == 0)
                add1 fa (a[i], b[i], cin, sum[i], carry[i]);
            else
                add1 fa (a[i], b[i], carry[i-1], sum[i], carry[i]);
        end
    endgenerate

    assign cout = carry[15];  // final carry out
endmodule


module add1 (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
