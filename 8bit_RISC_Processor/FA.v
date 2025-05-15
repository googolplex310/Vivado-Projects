`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez
// 
// Create Date: 04/24/2024 10:03:16 PM
// Design Name: 
// Module Name: FA
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


module FA(
    input a,
    input b,
    input c_in,
    output sum,
    output c_out
    );

    //wire wire1, wire2, wire3;

    assign sum = a ^ b ^ c_in;
    //xor (wire1, a, b);  wire1 = a ^ b;
    //xor (sum, wire1, c_in); // sum = wire1 ^ c_in;


    assign c_out = (c_in * (a ^ b) + (a * b));
    //and (wire2, a, b); // wire2 = a * b; 
    //and (wire3, c_in, wire1); // wire3 = c_in * wire1; 
    //or (c_out, wire3, wire2); // c_out = wire3 + wire2;

endmodule