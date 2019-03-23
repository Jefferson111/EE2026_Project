`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2019 16:14:25
// Design Name: 
// Module Name: TestWave_Gen
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


module TestWave_Gen(
    input clk,
    output reg [9:0] count = 0
    );
    
    always @ (posedge clk)
    begin
    count <= (count == 639) ? 0 : count + 1;
    end
endmodule
