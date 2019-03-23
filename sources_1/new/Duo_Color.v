`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2019 23:20:27
// Design Name: 
// Module Name: Duo_Color
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


module Duo_Color(
    input clk,
    
    output [7:0] duo
    );
    
    reg [3:0] col1;
    reg [3:0] col2;
    reg flip; 
    
    initial begin
    flip = 0;
    col1 = 15;
    col2 = 0;
    end
    
    always @(posedge clk)
    begin
    if (col1 == 0)
        begin
        flip = ~flip;
        end
    col2 = col2 + 1;
    col1 = col1 - 1;
    end
    
    assign duo[7:4] = flip ? col1 : col2;
    assign duo[3:0] = flip ? col2 : col1;
    
endmodule
