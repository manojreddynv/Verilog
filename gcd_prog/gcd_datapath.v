`timescale 1ns / 1ps

module gcd_datapath(
    input clk,rst,lda,ldb,sela,selb,sel_in,
    input [7:0] data_in,
    output lt,gt,eq,
    output [7:0] aout,bout
    );
    reg [7:0] a,b;
    wire [7:0]suba,subb;
    
    //subtraction results 
    assign suba = a-b;
    assign subb = b-a;
    
    //comparators 
    assign lt = (a<b);
    assign gt = (a>b);
    assign eq = (a==b);
    
    //registers with load enable 
    always@(posedge clk or posedge rst) begin
    if(rst)begin 
    a <= 0;
    b <= 0;
    end 
    else begin 
    if(lda) 
     a <= sel_in ? data_in : suba;
    if(ldb)
     b <= sel_in ? data_in : subb;
     end 
     end 
     assign aout = a;
     assign bout = b;
     
endmodule
