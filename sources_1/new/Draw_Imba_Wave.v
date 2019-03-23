`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 13:10:00
// Design Name: 
// Module Name: Draw_Imba_Wave
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


module Draw_Imba_Wave(
    input clk_24,
    input CLK_VGA,
    input clk_sample, //20kHz clock
    input [1:0] Waveform_State,

    input [9:0] wave_sample,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    
    output reg [11:0] VGA_Imba_Waveform //different output
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
    Rainbow_Generate rainbow(clk_24, color_pixel);
        
    wire [11:0] Normal_Wave;
    assign Normal_Wave = ((VGA_HORZ_COORD < 1280) && 
                         ( ((1024 - Sample_Memory[VGA_HORZ_COORD] >= 512) && (VGA_VERT_COORD >= 512) && (VGA_VERT_COORD <= 1024 - Sample_Memory[VGA_HORZ_COORD])) || 
                           ((1024 - Sample_Memory[VGA_HORZ_COORD] < 512) && (VGA_VERT_COORD < 512) && (VGA_VERT_COORD >= 1024 - Sample_Memory[VGA_HORZ_COORD])) )) ? color_pixel : 12'h000;
    
    wire [11:0] Circle_Wave;
    wire [11:0] Bar_Wave;

    Draw_Circle drawCirc(clk_24, wave_sample, VGA_HORZ_COORD, VGA_VERT_COORD, Circle_Wave);
    Draw_Bar drawBar(clk_sample, CLK_VGA, wave_sample, VGA_HORZ_COORD, VGA_VERT_COORD, Bar_Wave);

    always @(posedge CLK_VGA)
    begin
    if (Waveform_State == 2'b00)
    VGA_Imba_Waveform = 3'h000;
    else if (Waveform_State == 2'b01)
    VGA_Imba_Waveform = Normal_Wave;
    else if (Waveform_State == 2'b10)
    VGA_Imba_Waveform = Circle_Wave;
    else 
    VGA_Imba_Waveform = Bar_Wave;
    end
    
endmodule