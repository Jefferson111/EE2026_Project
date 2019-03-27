`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2019 23:10:13
// Design Name: 
// Module Name: counter_val
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


module counter_val(
input [31:0]freq, // 
output [31:0]value
    );
    assign value = (100000000/ (2* freq)) - 1;
    
endmodule
