`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2024 01:57:30 AM
// Design Name: 
// Module Name: Register
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


module Register(
    input clk,
    input read,
    input write,
    input [15:0] result, //Result from ALU
    output reg [15:0] readResult //Reads the chosen register
    );
    
    reg [15:0] registers [0:1]; //8-bit storage register initialized to 0
    //readResult = 8'h00; //8-bit register to hold result
    //reg c = 0;
    
    
    integer i,j;
    initial begin
        for (j = 0; j < 2; j = j + 1) begin
            registers[j] <= 8'b00000000;
        end
    end
    
    /*
    always@(*) begin
        readResult <= registers[0]; //always send the current register to the result output, nonblocking assignment
    end
    */
    
    
    
    
    always @(posedge clk) begin
        if (write) begin
            registers[0] <= result;
        end else if (read) begin
            readResult <= registers[0];
        end else begin
            readResult <= result;
        end
    end
    
    
    
    
    /*
    always @(posedge clk) begin
        readResult = result;
        if (write == 1'b1)
            register1 = readResult;
        if (read == 1'b1)
            readResult = register1;
    end
    */
    
    
    
    
    
    
    /*h
    always@(write) begin
        register1 = result; //stores current result in register 1, quick memory
        
        if (write == 1'b1)
            register2 = result;
        if (read == 1'b1)
            readResult = register2;
        else
            readResult = register2;
    end
    */
    
    /*
    always@(write == 1'b1)begin
        register1 = result;
        if (read == 1'b1)
            readResult = register1;
    end
    */
    
    /*
    always@(clk) begin
        if (c==0)begin
        if (register1 != result)
           c=1;
        register1 <= result;        
        end        
        else begin
        if (register2 != result)
                   c=0;
        register2 <= result;
        end
        
        
        if (read) begin
             if(c==0)
            readResult = register2;
            else 
            readResult=register1;
        end
    end
    */
    
endmodule
