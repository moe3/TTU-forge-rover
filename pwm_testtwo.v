`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 12:20:09 PM
// Design Name: 
// Module Name: pwm_testtwo
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


module pwm_testtwo(

   input clock, 
    input [1:0] speed, // 1:0
    //output led0,
    input reset,
    output PWM
    );
    
reg [4:0] counter; // sets the period 32bit from 0-31
reg [4:0] width; // stores the width of the desired pulse 
reg temp_PWM; // this is to manipulate the output

// settimg imitial values for vars
initial begin
    counter = 0;
    width = 0;
    temp_PWM = 0;
end 

// if counter reaches over 31 then the counter resets 
// this is how the pulse resets. For our application we need a period of 60Hz

always@(posedge clock) begin
    if (reset)
        counter <= 0;
    else   
        counter  <= counter +1;
        
    if (counter < width) 
        temp_PWM <= 1;
    else 
        temp_PWM <= 0;
end 


// the duty cycle scales by 2^n, n being the period and width of the counter 
always @ (*) begin
    case(speed)
        2'd0 : width = 5'd0; // 0% duty cycle 
        2'd1 : width = 5'd8; // 25% duty cycle 
        2'd2 : width = 5'd16; // 50% duty cycle 
        2'd3 : width = 5'd24; // 75% duty cycle 
        default : width = 5'd0;
    endcase
end 
 
assign PWM = temp_PWM;
//assign led0 = PWM;


endmodule