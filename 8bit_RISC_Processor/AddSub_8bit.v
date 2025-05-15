`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez
// 
// Create Date: 04/24/2024 10:08:05 PM
// Design Name: 
// Module Name: AddSub_8bit
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


module AddSub_8bit(
    input [7:0] a,
    input [7:0] b,
    input cin, // if 1, subtract, if 0, add. This is XOR'ed with b
    output [7:0] s,
    output cout, //msb decides if answer is positive or negative
    output overflow
    );

    wire [7:0] bin;
    wire [8:1] carry; 

    assign bin[0] = b[0]^cin;
    assign bin[1] = b[1]^cin;
    assign bin[2] = b[2]^cin;
    assign bin[3] = b[3]^cin;
    assign bin[4] = b[4]^cin;
    assign bin[5] = b[5]^cin;
    assign bin[6] = b[6]^cin;
    assign bin[7] = b[7]^cin;

    FA FA0(a[0],bin[0],cin,s[0],carry[1]);
    FA FA1(a[1],bin[1],carry[1],s[1],carry[2]);
    FA FA2(a[2],bin[2],carry[2],s[2],carry[3]);
    FA FA3(a[3],bin[3],carry[3],s[3],carry[4]);
    FA FA4(a[4],bin[4],carry[4],s[4],carry[5]);
    FA FA5(a[5],bin[5],carry[5],s[5],carry[6]);
    FA FA6(a[6],bin[6],carry[6],s[6],carry[7]);
    FA FA7(a[7],bin[7],carry[7],s[7],carry[8]);

    assign cout = (cin ^ carry[8]);
    assign overflow = carry[7]^carry[8]; // overflow flag is meaningless due to
                                        // unsigned addition and subtraction here
endmodule