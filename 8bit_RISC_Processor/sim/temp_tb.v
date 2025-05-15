`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2024 04:59:03 AM
// Design Name: 
// Module Name: temp_tb
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


module temp_tb();

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns
    
    // Inputs
    reg [3:0] A_input;
    reg [3:0] B_input;
    
    // Outputs
    wire [3:0] quotient;
    wire [3:0] remainder;
    
    // Clock
    reg clk;
    
    // Instantiate the divider_8bit module
    divider_8bit dut (
        .A_input(A_input),
        .B_input(B_input),
        .quotient(quotient),
        .remainder(remainder)
    );
    
    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;
    
    // Stimulus
    initial begin
        // Initialize inputs
        A_input = 4'b1111; // Example dividend
        B_input = 4'b0001;  // Example divisor
        
        #10;
        
        // End simulation
        $finish;
    end
    
endmodule

