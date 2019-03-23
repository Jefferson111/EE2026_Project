`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// You may study and modify the code inside this module to imporve the display feature or introduce other features
//////////////////////////////////////////////////////////////////////////////////

module Draw_Waveform(
    input clk_6,
    input clk_sample, //20kHz clock
    input Wave_Type,

    input [9:0] wave_sample,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    
    output [3:0] VGA_Red_waveform,
    output [3:0] VGA_Green_waveform,
    output [3:0] VGA_Blue_waveform
    );
    
    //The Sample_Memory represents the memory array used to store the voice samples.
    //There are 1280 points and each point can range from 0 to 1023. 
    reg [9:0] Sample_Memory[1279:0];
    reg [10:0] i = 0;
    
    //Each wave_sample is displayed on the screen from left to right. 
    always @ (posedge clk_sample) begin
        i = (i==1279) ? 0 : i + 1;
        Sample_Memory[i] <= wave_sample;              
    end
    wire [11:0] color_pixel;
    Duo_Color duo(clk_6, color_pixel[11:4]);
    assign color_pixel[3:0] = 4'h0;
        
    wire [11:0] Normal_Wave;
    assign Normal_Wave = ((VGA_HORZ_COORD < 1280) && (VGA_VERT_COORD == (1024 - Sample_Memory[VGA_HORZ_COORD]))) ? color_pixel : 12'h000;

    assign VGA_Red_waveform = Wave_Type ? Normal_Wave[11:8]: 4'h0;
    assign VGA_Green_waveform = Wave_Type ? Normal_Wave[7:4]: 4'h0;
    assign VGA_Blue_waveform = Wave_Type ? Normal_Wave[3:0] : 4'h0;
    
endmodule
