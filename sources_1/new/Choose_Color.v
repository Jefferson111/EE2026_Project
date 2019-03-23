`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2019 10:52:06
// Design Name: 
// Module Name: Choose_Color
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


module Choose_Color(
    output [3:0] red,
    output [3:0] green,
    output [3:0] blue,
    
    input [2:0] color 
    );
    
    // 7 == RED
    // 6 == GREEN
    // 5 == YELLOW
    // 4 == TURQUOISE
    // 3 == BLACK
    // 2 == BLUE
    // 1 == WHITE
    // 0 == PURPLE
    
    assign red = (color == 7) ? 4'hD : (color == 6) ? 4'h0 : (color == 5) ? 4'hD : (color == 4) ? 4'h0 : (color == 3) ? 4'h0 : (color == 2) ? 4'h0 : (color == 1) ? 4'hF : 4'hD;
    assign green = (color == 7) ? 4'h0 : (color == 6) ? 4'hD : (color == 5) ? 4'hD :(color == 4) ? 4'hD : (color == 3) ? 4'h0 : (color == 2) ? 4'h0 : (color == 1) ? 4'hF : 4'h0;
    assign blue = (color == 7) ? 4'h0 : (color == 6) ? 4'h0 : (color == 5) ? 4'h0 : (color == 4) ? 4'hD : (color == 3) ? 4'h0 : (color == 2) ? 4'hD : (color == 1) ? 4'hF : 4'hD;
    
endmodule
