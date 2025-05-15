`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2024 04:40:53 AM
// Design Name: 
// Module Name: block0
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


module block0(

    input A,
    input [3:0] B,

    output wire [2:0] row_mux,    
    output quo

);

    wire half_out;
    wire [1:0] row_wire; 

    HA inst0(.a(A), .b(B[0]), .c_out(half_out), .sum(row_mux[0]));
    
    FA inst1(.a(1'b0), .b(~B[1]), .c_in(half_out), .sum(row_mux[1]), .c_out(row_wire[0]));
    FA inst2(.a(1'b0), .b(~B[2]), .c_in(row_wire[0]), .sum(row_mux[2]), .c_out(row_wire[1]));
    //assign quo = row_mux[2];
    FA inst3(.a(1'b0), .b(~B[3]), .c_in(row_wire[1]), .sum(quo), .c_out());
    
endmodule
