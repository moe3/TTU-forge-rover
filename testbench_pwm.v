`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 12:21:57 PM
// Design Name: 
// Module Name: testbench_pwm
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


module testbench_pwm(

    );
    reg clock;
    reg [1:0] speed; // 1:0 3bit
  //  wire led0;
    reg reset;
    wire PWM;
    
    
    // Instantion (easiest way to instantiate 
    pwm_testtwo UUT(clock, speed, reset, PWM);
    
    initial begin 
        clock = 0;
        speed = 0;
        reset = 0;
        led0 = 0;
        #10;
        speed = 1;
        reset = 0; 
        #300; 
        speed = 2;
        reset = 0; 
        #300; 
        speed = 3;
        reset = 0; 
        #300; 
        sw0 = 0;
        speed = 0;
        reset = 1; 
        #10; 
    end 
// every 1 tick will invert the clock on the basys board 
    always begin 
    #1 clock = ~clock;
end
 
    
endmodule

