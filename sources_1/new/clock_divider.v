`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2019 23:03:19
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
input system_CLK,  //100MHz
input [31:0]value,  // value for counter
output reg desired_CLK = 0      
    );
    
    reg [31:0]COUNT = 0 ;
    wire [31:0]div;
    
    counter_val clk_dividercount(value,div);
    
    always @(posedge system_CLK)
    begin
    
    COUNT <= (COUNT >= div) ? 0: COUNT +1;
    desired_CLK <= (COUNT == 0) ? ~desired_CLK : desired_CLK;
    
    end
   
endmodule
