`timescale 1ns / 1ps


module booth(RST, CLK, x, multiplier, final_result);

input   [7:0]     x;
input             RST, CLK;
input   [7:0]     multiplier;
output  [15:0]    final_result;
         
wire     [9:0]    m;
wire     [9:0]    pp[2:0];
wire     [2:0]    sout;
wire     [2:0]    eout;

wire     [9:0]    result;

assign m[9] = multiplier[7];
assign m[8] = multiplier[7];
assign m[7] = multiplier[6];
assign m[6] = multiplier[5];
assign m[5] = multiplier[4];
assign m[4] = multiplier[3];
assign m[3] = multiplier[2];
assign m[2] = multiplier[1];
assign m[1] = multiplier[0];
assign m[0] = 0;        

adder3M adder3M(.x(x), .result(result));
    
partial_product pp0(.x(x), .m(m[3:0]), .tri_x(result), .pp(pp[0]), .RST(RST), .CLK(CLK), .sout(sout[0]), .eout(eout[0]));
partial_product pp1(.x(x), .m(m[6:3]), .tri_x(result), .pp(pp[1]), .RST(RST), .CLK(CLK), .sout(sout[1]), .eout(eout[1]));
partial_product pp2(.x(x), .m(m[9:6]), .tri_x(result), .pp(pp[2]), .RST(RST), .CLK(CLK), .sout(sout[2]), .eout(eout[2]));

cra cra0(.in0(pp[0]), .in1(pp[1]), .in2(pp[2]), .s(sout), .e(eout), .out(final_result));




endmodule
