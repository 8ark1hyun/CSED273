/* CSED273 lab1 experiment 2_i */
/* lab1_2_i.v */
/* 20220100 박기현 */

/* Implement AND with {OR, NOT}
 * You are only allowed to wire modules together */
module lab1_2_i(outAND, inA, inB);
    output wire outAND;
    input wire inA, inB;

    ////////////////////////
    wire C, D, E;
    not(C, inA); //C = NOT A
    not(D, inB); //D = NOT B
    or(E, C, D); //E = C OR D
    not(outAND, E); //A AND B
    ////////////////////////

endmodule