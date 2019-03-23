`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2019 12:03:41
// Design Name: 
// Module Name: Coordinate_Display
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


module Coordinate_Display(
    input [11:0] coordinate,
    output [23:0] display
    );
    
    Digit_Display d1(coordinate % 10, display[5:0]);
    Digit_Display d2((coordinate / 10) % 10, display[11:6]);
    Digit_Display d3((coordinate / 100) % 10, display[17:12]);
    Digit_Display d4((coordinate / 1000) % 10, display[23:18]);
    
endmodule
