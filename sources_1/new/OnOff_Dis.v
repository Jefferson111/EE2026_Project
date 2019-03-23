`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2019 14:27:40
// Design Name: 
// Module Name: OnOff_Dis
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


module OnOff_Dis(
    input on,
    
    output [11:0] horz_coor,
    output [5:0] char
    );
    
    assign horz_coor = on ? 12'd1120 : 12'd1135;
    assign char = on ? 6'b1101 : 6'b101;
    
endmodule
