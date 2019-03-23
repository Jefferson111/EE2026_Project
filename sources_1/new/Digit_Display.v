`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2019 12:12:39
// Design Name: 
// Module Name: Digit_Display
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


module Digit_Display(
    input [3:0] number,
    output [5:0] display
    );
    
    assign display[5:0] = (number != 0) ? 
                          (number != 1) ? 
                          (number != 2) ? 
                          (number != 3) ? 
                          (number != 4) ? 
                          (number != 5) ? 
                          (number != 6) ? 
                          (number != 7) ? 
                          (number != 8) ? 6'b100011 : 6'b100010: 6'b100001 : 6'b100000 : 6'b011111 : 6'b011110 : 6'b011101 : 6'b011100 : 6'b011011 : 6'b011010;
endmodule
