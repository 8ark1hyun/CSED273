/* CSED273 lab5 experiment 1 */
/* lab5_1.v */
/* 20220100 박기현 */

`timescale 1ps / 1fs

/* Implement adder 
 * You must not use Verilog arithmetic operators */
module adder(
    input [3:0] x,
    input [3:0] y,
    input c_in,             // Carry in
    output [3:0] out,
    output c_out            // Carry out
); 

    ////////////////////////
    wire c_in_1, c_in_2, c_in_3;

    xor(out[0], x[0], y[0], c_in);
    or(c_in_1, x[0]&y[0], x[0]&c_in, y[0]&c_in);
    xor(out[1], x[1], y[1], c_in_1);
    or(c_in_2, x[1]&y[1], x[1]&c_in_1, y[1]&c_in_1);
    xor(out[2], x[2], y[2], c_in_2);
    or(c_in_3, x[2]&y[2], x[2]&c_in_2, y[2]&c_in_2);
    xor(out[3], x[3], y[3], c_in_3);
    or(c_out, x[3]&y[3], x[3]&c_in_3, y[3]&c_in_3);
    ////////////////////////

endmodule

/* Implement arithmeticUnit with adder module
 * You must use one adder module.
 * You must not use Verilog arithmetic operators */
module arithmeticUnit(
    input [3:0] x,
    input [3:0] y,
    input [2:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    wire[3:0] A;

    or(A[0], y[0]&select[1], ~y[0]&select[2]);
    or(A[1], y[1]&select[1], ~y[1]&select[2]);
    or(A[2], y[2]&select[1], ~y[2]&select[2]);
    or(A[3], y[3]&select[1], ~y[3]&select[2]);

    adder Adder(x, A, select[0], out, c_out);
    ////////////////////////

endmodule

/* Implement 4:1 mux */
module mux4to1(
    input [3:0] in,
    input [1:0] select,
    output out
);

    ////////////////////////
    or(out, ~select[1]&~select[0]&in[0], ~select[1]&select[0]&in[1], select[1]&~select[0]&in[2], select[1]&select[0]&in[3]);
    ////////////////////////

endmodule

/* Implement logicUnit with mux4to1 */
module logicUnit(
    input [3:0] x,
    input [3:0] y,
    input [1:0] select,
    output [3:0] out
);

    ////////////////////////
    mux4to1 Mux3({~x[3], x[3]^y[3], x[3]|y[3], x[3]&y[3]}, select, out[3]);
    mux4to1 Mux2({~x[2], x[2]^y[2], x[2]|y[2], x[2]&y[2]}, select, out[2]);
    mux4to1 Mux1({~x[1], x[1]^y[1], x[1]|y[1], x[1]&y[1]}, select, out[1]);
    mux4to1 Mux0({~x[0], x[0]^y[0], x[0]|y[0], x[0]&y[0]}, select, out[0]);
    ////////////////////////

endmodule

/* Implement 2:1 mux */
module mux2to1(
    input [1:0] in,
    input  select,
    output out
);

    ////////////////////////
    or(out, in[1]&select, in[0]&~select);
    ////////////////////////

endmodule

/* Implement ALU with mux2to1 */
module lab5_1(
    input [3:0] x,
    input [3:0] y,
    input [3:0] select,
    output [3:0] out,
    output c_out            // Carry out
);

    ////////////////////////
    wire [3:0] D_0;
    wire [3:0] D_1;


    arithmeticUnit Arithmetic(x, y, {select[2], select[1], select[0]}, D_0, c_out);
    logicUnit Logic(x, y, {select[1], select[0]}, D_1);
    mux2to1 MUX3({D_1[3], D_0[3]}, select[3], out[3]);
    mux2to1 MUX2({D_1[2], D_0[2]}, select[3], out[2]);
    mux2to1 MUX1({D_1[1], D_0[1]}, select[3], out[1]);
    mux2to1 MUX0({D_1[0], D_0[0]}, select[3], out[0]);
    ////////////////////////

endmodule
