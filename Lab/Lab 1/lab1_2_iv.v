/* CSED273 lab1 experiment 2_iv */
/* lab1_2_iv.v */
/* 20220100 박기현 */

module lab1_2_iv(outAND, outOR, outNOT, inA, inB);
    output wire outAND, outOR, outNOT;
    input wire inA, inB;

    AND(outAND, inA, inB);
    OR(outOR, inA, inB);
    NOT(outNOT, inA);

endmodule


/* Implement AND, OR, and NOT modules with {NOR}
 * You are only allowed to wire modules below
 * i.e.) No and, or, not, etc. Only nor, AND, OR, NOT are available*/
module AND(outAND, inA, inB);
    output wire outAND;
    input wire inA, inB; 

    ////////////////////////
    wire C, D;
    nor(C, inA, inA); //NOT A
    nor(D, inB, inB); //NOT B
    nor(outAND, C, D); //A AND B
    ////////////////////////

endmodule

module OR(outOR, inA, inB); 
    output wire outOR;
    input wire inA, inB;

    ////////////////////////
    wire E;
    nor(E, inA, inB); //E = NOT(A OR B)
    nor(outOR, E, E); //A OR B
    ////////////////////////

endmodule

module NOT(outNOT, inA);
    output wire outNOT;
    input wire inA; 

    ////////////////////////
    nor(outNOT, inA, inA); //NOT A
    ////////////////////////

endmodule