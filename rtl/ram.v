`timescale 1ns / 1ps
module ram(bus,addr,clk,rst,RI,RO,ext_addr,ext_data,load,start);
input clk,rst,RI,RO,load,start;
input [3:0]addr,ext_addr;
input [7:0]ext_data;
inout [7:0] bus;
reg [7:0]ram [15:0];
integer i;
always @ (posedge clk or posedge rst) begin
if(rst)
for( i = 0;i < 16;i = i + 1)
begin
ram[i] <= 8'b00000000;
end
else if(!start && load)
ram[ext_addr] <= ext_data;
else if(RI)
ram[addr] <= bus;
end
assign bus = RO ? ram[addr] : 8'bz;
endmodule
