`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 15:37:44
// Design Name: 
// Module Name: Draw_Bar
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


module Draw_Bar(
    input clk_sample,
    input CLK_VGA,

    input [9:0] wave_sample,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    
    output [11:0] Bar_Wave
    );
    
    reg [4:0] Sample_Memory[79:0];
    reg [6:0] i = 0;
    reg [6:0] j = 0;
    reg [4:0] vol[79:0];
    
    wire Condition_For_Bar = ~((VGA_HORZ_COORD % 16 == 0) | (VGA_VERT_COORD % 16 == 0)) & ( (VGA_VERT_COORD <= 512) & (VGA_HORZ_COORD <= 1280) & ( ((512 - VGA_VERT_COORD) >> 4) <= vol[VGA_HORZ_COORD[11:4]]) );

    Color_Hashing hashColor(Condition_For_Bar, VGA_VERT_COORD[8:4], Bar_Wave);
    
    always @ (posedge clk_sample) 
    begin        
        i = (i == 79) ? 0 : i + 1;
        if (wave_sample[9])
            Sample_Memory[i] <= wave_sample[8:4];
        else
            Sample_Memory[i] = 0;             
    end
    
    always @ (posedge clk_sample) 
    begin
        j = (j == 79) ? 0 : (j + 1);
        if (vol[j] < Sample_Memory[j]) begin
            vol[j] <= vol[j] + 1;
        end
        else if (vol[j] > Sample_Memory[j]) begin
            vol[j] <= vol[j] - 1;
        end 
    end
    
    
endmodule
