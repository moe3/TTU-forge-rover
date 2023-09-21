`timescale 1ns/1ps

module clk_div(
    input clk,
    input rst,
    output reg clk_divider
    );
 // const number to divide clk by to get 1Hz signal    
 localparam constNumber = 50000000;
 
 reg [31:0] count;
 // counter block 
always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1)
        count <= 32'b0;
    else if (count == constNumber - 1)
        count <= 32'b0;
    else
        count <= count + 1;
end
//flip flop with comparator 
always @ (posedge(clk), posedge(rst))
begin
    if (rst == 1'b1)
        clk_divider <= 1'b0;
    else if (count == constNumber - 1)
        clk_divider <= ~clk_divider;
    else
        clk_divider <= clk_divider;
end
endmodule
