module counter(out, clk, reset);
    output [3:0]out;
    input clk, reset;

    wire new_clk;
    clockDivisor cd(new_clk, clk, reset);
    T_FF t0(out[0], 1'b1, new_clk, reset);
    T_FF t1(out[1], 1'b1, out[0], reset);
    T_FF t2(out[2], 1'b1, out[1], reset);
    T_FF t3(out[3], 1'b1, out[2], reset);
endmodule

module clockDivisor(clk_out, clk_in, reset);
    output clk_out;
    input clk_in, reset;
    wire [18:0]counters;

    T_FF t0(counters[0], 1'b1, clk_in, reset);
    T_FF t1(counters[1], 1'b1, counters[0], reset);
    T_FF t2(counters[2], 1'b1, counters[1], reset);
    T_FF t3(counters[3], 1'b1, counters[2], reset);
    T_FF t4(counters[4], 1'b1, counters[3], reset);
    T_FF t5(counters[5], 1'b1, counters[4], reset);
    T_FF t6(counters[6], 1'b1, counters[5], reset);
    T_FF t7(counters[7], 1'b1, counters[6], reset);
    T_FF t8(counters[8], 1'b1, counters[7], reset);
    T_FF t9(counters[9], 1'b1, counters[8], reset);
    T_FF t10(counters[10], 1'b1, counters[9], reset);
    T_FF t11(counters[11], 1'b1, counters[10], reset);
    T_FF t12(counters[12], 1'b1, counters[11], reset);
    T_FF t13(counters[13], 1'b1, counters[12], reset);
    T_FF t14(counters[14], 1'b1, counters[13], reset);
    T_FF t15(counters[15], 1'b1, counters[14], reset);
    T_FF t16(counters[16], 1'b1, counters[15], reset);
    T_FF t17(counters[17], 1'b1, counters[16], reset);
    T_FF t18(counters[18], 1'b1, counters[17], reset);
    T_FF t19(clk_out, 1'b1, counters[18], reset);
endmodule

module T_FF(q, t, clk, reset);
    output q;
    input t, clk, reset;
    wire d;

    xor (d, q, t);
    D_FF dff(q, d, clk, reset);
endmodule

module D_FF(q, d, clk, reset);
    output q;
    input d, clk, reset;
    reg q;
    always @(posedge reset or negedge clk)
        if (reset == 1'b1)
            q <= 1'b0;
        else
            q <= d;    
endmodule