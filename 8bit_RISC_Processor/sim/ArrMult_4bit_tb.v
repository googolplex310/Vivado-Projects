`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2024 09:06:22 PM
// Design Name: 
// Module Name: ArrMult_4bit_tb
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


module ArrMult_4bit_tb();

reg [3:0] a_tb, b_tb;
wire [7:0] prod_tb;

ArrMult_4bit uut(.a(a_tb), .b(b_tb), .prod(prod_tb));

initial begin
    /*
    a_tb = 4'b1101;
    b_tb = 4'b1001;
    #10
    
    // Continute With Other Testcases
    a_tb = 4'b0011;
    b_tb = 4'b1011;
    #10
    
    a_tb = 4'b0100;
    b_tb = 4'b0000;
    #10
    
    a_tb = 4'b1111;
    b_tb = 4'b0101;
    #10
    
    a_tb = 4'b1101;
    b_tb = 4'b0011;
    #10
    
    a_tb = 4'b1111;
    b_tb = 4'b1111;
    #10
    */
    a_tb = 4'b0000;
    b_tb = 4'b0000;
    #10
    
    a_tb = 4'b1101;
    b_tb = 4'b1001;
    #10
    
    a_tb = 4'b1010;
    b_tb = 4'b0010;
    #10
    
    a_tb = 4'b1111;
    b_tb = 4'b1111;
    #10

    $finish;
end
endmodule