`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2019 21:20:56
// Design Name: 
// Module Name: Color_Select
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


module Color_Select(
    input clk, 
    input up,
    input down,
    input Cursor_Sw,
    
    output reg [2:0] color = 4
    );
    
    always @ (posedge clk)
    begin
    if (up & ~down & (color != 3'b111) & ~Cursor_Sw)
        color = color + 1;
    else if (down & ~up & (color != 3'b000) & ~Cursor_Sw)
        color = color - 1;
    end
    
endmodule
