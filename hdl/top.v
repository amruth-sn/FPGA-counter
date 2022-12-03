`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2022 10:38:31 PM
// Design Name: 
// Module Name: top
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


module top(
    input normalclock,
    input inc,
    input reset,
    input mode_select,
    output [3:0] digit_select,
    output [6:0] seven
    );
    wire div1k, div1, debnormal;
    reg r4;
    wire [3:0] c1, c2;
    wire [15:0] d1;
    clock_div_to_1Hz slowclock(.clk_i(normalclock), .reset(reset), .clk_o(div1));
    clock_div_to_1kHz fastclock(.clk_i(normalclock), .reset(reset), .clk_o(div1k));
    debouncer_16bit deb(.global_clock(normalclock), .reset(reset), .button_in(inc), .button_out(debnormal));
    always @ (*) begin
        case(mode_select)
            0: r4 <= div1;
            1: r4 <= debnormal;
        endcase
    end//always
    counter_16bit cnt(/*.clk(normalclock), */.reset(reset), .inc(r4), .count(d1));
    display_control disp(/*.clk(normalclock), */.inc(div1k), .count(d1), .digit_select(digit_select), .cout(c1));
    seven_seg_dec sev(.in(c1), .out(seven));
endmodule
