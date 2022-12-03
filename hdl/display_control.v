`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2022 09:44:56 PM
// Design Name: 
// Module Name: display_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display_control(
    input /*clk, */  inc,
    input [15:0] count,
    output [3:0] digit_select,
    output [3:0] cout
    );
    wire [1:0] r1;
    counter_2bit c1(/*.clk(clk), */.inc(inc), .count(r1));
    mux_4to1 m1(.a(4'b0111), .b(4'b1011), .c(4'b1101), .d(4'b1110), .sel(r1), .out(digit_select));
    mux_4to1 m2(.a(count[15:12]), .b(count[11:8]), .c(count[7:4]), .d(count[3:0]), .sel(r1), .out(cout));
endmodule
