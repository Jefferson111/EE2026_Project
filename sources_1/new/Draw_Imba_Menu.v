`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2019 14:43:27
// Design Name: 
// Module Name: Draw_Imba_Menu
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


module Draw_Imba_Menu(
    input CLK_VGA,
    input Menu_Clap,
    
    input [11:0] VGA_HORZ_COORD, 
    input [11:0] VGA_VERT_COORD,
    
    input [1:0] menu_state,
    
    output Condition_For_Imba_Border, 
    output Condition_For_Imba_Menu,
    output reg Condition_For_Imba_Menu_Text = 0
    );
    
    wire [3:0] main;
    wire [5:0] wave;
    wire [4:0] display;
    wire [3:0] analysis;
    wire m;
    wire w;
    wire d;
    wire a;
    
    assign m = main[3] | main[2] | main[1] | main[0];
    assign w = wave[5] | wave[4] | wave[3] | wave[2] | wave[1] | wave[0];
    assign d = display[4] | display[3] | display[2] | display [1] | display[0];
    assign a = analysis[3] | analysis[2] | analysis[1] | analysis[0];
    
    assign Condition_For_Imba_Menu = Menu_Clap & (VGA_VERT_COORD >= 832) & (VGA_HORZ_COORD <= 240);
    assign Condition_For_Imba_Border = Menu_Clap & ((VGA_VERT_COORD >= 832 && VGA_VERT_COORD <= 834 && VGA_HORZ_COORD <= 240) | 
                                                    (VGA_HORZ_COORD >= 238 && VGA_HORZ_COORD <= 240 && VGA_VERT_COORD >= 832) |
                                                    (VGA_HORZ_COORD <= 2 && VGA_VERT_COORD > 834) |
                                                    (VGA_VERT_COORD >= 1021 && VGA_HORZ_COORD < 238));
    
    always @ (CLK_VGA)
    begin
    if (Menu_Clap)
        begin
        case (menu_state)
            2'b00 : Condition_For_Imba_Menu_Text = m;
            2'b01 : Condition_For_Imba_Menu_Text = w;
            2'b10 : Condition_For_Imba_Menu_Text = d;
            2'b11 : Condition_For_Imba_Menu_Text = a;
        endcase
        end    
    else
    Condition_For_Imba_Menu_Text = 0;
    end
    
    Pixel_On_Text2 #(.displayText("-------------MENU------------")) word1(CLK_VGA, 12'd0, 12'd836, VGA_HORZ_COORD, VGA_VERT_COORD, main[0]);
    Pixel_On_Text2 #(.displayText("Select Waveform")) word2(CLK_VGA, 12'd40, 12'd864, VGA_HORZ_COORD, VGA_VERT_COORD, main[1]);
    Pixel_On_Text2 #(.displayText("Select Display Settings")) word3(CLK_VGA, 12'd40, 12'd880, VGA_HORZ_COORD, VGA_VERT_COORD, main[2]);
    Pixel_On_Text2 #(.displayText("Select Wave Analysis")) word4(CLK_VGA, 12'd40, 12'd896, VGA_HORZ_COORD, VGA_VERT_COORD, main[3]);
    
    Pixel_On_Text2 #(.displayText("-----------Waveform----------")) word5(CLK_VGA, 12'd0, 12'd836, VGA_HORZ_COORD, VGA_VERT_COORD, wave[0]);
    Pixel_On_Text2 #(.displayText("Select Default Wave")) word6(CLK_VGA, 12'd40, 12'd864, VGA_HORZ_COORD, VGA_VERT_COORD, wave[1]);
    Pixel_On_Text2 #(.displayText("Select Pulsar Wave")) word7(CLK_VGA, 12'd40, 12'd880, VGA_HORZ_COORD, VGA_VERT_COORD, wave[2]);
    Pixel_On_Text2 #(.displayText("Select Blocks Wave")) word8(CLK_VGA, 12'd40, 12'd896, VGA_HORZ_COORD, VGA_VERT_COORD, wave[3]);
    Pixel_On_Text2 #(.displayText("Select No Wave")) word9(CLK_VGA, 12'd40, 12'd912, VGA_HORZ_COORD, VGA_VERT_COORD, wave[4]);
    Pixel_On_Text2 #(.displayText("Back")) word15(CLK_VGA, 12'd40, 12'd928, VGA_HORZ_COORD, VGA_VERT_COORD, wave[5]);
    
    Pixel_On_Text2 #(.displayText("------------Display----------")) word10(CLK_VGA, 12'd0, 12'd836, VGA_HORZ_COORD, VGA_VERT_COORD, display[0]);
    Pixel_On_Text2 #(.displayText("Toggle Axis")) word11(CLK_VGA, 12'd40, 12'd864, VGA_HORZ_COORD, VGA_VERT_COORD, display[1]);
    Pixel_On_Text2 #(.displayText("Toggle Grid")) word12(CLK_VGA, 12'd40, 12'd880, VGA_HORZ_COORD, VGA_VERT_COORD, display[2]);
    Pixel_On_Text2 #(.displayText("Toggle Ticks")) word13(CLK_VGA, 12'd40, 12'd896, VGA_HORZ_COORD, VGA_VERT_COORD, display[3]);
    Pixel_On_Text2 #(.displayText("Back")) word14(CLK_VGA, 12'd40, 12'd912, VGA_HORZ_COORD, VGA_VERT_COORD, display[4]);
    
    Pixel_On_Text2 #(.displayText("------------Analysis---------")) word120(CLK_VGA, 12'd0, 12'd836, VGA_HORZ_COORD, VGA_VERT_COORD, analysis[0]);
    Pixel_On_Text2 #(.displayText("Toggle FFT")) word16(CLK_VGA, 12'd40, 12'd864, VGA_HORZ_COORD, VGA_VERT_COORD, analysis[1]);
    Pixel_On_Text2 #(.displayText("Toggle Amplitude")) word17(CLK_VGA, 12'd40, 12'd880, VGA_HORZ_COORD, VGA_VERT_COORD, analysis[2]);
    Pixel_On_Text2 #(.displayText("Back")) word18(CLK_VGA, 12'd40, 12'd896, VGA_HORZ_COORD, VGA_VERT_COORD, analysis[3]);
    
endmodule
