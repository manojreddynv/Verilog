`timescale 1ns / 1ps

module top_module(
    input clk,rst,start,
    input [7:0] data_in,
    output done,
    output [7:0] gcd
    );
    wire lda,ldb,sel_in;
    wire lt,gt,eq;
    wire [7:0] aout,bout;
    
    gcd_datapath DP(
    .clk(clk), .rst(rst), .lda(lda), .ldb(ldb),
        .selb(), .sel_in(sel_in),
        .data_in(data_in), .lt(lt), .gt(gt), .eq(eq),
        .aout(Aout), .bout(Bout)
        );
     
     controller CU(
      .clk(clk), .rst(rst), .start(start),
        .lt(lt), .gt(gt), .eq(eq),
        .lda(lda), .ldb(ldb), .sel_in(sel_in),
        .done(done)
        );
        
     assign gcd = aout;
     
endmodule
