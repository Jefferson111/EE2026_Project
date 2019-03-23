`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2019 21:32:51
// Design Name: 
// Module Name: PauseTheDraw
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


module PauseTheDraw(
    input pulse,
    input clock,
    output reg toggle = 0
    );
    
    always @ (posedge clock)
    begin
    if (pulse)
        toggle = ~toggle;
    end
    
endmodule
