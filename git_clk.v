`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 10:15:14 AM
// Design Name: 
// Module Name: git_clk
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


module git_clk(
	input clk,
	input reset,
//	input [31:0] scale,
	output reg clk_out = 0,
	output [3:0] ja
    );

	// f = (100 MHz)/(4*scale)
     // scale = 1000 --> f = 25 kHz
	reg [15:0] count = 16'd0;
	localparam scale = 10000;
	always @(posedge clk)
          if (reset) begin
               count <= 16'd0;
               clk_out <= 1'd0;
          end else if (count == scale - 1) begin
               count <= 16'd0;
               clk_out <= ~clk_out;
          end else begin
               count <= count + 1;
               clk_out <= clk_out;
          end
    always @(posedge clk_out) begin 
        if(count < 100) count <= count +1;
        else count <= 0;
        end   
    assign ja [0] = (count < 25) ? 1:0;
    assign ja [1] = (count < 50) ? 1:0;
    assign ja [2] = (count < 75) ? 1:0;
    assign ja [3] = (count < 95) ? 1:0;
endmodule