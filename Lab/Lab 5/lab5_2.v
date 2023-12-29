/* CSED273 lab5 experiment 2 */
/* lab5_2.v */
/* 20220100 박기현 */

`timescale 1ns / 1ps

/* Implement srLatch */
module srLatch(
    input s, r, reset_n,
    output q, q_
    );

    ////////////////////////
    nand(q, s, q_);
    nand(q_, r, q, reset_n);
    ////////////////////////

endmodule

/* Implement Negative reset master-slave SR flip-flop with srLatch module */
module lab5_2_a(
    input reset_n, j, k, clk,
    output q, q_
    );

    ////////////////////////
    wire p, p_;
    wire ms, mr, ss, sr;

    nand(ms, j, clk);
    nand(mr, k, clk);

    srLatch Master(ms, mr, reset_n, p, p_);

    nand(ss, p, ~clk);
    nand(sr, p_, ~clk);
    
    srLatch Slave(ss, sr, reset_n, q, q_);
    ////////////////////////
    
endmodule

/* Implement Negative reset master-slave JK flip-flop with srLatch module */
module lab5_2_b(
    input reset_n, j, k, clk,
    output q, q_
    );

    ////////////////////////
    wire p, p_;
    wire ms, mr, ss, sr;

    nand(ms, j, clk, q_);
    nand(mr, k, clk, q);

    srLatch Master(ms, mr, reset_n, p, p_);

    nand(ss, p, ~clk);
    nand(sr, p_, ~clk);
    
    srLatch Slave(ss, sr, reset_n, q, q_);
    ////////////////////////
    
endmodule