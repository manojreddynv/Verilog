module ripple_carry_counter(q,clk,reset);
  input clk,reset;
  output [3:0] q;
  
  T_FF tff0(q[0], clk, reset);
  T_FF tff1(q[1], q[0], reset);
  T_FF tff2(q[2], q[1], reset);
  T_FF tff3(q[3], q[2], reset);
  
endmodule 


module T_FF(q,clk,reset);
  input clk,reset;
  output q;
  
  wire d;
  D_FF dff0(.q(q),.d(d),.clk(clk),.reset(reset));
  not n1(d,q);
endmodule 


module D_FF(q,d,clk,reset);
  input d,clk,reset;
  output reg q;
  
  always@(posedge reset or negedge clk) begin
    if(reset)
      q <= 0;
    else
      q<= d;
  end 
endmodule

  
  
