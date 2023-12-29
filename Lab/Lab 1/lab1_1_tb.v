/* CSED273 lab1 experiment 1 */
/* lab1_1_tb.v */
/* 20220100 박기현 */

`timescale 1ns / 1ps

module lab1_1_tb();
    wire out;
    reg A, B;
    
    lab1_1 AND(out, A,B);
    
	/* Initialize A and B */
    initial begin
		////////////////////////
		A = 1; //0ns일 때 A게이트 입력 초기값 = 1
		B = 1; //0ns일 때 B게이트 입력 초기값 = 1
		#10 $finish; //10ns동안 시뮬레이션 수행
		////////////////////////
    end
	
	/* Flip A every 1ns */
    always begin
		#1 A <= !A;
    end
	
	/* Flip B every 2ns */
    always begin
		////////////////////////
		#2 B <= !B; //2ns마다 B게이트 입력 반전
		////////////////////////
    end
endmodule
