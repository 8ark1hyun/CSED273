/* CSED273 lab6 experiment 3 */
/* lab6_3.v */
/* 20220100 박기현 */

`timescale 1ps / 1fs

/* Implement 369 game counter (0, 3, 6, 9, 13, 6, 9, 13, 6 ...)
 * You must first implement D flip-flop in lab6_ff.v
 * then you use D flip-flop of lab6_ff.v */
module counter_369(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    wire d_3, d_2, d_1, d_0;

    wire [3:0] _count;

    or(d_3, count[2]&count[1], count[3]&_count[2]);
    assign d_2 = count[0];
    or(d_1, _count[3]&_count[2], count[3]&count[2]);
    or(d_0, _count[0], _count[2]&_count[1]);

    edge_trigger_D_FF FF3(reset_n, d_3, clk, count[3], _count[3]);
    edge_trigger_D_FF FF2(reset_n, d_2, clk, count[2], _count[2]);
    edge_trigger_D_FF FF1(reset_n, d_1, clk, count[1], _count[1]);
    edge_trigger_D_FF FF0(reset_n, d_0, clk, count[0], _count[0]);
    ////////////////////////
	
endmodule
