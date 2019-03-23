`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2019 14:20:27
// Design Name: 
// Module Name: Large_Font
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


module Large_Font(
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    
    input [11:0] VGA_HORZ_BASE,
    input [11:0] VGA_VERT_BASE,
    
    input [5:0] char,
    output Is_Draw 
    );
    
    wire [10:0] col = (VGA_HORZ_COORD >> 3) - (VGA_HORZ_BASE >> 3);
    wire [10:0] row = (VGA_VERT_COORD >> 3) - (VGA_VERT_BASE >> 3);
    
    assign Is_Draw = (((char == 6'b000000) && (( ((row == 4) || (row == 5) || (row == 7)) && ((col == 7) || (col == 8)) ) ||
                          /*A*/                ( ((row == 5) || (row == 6) || (row == 7) || (row == 8) || (row == 9) || (row == 10)) && ((col == 6) || (col == 9)) ) ||
                                               ( ((row == 6) || (row == 7) || (row == 8) || (row == 9) || (row == 10)) && ((col == 5) || (col == 10)) )) ) ||
                      ((char == 6'b000001) && (( ((row == 4) || (row == 10) || (row == 7)) && ((col == 7) || (col == 8) || (col == 5)  || (col == 6) || (col == 9)) ) ||
                          /*B*/                ( ((row == 6) || (row == 5) || (row == 8) || (row == 9)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) )) ) ||
                      ((char == 6'b000010) && (( ((row == 4) || (row == 10)) && ((col == 7) || (col == 6) || (col == 9) || (col == 8)) ) ||
                          /*C*/                ( ((row == 5) || (row == 9)) && ((col == 6) || (col == 5) || (col == 10) || (col == 9)) ) ||
                                               ( ((row == 6) || (row == 7) || (row == 8)) && ((col == 5) || (col == 6)) )) ) ||
                      ((char == 6'b000011) && (( ((row == 4) || (row == 10)) && ((col == 7) || (col == 5) || (col == 6) || (col == 8)) ) ||
                          /*D*/                ( ((row == 5) || (row == 9)) && ((col == 6) || (col == 5) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 6) || (row == 7) || (row == 8)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) )) ) ||
                      ((char == 6'b000100) && (( ((row == 4) || (row == 10)) && ((col == 5) ||(col == 6) || (col == 7) || (col == 8) || (col == 9) || (col == 10)) ) ||
                         /*E*/                 ( ((row == 7)) && ((col == 6) || (col == 8) ||(col == 5) || (col == 7) || (col == 9)) ) ||
                                               ( ((row == 6) || (row == 5) || (row == 8) || (row == 9)) && ((col == 5) || (col == 6)) )) ) ||
                      ((char == 6'b000101) && (( ((row == 4)) && ((col == 7) || (col == 5) || (col == 6) || (col == 9) || (col == 10) || (col == 8)) ) ||
                         /*F*/                 ( ((row == 7)) && ((col == 6) || (col == 5) || (col == 7) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 6) || (row == 5) || (row == 8) || (row == 9) || (row == 10)) && ((col == 5) || (col == 6)) )) ) ||
                      ((char == 6'b000110) && (( ((row == 4)) && ((col == 7) || (col == 6) || (col == 9) || (col == 8)) ) ||
                                               ( ((row == 5)) && ((col == 6) || (col == 5) || (col == 10) || (col == 9)) ) ||
                                               ( ((row == 6)) && ((col == 6) || (col == 5)) ) ||
                                               ( ((row == 7)) && ((col == 6) || (col == 8) || (col == 5) || (col == 10) || (col == 9)) ) ||
                                               ( ((row == 8)) && ((col == 6) || (col == 5) || (col == 10)) ) ||
                                               ( ((row == 9)) && ((col == 6) || (col == 5) || (col == 7) || (col == 10) || (col == 9)) ) ||
                                               ( ((row == 10)) && ((col == 8) || (col == 6) || (col == 7) || (col == 9) || (col == 10)) )) ) ||
                      ((char == 6'b000111) && (( ((row == 4) || (row == 5) || (row == 10) || (row == 9) || (row == 8)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                          /*H*/                ( ((row == 6) || (row == 7)) && ((col == 5) || (col == 6) || (col == 9) || (col == 8) || (col == 7) || (col == 10)) )) ) ||
                      ((char == 6'b001000) && (( ((row == 4) || (row == 10)) && ((col == 7) || (col == 6) || (col == 9) || (col == 8)) ) ||
                                               ( ((row == 6) || (row == 7) || (row == 8) || (row == 9) || (row == 5)) && ((col == 8) || (col == 7)) )) ) ||
                      ((char == 6'b001001) && (( ((row == 4)) && ((col == 7) || (col == 5) || (col == 6) || (col == 9) || (col == 10) || (col == 8)) ) ||
                          /*J*/                ( ((row == 5) || (row == 6)) && ((col == 7) || (col == 8)) ) ||
                                               ( ((row == 7) || (row == 8) || (row == 9)) && ((col == 7) || (col == 8) || (col == 5)) ) ||
                                               ( ((row == 10)) && ((col == 5) || (col == 6) || (col == 7) || (col == 8)) )) ) ||
                      ((char == 6'b001010) && (( ((row == 4) || (row == 10)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 5) || (row == 9)) && ((col == 6) || (col == 5) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 6) || (row == 8)) && ((col == 6) || (col == 5) || (col == 8) || (col == 7)) ) ||
                                               ( ((row == 7)) && ((col == 5) || (col == 6) || (col == 7)) )) ) ||
                      ((char == 6'b001011) && (( ((row == 4) || (row == 5) || (row == 7)|| (row == 6) || (row == 8)) && ((col == 5) || (col == 6)) ) ||
                                               ( ((row == 9) || (row == 10)) && ((col == 5) || (col == 6) || (col == 9) || (col == 7) || (col == 8) ||  (col == 10)) )) ) ||
                      ((char == 6'b001100) && (( ((row == 4) || (row == 9) || (row == 10)) && ((col == 4) || (col == 5) || (col == 9) || (col == 10)) ) ||
                          /*M*/                ( ((row == 5)) && ((col == 6) || (col == 4) || (col == 5) || (col == 9) || (col == 8) || (col == 10)) ) ||
                                               ( ((row == 8)) && ((col == 4) || (col == 5) || (col == 10) || (col == 7) || (col == 9)) ) ||
                                               ( ((row == 6) || (row == 7)) && ((col == 5) || (col == 6) || (col == 4) || (col == 7) || (col == 9) || (col == 8) || (col == 10)) )) ) ||
                      ((char == 6'b001101) && (( ((row == 4) || (row == 10)) && ((col == 4) || (col == 5) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 5)) && ((col == 4) || (col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 6)) && ((col == 4) || (col == 5) || (col == 6) || (col == 7) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 7)) && ((col == 4) || (col == 5) || (col == 6) || (col == 7) || (col == 8) ||(col == 9) || (col == 10)) ) ||
                                               ( ((row == 8)) && ((col == 4) || (col == 5) || (col == 7) || (col == 8) ||(col == 9) || (col == 10)) ) ||
                                               ( ((row == 9)) && ((col == 5) || (col == 4) || (col == 9) || (col == 8) || (col == 10)) )) ) ||
                      ((char == 6'b001110) && (( ((row == 4) || (row == 10)) && ((col == 7) || (col == 6) || (col == 9) || (col == 8)) ) ||
                       /*O*/                   ( ((row == 6) || (row == 7) || (row == 8) || (row == 5) || (row == 9)) && ((col == 5) || (col == 6) || (col == 10) || (col == 9)) )) ) ||
                      ((char == 6'b001111) && (( ((row == 4) || (row == 7)) && ((col == 7) || (col == 5) || (col == 6) || (col ==9) || (col == 8)) ) ||
                                               ( ((row == 5) || (row == 6)) && ((col == 6) || (col == 5) || (col == 10) || (col == 9)) ) ||
                                               ( ((row == 8)) && ((col == 6) || (col == 5) || (col == 7) || (col == 8)) ) ||
                                               ( ((row == 9) || (row == 10)) && ((col == 5) || (col == 6)) )) ) ||
                      ((char == 6'b010000) && (( ((row == 4) || (row == 9)) && ((col == 6) || (col == 7) || (col == 8) || (col == 9)) ) ||
                       /*Q*/                   ( ((row == 5) || (row == 6) || (row == 7) || (row == 8)) && ((col == 6) || (col == 5) || (col == 10) || (col == 9)) ) ||
                                               ( ((row == 10)) && ((col == 9) || (col == 8) || (col == 10)) )) ) ||
                      ((char == 6'b010001) && (( ((row == 4) || (row == 7)) && ((col == 7) || (col == 5) || (col == 6) || (col ==9) || (col == 8)) ) ||
                                               ( ((row == 5) || (row == 6)) && ((col == 6) || (col == 5) || (col == 10) || (col == 9)) ) ||
                                               ( ((row == 8)) && ((col == 6) || (col == 5) || (col == 7) || (col == 8)) ) ||
                                               ( ((row == 9) || (row == 10)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) )) ) ||
                      ((char == 6'b010010) && (( ((row == 4) || (row == 10)) && ((col == 6) || (col == 7) || (col == 8) || (col == 9)) ) ||
                          /*S*/                ( ((row == 5) || (row == 9)) && ((col == 6) || (col == 5) || (col == 10) || (col == 9)) ) ||
                                               ( ((row == 6)) && ((col == 6) || (col == 5)) ) ||
                                               ( ((row == 7)) && ((col == 6) || (col == 7) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 8)) && ((col == 9) || (col == 10)) )) ) ||
                      ((char == 6'b010011) && (( ((row == 4) || (row == 5)) && ((col == 7) || (col == 5) || (col == 6) || (col == 9) || (col == 10) || (col == 8)) ) ||
                                               ( ((row == 6) || (row == 7) || (row == 8) || (row == 9) || (row == 10)) && ((col == 7) || (col == 8)) )) ) ||
                      ((char == 6'b010100) && (( ((row == 4) || (row == 5) || (row == 6) || (row == 7) || (row == 8)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                          /*U*/                ( ((row == 9)) && ((col == 7) || (col == 8) || (col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 10)) && ((col == 7) || (col == 8) || (col == 6) || (col == 9)) )) ) ||
                      ((char == 6'b010101) && (( ((row == 4) || (row == 5) || (row == 6) || (row == 7)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 8)) && ((col == 7) || (col == 8) || (col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 9)) && ((col == 6) || (col == 7) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 10)) && ((col == 7) || (col == 8)) )) ) ||
                      ((char == 6'b010110) && (( ((row == 4)) && ((col == 4) || (col == 5) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 5) || (row == 6) || (row == 7)) && ((col == 4) || (col == 5) || (col == 7) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 8)) && ((col == 4) || (col == 5) || (col == 6) || (col == 7) || (col == 8) || (col == 9) || (col == 10)) ) ||
                          /*W*/                ( ((row == 9)) && ((col == 6) || (col == 5) || (col == 7) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 10)) && ((col == 5) || (col == 6) || (col == 8) || (col == 9)) )) ) ||
                      ((char == 6'b010111) && (( ((row == 4) || (row == 10) || (row == 5) || (row == 9)) && ((col == 6) || (col == 5) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 6) || (row == 8)) && ((col == 6) || (col == 7) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 7)) && ((col == 7) || (col == 8)) )) ) ||
                      ((char == 6'b011000) && (( ((row == 4) || (row == 5) || (row == 6)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 7)) && ((col == 6) || (col == 7) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 8) || (row == 9) || (row == 10)) && ((col == 7) || (col == 8)) )) ) ||
                      ((char == 6'b011001) && (( ((row == 4) || (row == 10)) && ((col == 7) || (col == 5) || (col == 6) || (col == 9) || (col == 10) || (col == 8)) ) ||
                          /*Z*/                ( ((row == 5) || (row == 9)) && ((col == 6) || (col == 5) || (col == 10) || (col == 9)) ) ||
                                               ( ((row == 6)) && ((col == 8) || (col == 9)) ) ||
                                               ( ((row == 7)) && ((col == 7) || (col == 8)) ) ||
                                               ( ((row == 8)) && ((col == 7) || (col == 6)) )) ) ||
                      ((char == 6'b011010) && (( ((row == 4) || (row == 10)) && ((col == 7) || (col == 6) || (col == 9) || (col == 8)) ) || 
                                               ( ((row == 6)) && ((col == 8)) ) ||
                                               ( ((row == 7)) && ((col == 7)) ) ||
                        /*0*/                  ( ((row == 6) || (row == 7) || (row == 8) || (row == 9) || (row == 5)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) )) ) ||
                      ((char == 6'b011011) && (( ((row == 6)) && ((col == 6) || (col == 7) || (col == 8)) ) ||
                                               ( ((row == 5) || (row == 4) || (row == 7) || (row == 8) || (row == 9) || (row == 10)) && ((col == 7) || (col == 8)) ) ||
                                               ( ((row == 10)) && ((col == 7) || (col == 5) || (col == 6) || (col == 9) || (col == 10) || (col == 8)) )) ) ||
                      ((char == 6'b011100) && (( ((row == 4)) && ((col == 6) || (col == 7) || (col == 8) || (col == 9)) ) ||
                          /*2*/                ( ((row == 5)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 6)) && ((col == 9) || (col == 10)) ) ||
                                               ( ((row == 7)) && ((col == 9) || (col == 8)) ) ||
                                               ( ((row == 8)) && ((col == 7) || (col == 6)) ) ||
                                               ( ((row == 9)) && ((col == 5) || (col == 6)) ) ||
                                               ( ((row == 10)) && ((col == 7) || (col == 5) || (col == 6) || (col == 9) || (col == 10) || (col == 8)) )) ) ||
                      ((char == 6'b011101) && (( ((row == 4) || (row == 10)) && ((col == 6) || (col == 7) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 5) || (row == 9)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 6) || (row == 8)) && ((col == 9) || (col == 10)) ) ||
                                               ( ((row == 7)) && ((col == 7) || (col == 8) || (col == 9)) )) ) ||
                      ((char == 6'b011110) && (( ((row == 4) || (row == 9) || (row == 10)) && ((col == 9) || (col == 8)) ) ||
                                               ( ((row == 5)) && ((col == 9) || (col == 8) || (col == 7)) ) ||
                                               ( ((row == 6)) && ((col == 9) || (col == 8) || (col == 7) || (col == 6)) ) ||
                                               ( ((row == 7)) && ((col == 4) || (col == 5) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 8)) && ((col == 5) || (col == 4) || (col == 6) || (col == 7) || (col == 8) || (col == 9) || (col == 10)) )) ) ||
                      ((char == 6'b011111) && (( ((row == 4)) && ((col == 5) || (col == 6) || (col == 7) || (col == 8) || (col == 9) || (col == 10)) ) ||
                          /*5*/                ( ((row == 5)) && ((col == 6) || (col == 5)) ) ||
                                               ( ((row == 6)) && ((col == 6) || (col == 5) || (col == 7) || (col == 8) || (col == 9)) ) ||
                                               ( ((row == 7) || (row == 8)) && ((col == 9) || (col == 10)) ) ||
                                               ( ((row == 9)) && ((col == 6) || (col == 5) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 10)) && ((col == 6) || (col == 7) || (col == 8) || (col == 9)) )) ) ||
                      ((char == 6'b100000) && (( ((row == 4) || (row == 10)) && ((col == 7) || (col == 6) || (col == 9) || (col == 8)) ) ||
                                               ( ((row == 5) || (row == 8) || (row == 9)) && ((col == 6) || (col == 5) || (col == 10) || (col == 9)) ) ||
                                               ( ((row == 6)) && ((col == 7) || (col == 6) || (col == 5)) ) ||
                                               ( ((row == 7)) && ((col == 5) || (col == 6) || (col == 7) || (col == 8) || (col == 9)) )) ) ||
                      ((char == 6'b100001) && (( ((row == 4)) && ((col == 7) || (col == 5) || (col == 6) || (col == 9) || (col == 10) || (col == 8)) ) ||
                                               ( ((row == 5)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 6)) && ((col == 8) || (col == 9)) ) ||
                                               ( ((row == 7) || (row == 8) || (row == 9) || (row == 10)) && ((col == 7) || (col == 8)) )) ) ||
                      ((char == 6'b100010) && (( ((row == 4) || (row == 10) || (row == 7)) && ((col == 7) || (col == 6) || (col == 9) || (col == 8)) ) ||
                                               ( ((row == 6) || (row == 5) || (row == 8) || (row == 9)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) )) ) ||
                      ((char == 6'b100011) && (( ((row == 4) || (row == 10)) && ((col == 7) || (col == 6) || (col == 9) || (col == 8)) ) ||
                          /*9*/                ( ((row == 5) || (row == 6) || (row == 9)) && ((col == 5) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 7)) && ((col == 7) || (col == 8) || (col == 6) || (col == 9) || (col == 10)) ) ||
                                               ( ((row == 8)) && ((col == 9) || (col == 10)) )) )) ? 1'b1 : 1'b0;

endmodule