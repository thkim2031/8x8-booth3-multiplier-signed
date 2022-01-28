`timescale 1ns / 1ps

module top( rst, clk, multiplicand, multiplier, final_result);

input rst, clk;
input [7:0]     multiplicand, multiplier;
output[15:0]    final_result;

reg [7:0] multiplier_r, multiplicand_r;
wire [7:0] multiplier_w, multiplicand_w;

reg [15:0] final_result_r;
wire [15:0] final_result_w;

booth booth0(.rst(rst), .clk(clk), .x(multiplicand_w), .multiplier(multiplier_w), .final_result(final_result_w));



always @(posedge clk) begin
    multiplicand_r <= multiplicand;
    multiplier_r <= multiplier;
    final_result_r <= final_result_w; 
end

assign multiplicand_w = multiplicand_r;
assign multiplier_w = multiplier_r;
assign final_result = final_result_r;
    
endmodule