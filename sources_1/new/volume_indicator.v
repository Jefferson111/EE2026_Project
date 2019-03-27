`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2019 22:16:10
// Design Name: 
// Module Name: volume_indicator
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


module volume_indicator(
input CLK,   //20KHz to take in mic inputs
input refreshCLK,    // 20Hz
input [1:0] LIRO_state,

//input SW1,  //0--> left , 1--> right
//input SW2,  //sw1 = 0, sw2=1 to activate centre
//input SW3,  //sw1 =0 , sw2=0, sw3=1 to activate out to in
input [11:0]MIC_in,
output reg [11:0] led,  //reg to store LED values
output reg trigger,
output reg [3:0]num //value of volume from 0 to 12
    );
    
wire [11:0]filtered_MIC;
reg [11:0] seg;
mic_filter filterMIC(CLK,MIC_in,filtered_MIC);    
    
always @ (posedge refreshCLK)  //20Hz CLK
begin
    if (/*!SW1 & !SW2 & !SW3*/LIRO_state == 2'b00)begin

        if (filtered_MIC>3600)
        begin
                trigger <= ~trigger;    
        end
        
        if ((filtered_MIC<3350) && (filtered_MIC>3250))
        begin
                led <= 12'b111111111111;
                num <= 12;
        end
        
        if ((filtered_MIC<3250) && (filtered_MIC>3150))
        begin
                led <= 12'b011111111111;
                num <= 11;
        end

        if ((filtered_MIC<3150) && (filtered_MIC>3050))
        begin
                led <= 12'b001111111111;
                num <= 10;
        end
        
        else if ((filtered_MIC<3050) && (filtered_MIC>2950))
        begin
                led <= 12'b000111111111;
                num <= 9;
        end
        
        else if ((filtered_MIC<2950) && (filtered_MIC>2850))
        begin
                led <= 12'b000011111111;               
                num <= 8;
        end
        
        else if ((filtered_MIC<2850) && (filtered_MIC>2750))
        begin
                led <= 12'b000001111111;
                num <= 7;
        end
                
        else if ((filtered_MIC<2750) && (filtered_MIC>2650))
        begin
                led <= 12'b000000111111;
                num <= 6;
        end
                
        else if ((filtered_MIC<2650) && (filtered_MIC>2550))
        begin
                led <= 12'b000000011111;
                num <= 5;
        end
                
        else if ((filtered_MIC<2550) && (filtered_MIC>2450))
        begin
                led <= 12'b000000001111;                
                num <= 4;
        end
                
        else if ((filtered_MIC<2450) && (filtered_MIC>2350))
        begin
                led <= 12'b000000000111;
                num <= 3;
        end
        
        else if ((filtered_MIC<2350) && (filtered_MIC>2250))
        begin
                led <= 12'b000000000011;
                num <= 2;
        end
        
        else if ((filtered_MIC<2250) && (filtered_MIC>2150))
        begin
                led <= 12'b000000000001;
                num <= 1;
        end
                
        else if ((filtered_MIC<2150) && (filtered_MIC>0))
        begin
                led <= 12'b000000000000;
                num <= 0;
        end
        
end //first if


else if (/*SW1 & !SW2 &!SW3*/LIRO_state == 2'b10) begin

        if (filtered_MIC>3600)
        begin
                trigger <= ~trigger;    
        end
        
        if ((filtered_MIC<3350) && (filtered_MIC>3250))
        begin
                led <= 12'b111111111111;
                num <= 12;
        end
        
        if ((filtered_MIC<3250) && (filtered_MIC>3150))
        begin
                led <= 12'b111111111110;
                num <= 11;
        end

        if ((filtered_MIC<3150) && (filtered_MIC>3050))
        begin
                led <= 12'b111111111100;
                num <= 10;
        end
        
        else if ((filtered_MIC<3050) && (filtered_MIC>2950))
        begin
                led <= 12'b111111111000;
                num <= 9;
        end
        
        else if ((filtered_MIC<2950) && (filtered_MIC>2850))
        begin
                led <= 12'b111111110000;               
                num <= 8;
        end
        
        else if ((filtered_MIC<2850) && (filtered_MIC>2750))
        begin
                led <= 12'b111111100000;
                num <= 7;
        end
                
        else if ((filtered_MIC<2750) && (filtered_MIC>2650))
        begin
                led <= 12'b111111000000;
                num <= 6;
        end
                
        else if ((filtered_MIC<2650) && (filtered_MIC>2550))
        begin
                led <= 12'b111110000000;
                num <= 5;
        end
                
        else if ((filtered_MIC<2550) && (filtered_MIC>2450))
        begin
                led <= 12'b111100000000;                
                num <= 4;
        end
                
        else if ((filtered_MIC<2450) && (filtered_MIC>2350))
        begin
                led <= 12'b111000000000;
                num <= 3;
        end
        
        else if ((filtered_MIC<2350) && (filtered_MIC>2250))
        begin
                led <= 12'b110000000000;
                num <= 2;
        end
        
        else if ((filtered_MIC<2250) && (filtered_MIC>2150))
        begin
                led <= 12'b100000000000;
                num <= 1;
        end
                
        else if ((filtered_MIC<2150) && (filtered_MIC>0))
        begin
                led <= 12'b000000000000;
                num <= 0;
        end

end //second if
    
else if (/*!SW1 & SW2 & !SW3*/LIRO_state == 2'b01)
begin
    
        if (filtered_MIC>3600)
        begin
                trigger <= ~trigger;    
        end
        
        if ((filtered_MIC<3350) && (filtered_MIC>3250))
        begin
                led <= 12'b111111111111;
                num <= 12;
        end
        
        if ((filtered_MIC<3250) && (filtered_MIC>3150))
        begin
                led <= 12'b111111111111;
                num <= 11;
        end

        if ((filtered_MIC<3150) && (filtered_MIC>3050))
        begin
                led <= 12'b011111111110;
                num <= 10;
        end
        
        else if ((filtered_MIC<3050) && (filtered_MIC>2950))
        begin
                led <= 12'b011111111110;
                num <= 9;
        end
        
        else if ((filtered_MIC<2950) && (filtered_MIC>2850))
        begin
                led <= 12'b001111111100;               
                num <= 8;
        end
        
        else if ((filtered_MIC<2850) && (filtered_MIC>2750))
        begin
                led <= 12'b001111111100;
                num <= 7;
        end
                
        else if ((filtered_MIC<2750) && (filtered_MIC>2650))
        begin
                led <= 12'b000111111000;
                num <= 6;
        end
                
        else if ((filtered_MIC<2650) && (filtered_MIC>2550))
        begin
                led <= 12'b000111111000;
                num <= 5;
        end
                
        else if ((filtered_MIC<2550) && (filtered_MIC>2450))
        begin
                led <= 12'b000011110000;                
                num <= 4;
        end
                
        else if ((filtered_MIC<2450) && (filtered_MIC>2350))
        begin
                led <= 12'b000011110000;
                num <= 3;
        end
        
        else if ((filtered_MIC<2350) && (filtered_MIC>2250))
        begin
                led <= 12'b000001100000;
                num <= 2;
        end
        
        else if ((filtered_MIC<2250) && (filtered_MIC>2150))
        begin
                led <= 12'b000001000000;
                num <= 1;
        end
                
        else if ((filtered_MIC<2150) && (filtered_MIC>0))
        begin
                led <= 12'b000000000000;
                num <= 0;
        end



end // third if  

else if (/*!SW1 & !SW2 & SW3*/LIRO_state == 2'b11)begin
        
        if (filtered_MIC>3600)
        begin
                trigger <= ~trigger;    
        end
        
        if ((filtered_MIC<3350) && (filtered_MIC>3250))
        begin
                led <= 12'b111111111111;
                num <= 12;
        end
        
        if ((filtered_MIC<3250) && (filtered_MIC>3150))
        begin
                led <= 12'b111111011111;
                num <= 11;
        end

        if ((filtered_MIC<3150) && (filtered_MIC>3050))
        begin
                led <= 12'b111110011111;
                num <= 10;
        end
        
        else if ((filtered_MIC<3050) && (filtered_MIC>2950))
        begin
                led <= 12'b111110011111;
                num <= 9;
        end
        
        else if ((filtered_MIC<2950) && (filtered_MIC>2850))
        begin
                led <= 12'b111100001111;               
                num <= 8;
        end
        
        else if ((filtered_MIC<2850) && (filtered_MIC>2750))
        begin
                led <= 12'b111100001111;
                num <= 7;
        end
                
        else if ((filtered_MIC<2750) && (filtered_MIC>2650))
        begin
                led <= 12'b111000000111;
                num <= 6;
        end
                
        else if ((filtered_MIC<2650) && (filtered_MIC>2550))
        begin
                led <= 12'b111000000111;
                num <= 5;
        end
                
        else if ((filtered_MIC<2550) && (filtered_MIC>2450))
        begin
                led <= 12'b110000000011;                
                num <= 4;
        end
                
        else if ((filtered_MIC<2450) && (filtered_MIC>2350))
        begin
                led <= 12'b110000000011;
                num <= 3;
        end
        
        else if ((filtered_MIC<2350) && (filtered_MIC>2250))
        begin
                led <= 12'b100000000001;
                num <= 2;
        end
        
        else if ((filtered_MIC<2250) && (filtered_MIC>2150))
        begin
                led <= 12'b100000000001;
                num <= 1;
        end
                
        else if ((filtered_MIC<2150) && (filtered_MIC>0))
        begin
                led <= 12'b000000000000;
                num <= 0;
        end

end//fourth if  
    
end //always

endmodule
