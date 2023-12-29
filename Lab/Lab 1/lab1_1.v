/* CSED273 lab1 experiment 1 */
/* lab1_1.v */
/* 20220100 박기현 */

/* Implement AND */
module lab1_1(outAND, inA, inB);
    output wire outAND;
    input wire inA, inB;

    ////////////////////////
    and(outAND, inA, inB); //A AND B
    ////////////////////////

endmodule