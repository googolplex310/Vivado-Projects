`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2024 12:08:06 AM
// Design Name: 
// Module Name: InstructionDecoder
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


module InstructionDecoder( 
    
    input clk,
    input add,
    input sub,
    input mult,
    input div,
    input prev,
    input write_en,
    
    output reg [2:0] opcode
    );
    
    
    //converts the multiple 1-bit signal input from the button presses to the corresponding operation code to be sent to ALU or Registers
    always @(posedge clk) begin
        if (add)
            opcode = 3'b000;
        else if (sub)
            opcode = 3'b001;
        else if (mult)
            opcode = 3'b010;
        else if (div)
            opcode = 3'b011;
        else if (prev)
            opcode = 3'b100;
        else if (!write_en) // CPU reset button is negative logic
            opcode = 3'b101;
        else // default to displaying user inputs
            opcode = 3'b110;
         
    end
    
    /*always @(*) begin
    if (op == 5'b00010) //add, up btn
        opcode = 3'b000;
    else if (op == 5'b10000) //sub, down btn
        opcode = 3'b001;
    else if (op == 5'b00100) //mult, left btn
        opcode = 3'b010;
    else if (op == 5'b01000) //div, right btn
        opcode = 3'b011;
    else if (op == 5'b00001) //prev, center btn
        opcode = 3'b100;
    else if (op == 5'b00011) //write, up and center btn
        opcode = 3'b101;
    else
        opcode = 3'b110;
    end
    */
    
endmodule
