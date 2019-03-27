`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2019 15:26:23
// Design Name: 
// Module Name: seven_seg_display
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


module seven_seg_display(
input CLK,
input [3:0]num,
input [1:0] LIRO_state,
//input SW1,
//input SW2,
//input SW3,
output reg [3:0]an,
output [7:0]seg
    );


reg [1:0]anode_count;    
wire [4:0]digit;
    
always @(posedge CLK)
begin
    
 anode_count <= anode_count + 1;
 
 case(anode_count)
    0: an = 4'b1110;       
    1: an = 4'b1101;
    2: an = 4'b1011; 
    3: an = 4'b0111;
 endcase
 end
 
sevenseg_control(CLK,anode_count,num,LIRO_state,digit);
seg_codes(digit,seg);  

 
  
endmodule
