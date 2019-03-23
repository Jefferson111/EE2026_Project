`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2019 10:03:43
// Design Name: 
// Module Name: Draw_Imba_Background
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


module Draw_Imba_Background(
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    input CLK_VGA,
    input clk_24,
    
    input Axis_On, //4
    input Grid_On, //6
    input Tick_On, //5
    
    input Condition_For_Welcome,
    input Condition_For_Imba_Menu, //3
    input Condition_For_Imba_Border, //2
    input Condition_For_Imba_Menu_Text, //3
     
    input Condition_For_Cursor, //1
    input Condition_For_Cursor_Menu, //3
    input Condition_For_Cursor_Border, //2
    input Condition_For_Cursor_Text, //3 Not original cursor text

    output [3:0] VGA_Red_Grid, //not orginal rgb grid
    output [3:0] VGA_Green_Grid,
    output [3:0] VGA_Blue_Grid
    );

    wire Condition_For_Axis = ((VGA_HORZ_COORD == 640) || (VGA_VERT_COORD == 512)) & Axis_On;
    
    wire Condition_For_Grid = ((VGA_HORZ_COORD % 80 == 0) || (VGA_VERT_COORD % 64 == 0)) & Grid_On;

    wire Condition_For_Ticks = (((VGA_VERT_COORD > 502 &&  VGA_VERT_COORD < 522 && (VGA_HORZ_COORD % 20 == 0)) || 
            (VGA_HORZ_COORD > 634 && VGA_HORZ_COORD < 646 && (VGA_VERT_COORD % 16 == 0))) | ((VGA_VERT_COORD % 16 == 0) && (VGA_HORZ_COORD % 80 == 0)) || 
                ((VGA_VERT_COORD % 64 == 0) && (VGA_HORZ_COORD % 20 == 0))) & Tick_On  ;     
                
    reg [11:0] colorHack;
    wire [11:0] rainbow;
    Rainbow_Generate rain(clk_24, rainbow);
    
    always @(posedge CLK_VGA)
    begin
    if (Condition_For_Welcome)
        begin
        colorHack = rainbow;
        end
    else if (Condition_For_Cursor)
        begin
        colorHack = 12'hFFF;
        end
    else if (Condition_For_Cursor_Border | Condition_For_Imba_Border)
        begin
        colorHack = rainbow;
        end
    else if (Condition_For_Imba_Menu_Text | Condition_For_Cursor_Text)
        begin
        colorHack = 12'hDDD;
        end
    else if (Condition_For_Imba_Menu | Condition_For_Cursor_Menu)
        begin
        colorHack = 12'h222;
        end
    else if (Condition_For_Axis)
        begin
        colorHack = 12'hF00;
        end
    else if (Condition_For_Ticks)
        begin
        colorHack = 12'h09F;
        end
    else if (Condition_For_Grid)
        begin
        colorHack = 12'h0F0;
        end
    else
        begin
        colorHack = 12'h000;
        end
    end
   
// Using the gridline example, insert your code below to draw ticks on the x-axis and y-axis.
    assign VGA_Red_Grid = colorHack[11:8];
    assign VGA_Green_Grid = colorHack[7:4];
    assign VGA_Blue_Grid = colorHack[3:0];
     
endmodule
