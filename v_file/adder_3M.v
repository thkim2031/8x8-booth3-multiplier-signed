`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/27 13:23:55
// Design Name: 
// Module Name: adder_3M
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


module adder3M(x, result);

input   [7:0]       x;
output  [9:0]       result;

wire c0, c1, c2, c3, c4, c5, c6, c7;

assign result[0] = x[0];
assign result[9] = c7;

half_adder h0(.in0(x[1]), .in1(x[0]), .cout(c0), .out(result[1]));
full_adder f0(.in0(x[2]), .in1(x[1]), .cin(c0), .out(result[2]), .cout(c1));
full_adder f1(.in0(x[3]), .in1(x[2]), .cin(c1), .out(result[3]), .cout(c2));
full_adder f2(.in0(x[4]), .in1(x[3]), .cin(c2), .out(result[4]), .cout(c3));
full_adder f3(.in0(x[5]), .in1(x[4]), .cin(c3), .out(result[5]), .cout(c4));
full_adder f4(.in0(x[6]), .in1(x[5]), .cin(c4), .out(result[6]), .cout(c5));
full_adder f5(.in0(x[7]), .in1(x[6]), .cin(c5), .out(result[7]), .cout(c6));

full_adder f6(.in0(x[7]), .in1(x[7]), .cin(c6), .out(result[8]), .cout(c7));
full_adder f7(.in0(x[7]), .in1(x[7]), .cin(c7), .out(result[9]), .cout());



endmodule
