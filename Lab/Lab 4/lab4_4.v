/* CSED273 lab4 experiment 4 */
/* lab4_4.v */
/* 20220100 박기현 */

/* Implement 5x3 Binary Mutliplier
 * You must use lab4_2 module in lab4_2.v
 * You cannot use fullAdder or halfAdder module directly
 * You may use keword "assign" and bitwise operator
 * or just implement with gate-level modeling*/
module lab4_4(
    input [4:0]in_a,
    input [2:0]in_b,
    output [7:0]out_m
    );

    ////////////////////////
    wire s1, s2, s3, s4, c;
    and(out_m[0], in_a[0], in_b[0]);
    lab4_2 Adder1 ({0, in_a[4]&in_b[0], in_a[3]&in_b[0], in_a[2]&in_b[0], in_a[1]&in_b[0]}, {in_a[4]&in_b[1], in_a[3]&in_b[1], in_a[2]&in_b[1], in_a[1]&in_b[1], in_a[0]&in_b[1]}, 0, {s4, s3, s2, s1, out_m[1]}, c);
    lab4_2 Adder2 ({c, s4, s3, s2, s1}, {in_a[4]&in_b[2], in_a[3]&in_b[2], in_a[2]&in_b[2], in_a[1]&in_b[2], in_a[0]&in_b[2]}, 0, {out_m[6], out_m[5], out_m[4], out_m[3], out_m[2]}, out_m[7]);
    ////////////////////////
    
endmodule