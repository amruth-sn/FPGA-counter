`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 01:33:40 PM
// Design Name: 
// Module Name: counter_16bit
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


module counter_16bit(
    //input clk,
    input reset,
    input inc,
    output reg [15:0] count
    );
    always @ (posedge inc or negedge reset) begin
        if(!reset) begin
        count <= 0;
    end else begin
//        if(inc == 1)
            count <= count + 1;
    end
    end
endmodule

