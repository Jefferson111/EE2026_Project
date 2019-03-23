`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2019 16:05:10
// Design Name: 
// Module Name: Sign_Deduction
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


module Sign_Deduction(
    input [11:0] coord,
    input [11:0] offset,
    
    output [11:0] real_coord,
    output sign
    );
    
    assign sign = (coord >= offset) ? 0 : 1;
    assign real_coord = (coord >= offset) ? coord - offset : offset - coord;
      
endmodule
