`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2019 12:04:09
// Design Name: 
// Module Name: Draw_Welcome_Imba
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


module Draw_Welcome_Imba(
    input trigger,
    
    input clk,
    input CLK_VGA,
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    
    output Condition_For_Welcome
    );
    
    reg [3:0] count = 4'b0;
    
    always @ (posedge clk)
    begin
    if (count >= 10)
    count <= 10;
    else if (trigger)
    count <= count + 1;
    end
    
    wire word;
    wire [6:0] welcome;
    
    Large_Font font0(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd100, 12'd128, 6'b10110 , welcome[0]);
    Large_Font font1(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd260, 12'd128, 6'b100, welcome[1]);
    Large_Font font2(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd420, 12'd128, 6'b1011, welcome[2]);
    Large_Font font3(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd580, 12'd128, 6'b10, welcome[3]);
    Large_Font font4(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd740, 12'd128, 6'b1110, welcome[4]);
    Large_Font font5(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd900, 12'd128, 6'b1100, welcome[5]);
    Large_Font font6(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1060, 12'd128, 6'b100, welcome[6]);
    
    Pixel_On_Text2 #(.displayText("TO IMBA MODE. CLAP TO ENABLE/DISABLE MENU.")) 
           font7(CLK_VGA, 12'd520, 12'd512, VGA_HORZ_COORD, VGA_VERT_COORD, word);
    
    assign Condition_For_Welcome = (count < 10) & trigger & (word | welcome[6] | welcome[5] | welcome[4] | welcome[3] | welcome[2] | welcome[1] | welcome[0]);
    
endmodule
