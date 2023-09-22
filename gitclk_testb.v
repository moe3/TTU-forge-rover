`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 10:16:04 AM
// Design Name: 
// Module Name: gitclk_testb
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


module gitclk_testb(

    );
     reg clk,rst;

     // Generally, you make registers for inputs because you usually want to
     // make procedural changes to them to see how the output is affected. In
     // this case, we could get away with using wires if we also made appropriate
     // changes to the assignments so they were continuous assignments instead
     // of procedural assignments.
     //reg [31:0] scale = 1000;
     // Make a wire for your output.
    // reg scale;
    wire [3:0] ja;
     wire out;

     // Instantiate the module we're testbenching.
     git_clk test(
          .clk(clk),
          .reset(rst),
          .ja(ja),
          .clk_out(out)
          );

     // Initialize the clock and reset to 0.
     initial begin
          clk = 0;
          rst = 0;
     end

     // Clock is 100 MHz
     always #5 clk = !clk;

endmodule
