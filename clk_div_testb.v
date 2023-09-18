`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2023 08:49:07 PM
// Design Name: 
// Module Name: clk_div_testb
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


module clk_div_testb(

    );
     // Make a register for the clock you're going to generate and the reset.
     reg clk = 0,rst = 0;
     wire [4:0] led;

     // Generally, you make registers for inputs because you usually want to
     // make procedural changes to them to see how the output is affected. In
     // this case, we could get away with using wires if we also made appropriate
     // changes to the assignments so they were continuous assignments instead
     // of procedural assignments.
     reg [31:0] scale = 1000;
     // Make a wire for your output.
     wire out;

     // Instantiate the module we're testbenching.
     clk_div test(
          .clk(clk),
          .reset(rst),
          .scale(scale),
          .clk_out(out),
          .led(led)
          );

     // Initialize the clock and reset to 0.
  //   initial begin
 //         clk = 0;
  //        rst = 0;
  //   end

     // Clock is 100 MHz
     always #5 clk = !clk;

endmodule