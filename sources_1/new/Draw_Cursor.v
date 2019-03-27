`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2019 11:13:02
// Design Name: 
// Module Name: Draw_Cursor
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


module Draw_Cursor(
    input Cursor_Sw,
    input Menu_Sw,
    input Trigger_Sw,
    input clk,
    input CLK_VGA,
    input real_clk,
    
    input [11:0] VGA_HORZ_COORD, 
    input [11:0] VGA_VERT_COORD, 
    
    input btnL, 
    input btnR, 
    input btnC, 
    input btnU, 
    input btnD, 
    
    input CPulse,
    
    input Menu_Clap,
    
    output Condition_For_Cursor, //reuse 
    output Condition_For_Cursor_Menu, //reuse
    output Condition_For_Cursor_Border, //reuse
    output Condition_For_Cursor_Text1,
    output Condition_For_Cursor_Text2,
    output Condition_For_Imba_Cursor_Text,
    
    output reg Axis_On = 1,
    output reg Grid_On = 1,
    output reg Tick_On = 1,
    output reg Wave_Type = 1,
    
    output reg Imba_Mode_On = 0,
    output reg Axis_Imba_On = 0,
    output reg Grid_Imba_On = 0,
    output reg Tick_Imba_On = 0,
    output reg [1:0] Menu_State = 2'b00,
    output reg [1:0] Waveform_State = 2'b00,
    output reg FFT_State = 0,
    output reg Amplitude_State = 0,
    output reg [1:0] LIRO_state = 2'b00
    //waveform history

    
    );
    
    reg [11:0] cursor_horz;
    reg [11:0] cursor_vert;
    reg [11:0] track_x;
    reg [11:0] track_y;
    reg [5:0] speedo;
    reg [1:0] count;
    
    initial begin
    count = 0;
    speedo = 0;
    cursor_horz = 640;
    cursor_vert = 512;
    track_x = 0;
    track_y = 0;
    end
    
    always @(posedge real_clk)
    begin
    if ((btnL | btnR | btnD | btnU) & Cursor_Sw & (count < 3))
    count = count + 1;
    else if ((btnL | btnR | btnD | btnU) & Cursor_Sw)
    count = 3;
    else
    count = 0;
    if ((btnL | btnR | btnD | btnU) & Cursor_Sw & (count > 2))
    speedo = speedo + 1;
    else
    speedo = 0;
    end
    
    always @ (posedge clk)
    begin
    if (~Trigger_Sw)
        begin
        track_x = cursor_horz;
        track_y = cursor_vert;
        end
    if (btnL & ~btnR & ~btnC & ~btnD & ~btnU & Cursor_Sw)
        cursor_horz = cursor_horz - 1 - speedo;
    else if (~btnL & btnR & ~btnC & ~btnD & ~btnU & Cursor_Sw)
        cursor_horz = cursor_horz + 1 + speedo;
    else if (~btnL & ~btnR & ~btnC & btnD & ~btnU & Cursor_Sw)
        cursor_vert = cursor_vert + 1 + speedo;
    else if (~btnL & ~btnR & ~btnC & ~btnD & btnU & Cursor_Sw)
        cursor_vert = cursor_vert - 1 - speedo;
    else if (~btnL & ~btnR & CPulse & ~btnD & ~btnU & Cursor_Sw & Menu_Sw & ~Imba_Mode_On)
        begin
        if ( ((cursor_horz < 1150) & (cursor_horz > 1110)) & ((cursor_vert < 711) & (cursor_vert > 691)) )
        Axis_On = ~Axis_On;
        else if (((cursor_horz < 1150) & (cursor_horz > 1110)) & ((cursor_vert < 736) & (cursor_vert > 716)))
        Grid_On = ~Grid_On;
        else if (((cursor_horz < 1150) & (cursor_horz > 1110)) & ((cursor_vert < 761) & (cursor_vert > 741)))
        Tick_On = ~Tick_On;
        else if (((cursor_horz < 1150) & (cursor_horz > 1110)) & ((cursor_vert < 786) & (cursor_vert > 766)))
        Wave_Type = ~Wave_Type;
        else if (((cursor_horz < 1150) & (cursor_horz > 1110)) & ((cursor_vert < 811) & (cursor_vert > 791)))
        Imba_Mode_On = 1;
        end   
    else if (~btnL & ~btnR & CPulse & ~btnD & ~btnU & Cursor_Sw & Menu_Clap & Imba_Mode_On)
        begin
        if ((cursor_horz < 240) & (cursor_vert > 862) & (cursor_vert < 879))
            begin
            if (Menu_State == 2'b00)
            Menu_State = 2'b01;
            else if (Menu_State == 2'b01)
            Waveform_State = 2'b01;
            else if (Menu_State == 2'b10)
            Axis_Imba_On = ~Axis_Imba_On;
            end
        else if ((cursor_horz < 240) & (cursor_vert < 895) & (cursor_vert > 878))
        begin
            if (Menu_State == 2'b00)
            Menu_State = 2'b10;
            else if (Menu_State == 2'b01)
            Waveform_State = 2'b10;
            else if (Menu_State == 2'b10)
            Grid_Imba_On = ~Grid_Imba_On;
        end
        else if ((cursor_horz < 240) & (cursor_vert < 912) & (cursor_vert > 894))
        begin
            if (Menu_State == 2'b00)
            Menu_State = 2'b11;
            else if (Menu_State == 2'b01)
            Waveform_State = 2'b11;
            else if (Menu_State == 2'b10)
            Tick_Imba_On = ~Tick_Imba_On;
            else
            Menu_State = 2'b00;
        end
        else if ((cursor_horz < 240) & (cursor_vert < 927) & (cursor_vert > 911))
        begin
            if (Menu_State == 2'b01)
            Waveform_State = 2'b00;
            else if (Menu_State == 2'b10)
            Menu_State = 2'b00; 
        end
        else if ((cursor_horz < 240) & (cursor_vert < 943) & (cursor_vert > 926))
            if (Menu_State == 2'b01)
            Menu_State = 2'b00;
        else if ((cursor_horz > 738) & (cursor_horz < 865) & (cursor_vert > 895))
            LIRO_state = 2'b00;
        else if ((cursor_horz > 876) & (cursor_horz < 1003) & (cursor_vert > 895))
            LIRO_state = 2'b01;
        else if ((cursor_horz > 1014) & (cursor_horz < 1141) & (cursor_vert > 895))
            LIRO_state = 2'b10;
        else if ((cursor_horz > 1152) & (cursor_horz < 1280) & (cursor_vert > 895))
            LIRO_state = 2'b11;   
        end
        
    end
    
    assign Condition_For_Cursor = ( ((VGA_HORZ_COORD == cursor_horz) && ((VGA_VERT_COORD - cursor_vert < 10) | (VGA_VERT_COORD - cursor_vert > -10))) |
                                  ((VGA_VERT_COORD == cursor_vert) && ((VGA_HORZ_COORD - cursor_horz < 10) | (VGA_HORZ_COORD - cursor_horz > -10))) ) &
                                  Cursor_Sw;
    
    assign Condition_For_Cursor_Menu = (VGA_HORZ_COORD >= 1040) & (VGA_VERT_COORD <= 128) & Cursor_Sw;
    
    assign Condition_For_Cursor_Border = Cursor_Sw & ( ((VGA_HORZ_COORD >= 1040) & (VGA_VERT_COORD <= 128) & (VGA_VERT_COORD >= 126)) | 
                                                       ((VGA_VERT_COORD <= 128) & (VGA_HORZ_COORD >= 1040) & (VGA_HORZ_COORD <= 1042)) |
                                                       ((VGA_HORZ_COORD > 1042) & (VGA_VERT_COORD <= 2)) |
                                                       ((VGA_VERT_COORD < 126) & (VGA_HORZ_COORD >= 1277)));
        
    wire [11:0] a;
    wire [23:0] Imba_x;
    wire [23:0] Imba_y;
    wire [1:0] sign;
    wire [11:0] magnitude_x;
    wire [11:0] magnitude_y;
    
    Sign_Deduction deduce1(cursor_horz, 12'd640, magnitude_x, sign[0]);
    Sign_Deduction deduce2(cursor_vert, 12'd512, magnitude_y, sign[1]);
    
    Coordinate_Display coordinateIX(magnitude_x, Imba_x);
    Coordinate_Display coordinateIY(magnitude_y, Imba_y);
    Pixel_On_Text2 #(.displayText("X:")) letter1a(CLK_VGA, 12'd1135, 12'd72, VGA_HORZ_COORD, VGA_VERT_COORD, a[0]);
    Pixel_On_Text2 #(.displayText("--")) lette(CLK_VGA, 12'd1155, 12'd72, VGA_HORZ_COORD, VGA_VERT_COORD, a[10]);
    Alphabet_Map letter2a(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1170, 12'd64, Imba_x[23:18], a[1]);
    Alphabet_Map letter3a(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1185, 12'd64, Imba_x[17:12], a[2]);
    Alphabet_Map letter4a(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1200, 12'd64, Imba_x[11:6], a[3]);     
    Alphabet_Map letter5a(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1215, 12'd64, Imba_x[5:0], a[4]);
    
    
    Pixel_On_Text2 #(.displayText("Y:")) letter6a(CLK_VGA, 12'd1135, 12'd96, VGA_HORZ_COORD, VGA_VERT_COORD, a[5]);
    Pixel_On_Text2 #(.displayText("--")) lea(CLK_VGA, 12'd1155, 12'd96, VGA_HORZ_COORD, VGA_VERT_COORD, a[11]);
    Alphabet_Map letter7a(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1170, 12'd88, Imba_y[23:18], a[6]);
    Alphabet_Map letter8a(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1185, 12'd88, Imba_y[17:12], a[7]);
    Alphabet_Map letter9a(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1200, 12'd88, Imba_y[12:6], a[8]);
    Alphabet_Map letter10a(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1215, 12'd88, Imba_y[5:0], a[9]);
    
    assign Condition_For_Imba_Cursor_Text = Cursor_Sw & Imba_Mode_On & ((a[11] & ~sign[1]) | (a[10] & sign[0]) | a[9] | a[8] | a[7] | a[6] | a[5] | a[4] | a[3] | a[2] | a[1] | a[0]);
    
    wire [9:0] b;
    wire [23:0] x_coor;
    wire [23:0] y_coor;
    
    Coordinate_Display coordinateX(cursor_horz, x_coor);
    Coordinate_Display coordinateY(cursor_vert, y_coor);
    
    Alphabet_Map letter1(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1040, 12'd64, 6'b10111, b[0]);
    Alphabet_Map letter2(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1170, 12'd64, x_coor[23:18], b[1]);
    Alphabet_Map letter3(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1185, 12'd64, x_coor[17:12], b[2]);
    Alphabet_Map letter4(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1200, 12'd64, x_coor[11:6], b[3]);     
    Alphabet_Map letter5(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1215, 12'd64, x_coor[5:0], b[4]);
    
    Alphabet_Map letter6(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1040, 12'd88, 6'b11000, b[5]);
    Alphabet_Map letter7(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1170, 12'd88, y_coor[23:18], b[6]);
    Alphabet_Map letter8(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1185, 12'd88, y_coor[17:12], b[7]);
    Alphabet_Map letter9(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1200, 12'd88, y_coor[12:6], b[8]);
    Alphabet_Map letter10(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1215, 12'd88, y_coor[5:0], b[9]);
    
    assign Condition_For_Cursor_Text1 = Cursor_Sw & (b[0] | b[1] | b[2] | b[3] | b[4] | b[5] | b[6] | b[7] | b[8] | b[9]) & ~Imba_Mode_On;
    
    
    wire [11:0] c;
    wire [23:0] x_memory;
    wire [23:0] y_memory;
        
    Coordinate_Display memX(track_x, x_memory);
    Coordinate_Display memY(track_y, y_memory);
        
    Alphabet_Map letter1A(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1040, 12'd6, 6'b10111, c[0]);
    Alphabet_Map letter1B(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1055, 12'd6, 6'b011011, c[10]);
    Alphabet_Map letter2A(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1170, 12'd6, x_memory[23:18], c[1]);
    Alphabet_Map letter3A(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1185, 12'd6, x_memory[17:12], c[2]);
    Alphabet_Map letter4A(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1200, 12'd6, x_memory[11:6], c[3]);     
    Alphabet_Map letter5A(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1215, 12'd6, x_memory[5:0], c[4]);
        
    Alphabet_Map letter6A(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1040, 12'd30, 6'b11000, c[5]);
    Alphabet_Map letter6B(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1055, 12'd30, 6'b011011, c[11]);
    Alphabet_Map letter7A(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1170, 12'd30, y_memory[23:18], c[6]);
    Alphabet_Map letter8A(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1185, 12'd30, y_memory[17:12], c[7]);
    Alphabet_Map letter9A(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1200, 12'd30, y_memory[12:6], c[8]);
    Alphabet_Map letter10A(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1215, 12'd30, y_memory[5:0], c[9]);
        
    assign Condition_For_Cursor_Text2 = ~Imba_Mode_On & Trigger_Sw & (c[0] | c[1] | c[2] | c[3] | c[4] | c[5] | c[6] | c[7] | c[8] | c[9] | c[10] | c[11]);                          
                                  
endmodule
