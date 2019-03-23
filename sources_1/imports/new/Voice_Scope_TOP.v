`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// National University of Singapore
// Department of Electrical and Computer Engineering
// EE2026 Digital Design
// AY1819 Semester 1
// Project: Voice Scope
//////////////////////////////////////////////////////////////////////////////////

module Voice_Scope_TOP(
    input CLK,
    input sw,
    input Menu_Sw,
    input Cursor_Sw,
    input Trigger_Sw,
    input Scrolling_Sw,
    input temp_sw,
    
    input btnL,
    input btnR,
    input btnC,
    input btnU,
    input btnD,
    
    input  J_MIC3_Pin3,   // PmodMIC3 audio input data (serial)
    output J_MIC3_Pin1,   // PmodMIC3 chip select, 20kHz sampling clock
    output J_MIC3_Pin4,   // PmodMIC3 serial clock (generated by module VoiceCapturer.v)
   
    output [3:0] VGA_RED,    // RGB outputs to VGA connector (4 bits per channel gives 4096 possible colors)
    output [3:0] VGA_GREEN,
    output [3:0] VGA_BLUE,
    
    output VGA_VS,          // horizontal & vertical sync outputs to VGA connector
    output VGA_HS,
    
    output [11:0] led
    );
    
    wire CLK_VGA;
    wire clk_20k;
    wire clk_but;
    wire clk_24;
    wire clk_6;
    wire [11:0] MIC_in; 
    wire LPulse;
    wire RPulse;
    wire UPulse;
    wire DPulse;
    wire CPulse;
    wire Is_Pause;
    wire [9:0] ramp_sample;        
    wire [11:0] VGA_HORZ_COORD;
    wire [11:0] VGA_VERT_COORD; 
    wire [3:0] VGA_Red_waveform;
    wire [3:0] VGA_Green_waveform;
    wire [3:0] VGA_Blue_waveform;
    wire [9:0] wave_sample;
    wire draw_clk;
    wire [3:0] VGA_Red_grid;
    wire [3:0] VGA_Green_grid;
    wire [3:0] VGA_Blue_grid;
    wire [2:0] Color_Scheme;
    wire Axis_On;
    wire Grid_On;
    wire Tick_On;
    wire Imba_Mode_On;
    wire [3:0] VGA_Red_Chan;
    wire [3:0] VGA_Green_Chan;
    wire [3:0] VGA_Blue_Chan;
    wire [23:0] Clock_Time;
    wire Condition_For_Menu_Box;
    wire Condition_For_Menu_Border;
    wire Condition_For_Menu_Text;
    wire Condition_For_Text1;
    wire Condition_For_Text2;
    wire Condition_For_Cursor;
    wire Condition_For_Cursor_Menu; 
    wire Condition_For_Cursor_Border;
    wire Condition_For_Cursor_Text1;
    wire Condition_For_Cursor_Text2;  
    wire Condition_For_Imba_Cursor_Text;
    wire Condition_For_Scroll_Text1;
    wire Condition_For_Scroll_Text2; 
    wire Condition_For_Welcome;
    wire Condition_For_Imba_Border;
    wire Condition_For_Imba_Menu;
    wire Condition_For_Imba_Menu_Text;
    wire Wave_Type;
    wire Menu_Clap;
    wire Axis_Imba_On;
    wire Grid_Imba_On;
    wire Tick_Imba_On;
    wire [1:0] Menu_State;
    wire [1:0] Waveform_State;
    wire FFT_State;
    wire Amplitude_State;
    wire [11:0] VGA_Imba_Grid;
    wire [11:0] VGA_Imba_Waveform;
    
    assign Menu_Clap = Trigger_Sw; //temporary
    assign wave_sample = sw ? MIC_in[11:2] : ramp_sample;
    assign draw_clk = (Is_Pause & ~Cursor_Sw)? 0 : clk_20k;
           
    Clock_6hz s2clk(CLK, clk_6);
    slowclk s1clk(CLK, clk_20k);   
    buttonClk butclk(CLK, clk_but);
    Scroll_Clock scrclk(CLK, clk_24);
    CLK_108M VGA_CLK_108M( 
        CLK,   // 100 MHz
        CLK_VGA     // 108 MHz
    ) ; 
    Real_Clock realclk(CLK, Clock_Time);
           
    //singlePulse pulseL(btnL, clk_but, LPulse);
    //singlePulse pulseR(btnR, clk_but, RPulse);
    singlePulse pulseU(btnU, clk_but, UPulse);
    singlePulse pulseD(btnD, clk_but, DPulse);
    singlePulse pulseC(btnC, clk_but, CPulse);
        
    PauseTheDraw toggler(CPulse, clk_but, Is_Pause);
    
    TestWave_Gen test(clk_20k, ramp_sample);

    Voice_Capturer v1(CLK, clk_20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, MIC_in);
           
    Color_Select colSel(clk_but, UPulse, DPulse, Cursor_Sw, Color_Scheme[2:0]);

    Draw_Welcome_Imba welcome(Imba_Mode_On, Clock_Time[0], CLK_VGA, VGA_HORZ_COORD, VGA_VERT_COORD, Condition_For_Welcome);
    Draw_Imba_Menu Imba_menu(CLK_VGA, Menu_Clap, VGA_HORZ_COORD, VGA_VERT_COORD, Menu_State, Condition_For_Imba_Border, Condition_For_Imba_Menu, Condition_For_Imba_Menu_Text);
    Draw_Imba_Background Imba_back(VGA_HORZ_COORD, VGA_VERT_COORD, CLK_VGA, clk_24,
        Axis_Imba_On, Grid_Imba_On, Tick_Imba_On,
        Condition_For_Welcome, Condition_For_Imba_Menu, Condition_For_Imba_Border, Condition_For_Imba_Menu_Text,
        Condition_For_Cursor, Condition_For_Cursor_Menu, Condition_For_Cursor_Border, Condition_For_Imba_Cursor_Text,
        VGA_Imba_Grid[11:8], VGA_Imba_Grid[7:4], VGA_Imba_Grid[3:0]);
    Draw_Imba_Wave wave_draw(clk_24, CLK_VGA, draw_clk, Waveform_State, wave_sample,
        VGA_HORZ_COORD, VGA_VERT_COORD, VGA_Imba_Waveform);
    
    Scrolling_Display scroll(VGA_HORZ_COORD, VGA_VERT_COORD, Scrolling_Sw, clk_24,
        Condition_For_Scroll_Text1, Condition_For_Scroll_Text2);
    Draw_Menu normal_menu(VGA_HORZ_COORD, VGA_VERT_COORD, Menu_Sw, Clock_Time, 
        Axis_On, Grid_On, Tick_On, Wave_Type,
        Condition_For_Menu_Box, Condition_For_Menu_Border, Condition_For_Menu_Text);
    Draw_Cursor cursor(Cursor_Sw, Menu_Sw, Trigger_Sw, clk_but, CLK_VGA, Clock_Time[0],
        VGA_HORZ_COORD, VGA_VERT_COORD, 
        btnL, btnR, btnC, btnU, btnD, CPulse, Menu_Clap,
        Condition_For_Cursor, Condition_For_Cursor_Menu, Condition_For_Cursor_Border, Condition_For_Cursor_Text1, Condition_For_Cursor_Text2, Condition_For_Imba_Cursor_Text,
        Axis_On, Grid_On, Tick_On, Wave_Type, Imba_Mode_On,
        Axis_Imba_On, Grid_Imba_On, Tick_Imba_On, Menu_State, Waveform_State, FFT_State, Amplitude_State);
    Draw_Background draw_back(VGA_HORZ_COORD, VGA_VERT_COORD, CLK_VGA,
        Color_Scheme, Axis_On, Grid_On, Tick_On,
        Condition_For_Menu_Box, Condition_For_Menu_Border, Condition_For_Menu_Text,
        Condition_For_Cursor, Condition_For_Cursor_Menu, Condition_For_Cursor_Border, 
        Condition_For_Cursor_Text1, Condition_For_Cursor_Text2, Condition_For_Scroll_Text1, Condition_For_Scroll_Text2,
        VGA_Red_grid, VGA_Green_grid, VGA_Blue_grid);
    Draw_Waveform draw_wave(clk_6, draw_clk, Wave_Type, wave_sample,
        VGA_HORZ_COORD, VGA_VERT_COORD,
        VGA_Red_waveform, VGA_Green_waveform, VGA_Blue_waveform); 
    VGA_Channel_Combo chan(Color_Scheme[2], Imba_Mode_On,        
        VGA_Red_waveform, VGA_Green_waveform, VGA_Blue_waveform,
        VGA_Red_grid, VGA_Green_grid, VGA_Blue_grid,
        VGA_Imba_Grid, VGA_Imba_Waveform,
        VGA_Red_Chan, VGA_Green_Chan, VGA_Blue_Chan); 
    VGA_DISPLAY display(CLK, CLK_VGA, VGA_Red_Chan, VGA_Green_Chan, VGA_Blue_Chan, VGA_HORZ_COORD, VGA_VERT_COORD, VGA_RED, VGA_GREEN, VGA_BLUE, VGA_VS, VGA_HS);
                    
endmodule
