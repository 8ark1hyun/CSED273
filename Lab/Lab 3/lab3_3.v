/* CSED273 lab3 experiment 3 */
/* lab3_3.v */
/* 20220100 박기현 */

/* 8-to-1 Multiplexer
 * You must use this module to implement 5-bit Majority Function */
module mux(
    input wire [7:0] data_input,
    input wire [2:0] select_input,
    output wire out
    );

    wire i0, i1, i2, i3, i4, i5, i6, i7;
    and(i0, ~select_input[2], ~select_input[1], ~select_input[0], data_input[0]);
    and(i1, ~select_input[2], ~select_input[1],  select_input[0], data_input[1]);
    and(i2, ~select_input[2],  select_input[1], ~select_input[0], data_input[2]);
    and(i3, ~select_input[2],  select_input[1],  select_input[0], data_input[3]);
    and(i4,  select_input[2], ~select_input[1], ~select_input[0], data_input[4]);
    and(i5,  select_input[2], ~select_input[1],  select_input[0], data_input[5]);
    and(i6,  select_input[2],  select_input[1], ~select_input[0], data_input[6]);
    and(i7,  select_input[2],  select_input[1],  select_input[0], data_input[7]);
    or(out, i0, i1, i2, i3, i4, i5, i6, i7);

endmodule


/* Implement 5-bit Majority Function
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab3_3(
    input wire [4:0] in,
    output wire out
    );

    ////////////////////////
    wire [7:0] data;
    assign data[0] = 0;
    and(data[1], in[1], in[0]);
    and(data[2], in[1], in[0]);
    or(data[3], in[1], in[0]);
    and(data[4], in[1], in[0]);
    or(data[5], in[1], in[0]);
    or(data[6], in[1], in[0]);
    assign data[7] = 1;
    mux Majority_Func ({data[7], data[6], data[5], data[4], data[3], data[2], data[1], data[0]}, {in[4], in[3], in[2]}, out);
    ////////////////////////

endmodule