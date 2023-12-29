/* CSED273 lab2 experiment 1 */
/* lab2_1.v */
/* 20220100 박기현 */

/* Unsimplifed equation
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_1(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT cal_gt(outGT, inA, inB);
    CAL_EQ cal_eq(outEQ, inA, inB);
    CAL_LT cal_lt(outLT, inA, inB);
    
endmodule

/* Implement output about "A>B" */
module CAL_GT(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    ////////////////////////
    wire gt1, gt2, gt3, gt4, gt5, gt6;
    and(gt1, ~inA[1], inA[0], ~inB[1], ~inB[0]); //gt1 = A1'A0B1'B0'
    and(gt2, inA[1], ~inA[0], ~inB[1], ~inB[0]); //gt2 = A1A0'B1'B0'
    and(gt3, inA[1], inA[0], ~inB[1], ~inB[0]); //gt3 = A1A0B1'B0'
    and(gt4, inA[1], ~inA[0], ~inB[1], inB[0]); //gt4 = A1A0'B1'B0
    and(gt5, inA[1], inA[0], ~inB[1], inB[0]); //gt5 = A1A0B1'B0
    and(gt6, inA[1], inA[0], inB[1], ~inB[0]); //gt6 = A1A0B1B0'
    or(outGT, gt1, gt2, gt3, gt4, gt5, gt6); //outGT(A>B) = gt1+gt2+gt3+gt4+gt5+gt6 = A1'A0B1'B0' + A1A0'B1'B0' + A1A0B1'B0' + A1A0'B1'B0 + A1A0B1'B0 + A1A0B1B0'
    ////////////////////////

endmodule

/* Implement output about "A=B" */
module CAL_EQ(
    output wire outEQ,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    wire eq1, eq2, eq3, eq4;
    and(eq1, ~inA[1], ~inA[0], ~inB[1], ~inB[0]); //eq1 = A1'A0'B1'B0'
    and(eq2, ~inA[1], inA[0], ~inB[1], inB[0]); //eq2 = A1'A0B1'B0
    and(eq3, inA[1], ~inA[0], inB[1], ~inB[0]); //eq3 = A1A0'B1B0'
    and(eq4, inA[1], inA[0], inB[1], inB[0]); //eq4 = A1A0B1B0
    or(outEQ, eq1, eq2, eq3, eq4); //outEQ(A=B) = eq1+eq2+eq3+eq4 = A1'A0'B1'B0' + A1'A0B1'B0 + A1A0'B1B0' + A1A0B1B0
    ////////////////////////

endmodule

/* Implement output about "A<B" */
module CAL_LT(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    wire lt1, lt2, lt3, lt4, lt5, lt6;
    and(lt1, ~inA[1], ~inA[0], ~inB[1], inB[0]); //lt1 = A1'A0'B1'B0
    and(lt2, ~inA[1], ~inA[0], inB[1], inB[0]); //lt2 = A1'A0'B1B0
    and(lt3, ~inA[1], inA[0], inB[1], inB[0]); //lt3 = A1'A0B1B0
    and(lt4, ~inA[1], ~inA[0], inB[1], ~inB[0]); //lt4 = A1'A0'B1B0'
    and(lt5, ~inA[1], inA[0], inB[1], ~inB[0]); //lt5 = A1'A0B1B0'
    and(lt6, inA[1], ~inA[0], inB[1], inB[0]); //lt6 = A1A0'B1B0
    or(outLT, lt1, lt2, lt3, lt4, lt5, lt6); //outLT(A<B) = lt1+lt2+lt3+lt4+lt5+lt6 = A1'A0'B1'B0 + A1'A0'B1B0 + A1'A0B1B0 + A1'A0'B1B0' + A1'A0B1B0' + A1A0'B1B0
    ////////////////////////

endmodule