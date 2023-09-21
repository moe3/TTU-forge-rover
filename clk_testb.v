`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 02:46:58 PM
// Design Name: 
// Module Name: clk_testb
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


module clk_testb(
    );
    
    reg clk;
    reg rst;
    wire clk_out;
    
    //instantiate 
    clk_div UUT(
    .clk(clk),
    .rst(rst),
    .clk_divider(clk_out));
    
    
    initial begin
          clk = 0;
          rst = 0;
     end
     
   always #5 clk = !clk;
    
endmodule
