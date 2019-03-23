`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2019 14:58:51
// Design Name: 
// Module Name: slowclk
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


module slowclk(
    input clk,
    output reg slw = 0
    );
    
    reg [11:0] count = 0;
    
    always @ (posedge clk)
    begin
        count <= (count == 2499) ? 0 : count + 1;
        slw <= (count == 0) ? ~slw : slw; 
    end
    
endmodule
