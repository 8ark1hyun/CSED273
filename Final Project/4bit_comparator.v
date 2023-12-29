module _8bit_comparator(input wire [7:0] A, input wire [7:0] B, output wire outEQ);

    wire [7:0] comp;
    xor(comp[7], A[7], B[7]);
    xor(comp[6], A[6], B[6]);
    xor(comp[5], A[5], B[5]);
    xor(comp[4], A[4], B[4]);
    xor(comp[3], A[3], B[3]);
    xor(comp[2], A[2], B[2]);
    xor(comp[1], A[1], B[1]);
    xor(comp[0], A[0], B[0]);
    and(outEQ, ~comp[7], ~comp[6], ~comp[5], ~comp[4], ~comp[3], ~comp[2], ~comp[1], ~comp[0]);

endmodule