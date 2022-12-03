`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2022 01:33:40 PM
// Design Name: 
// Module Name: debouncer_16bit
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


module debouncer_16bit(
    input global_clock,
    input reset,
    input button_in,
    output reg button_out
    );
    reg count_start, output_exist;
//    reg [7:0] deb_count = 8'b00000000;
    integer deb_count = 0;
   always @ (posedge global_clock or negedge reset) begin
     if(!reset) begin
         button_out <= 0;
         count_start <= 0;
         deb_count <= 0;
         output_exist <= 0;
     end else begin
        case(button_in)
        0: {button_out, deb_count, count_start, output_exist} = 0;
        1: if(output_exist == 0) begin 
               if(count_start == 0) begin
                   count_start <= 1;
                   deb_count <= deb_count +1;
                   if(deb_count == 1000000) begin
                       button_out <= 1;
                       count_start <= 0;
                       deb_count <= 0;
                       output_exist <= 1; 
                   end 
               end else begin
                   deb_count <= deb_count + 1;
                   if(deb_count == 1000000) begin
                       button_out <= 1;
                       count_start <= 0;
                       deb_count <= 0;
                       output_exist <= 1; 
                   end
               end               
           end else //caseif
               button_out <= 0;
       endcase  //case
      end //else
   end //always
endmodule
