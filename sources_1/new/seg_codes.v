`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 10:16:29
// Design Name: 
// Module Name: seg_codes
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


module seg_codes(
input [4:0]digit,
output reg [7:0]seg
    );

always @(digit)
begin
        
     case(digit)   
        5'b00000: seg = 8'b11000000; // "0"     
        5'b00001: seg = 8'b11111001; // "1" 
        5'b00010: seg = 8'b10100100; // "2" 
        5'b00011: seg = 8'b10110000; // "3" 
        5'b00100: seg = 8'b10011001; // "4" 
        5'b00101: seg = 8'b10010010; // "5" 
        5'b00110: seg = 8'b10000010; // "6" 
        5'b00111: seg = 8'b11111000; // "7" 
        5'b01000: seg = 8'b10000000; // "8"     
        5'b01001: seg = 8'b10010000; // "9" 
        5'b01010: seg = 8'b11000111; // L
        5'b01011: seg = 8'b10101111; // r
        5'b01100: seg = 8'b11001111; //I
        5'b01101: seg = 8'b10101011; //n
        5'b01110: seg = 8'b10000111; //t
        default : seg = 8'b11111111; //blank
    endcase
end    
endmodule
