`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2019 13:47:47
// Design Name: 
// Module Name: Draw_Menu
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


module Draw_Menu(
    input [11:0] VGA_HORZ_COORD,
    input [11:0] VGA_VERT_COORD,
    input Menu_Sw,
    input [23:0] Clock_Time, 
    
    //input imba_mode
    input Axis_On,
    input Grid_On,
    input Tick_On,
    input Wave_On,
 
    output Condition_For_Menu_Box,
    output Condition_For_Menu_Border,
    output Condition_For_Menu_Text
    );
    
    //For menu
    assign Condition_For_Menu_Box = (VGA_HORZ_COORD >= 1040) & (VGA_VERT_COORD >= 640) & Menu_Sw;
    
    assign Condition_For_Menu_Border = Menu_Sw & ( ((VGA_HORZ_COORD >= 1040) & (VGA_HORZ_COORD <= 1042) & (VGA_VERT_COORD >= 640)) |
                                       ((VGA_VERT_COORD >= 640) & (VGA_VERT_COORD <= 642) & (VGA_HORZ_COORD >= 1040)) );
       
    wire [55:0] a;
    Alphabet_Map letter1(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1110, 12'd640, 6'b1100, a[0]);
    Alphabet_Map letter2(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1130, 12'd640, 6'b100, a[1]);
    Alphabet_Map letter3(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1150, 12'd640, 6'b1101, a[2]);
    Alphabet_Map letter4(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1170, 12'd640, 6'b10100, a[3]);
    //Axis text Display
    Alphabet_Map letter5(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1105, 12'd688, 6'b1110, a[4]);
    wire [11:0] Coor_For_Axis;
    wire [5:0] Char_Axis;
    OnOff_Dis d1(Axis_On, Coor_For_Axis, Char_Axis);
    Alphabet_Map letter6(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1120, 12'd688, Char_Axis, a[5]);
    Alphabet_Map letter6A(VGA_HORZ_COORD, VGA_VERT_COORD, Coor_For_Axis, 12'd688, Char_Axis, a[45]);
    Alphabet_Map letter7(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1160, 12'd688, 6'b0000, a[6]);
    Alphabet_Map letter8(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1175, 12'd688, 6'b10111, a[7]);
    Alphabet_Map letter9(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1190, 12'd688, 6'b1000, a[8]);
    Alphabet_Map letter10(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1205, 12'd688, 6'b10010, a[9]);
    //Grid text Display
    Alphabet_Map letter11(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1105, 12'd712, 6'b1110, a[10]);
    wire [11:0] Coor_For_Grid;
    wire [5:0] Char_Grid;
    OnOff_Dis d2(Grid_On, Coor_For_Grid, Char_Grid);
    Alphabet_Map letter12(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1120, 12'd712, Char_Grid, a[11]);
    Alphabet_Map letter12A(VGA_HORZ_COORD, VGA_VERT_COORD, Coor_For_Grid, 12'd712, Char_Grid, a[46]);
    Alphabet_Map letter13(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1160, 12'd712, 6'b110, a[12]);
    Alphabet_Map letter14(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1175, 12'd712, 6'b10001, a[13]);
    Alphabet_Map letter15(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1190, 12'd712, 6'b1000, a[14]);
    Alphabet_Map letter16(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1205, 12'd712, 6'b11, a[15]);
    //Tick text Display
    Alphabet_Map letter17(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1105, 12'd736, 6'b1110, a[16]);
    wire [11:0] Coor_For_Tick;
    wire [5:0] Char_Tick;
    OnOff_Dis d3(Tick_On, Coor_For_Tick, Char_Tick);
    Alphabet_Map letter18(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1120, 12'd736, Char_Tick, a[17]);
    Alphabet_Map letter18A(VGA_HORZ_COORD, VGA_VERT_COORD, Coor_For_Tick, 12'd736, Char_Tick, a[47]);
    Alphabet_Map letter19(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1160, 12'd736, 6'b10011, a[18]);
    Alphabet_Map letter20(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1175, 12'd736, 6'b1000, a[19]);
    Alphabet_Map letter21(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1190, 12'd736, 6'b10, a[20]);
    Alphabet_Map letter22(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1205, 12'd736, 6'b1010, a[21]);
    //Wave text Display
    Alphabet_Map letter23(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1105, 12'd760, 6'b1110, a[22]);
    wire [11:0] Coor_For_Wave;
    wire [5:0] Char_Wave;
    OnOff_Dis d4(Wave_On, Coor_For_Wave, Char_Wave);
    Alphabet_Map letter24(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1120, 12'd760, Char_Wave, a[23]);
    Alphabet_Map letter24A(VGA_HORZ_COORD, VGA_VERT_COORD, Coor_For_Wave, 12'd760, Char_Wave, a[48]);
    Alphabet_Map letter25(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1160, 12'd760, 6'b10110, a[24]);
    Alphabet_Map letter26(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1175, 12'd760, 6'b0, a[25]);
    Alphabet_Map letter27(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1190, 12'd760, 6'b10101, a[26]);
    Alphabet_Map letter28(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1205, 12'd760, 6'b100, a[27]);
    //On Imba text
    Alphabet_Map letter48(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1105, 12'd784, 6'b1110, a[49]);
    Alphabet_Map letter49(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1120, 12'd784, 6'b1101, a[50]);
    Alphabet_Map letter51(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1160, 12'd784, 6'b1000, a[52]);
    Alphabet_Map letter52(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1175, 12'd784, 6'b1100, a[53]);
    Alphabet_Map letter53(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1190, 12'd784, 6'b1, a[54]);
    Alphabet_Map letter54(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1205, 12'd784, 6'b0, a[51]);
    
    Alphabet_Map letter29(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1040, 12'd960, 6'b100, a[28]);
    Alphabet_Map letter30(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1055, 12'd960, 6'b100, a[29]);
    Alphabet_Map letter31(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1070, 12'd960, 6'b011100, a[30]);
    Alphabet_Map letter32(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1085, 12'd960, 6'b011010, a[31]);
    Alphabet_Map letter33(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1100, 12'd960, 6'b011100, a[32]);
    Alphabet_Map letter34(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1115, 12'd960, 6'b100000, a[33]);
    
    Alphabet_Map letter35(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1145, 12'd960, 6'b001111, a[34]);
    Alphabet_Map letter36(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1160, 12'd960, 6'b010001, a[35]);
    Alphabet_Map letter37(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1175, 12'd960, 6'b001110, a[36]);
    Alphabet_Map letter38(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1190, 12'd960, 6'b001001, a[37]);
    Alphabet_Map letter39(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1205, 12'd960, 6'b100, a[38]);
    Alphabet_Map letter40(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1220, 12'd960, 6'b10, a[39]);
    Alphabet_Map letter41(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1235, 12'd960, 6'b010011, a[40]);
    
    Alphabet_Map letter42(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1040, 12'd984, Clock_Time[23:18], a[41]);
    Alphabet_Map letter43(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1055, 12'd984, Clock_Time[17:12], a[42]);
    Alphabet_Map letter44(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1085, 12'd984, Clock_Time[11:6], a[43]);
    Alphabet_Map letter45(VGA_HORZ_COORD, VGA_VERT_COORD, 12'd1100, 12'd984, Clock_Time[5:0], a[44]);
    
    assign Condition_For_Menu_Text = (a[0] | a[1] | a[2] | a[3] | a[4] | a[5] | a[6] | a[7] | a[8] | a[9] | a[10] | a[11] | a[12] | a[13] | a[14] | a[15] | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23] | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31] | a[32] | a[33] | a[34] | a[35]
    | a[36] | a[37] | a[38] | a[39] | a[40] | a[41] | a[42] | a[43] | a[44] | a[45] | a[46] | a[47] | a[48] | a[49] | a[50] | a[51] | a[52] | a[53] | a[54]) & Menu_Sw;
    
    
endmodule
