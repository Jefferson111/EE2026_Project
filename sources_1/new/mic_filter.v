`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2019 22:59:07
// Design Name: 
// Module Name: mic_filter
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

//TO GET THE BAR GRAPH, TAKE THE OUTPUT MIC_OUT, USE IF ELSE OR WHATEVER CASE STATEMENTS TO DETERMINE THE RANGE FOR BAR GRAPH
module mic_filter(
input CLK,  //20KHz
input [11:0]MIC_in,
output reg [11:0]MIC_out = 0
    );
    
reg [6:0]COUNT = 0;                       
reg [11:0] COUNT2 = 0;
reg [31:0]store_total_MIC_in_values = 0;  //100 MIC_in values
reg [11:0]peak_MIC_value = 0; 
                        
    
always @ (posedge CLK)
begin
    COUNT <= COUNT + 1;
    if (peak_MIC_value < MIC_in)
        peak_MIC_value <= MIC_in;   //store highest peak value
        
        if (COUNT >= 50)
        begin
            store_total_MIC_in_values<= store_total_MIC_in_values+ peak_MIC_value;
            COUNT2 <= COUNT2 +1;
            peak_MIC_value <= 0;
            COUNT <= 0;        
        end
        
        if (COUNT2 == 50)
        begin
           MIC_out <= store_total_MIC_in_values/COUNT2;
           
           COUNT2 <= 0;
           store_total_MIC_in_values <=0;
        end
   
end    
    
endmodule
