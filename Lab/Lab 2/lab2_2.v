/* CSED273 lab2 experiment 2 */
/* lab2_2.v */
/* 20220100 박기현 */

/* Simplifed equation by K-Map method
 * You are allowed to use keword "assign" and operator "&","|","~",
 * or just implement with gate-level-modeling (and, or, not) */
module lab2_2(
    output wire outGT, outEQ, outLT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    CAL_GT_2 cal_gt2(outGT, inA, inB);
    CAL_EQ_2 cal_eq2(outEQ, inA, inB);
    CAL_LT_2 cal_lt2(outLT, inA, inB);

endmodule

/* Implement output about "A>B" */
module CAL_GT_2(
    output wire outGT,
    input wire [1:0] inA,
    input wire [1:0] inB
    );

    ////////////////////////
    wire gt1, gt2, gt3;
    and(gt1, inA[1], ~inB[1]); //gt1 = A1B1'
    and(gt2, inA[0], ~inB[1], ~inB[0]); //gt2 = A0B1'B0'
    and(gt3, inA[1], inA[0], ~inB[0]); //gt3 = A1A0B0'
    or(outGT, gt1, gt2, gt3); //outGT(A>B) = gt1+gt2+gt3 = A1B_1' + A0B1'B0' + A1A0B0'
    ////////////////////////

endmodule

/* Implement output about "A=B" */
module CAL_EQ_2(
    output wire outEQ,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    wire eq1, eq2, eq3, eq4;
    or(eq1, ~inA[1], inB[1]); //eq1 = A1'+B1
    or(eq2, inA[1], ~inB[1]); //eq2 = A1+B1'
    or(eq3, ~inA[0], inB[0]); //eq3 = A0'+B0
    or(eq4, inA[0], ~inB[0]); //eq4 = A0+B0'
    and(outEQ, eq1, eq2, eq3, eq4); //outEQ(A=B) = eq1eq2eq3eq4 = (A1'+B1)(A1+B1')(A0'+B0)(A0+B0')
    ////////////////////////

endmodule

/* Implement output about "A<B" */
module CAL_LT_2(
    output wire outLT,
    input wire [1:0] inA, 
    input wire [1:0] inB
    );

    ////////////////////////
    wire lt1, lt2, lt3;
    and(lt1, ~inA[1], inB[1]); //lt1 = A1'B1
    and(lt2, ~inA[0], inB[1], inB[0]); //lt2 = A0'B1B0
    and(lt3, ~inA[1], ~inA[0], inB[0]); //lt3 = A1'A0'B0
    or(outLT, lt1, lt2, lt3); //outLT(A<B) = lt1+lt2+lt3 = A1'B1 + A0'B1B0 + A1'A0'B0
    ////////////////////////

endmodule