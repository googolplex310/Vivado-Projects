`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez
// 
// Create Date: 05/05/2024 04:22:34 PM
// Design Name: 
// Module Name: divider_4bit_tb
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


module divider_4bit_tb();

    reg [3:0] a_tb, b_tb; 
    reg [3:0] quotient;
    reg [3:0] remainder;
    
    wire [3:0] quo_tb;
    wire [3:0] rem_tb;
    
    integer i, j;
    integer success = 0, fail = 0;
    
    divider_4bit uut(.A_input(a_tb), .B_input(b_tb), .quotient(quo_tb), .remainder(rem_tb));
    
    initial begin
        for(i=0; i < 16; i = i + 1) 
            begin
            {a_tb} = i;
                for(j=0; j<16; j = j + 1) 
                begin
                {b_tb} = j;     
                //#10;
                quotient = (a_tb / b_tb);
                remainder = (a_tb % b_tb);
                #3;   
                if (quotient == quo_tb && remainder == rem_tb) 
                    begin
                    $display(a_tb," / ", b_tb, " passed. Since quotient = ",quotient," and quo_tb = ",quo_tb, ". Also remainder = ",remainder," and rem_tb =",rem_tb,);
                    success = success + 1;
                    end 
                else 
                    begin
                    $display(a_tb," / ", b_tb, " failed. Why: quotient = ",quotient," and quo_tb = ",quo_tb, ". Also remainder = ",remainder," and rem_tb =",rem_tb,);
                    fail = fail + 1;
                    end 
                end  
            end
        $finish;   
    end    
endmodule

