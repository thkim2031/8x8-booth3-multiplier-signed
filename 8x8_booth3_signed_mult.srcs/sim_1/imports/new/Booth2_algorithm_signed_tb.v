`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/19 15:30:17
// Design Name: 
// Module Name: Booth2_algorithm_signed_tb
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


module Booth2_algorithm_signed_tb();
    reg rst, clk;
    reg [7:0] x, multiplier;

    wire [15:0]  final_result;

    top top0(.rst(rst), .clk(clk), .multiplicand(x), .multiplier(multiplier), .final_result(final_result));

    initial 
    begin
        clk = 0;
        rst = 0;
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
    
    always #20 clk = ~clk;
    
    
endmodule
