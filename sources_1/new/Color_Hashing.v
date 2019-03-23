`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 16:46:48
// Design Name: 
// Module Name: Color_Hashing
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


module Color_Hashing(
    input enable,
    input [4:0] coord,
    
    output [11:0] color
    );
    
    assign color = (~enable) ? 12'h000 :
                   (coord == 5'b11111) ? 12'h0F0 :
                   (coord == 5'b11110) ? 12'h1F0 :
                   (coord == 5'b11101) ? 12'h2F0 :
                   (coord == 5'b11100) ? 12'h3F0 : 
                   (coord == 5'b11011) ? 12'h4F0 : 
                   (coord == 5'b11010) ? 12'h5F0 : 
                   (coord == 5'b11001) ? 12'h6F0 : 
                   (coord == 5'b11000) ? 12'h7F0 :        
                   (coord == 5'b10111) ? 12'h8F0 : 
                   (coord == 5'b10110) ? 12'h9F0 : 
                   (coord == 5'b10101) ? 12'hAF0 : 
                   (coord == 5'b10100) ? 12'hBF0 :
                   (coord == 5'b10011) ? 12'hCF0 :
                   (coord == 5'b10010) ? 12'hDF0 :
                   (coord == 5'b10001) ? 12'hEF0 :
                   (coord == 5'b10000) ? 12'hFF0 :
                   (coord == 5'b01111) ? 12'hFF0 :
                   (coord == 5'b01110) ? 12'hFE0 :
                   (coord == 5'b01101) ? 12'hFD0 :
                   (coord == 5'b01100) ? 12'hFC0 :
                   (coord == 5'b01011) ? 12'hFB0 :
                   (coord == 5'b01010) ? 12'hFA0 :
                   (coord == 5'b01001) ? 12'hF90 :
                   (coord == 5'b01000) ? 12'hF80 : 
                   (coord == 5'b00111) ? 12'hF70 :
                   (coord == 5'b00110) ? 12'hF60 :
                   (coord == 5'b00101) ? 12'hF50 :
                   (coord == 5'b00100) ? 12'hF40 :
                   (coord == 5'b00011) ? 12'hF30 :
                   (coord == 5'b00010) ? 12'hF20 :
                   (coord == 5'b00001) ? 12'hF10 : 12'hF00;
    
endmodule
