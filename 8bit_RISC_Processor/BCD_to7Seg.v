`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez
// 
// Create Date: 04/29/2024 10:59:06 PM
// Design Name: 
// Module Name: BCD_to7Seg
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


module BCD_to7Seg(

    input wire [3:0] bitVal,
    output reg [7:0] digit

);     
     
     always @ (*)
          begin
               case(bitVal)        //hgfedcba
                4'b0000 : digit = 8'b11000000; //to display 0
                4'b0001 : digit = 8'b11111001; //to display 1
                4'b0010 : digit = 8'b10100100; //to display 2
                4'b0011 : digit = 8'b10110000; //to display 3
                4'b0100 : digit = 8'b10011001; //to display 4
                4'b0101 : digit = 8'b10010010; //to display 5
                4'b0110 : digit = 8'b10000010; //to display 6
                4'b0111 : digit = 8'b11111000; //to display 7
                4'b1000 : digit = 8'b10000000; //to display 8
                4'b1001 : digit = 8'b10010000; //to display 9
                default : digit = 8'b10111111; //dash
           endcase
      end

endmodule
