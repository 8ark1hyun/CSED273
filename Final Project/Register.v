`timescale 1ns / 1ps

// 4-bit Register
module _4bit_reg(input [3:0] in, input clk, output [3:0] q);

    edge_trigger_DFF DFF0 (in[0], clk, q[0], x);
    edge_trigger_DFF DFF1 (in[1], clk, q[1], x);
    edge_trigger_DFF DFF2 (in[2], clk, q[2], x);
    edge_trigger_DFF DFF3 (in[3], clk, q[3], x);
    
endmodule

// Shift Register (48-bit)
module fullreg(
    input [3:0] in, 
    input clk,
    output [7:0] num1, num2, num3, num4, num5, num6
);
    
    _4bit_reg r1(in, clk, num6[3:0]);
    _4bit_reg r2(num6[3:0], clk, num6[7:4]);
    _4bit_reg r3(num6[7:4], clk, num5[3:0]);
    _4bit_reg r4(num5[3:0], clk, num5[7:4]);
    _4bit_reg r5(num5[7:4], clk, num4[3:0]);
    _4bit_reg r6(num4[3:0], clk, num4[7:4]);
    _4bit_reg r7(num4[7:4], clk, num3[3:0]);
    _4bit_reg r8(num3[3:0], clk, num3[7:4]);
    _4bit_reg r9(num3[7:4], clk, num2[3:0]);
    _4bit_reg r10(num2[3:0], clk, num2[7:4]);
    _4bit_reg r11(num2[7:4], clk, num1[3:0]);
    _4bit_reg r12(num1[3:0], clk, num1[7:4]);
    
endmodule
