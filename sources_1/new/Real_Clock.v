`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2019 00:31:18
// Design Name: 
// Module Name: Real_Clock
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


module Real_Clock(
     input clk,
     output reg [23:0] real_time = 23'b011010011010011010011010
     );
     
     reg [26:0] count;
      
     initial begin
     count = 0;
     end
     
     always @ (posedge clk)
     begin
        count <= (count == 99999999) ? 0 : count + 1;
        if (count == 0)
            begin
            real_time[5:0] = real_time[5:0] + 1;
            end
        if (real_time[5:0] == 6'b100100)
            begin
            real_time[5:0] = 6'b011010;
            real_time[11:6] = real_time[11:6] + 1;
            end
        if (real_time[11:6] == 6'b100000)
            begin
            real_time[11:6] =  6'b011010;
            real_time[17:12] = real_time[17:12] + 1;
            end
        if (real_time[17:12] == 6'b100100)
            begin
            real_time[17:12] =  6'b011010;
            real_time[23:18] = real_time[23:18] + 1;
            end
        if (real_time[23:18] == 6'b100100)
            begin
           real_time[23:18] =  6'b011010;
           end    
     end
endmodule