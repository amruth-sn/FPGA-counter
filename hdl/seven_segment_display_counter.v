`timescale 1ns / 1ps

// EC-311 Lab-2 Part-2

module seven_segment_display_counter (
  
  input wire                    clk_i,                          // input clock
  input wire                    reset_btn_i,                    // input pushbutton for active HIGH reset (Note, not active LOW)
  input wire                    increment_counter_btn_i,        // input push button for counter increment
  input wire                    mode_select_switch_i,           // mode select switch

  output wire [3:0]             digital_select_o,               // 4 bit digital select output for 7 segment displays
  output wire [6:0]             seven_bit_display_o             // 7 bit encoded digital display value

);

// Your lab2 part-2 code comes here


endmodule
