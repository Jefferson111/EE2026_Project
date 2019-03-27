`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 09:57:35
// Design Name: 
// Module Name: sevenseg_control
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


module sevenseg_control(
input CLK,
input [1:0]anode_count,
input [3:0]num,
input [1:0] LIRO_state,
//input SW1,
//input SW2,
//input SW3,
output reg [4:0]digit
    );

reg [3:0]value1;    //tens
reg [3:0]value2;    //ones

always @(anode_count)
begin    
value1 <= ((num/10)%10);
value2 <= (num %10); 

if (/*!SW1 & !SW2 & !SW3*/LIRO_state == 2'b00)begin

   case (anode_count)
        2'd0: digit = 10;
        2'd1: digit = value2;
        2'd2: digit = value1;
        2'd3: digit = 11;
   endcase
end //first if

else if (/*SW1 & !SW2 & !SW3*/LIRO_state == 2'b10)begin
    case (anode_count)
        2'd0: digit = 11;
        2'd1: digit = value2;
        2'd2: digit = value1;
        2'd3: digit = 10;
   endcase


end //second if

else if (/*!SW1 & SW2 & !SW3*/LIRO_state == 2'b01) begin
    case (anode_count)
        2'd0: digit = 12;
        2'd1: digit = value2;
        2'd2: digit = value1;
        2'd3: digit = 13;
   endcase

end //third if

else if (/*!SW1 & !SW2 & SW3 */LIRO_state == 2'b11) begin
    case (anode_count)
        2'd0: digit = 0;
        2'd1: digit = value2;
        2'd2: digit = value1;
        2'd3: digit = 14;
   endcase


end

end    //always
endmodule
