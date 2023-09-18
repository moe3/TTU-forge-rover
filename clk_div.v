`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2023 08:47:33 PM
// Design Name: 
// Module Name: clk_div
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

// first part of our pwm code 
module clk_div(
	input clk,
	input reset,
	
	//output [4:0] led,
	output [3:0] ja,
	//input sw,
	output reg clk_out = 0
    );

	// f = (100 MHz)/(4*scale)
     // scale = 1000 --> f = 25 kHz
    //reg [31:0] scale;
    localparam constantNumber = 4000;
	reg [15:0] count = 16'b0;
	always @(posedge clk)
          if (reset) begin
               count <= 16'b0;
               clk_out <= 1'b0;
          end else if (count == constantNumber - 1) begin
               count <= 16'b0;
               clk_out <= ~clk_out;
               // statement that changes pwm output 
          end else if (count < 100) begin
               count <= count +1;
               
          end else begin
          //     count <= count + 1;
               clk_out <= clk_out;
              count <= 0; 
          end
// count <= 0;
//    assign clk_out = clk;
  //  assign led [0] = (count <20)? 1:0; // 20% duty cycle 
  //  assign led [1] = (count <40)? 1:0; // 40% duty cycle 
   // assign led [2] = (count <60)? 1:0; // 60% duty cycle 
   // assign led [3] = (count <80)? 1:0; // 80% duty cycle 
   // assign led [4] = (count <100)? 1:0; // 100% duty cycle 
    assign ja [0] = (count <20)? 1:0; // 20% duty cycle  
    assign ja [1] = (count <60)? 1:0; // 20% duty cycle  
    assign ja [2] = (count <80)? 1:0; // 20% duty cycle  
    assign ja [3] = (count <100)? 1:0; // 20% duty cycle  
  
 //assign switches to enable ja outputs 
   // assign sw = (count <33)? 1:0; // 20% duty cycle  
 //   assign sw = {1{ja[0]}};

endmodule