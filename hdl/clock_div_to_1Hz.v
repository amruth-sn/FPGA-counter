`timescale 1ns / 1ps
module clock_div_to_1Hz(
    input clk_i, reset,
    output reg clk_o
    );
    reg[29:0] counter = 30'd0;
    integer DIVISOR = 100000000; //need 28 bits for 100000000
    always @(posedge clk_i or negedge reset) begin
        if(!reset) begin
            clk_o <= 0;
            counter <= 0;
        end else begin
        counter <= counter + 1;
           if(counter >= (DIVISOR-1))
            counter <= 0;
           clk_o <= (counter<DIVISOR/2)?1'b1:1'b0;
           end
     end
endmodule
