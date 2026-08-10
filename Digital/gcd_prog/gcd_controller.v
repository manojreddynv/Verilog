`timescale 1ns / 1ps

module controller(
    input clk,rst,start,lt,gt,eq,
    output reg lda,ldb,sel_in,done
    );
    reg [2:0]state,next;
    
    //states 
    parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5,s6=6;
    
    // state register 
    always@(posedge clk or posedge rst) begin 
    if(rst) 
    state <= s0;
    else
    state <= s1;
    end 
    
    // next state logic 
    always@(posedge clk) begin 
    next = state;
    case(state)
    s0 : if(start) next = s1;
    s1 : next = s2;
    s2 : next = s3;
    s3 : if(eq) next = s6;
         else if(gt) next = s4;
         else if(lt) next = s5;
    s4 : next = s3;
    s5 : next = s3;
    s6 : next = s6;
  endcase 
  end 
  
  //output logic 
  always@(state) begin 
  lda=0; ldb=0; sel_in=0; done=0;
  case(state)
  s1 : begin lda=1; sel_in=1; end 
  s2 : begin ldb=1; sel_in=1; end
  s4 : begin lda=1; sel_in=0; end 
  s5 : begin ldb=1; sel_in=0; end
  s6 : done=1;
  endcase 
  end   
endmodule
