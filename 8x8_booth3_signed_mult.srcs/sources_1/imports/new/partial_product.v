`timescale 1ns / 1ps


module partial_product(m, x, tri_x, pp, rst, clk, sout, eout);

input [3:0] m; //multiplier
input [9:0] tri_x; // 3 x multiplicand
input [7:0] x; // multiplicand
input rst, clk;
output [9:0] pp; // partial product
output sout, eout;

// M1 = M*1, M2 = M*2.... N = negative 


assign M1 = ~((m[3] ^ m[2]) | (~(m[1] ^ m[0])));
assign M2 = ~((m[1] ^ m[0]) | (~(m[2] ^ m[1])));
assign M3 = ~((~(m[1] ^ m[0])) | (~(m[3] ^ m[2])));
assign M4 = ~((m[1] ^ m[0]) | (m[2] ^ m[1]) | (~(m[3] ^ m[2])));

assign N = m[3]; // negative
assign N_Z = (M1 | M2 | M3 | M4); // not zero 



assign pp[0] = ((x[0] & M1) | (tri_x[0] & M3)) ^ (N);
assign pp[1] = ((x[1] & M1) | (tri_x[1] & M3) | (x[0] & M2)) ^ (N);
assign pp[2] = ((x[2] & M1) | (tri_x[2] & M3) | (x[1] & M2) | (x[0] & M4)) ^ (N);
assign pp[3] = ((x[3] & M1) | (tri_x[3] & M3) | (x[2] & M2) | (x[1] & M4)) ^ (N);
assign pp[4] = ((x[4] & M1) | (tri_x[4] & M3) | (x[3] & M2) | (x[2] & M4)) ^ (N);
assign pp[5] = ((x[5] & M1) | (tri_x[5] & M3) | (x[4] & M2) | (x[3] & M4)) ^ (N);
assign pp[6] = ((x[6] & M1) | (tri_x[6] & M3) | (x[5] & M2) | (x[4] & M4)) ^ (N);
assign pp[7] = ((x[7] & M1) | (tri_x[7] & M3) | (x[6] & M2) | (x[5] & M4)) ^ (N);
assign pp[8] = ((x[7] & M1) | (tri_x[8] & M3) | (x[7] & M2) | (x[6] & M4)) ^ (N);
assign pp[9] = ((x[7] & (M1|M2)) | (tri_x[9] & M3) | (x[7] & M4)) ^ (N);


assign sout = N;
assign eout = ((~(sout ^ x[7])) & N_Z) | (~sout & ~N_Z);





endmodule
