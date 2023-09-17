`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2023 01:15:38 AM
// Design Name: 
// Module Name: pwm_excode_testb
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


module pwm_excode_testb;
 // Inputs
 reg clk;
 reg increase_duty;
 reg decrease_duty;
 // Outputs
 wire PWM_OUT;
 // Instantiate the PWM Generator with variable duty cycle in Verilog
 pwm_excode UUT(
  .clk(clk), 
  .increase_duty(increase_duty), 
  .decrease_duty(decrease_duty), 
  .PWM_OUT(PWM_OUT)
 );
 // Create 100Mhz clock
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end 
 initial begin
  increase_duty = 0;
  decrease_duty = 0;
  #100; 
    increase_duty = 1; 
  #100;// increase duty cycle by 10%
    increase_duty = 0;
  #100; 
    increase_duty = 1;
  #100;// increase duty cycle by 10%
    increase_duty = 0;
  #100; 
    increase_duty = 1;
  #100;// increase duty cycle by 10%
    increase_duty = 0;
  #100;
    decrease_duty = 1; 
  #100;//decrease duty cycle by 10%
    decrease_duty = 0;
  #100; 
    decrease_duty = 1;
  #100;//decrease duty cycle by 10%
    decrease_duty = 0;
  #100;
    decrease_duty = 1;
  #100;//decrease duty cycle by 10%
    decrease_duty = 0;
 end
endmodule