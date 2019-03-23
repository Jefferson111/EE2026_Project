`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 13:22:25
// Design Name: 
// Module Name: Clock_6hz
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


module Clock_6hz(
    input clock,
    output reg slowclk = 0
    );
    
    reg [22:0] count;
    always @ (posedge clock) 
       begin
       count <= count + 1;
       slowclk <= (count == 23'b0) ? ~slowclk : slowclk;
       end
       
endmodule
