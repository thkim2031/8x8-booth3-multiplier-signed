`timescale 1ns / 1ps

module Booth3_algorithm_signed_tb();
    reg RST, CLK;
    reg [7:0] x, multiplier;

    wire [15:0]  final_result;

    booth booth0(.RST(RST), .CLK(CLK), .x(x), .multiplier(multiplier), .final_result(final_result));

    initial 
    begin
        CLK = 0;
        RST = 0;
        x = 0;
        multiplier = 0;
        
        #15;

        
        #35;
        x = 8'b10001001;
        multiplier = 8'b00100110;
        
        #35;
        x = 8'b10111001;
        multiplier = 8'b11100110;
        
        #35;
        x = 8'b00110101;
        multiplier = 8'b00111110;
        
        #35;
        x = 8'b01111010;
        multiplier = 8'b00111111;

        #35;
        x = 8'b00000101;
        multiplier = 8'b11111110;
        
        #35;
        x = 8'b00111111;
        multiplier = 8'b00111111;
        //#15;
        //x = 4'b0110;
        //multiplier = 4'b1101;
        
        //#110;

        
        //#15;
        //x = 4'b1100;
    
    
        //multiplier = 4'b1111;
    end
    
    always #20 CLK = ~CLK;
    
    
endmodule
