`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez & Diego Davalos
// 
// Create Date: 04/30/2024 04:10:56 PM
// Design Name: 
// Module Name: digit_Sep
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


module digit_Sep(
    input [7:0] A_channel, [7:0] B_channel, 
    input [15:0] input_data,
    
    output reg [3:0] digit_1, 
    output reg [3:0] digit_1A, 
    output reg [3:0] digit_1B,
    
    output reg [3:0] digit_2, 
    output reg [3:0] digit_2A, 
    output reg [3:0] digit_2B,
    
    output reg [3:0] digit_3, 
    output reg [3:0] digit_3A, 
    output reg [3:0] digit_3B,
    
    output reg [3:0] digit_4, 
    output reg [3:0] digit_5
    
    //output reg switchDisplay
    
);

// Declare variables for calculations
reg [15:0] temp;

reg [7:0] temp_A;
reg [7:0] temp_B;

reg switchDisplay;

// Separate the digits using procedural assignments
always @*
    begin // diagnose the result's decimal form
    
            temp = input_data;
            digit_1 = temp % 10;
            temp = temp / 10;
            digit_2 = temp % 10;
            temp = temp / 10;
            digit_3 = temp % 10;
            temp = temp / 10;
            digit_4 = temp % 10;
            temp = temp / 10;
            digit_5 = temp % 10;
            
            // diagnose A's decimal form
            temp_A = A_channel;
            digit_1A = temp_A % 10;
            temp_A = temp_A / 10;
            digit_2A = temp_A % 10;
            temp_A = temp_A / 10;
            digit_3A = temp_A % 10;

            // diagnose B's decimal form
            temp_B = B_channel;
            digit_1B = temp_B % 10;
            temp_B = temp_B / 10;
            digit_2B = temp_B % 10;
            temp_B = temp_B / 10;
            digit_3B = temp_B % 10;        
     
    end

endmodule

