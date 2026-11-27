// Code your design here
module mealy(clk,in,rst,out);
  input in ; 
  input clk,rst;
  output reg out;
  reg[1:0] state,nxt;
  
  parameter s0=2'b00;
  parameter s1=2'b01;
  parameter s2=2'b10;
  parameter s3=2'b11;
  
  
  always@(posedge clk or negedge rst) begin
    if(!rst)
      state <= s0;
    else
      state <= nxt;
  end 
  
  
  always@(state,in)begin
    case(state)
      s0 : begin
        nxt = in ? s1 : s0;
      end
      s1 : begin
        nxt = in ? s2 : s0;
      end
      s2 : begin 
        nxt = in ? s3 : s0;
      end 
      s3 : begin 
        nxt = in ? s3 : s0;
      end
       default: nxt = s0;
    endcase
  end
  
  always@(state,in)begin
    if((state == 3) && (in == 0))
      out <= 1;
    else 
      out <= 0;
  end 
endmodule 
    

  
  
