`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 05:38:32 PM
// Design Name: 
// Module Name: top_time
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


module top_time(
    input clk,
    input reset,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    output [7:0] anode,
    output [7:0] cathode
);

time_multiplexer inst_time_mux(
    .clk(clk),
    .reset(reset),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .anode(anode),
    .cathode(cathode)
);

endmodule