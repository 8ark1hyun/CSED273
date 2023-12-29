/* CSED273 lab6 experiments */
/* lab6_tb.v */
/* 20220100 박기현 */

`timescale 1ps / 1fs

module lab6_tb();

    integer Passed;
    integer Failed;

    /* Define input, output and instantiate module */
    ////////////////////////
    reg reset_n_1, reset_n_2, reset_n_3;
    reg clk_1, clk_2, clk_3;
    

    wire [3:0] count_1;
    wire [7:0] count_2;
    wire [3:0] count_3;



    decade_counter lab6_1(
        .reset_n(reset_n_1),
        .clk(clk_1),
        .count(count_1)
    );

    decade_counter_2digits lab6_2(
        .reset_n(reset_n_2),
        .clk(clk_2),
        .count(count_2)
    );

    counter_369 lab6_3(
        .reset_n(reset_n_3),
        .clk(clk_3),
        .count(count_3)
    );

    always begin
        clk_1 = !clk_1;  #5;
    end
    always begin
        clk_2 = !clk_2;  #5;
    end
    always begin
        clk_3 = !clk_3;  #5;
    end

    ////////////////////////

    initial begin
        Passed = 0;
        Failed = 0;

        lab6_1_test;
        lab6_2_test;
        lab6_3_test;

        $display("Lab6 Passed = %0d, Failed = %0d", Passed, Failed);
        $finish;
    end

    /* Implement test task for lab6_1 */
    task lab6_1_test;
        ////////////////////////
        integer i;
        reg [3:0] count_expected_1;
        begin
            $display("===================");
            $display("  lab6_1 Test  ");
            $display("===================");
            
            reset_n_1 = 1'b1;
            clk_1 = 1'b0;

            reset_n_1 = 1; #5
            reset_n_1 = 0; #10
            reset_n_1 = 1;
            
            count_expected_1 = 4'b0000;

            for(i = 0; i < 10; i = i + 1) begin
                if(count_expected_1 == 9) begin
                    #10 count_expected_1 = 0;
                end
                else begin
                    #10 count_expected_1 = i + 1;
                end
            
                if(count_1 == count_expected_1) begin
                    Passed = Passed + 1;
                end
                else begin
                    Failed = Failed + 1;
                end
            end
            #10 reset_n_1 = 0;
        end
        ////////////////////////
    endtask

    /* Implement test task for lab6_2 */
    task lab6_2_test;
        ////////////////////////
        integer i;
        reg [7:0] count_expected_2;
        begin
            $display("===================");
            $display("  lab6_2 Test  ");
            $display("===================");
            
            reset_n_2 = 1'b1;
            clk_2= 1'b1;

            reset_n_2 = 1; #5
            reset_n_2 = 0; #10
            reset_n_2 = 1;
            
            for (i = 0; i < 10; i = i + 1) begin
                if(i == 9)
                    #10 reset_n_2 = 0;
                #5 clk_2 = !clk_2;
                #5 clk_2 = !clk_2;
            end
            
            #10 clk_2 = !clk_2;
            
            count_expected_2 = 8'h00;
            reset_n_2 = 1;

            for(i = 0; i < 100; i = i + 1) begin
                if((count_2[7:4] * 10 + count_2[3:0]) == count_expected_2) begin
                    Passed = Passed + 1;
                end
                else begin
                    Failed = Failed + 1;
                end
                
                if(count_expected_2 == 99) begin
                    #10 count_expected_2 = 0;
                end
                else begin
                    #10 count_expected_2 = i + 1;
                end
            end
            #10 reset_n_2 = 0;
        end
        ////////////////////////
    endtask

    /* Implement test task for lab6_3 */
    task lab6_3_test;
        ////////////////////////
        integer i;
        reg [3:0] count_expected_3;
        begin
            $display("===================");
            $display("  lab6_3 Test  ");
            $display("===================");
            
            reset_n_3 = 1'b1;
            clk_3= 1'b1;
            
            reset_n_3 = 1; #5
            reset_n_3 = 0; #10
            reset_n_3 = 1;

            count_expected_3 = 4'h0;

            i = 0;
            while(i < 10) begin
                if(count_expected_3 == 9) begin
                    #10 count_expected_3 = 13;
                end
                else if(count_expected_3 == 13) begin
                    #10 count_expected_3 = 6;
                end
                else begin
                    #10 count_expected_3 = count_expected_3 + 3;
                end

                if(count_3 == count_expected_3) begin
                    Passed = Passed + 1;
                end
                else begin
                    Failed = Failed + 1;
                end

                i = i + 1;
            end

            #10 $finish;
        end
        ////////////////////////
    endtask

endmodule