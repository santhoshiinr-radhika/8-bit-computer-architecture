`timescale 1ns / 1ps
module b_reg(clk,rst,bus,BI);
input clk,rst,BI;
input [7:0]bus;
reg [7:0]b_reg;
always @ (posedge clk or posedge rst) begin
if(rst)
b_reg <= 8'b00000000;
else if(BI)
b_reg <= bus;
end
endmodule
