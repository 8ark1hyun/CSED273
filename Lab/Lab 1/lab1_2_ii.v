/* CSED273 lab1 experiment 2_ii */
/* lab1_2_ii.v */
/* 20220100 박기현 */

/* Implement OR with {AND, NOT}
 * You are only allowed to wire modules together */
module lab1_2_ii(outOR, inA, inB);
    output wire outOR;
    input wire inA, inB;

    ////////////////////////
    wire C, D, E;
    not(C, inA); //C = NOT A
    not(D, inB); //D = NOT B
    and(E, C, D); //E = C AND D
    not(outOR, E); //A OR B
    ////////////////////////

endmodule