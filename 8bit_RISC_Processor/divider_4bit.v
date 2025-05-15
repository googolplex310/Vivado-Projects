`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez
// 
// Create Date: 05/05/2024 12:54:42 AM
// Design Name: 
// Module Name: divider_8bit
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


module divider_4bit(

    input [3:0] A_input,
    input [3:0] B_input,
    
    output [3:0] quotient,
    output [3:0] remainder

);

    
    wire [2:0] row0_mux;
    wire quo3;
    wire [2:0] mux_toBlock1;

    // row0 of block0 and muxes 0
    block0 inst0(.A(A_input[3]), .B(B_input), .row_mux(row0_mux), .quo(quo3));
    
    mux2to1 inst1(.a(A_input[3]), .b(row0_mux[0]), .sel(quo3), .out(mux_toBlock1[0]));
    mux2to1 inst2(.a(1'b0), .b(row0_mux[1]), .sel(quo3), .out(mux_toBlock1[1]));
    mux2to1 inst3(.a(1'b0), .b(row0_mux[2]), .sel(quo3), .out(mux_toBlock1[2]));
   
    assign quotient[3] = ~quo3;
    
    
    //row1 of block1 and muxes 1
    wire half_out1;
    wire [2:0] row_mux1;
    wire [1:0] row_wire1; 
    wire quo2;


    FA inst4(.a(A_input[2]), .b(~B_input[0]), .c_in(1'b1), .sum(row_mux1[0]), .c_out(half_out1));
    
    FA inst5(.a(mux_toBlock1[0]), .b(~B_input[1]), .c_in(half_out1), .sum(row_mux1[1]), .c_out(row_wire1[0]));
    FA inst6(.a(mux_toBlock1[1]), .b(~B_input[2]), .c_in(row_wire1[0]), .sum(row_mux1[2]), .c_out(row_wire1[1]));
    FA inst7(.a(mux_toBlock1[2]), .b(~B_input[3]), .c_in(row_wire1[1]), .sum(quo2), .c_out());
    
    wire [2:0] mux_toBlock2;
    
    mux2to1 inst8(.a(A_input[2]), .b(row_mux1[0]), .sel(quo2), .out(mux_toBlock2[0]));
    mux2to1 inst9(.a(mux_toBlock1[0]), .b(row_mux1[1]), .sel(quo2), .out(mux_toBlock2[1]));
    mux2to1 inst10(.a(mux_toBlock1[1]), .b(row_mux1[2]), .sel(quo2), .out(mux_toBlock2[2]));
    
    assign quotient[2] = ~quo2;
    
    
    //row2 of block2 and muxes 2
 
    wire [2:0] row_mux2;
    wire [1:0] row_wire2; 
    wire quo1;


    FA inst11(.a(A_input[1]), .b(~B_input[0]), .c_in(1'b1), .sum(row_mux2[0]), .c_out(half_out2));
    
    FA inst12(.a(mux_toBlock2[0]), .b(~B_input[1]), .c_in(half_out2), .sum(row_mux2[1]), .c_out(row_wire2[0]));
    FA inst13(.a(mux_toBlock2[1]), .b(~B_input[2]), .c_in(row_wire2[0]), .sum(row_mux2[2]), .c_out(row_wire2[1]));
    FA inst14(.a(mux_toBlock2[2]), .b(~B_input[3]), .c_in(row_wire2[1]), .sum(quo1), .c_out());
    
    wire [2:0] mux_toBlock3;
    
    mux2to1 inst15(.a(A_input[1]), .b(row_mux2[0]), .sel(quo1), .out(mux_toBlock3[0]));
    mux2to1 inst16(.a(mux_toBlock2[0]), .b(row_mux2[1]), .sel(quo1), .out(mux_toBlock3[1]));
    mux2to1 inst17(.a(mux_toBlock2[1]), .b(row_mux2[2]), .sel(quo1), .out(mux_toBlock3[2]));
        
    assign quotient[1] = ~quo1;

    
    //row3 of block3 and muxes 3
    wire half_out3;
    wire [2:0] row_mux3;
    wire [1:0] row_wire3; 
    wire quo0;

    FA inst18(.a(A_input[0]), .b(~B_input[0]), .c_in(1'b1), .sum(row_mux3[0]), .c_out(half_out3));
    
    FA inst19(.a(mux_toBlock3[0]), .b(~B_input[1]), .c_in(half_out3), .sum(row_mux3[1]), .c_out(row_wire3[0]));
    FA inst20(.a(mux_toBlock3[1]), .b(~B_input[2]), .c_in(row_wire3[0]), .sum(row_mux3[2]), .c_out(row_wire3[1]));
    FA inst21(.a(mux_toBlock3[2]), .b(~B_input[3]), .c_in(row_wire3[1]), .sum(quo0), .c_out());
    
    
    mux2to1 inst22(.a(A_input[0]), .b(row_mux3[0]), .sel(quo0), .out(remainder[0]));
    mux2to1 inst23(.a(mux_toBlock3[0]), .b(row_mux3[1]), .sel(quo0), .out(remainder[1]));
    mux2to1 inst24(.a(mux_toBlock3[1]), .b(row_mux3[2]), .sel(quo0), .out(remainder[2]));
    mux2to1 inst25(.a(mux_toBlock3[2]), .b(row_mux3[2]), .sel(quo0), .out(remainder[3]));
    
    assign quotient[0] = ~quo0;

endmodule

