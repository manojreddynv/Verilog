`timescale 1ns/1ps
module ripple_carry_counter_tb;
    reg clk;
    reg reset;
    wire [3:0] q;

    ripple_carry_counter uut (
        .q(q),
        .clk(clk),
        .reset(reset)
    );

  initial begin 
    $dumpfile("ripple_carry_counter_tb.vcd");
    $dumpvars(0,ripple_carry_counter_tb);
  end

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #12;
        reset = 0;
        #200;
        $finish;
    end

    initial begin
        $monitor("Time = %0t ns | Reset = %b | Q = %b",
                  $time, reset, q);
    end
endmodule
