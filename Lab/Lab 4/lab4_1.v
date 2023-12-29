/* CSED273 lab4 experiment 1 */
/* lab4_1.v */
/* 20220100 박기현 */


/* Implement Half Adder
 * You may use keword "assign" and bitwise operator
 * or just implement with gate-level modeling*/
module halfAdder(
    input in_a,
    input in_b,
    output out_s,
    output out_c
    );

    ////////////////////////
    xor(out_s, in_a, in_b);
    and(out_c, in_a, in_b);
    ////////////////////////

endmodule

/* Implement Full Adder
 * You must use halfAdder module
 * You may use keword "assign" and bitwise operator
 * or just implement with gate-level modeling*/
module fullAdder(
    input in_a,
    input in_b,
    input in_c,
    output out_s,
    output out_c
    );

    ////////////////////////
    wire A, B, C;
    halfAdder HA1 (in_a, in_b, A, B);
    halfAdder HA2 (A, in_c, out_s, C);
    or(out_c, B, C);
    ////////////////////////

endmodule