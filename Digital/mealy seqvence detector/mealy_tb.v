// Code your testbench here
module mealy_tb;
  reg in;
  reg clk,rst;
  wire out;
  
  mealy dut(.in(in),.rst(rst),.clk(clk),.out(out));
  
  initial begin 
    clk = 0;
    forever #5 clk = ~clk;
  end 
  
  
  initial begin 
    rst = 0;
    in = 0;
    
    #10 rst = 1;
    
    #10 in = 1;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    
    #10 in = 1;
    #10 in = 0;
    #10 in = 0;
    
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 0;
    
    #10 in = 1;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    
    #300 $finish;
    
  end 
  
  initial begin 
    $monitor($time,"clk=%b , in=%b , out=%b",clk,in,out);
  end 
  
  initial begin
    $dumpfile ("dump.vcd");
    $dumpvars(0,mealy_tb);
  end
  
endmodule 
    
    
    
