`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2019 14:56:14
// Design Name: 
// Module Name: Rainbow_Generate
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


module Rainbow_Generate(
    input clk,
    
    output [11:0] color
    );
    
    reg [3:0] red;
    reg [3:0] green;
    reg [3:0] blue;
    
    initial begin
    red = 15;
    green = 0;
    blue = 0;
    end
    
    always @(posedge clk)
    begin
    if (red == 15 && green < 15 && blue == 0)
        green <= green + 1;
    else if (red <= 15 && red > 0 && green == 15)
        red <= red - 1;
    else if (blue < 15 && green == 15 && red == 0)
        blue <= blue + 1;
    else if (green <= 15 && green > 0 && blue == 15)
        green <= green - 1;
    else if (red < 15 && blue == 15 && green == 0)
        red <= red + 1;
    else 
        blue <= blue - 1;
    end
    
    assign color[11:8] = red;
    assign color[7:4] = green;
    assign color[3:0] = blue;
    
endmodule
