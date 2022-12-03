`timescale 1ns / 1ps
module display_control_tb();
  reg clk, resetn;
  reg [15:0] display_select;
  wire [3:0] digit_value, digit_select;
  display_control A1(.inc(clk), .reset(resetn), .count(display_select), .digit_select(digit_select), .cout(digit_value));
  initial begin 
    resetn = 1;
    #10 resetn = 0;
    #10 resetn = 1;
  end
  initial begin 
    clk = 0;
    forever #1 clk = ~clk;
  end
  initial begin
    display_select = 0;
    forever #4 display_select = display_select + 1;
  end
endmodule
