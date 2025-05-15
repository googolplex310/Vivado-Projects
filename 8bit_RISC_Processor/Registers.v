`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Diego Davalos
// 
// Create Date: 03/28/2024 12:45:47 PM
// Design Name: 
// Module Name: Registers
// Project Name: 8-bit RISC architecture
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


module Registers(
    input clk, //Clock input
    input reset, //Reset input
    input read,
    //input [2:0] readAddr, //Determines which registers to read from
    //input [2:0] writeAddr, //Determines which register to write data on
    input [7:0] result, //Result from ALU
    //input writeEnable, //Write enable signal
    output reg [7:0] readResult //Reads the chosen register
    );

reg [7:0] registers [0:7]; //2D array of 8-bit registers defined for storage
reg [2:0] counter; //3 bit register that allows a way of checking if current register and incoming result are different

//base case - initialize all registers to 0
integer i,j;
initial begin
    for (j = 0; j < 8; j = j + 1) begin
        registers[j] <= 8'b00000000;
    end
end

//sequential logic that updates the registers
always @(posedge clk or posedge reset)begin
    if (reset) begin //use begin after if declaration if it holds multiple statements
        for (i = 0; i < 8; i = i + 1) begin
            registers[i] <= 8'b00000000;
        end
        readResult <= 8'b00000000;
    end else begin //using end and begin here bc multiple statements
        if (result != registers[counter]) begin //updates current register with result only if result has changed
            registers[counter] <= result;//update current register with incoming result
            if (counter == 3'b111) //no begin needed because only one statement
                counter <= 3'b000; //resets counter when max value is reached
            else
                counter <= counter + 1; //increments counter if not max value
        end
    end 
end

//combinational logic for readResult output
always@(*) begin
    readResult <= registers[counter]; //always send the current register to the result output, nonblocking assignment
end

endmodule
