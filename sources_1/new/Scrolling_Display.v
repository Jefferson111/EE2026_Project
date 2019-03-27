`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.03.2019 10:57:47
// Design Name: 
// Module Name: Scrolling_Display
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


module Scrolling_Display(
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    
    //input imba_mode
    input [3:0] vol,
    input Scrolling_Sw,
    input clk,
 
    output Condition_For_Text1,
    output Condition_For_Text2
    );
    
    reg [11:0] base_horz;
    reg [11:0] base_horz2;
    
    initial begin
    base_horz = 640;
    base_horz2 = 3700;
    end
    
    always @ (posedge clk)
    begin
    base_horz <= (base_horz == 2999) ? 640 : base_horz - 1;
    base_horz2 <= (base_horz2 == 2999) ? 640 : base_horz2 - 1;
    end   
    
    wire [18:0] d;
    Alphabet_Map letter0(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz, 12'd6, 6'b0, d[0]);
    Alphabet_Map letter1(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 15, 12'd6, 6'b10100, d[1]);
    Alphabet_Map letter2(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 30, 12'd6, 6'b11, d[2]);
    Alphabet_Map letter3(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 45, 12'd6, 6'b1000, d[3]);
    Alphabet_Map letter4(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 60, 12'd6, 6'b1110, d[4]);
    
    Alphabet_Map letter5(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 90, 12'd6, 6'b10101, d[5]);
    Alphabet_Map letter6(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 105, 12'd6, 6'b1000, d[6]);
    Alphabet_Map letter7(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 120, 12'd6, 6'b10010, d[7]);
    Alphabet_Map letter8(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 135, 12'd6, 6'b10100, d[8]);
    Alphabet_Map letter9(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 150, 12'd6, 6'b0, d[9]);
    Alphabet_Map letter10(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 165, 12'd6, 6'b1011, d[10]);
    Alphabet_Map letter11(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 180, 12'd6, 6'b1000, d[11]);
    Alphabet_Map letter12(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 195, 12'd6, 6'b11001, d[12]);
    Alphabet_Map letter13(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 210, 12'd6, 6'b100, d[13]);
    Alphabet_Map letter14(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 225, 12'd6, 6'b10001, d[14]);
    
    Alphabet_Map letter15(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 255, 12'd6, 6'b11100, d[15]);
    Alphabet_Map letter16(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 270, 12'd6, 6'b11010, d[16]);
    Alphabet_Map letter17(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 285, 12'd6, 6'b11011, d[17]);
    Alphabet_Map letter18(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz + 300, 12'd6, 6'b100011, d[18]);
    
    assign Condition_For_Text1 = Scrolling_Sw & (d[0] | d[1] | d[2] | d[3] | d[4] | d[5] | d[6] | d[7] | d[8] | d[9] | d[10] | d[11] | d[12] | d[13] |
                              d[14] | d[15] | d[16] | d[17] | d[18]);
    
    wire [14:0] e;
    Alphabet_Map etter0(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2, 12'd64, 6'b0, e[0]);
    Alphabet_Map etter1(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 15, 12'd64, 6'b10100, e[1]);
    Alphabet_Map etter2(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 30, 12'd64, 6'b11, e[2]);
    Alphabet_Map etter3(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 45, 12'd64, 6'b1000, e[3]);
    Alphabet_Map etter4(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 60, 12'd64, 6'b1110, e[4]);
    
    Alphabet_Map etter5(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 90, 12'd64, 6'b10101, e[5]);
    Alphabet_Map etter6(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 105, 12'd64, 6'b1110, e[6]);
    Alphabet_Map etter7(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 120, 12'd64, 6'b1011, e[7]);
    Alphabet_Map etter8(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 135, 12'd64, 6'b10100, e[8]);
    Alphabet_Map etter9(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 150, 12'd64, 6'b1100, e[9]);
    Alphabet_Map etter10(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 165, 12'd64, 6'b100, e[10]);
    
    Alphabet_Map etter11(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 195, 12'd64, 6'b1000, e[11]);
    Alphabet_Map etter12(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 210, 12'd64, 6'b10010, e[12]);
    
    wire [11:0] number;
    Digit_Display d1(vol / 10, number[5:0]);
    Digit_Display d2(vol % 10, number[11:6]);
    
    Alphabet_Map etter13(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 240, 12'd64, number[5:0] , e[13]);
    Alphabet_Map etter14(VGA_HORZ_COORD, VGA_VERT_COORD, base_horz2 + 255, 12'd64, number[11:6], e[14]);
    
    assign Condition_For_Text2 = Scrolling_Sw & (e[0] | e[1] | e[2] | e[3] | e[4] | e[5] | e[6] | e[7] | e[8] | e[9] | e[10] | e[11] | e[12] | e[13] |
                                  e[14]);
endmodule
