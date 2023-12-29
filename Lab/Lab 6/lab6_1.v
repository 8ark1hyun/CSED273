/* CSED273 lab6 experiment 1 */ 
/* lab6_1.v */
/* 20220100 박기현 */

`timescale 1ps / 1fs

/* Implement synchronous BCD decade counter (0-9)
 * You must use JK flip-flop of lab6_ff.v */
module decade_counter(input reset_n, input clk, output [3:0] count);

    ////////////////////////
    wire j_3, j_2, j_1, j_0;
    wire k_3, k_2, k_1, k_0;

    wire [3:0] _count;

    and(j_3, count[2], count[1], count[0]);
    assign k_3 = count[0];
    and(j_2, count[1], count[0]);
    and(k_2, count[1], count[0]);
    and(j_1, _count[3], count[0]);
    assign k_1 = count[0];
    assign j_0 = 1;
    assign k_0 = 1;

    edge_trigger_JKFF FF3(reset_n, j_3, k_3, clk, count[3], _count[3]);
    edge_trigger_JKFF FF2(reset_n, j_2, k_2, clk, count[2], _count[2]);
    edge_trigger_JKFF FF1(reset_n, j_1, k_1, clk, count[1], _count[1]);
    edge_trigger_JKFF FF0(reset_n, j_0, k_0, clk, count[0], _count[0]);

    ////////////////////////
	
endmodule