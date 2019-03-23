`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------  
//                  DRAWING GRID LINES AND TICKS ON SCREEN
// Description:
// Grid lines are drawn at pixel # 320 along the x-axis, and
// pixel #768 along the y-axis

// Note the VGA controller is configured to produce a 1024 x 1280 pixel resolution
//-------------------------------------------------------------------------

//-------------------------------------------------------------------------
// TOOD:    Draw grid lines at every 80-th pixel along the horizontal axis, and every 64th pixel
//          along the vertical axis. This gives us a 16x16 grid on screen. 
//          
//          Further draw ticks on the central x and y grid lines spaced 16 and 8 pixels apart in the 
//          horizontal and vertical directions respectively. This gives us 5 sub-divisions per division 
//          in the horizontal and 8 sub-divisions per divsion in the vertical direction   
//-------------------------------------------------------------------------  
  
//////////////////////////////////////////////////////////////////////////////////


module Draw_Background(
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    input CLK_VGA,
    input [1:0] Color_Scheme,
    
    input Axis_On, //4
    input Grid_On, //6
    input Tick_On, //5
    
    input Condition_For_Menu_Box, //3
    input Condition_For_Menu_Border, //2
    input Condition_For_Menu_Text, //3
     
    input Condition_For_Cursor, //1
    input Condition_For_Cursor_Menu, //3
    input Condition_For_Cursor_Border, //2
    input Condition_For_Cursor_Text1, //3
    input Condition_For_Cursor_Text2, //3
    
    input Condition_For_Scroll_Text1, //2
    input Condition_For_Scroll_Text2, //2
    
    output [3:0] VGA_Red_Grid,
    output [3:0] VGA_Green_Grid,
    output [3:0] VGA_Blue_Grid
    );
    
/* For drawin text using IEEE library
   res is condition_for_text
Pixel_On_Text2 #(.displayText("->")) pointer_01
       (CLK_VGA, POINTER_X, pointer_y, VGA_HORZ_COORD, VGA_VERT_COORD, res);
*/

    wire Condition_For_Axis = ((VGA_HORZ_COORD == 640) || (VGA_VERT_COORD == 512)) & Axis_On;
    
    wire Condition_For_Grid = ((VGA_HORZ_COORD % 80 == 0) || (VGA_VERT_COORD % 64 == 0)) & Grid_On;

    wire Condition_For_Ticks = (((VGA_VERT_COORD > 502 &&  VGA_VERT_COORD < 522 && (VGA_HORZ_COORD % 20 == 0)) || 
            (VGA_HORZ_COORD > 634 && VGA_HORZ_COORD < 646 && (VGA_VERT_COORD % 16 == 0))) | ((VGA_VERT_COORD % 16 == 0) && (VGA_HORZ_COORD % 80 == 0)) || 
                ((VGA_VERT_COORD % 64 == 0) && (VGA_HORZ_COORD % 20 == 0))) & Tick_On  ;     
                
    reg [11:0] colorHack;
    always @(posedge CLK_VGA)
    begin
    if (Condition_For_Cursor)
        begin
        colorHack = 12'hFFF;
        end
    else if (Condition_For_Cursor_Border | Condition_For_Menu_Border)
        begin
        case (Color_Scheme)
            0: colorHack = 12'hC00; //red
            1: colorHack = 12'h00C; //blue
            2: colorHack = 12'h0C0; //green
            3: colorHack = 12'hCC0; //greenish brown
        endcase
        end
    else if (Condition_For_Menu_Text | Condition_For_Cursor_Text1 | Condition_For_Cursor_Text2)
        begin
        case (Color_Scheme)
            0: colorHack = 12'h9F6; //light green
            1: colorHack = 12'hCFC; //close to white
            2: colorHack = 12'hFC9; //Peach
            3: colorHack = 12'hF39; //pink
        endcase
        end
        
    else if (Condition_For_Menu_Box | Condition_For_Cursor_Menu)
        begin
        case (Color_Scheme)
            0: colorHack = 12'h600; //dark red
            1: colorHack = 12'h606; //dark purple
            2: colorHack = 12'h060; //dark green
            3: colorHack = 12'h633; //ugly color
        endcase
        end
    else if (Condition_For_Scroll_Text1)
        begin
        case (Color_Scheme)
            0: colorHack = 12'hC0C; //purple
            1: colorHack = 12'h99F; //light blue-purple
            2: colorHack = 12'h0CC; //greeny turquoise
            3: colorHack = 12'hF90; //Orange
        endcase
        end
    else if (Condition_For_Scroll_Text2)
        begin
        case (Color_Scheme)
            0: colorHack = 12'h33F; //blue
            1: colorHack = 12'h3FC; //light greeny turquoise
            2: colorHack = 12'h0CF; //darker sky blue
            3: colorHack = 12'hFF3; //Yellow
        endcase
        end
    else if (Condition_For_Axis)
        begin
        case (Color_Scheme)
            0: colorHack = 12'h0F0; //green
            1: colorHack = 12'hFF0; //greenish brown
            2: colorHack = 12'hF00; //red
            3: colorHack = 12'h00F; //blue
        endcase
        end
    else if (Condition_For_Ticks)
        begin
        case (Color_Scheme)
            0: colorHack = 12'hFFC; //close to white
            1: colorHack = 12'hFF9; //close to white
            2: colorHack = 12'hCFF; //close to white
            3: colorHack = 12'hF9F; //close to white
        endcase
        end
    else if (Condition_For_Grid)
        begin
        case (Color_Scheme)
            0: colorHack = 12'h00F; //blue
            1: colorHack = 12'hF00; //red
            2: colorHack = 12'hFF0; //greenish brown
            3: colorHack = 12'h0F0; //green
        endcase
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
