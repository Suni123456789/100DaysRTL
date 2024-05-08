`timescale 1ns / 1ps

module test_bench_hs;
  reg a, b;
  wire diff, bout;
  reg clk;

  half_subtractor dut(a, b, diff, bout);
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    a = 0; b = 0;
    #10;
    a = 0; b = 1;
    #10;
    a = 1; b = 0;
    #10;
    a = 1; b = 1;
    #10
    $finish;
  end

  always @(posedge clk) begin
    $display("a: %b, b: %b, difference: %b, borrow: %b", a, b, diff, bout);
  end
endmodule
