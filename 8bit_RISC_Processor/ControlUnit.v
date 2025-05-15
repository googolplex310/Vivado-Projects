`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Diego Davalos, Jonathon Lopez
// 
// Create Date: 04/21/2024 12:49:44 PM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit( //Control Unit takes in opcode signal, modifies control signals, then decodes for directing instruction to ALU
    input clk,
    input [2:0] opcode, // 3 bit input control signal from FPGA that determines CPU process 
    output reg [1:0] alu_op, // 2 bit ALU control signal that specifies the operation, depending on the opcode
    output reg read, // 1 bit Read signal to Registers memory module that tells it to access last calculation
    output reg write, // 1 bit Write signal to Registers memory module that tells it to write current calculation to memory
    output reg switchInput
    );
    
    //opcode:
    always @(posedge clk) //loop that triggers procedural statements whenever an input to or signals in this module (sensitivity list) changes, combinational logic
    begin
        case(opcode) //control signals changed depedning on the following opcode input
            3'b000: begin
                alu_op = 2'b00; //addition operation
                switchInput = 1'b0;
                read = 1'b0;
                write = 1'b0;
            end

            3'b001: begin
                alu_op = 2'b01; //subtraction
                switchInput = 1'b0;
                read = 1'b0;
                write = 1'b0;
            end

            3'b010: begin
                alu_op = 2'b10; //array multiplier
                switchInput = 1'b0;
                read = 1'b0;
                write = 1'b0;
            end
            
            3'b011: begin
                alu_op = 2'b11; //array divider
                switchInput = 1'b0;
                read = 1'b0;
                write = 1'b0;
            end
            
            3'b100: begin
                switchInput = 1'b0;
                //alu_op = 2'b00;
                read = 1'b1; //register read signal
                write = 1'b0;
            end
            
            3'b101: begin
                switchInput = 1'b0;
                //alu_op = 2'b00;
                read = 1'b0;
                write = 1'b1; //register write signal
            end
            
            default: begin //default case - display the user inputs instead
                switchInput = 1'b1;
                read = 1'b0;
                write = 1'b0;
            end
        endcase
    end
endmodule
