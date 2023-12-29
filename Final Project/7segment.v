module BCD_to_7segment(input wire [3:0] in, output wire [6:0] Disp); // 0123456789tndrhe (0~15)

    nor(Disp[6], ~in[3]&in[1], in[3]&~in[2]&~in[1], ~in[2]&~in[1]&~in[0], in[2]&in[1]&in[0], ~in[3]&in[2]&in[0]);
    nor(Disp[5], ~in[2]&~in[1], ~in[3]&~in[2], ~in[1]&~in[0], ~in[3]&in[1]&in[0]);
    nor(Disp[4], ~in[3]&in[0], in[2]&~in[0], ~in[2]&~in[1], ~in[2]&in[0]);
    nor(Disp[3], ~in[2]&~in[0], ~in[3]&in[1]&~in[0], in[3]&~in[1]&~in[0], in[3]&~in[2]&~in[1], ~in[3]&~in[2]&in[1], ~in[3]&in[2]&~in[1]&in[0], in[3]&in[2]&in[1]&in[0]);
    nor(Disp[2], in[3]&in[2], in[1]&~in[0], in[3]&in[1], in[3]&~in[0], ~in[2]&~in[0]);
    nor(Disp[1], ~in[3]&in[2], in[2]&in[1], in[3]&~in[2]&~in[1], ~in[2]&~in[1]&~in[0], in[3]&in[1]&~in[0]);
    nor(Disp[0], in[3], in[1]&~in[0], in[2]&~in[1], ~in[2]&in[1]);

endmodule