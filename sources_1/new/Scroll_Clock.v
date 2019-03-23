`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2019 11:19:55
// Design Name: 
// Module Name: Scroll_Clock
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


module Scroll_Clock(
    input clock,
    output reg slowclk = 0
    );
    
    reg [20:0] count;
    always @ (posedge clock) 
       begin
       count <= count + 1;
       slowclk <= (count == 21'b0) ? ~slowclk : slowclk;
       end
endmodule
