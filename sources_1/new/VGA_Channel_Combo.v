`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2019 23:11:59
// Design Name: 
// Module Name: VGA_Channel_Combo
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


module VGA_Channel_Combo(
    input Neg_Dis,
    input Imba_Mode_On,
        
    input [3:0] VGA_RED_WAVEFORM, 
    input [3:0] VGA_GREEN_WAVEFORM, 
    input [3:0] VGA_BLUE_WAVEFORM,
    
    input [3:0] VGA_RED_GRID,
    input [3:0] VGA_GREEN_GRID,
    input [3:0] VGA_BLUE_GRID,
    
    input [11:0] VGA_Imba_Grid,
    input [11:0] VGA_Imba_Waveform,
    
    output [3:0] VGA_RED_CHAN,
    output [3:0] VGA_GREEN_CHAN,
    output [3:0] VGA_BLUE_CHAN
    );
    
    // COMBINE ALL OUTPUTS ON EACH CHANNEL 
        
    assign VGA_RED_CHAN = Imba_Mode_On ? (VGA_Imba_Grid[11:8] | VGA_Imba_Waveform[11:8]) : Neg_Dis ? ~(VGA_RED_GRID | VGA_RED_WAVEFORM) : (VGA_RED_GRID | VGA_RED_WAVEFORM);
    assign VGA_GREEN_CHAN = Imba_Mode_On ? (VGA_Imba_Grid[7:4] | VGA_Imba_Waveform[7:4]) : Neg_Dis ? ~(VGA_GREEN_GRID | VGA_GREEN_WAVEFORM) : (VGA_GREEN_GRID | VGA_GREEN_WAVEFORM);
    assign VGA_BLUE_CHAN = Imba_Mode_On ? (VGA_Imba_Grid[3:0]  | VGA_Imba_Waveform[3:0]) : Neg_Dis ? ~(VGA_BLUE_GRID | VGA_BLUE_WAVEFORM) : (VGA_BLUE_GRID | VGA_BLUE_WAVEFORM);
    
endmodule
