`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/17 16:47:42
// Design Name: 
// Module Name: cra
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


module cra(in0, in1, in2, s, e, out );

input [9:0] in0;
input [9:0] in1;
input [9:0] in2;
input [2:0] s; 
input [2:0] e;

output[15:0] out;



wire [35:0] c;
wire [23:0] w;

assign w[23] = 1;

half_adder h0(.in0(in0[0]), .in1(s[0]), .cout(c[0]), .out(out[0]));
half_adder h1(.in0(in0[1]), .in1(c[0]), .cout(c[1]), .out(out[1]));
half_adder h2(.in0(in0[2]), .in1(c[1]), .cout(c[2]), .out(out[2]));


full_adder f0(.in0(in0[3]), .in1(in1[0]), .cin(c[2]), .out(w[0]), .cout(c[3]));
half_adder h3(.in0(w[0]), .in1(s[1]), .cout(c[4]), .out(out[3]));

full_adder f1(.in0(in0[4]), .in1(in1[1]), .cin(c[3]), .out(w[1]), .cout(c[5]));
half_adder h4(.in0(w[1]), .in1(c[4]), .cout(c[6]), .out(out[4]));

full_adder f2(.in0(in0[5]), .in1(in1[2]), .cin(c[5]), .out(w[2]), .cout(c[7]));
half_adder h5(.in0(w[2]), .in1(c[6]), .cout(c[8]), .out(out[5]));

full_adder f3(.in0(in0[6]), .in1(in1[3]), .cin(c[7]), .out(w[3]), .cout(c[9]));
full_adder f4(.in0(w[3]), .in1(in2[0]), .cin(c[8]), .out(w[4]), .cout(c[10]));
half_adder h6(.in0(w[4]), .in1(s[2]), .cout(c[11]), .out(out[6]));

full_adder f5(.in0(in0[7]), .in1(in1[4]), .cin(c[9]), .out(w[5]), .cout(c[12]));
full_adder f6(.in0(w[5]), .in1(in2[1]), .cin(c[10]), .out(w[6]), .cout(c[13]));
half_adder h7(.in0(w[6]), .in1(c[11]), .cout(c[14]), .out(out[7]));

full_adder f7(.in0(in0[8]), .in1(in1[5]), .cin(c[12]), .out(w[7]), .cout(c[15]));
full_adder f8(.in0(w[7]), .in1(in2[2]), .cin(c[13]), .out(w[8]), .cout(c[16]));
half_adder h8(.in0(w[8]), .in1(c[14]), .cout(c[17]), .out(out[8]));

full_adder f9(.in0(in0[9]), .in1(in1[6]), .cin(c[15]), .out(w[9]), .cout(c[18]));
full_adder f10(.in0(w[9]), .in1(in2[3]), .cin(c[16]), .out(w[10]), .cout(c[19]));
half_adder h9(.in0(w[10]), .in1(c[17]), .cout(c[20]), .out(out[9]));

full_adder f11(.in0(~e[0]), .in1(in1[7]), .cin(c[18]), .out(w[11]), .cout(c[21]));
full_adder f12(.in0(w[11]), .in1(in2[4]), .cin(c[19]), .out(w[12]), .cout(c[22]));
half_adder h10(.in0(w[12]), .in1(c[20]), .cout(c[23]), .out(out[10]));

full_adder f13(.in0(~e[0]), .in1(in1[8]), .cin(c[21]), .out(w[13]), .cout(c[24]));
full_adder f14(.in0(w[13]), .in1(in2[5]), .cin(c[22]), .out(w[14]), .cout(c[25]));
half_adder h11(.in0(w[14]), .in1(c[23]), .cout(c[26]), .out(out[11]));

full_adder f15(.in0(~e[0]), .in1(in1[9]), .cin(c[24]), .out(w[15]), .cout(c[27]));
full_adder f16(.in0(w[15]), .in1(in2[6]), .cin(c[25]), .out(w[16]), .cout(c[28]));
half_adder h12(.in0(w[16]), .in1(c[26]), .cout(c[29]), .out(out[12]));

full_adder f17(.in0(e[0]), .in1(in2[7]), .cin(c[27]), .out(w[17]), .cout(c[30]));
full_adder f18(.in0(w[17]), .in1(e[1]), .cin(c[28]), .out(w[18]), .cout(c[31]));
half_adder h13(.in0(w[18]), .in1(c[29]), .cout(c[32]), .out(out[13]));

full_adder f19(.in0(w[23]), .in1(in2[8]), .cin(c[30]), .out(w[19]), .cout(c[33]));
half_adder h14(.in0(w[19]), .in1(c[31]), .cout(c[34]), .out(w[20]));
half_adder h15(.in0(w[20]), .in1(c[32]), .cout(c[35]), .out(out[14]));

full_adder f20(.in0(w[23]), .in1(in2[9]), .cin(c[33]), .out(w[21]), .cout());
half_adder h16(.in0(w[21]), .in1(c[34]), .cout(), .out(w[22]));
half_adder h17(.in0(w[22]), .in1(c[35]), .cout(), .out(out[15]));

endmodule
