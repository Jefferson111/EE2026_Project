`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2019 14:37:28
// Design Name: 
// Module Name: Draw_Circle
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


module Draw_Circle(
    input clk,
    input [9:0] wave_sample, //1024
    input [11:0] VGA_HORZ_COORD, 
    input [11:0] VGA_VERT_COORD, 
    
    output [11:0] Circle_Wave
    );
    
    wire [11:0] x = (VGA_HORZ_COORD > 640) ? VGA_HORZ_COORD - 640: 640 - VGA_HORZ_COORD;
    wire [11:0] y = (VGA_VERT_COORD > 512) ? VGA_VERT_COORD - 512: 512 - VGA_VERT_COORD; 
    wire [9:0] wave_offset = wave_sample - 2040; //alter the values here when with mic
    wire [15:0] radius = (wave_offset > 1023) ? 8'd255 : wave_offset[9:2]; // can just direct assign I think
    wire Condition_For_Circle = ( (x * x + y * y) < radius * radius);
    
    wire [11:0] color_pixel;
    Rainbow_Generate rainbow(clk, color_pixel);
    
    assign Circle_Wave = (Condition_For_Circle) ? color_pixel : 12'h000;
    
endmodule
