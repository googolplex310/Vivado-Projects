`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer(s): Matthew Kim and Jonathan Lopez 
// 
// Create Date: 05/03/2024 04:59:05 PM
// Design Name: 
// Module Name: ArrMult_8bit
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

module ArrMult_8bit(

    input [7:0] a, b,
    output wire [15:0] prod
    
    );

    wire [55:0] carry; //The number of carry bits that are in the array multiplier adder
    wire [42:0] partialSum; //The number of inner additions that are within the array multiplier adder
    
    //Partial Products
    wire [7:0] pp [0:7]; //Change from 3 to 7 as each partial product can now be 8 bits

    //Assign Partial Products
    //row 0
    mux2to1 m00(.a(a[0]), .b(1'b0), .sel(b[0]), .out(pp[0][0]));
    mux2to1 m01(.a(a[1]), .b(1'b0), .sel(b[0]), .out(pp[0][1]));
    mux2to1 m02(.a(a[2]), .b(1'b0), .sel(b[0]), .out(pp[0][2]));
    mux2to1 m03(.a(a[3]), .b(1'b0), .sel(b[0]), .out(pp[0][3]));
    mux2to1 m04(.a(a[4]), .b(1'b0), .sel(b[0]), .out(pp[0][4]));
    mux2to1 m05(.a(a[5]), .b(1'b0), .sel(b[0]), .out(pp[0][5]));
    mux2to1 m06(.a(a[6]), .b(1'b0), .sel(b[0]), .out(pp[0][6]));
    mux2to1 m07(.a(a[7]), .b(1'b0), .sel(b[0]), .out(pp[0][7]));
    
    //row 1
    mux2to1 m10(.a(a[0]), .b(1'b0), .sel(b[1]), .out(pp[1][0]));
    mux2to1 m11(.a(a[1]), .b(1'b0), .sel(b[1]), .out(pp[1][1]));
    mux2to1 m12(.a(a[2]), .b(1'b0), .sel(b[1]), .out(pp[1][2]));
    mux2to1 m13(.a(a[3]), .b(1'b0), .sel(b[1]), .out(pp[1][3]));
    mux2to1 m14(.a(a[4]), .b(1'b0), .sel(b[1]), .out(pp[1][4]));
    mux2to1 m15(.a(a[5]), .b(1'b0), .sel(b[1]), .out(pp[1][5]));
    mux2to1 m16(.a(a[6]), .b(1'b0), .sel(b[1]), .out(pp[1][6]));
    mux2to1 m17(.a(a[7]), .b(1'b0), .sel(b[1]), .out(pp[1][7]));

    //row 2
    mux2to1 m20(.a(a[0]), .b(1'b0), .sel(b[2]), .out(pp[2][0]));
    mux2to1 m21(.a(a[1]), .b(1'b0), .sel(b[2]), .out(pp[2][1]));
    mux2to1 m22(.a(a[2]), .b(1'b0), .sel(b[2]), .out(pp[2][2]));
    mux2to1 m23(.a(a[3]), .b(1'b0), .sel(b[2]), .out(pp[2][3]));
    mux2to1 m24(.a(a[4]), .b(1'b0), .sel(b[2]), .out(pp[2][4]));
    mux2to1 m25(.a(a[5]), .b(1'b0), .sel(b[2]), .out(pp[2][5]));
    mux2to1 m26(.a(a[6]), .b(1'b0), .sel(b[2]), .out(pp[2][6]));
    mux2to1 m27(.a(a[7]), .b(1'b0), .sel(b[2]), .out(pp[2][7]));
    
    //row 3
    mux2to1 m30(.a(a[0]), .b(1'b0), .sel(b[3]), .out(pp[3][0]));
    mux2to1 m31(.a(a[1]), .b(1'b0), .sel(b[3]), .out(pp[3][1]));
    mux2to1 m32(.a(a[2]), .b(1'b0), .sel(b[3]), .out(pp[3][2]));
    mux2to1 m33(.a(a[3]), .b(1'b0), .sel(b[3]), .out(pp[3][3]));
    mux2to1 m34(.a(a[4]), .b(1'b0), .sel(b[3]), .out(pp[3][4]));
    mux2to1 m35(.a(a[5]), .b(1'b0), .sel(b[3]), .out(pp[3][5]));
    mux2to1 m36(.a(a[6]), .b(1'b0), .sel(b[3]), .out(pp[3][6]));
    mux2to1 m37(.a(a[7]), .b(1'b0), .sel(b[3]), .out(pp[3][7]));
    
    //row 4
    mux2to1 m40(.a(a[0]), .b(1'b0), .sel(b[4]), .out(pp[4][0]));
    mux2to1 m41(.a(a[1]), .b(1'b0), .sel(b[4]), .out(pp[4][1]));
    mux2to1 m42(.a(a[2]), .b(1'b0), .sel(b[4]), .out(pp[4][2]));
    mux2to1 m43(.a(a[3]), .b(1'b0), .sel(b[4]), .out(pp[4][3]));
    mux2to1 m44(.a(a[4]), .b(1'b0), .sel(b[4]), .out(pp[4][4]));
    mux2to1 m45(.a(a[5]), .b(1'b0), .sel(b[4]), .out(pp[4][5]));
    mux2to1 m46(.a(a[6]), .b(1'b0), .sel(b[4]), .out(pp[4][6]));
    mux2to1 m47(.a(a[7]), .b(1'b0), .sel(b[4]), .out(pp[4][7]));
    
    //row 5
    mux2to1 m50(.a(a[0]), .b(1'b0), .sel(b[5]), .out(pp[5][0]));
    mux2to1 m51(.a(a[1]), .b(1'b0), .sel(b[5]), .out(pp[5][1]));
    mux2to1 m52(.a(a[2]), .b(1'b0), .sel(b[5]), .out(pp[5][2]));
    mux2to1 m53(.a(a[3]), .b(1'b0), .sel(b[5]), .out(pp[5][3]));
    mux2to1 m54(.a(a[4]), .b(1'b0), .sel(b[5]), .out(pp[5][4]));
    mux2to1 m55(.a(a[5]), .b(1'b0), .sel(b[5]), .out(pp[5][5]));
    mux2to1 m56(.a(a[6]), .b(1'b0), .sel(b[5]), .out(pp[5][6]));
    mux2to1 m57(.a(a[7]), .b(1'b0), .sel(b[5]), .out(pp[5][7]));
    
    //row 6
    mux2to1 m60(.a(a[0]), .b(1'b0), .sel(b[6]), .out(pp[6][0]));
    mux2to1 m61(.a(a[1]), .b(1'b0), .sel(b[6]), .out(pp[6][1]));
    mux2to1 m62(.a(a[2]), .b(1'b0), .sel(b[6]), .out(pp[6][2]));
    mux2to1 m63(.a(a[3]), .b(1'b0), .sel(b[6]), .out(pp[6][3]));
    mux2to1 m64(.a(a[4]), .b(1'b0), .sel(b[6]), .out(pp[6][4]));
    mux2to1 m65(.a(a[5]), .b(1'b0), .sel(b[6]), .out(pp[6][5]));
    mux2to1 m66(.a(a[6]), .b(1'b0), .sel(b[6]), .out(pp[6][6]));
    mux2to1 m67(.a(a[7]), .b(1'b0), .sel(b[6]), .out(pp[6][7]));
    
    //row 7
    mux2to1 m70(.a(a[0]), .b(1'b0), .sel(b[7]), .out(pp[7][0]));
    mux2to1 m71(.a(a[1]), .b(1'b0), .sel(b[7]), .out(pp[7][1]));
    mux2to1 m72(.a(a[2]), .b(1'b0), .sel(b[7]), .out(pp[7][2]));
    mux2to1 m73(.a(a[3]), .b(1'b0), .sel(b[7]), .out(pp[7][3]));
    mux2to1 m74(.a(a[4]), .b(1'b0), .sel(b[7]), .out(pp[7][4]));
    mux2to1 m75(.a(a[5]), .b(1'b0), .sel(b[7]), .out(pp[7][5]));
    mux2to1 m76(.a(a[6]), .b(1'b0), .sel(b[7]), .out(pp[7][6]));
    mux2to1 m77(.a(a[7]), .b(1'b0), .sel(b[7]), .out(pp[7][7]));
    
    //Assign Adding Circuit
    //sum 0
    assign prod[0] = pp[0][0];
    
    //sum 1
    HA h0(.a(pp[1][0]), .b(pp[0][1]), .c_out(carry[0]), .sum(prod[1]));

    //sum 2
    FA f0(.a(pp[1][1]), .b(pp[0][2]), .c_in(carry[0]), .c_out(carry[1]), .sum(partialSum[0]));
    HA h1(.a(pp[2][0]), .b(partialSum[0]), .c_out(carry[2]), .sum(prod[2]));

    //sum 3
    HA h2 (.a(carry[1]), .b(carry[2]), .c_out(carry[3]), .sum(partialSum[1]));
    FA f1 (.a(pp[1][2]), .b(pp[0][3]), .c_in(partialSum[1]), .c_out(carry[4]), .sum(partialSum[2]));
    FA f2 (.a(pp[3][0]), .b(pp[2][1]), .c_in(partialSum[2]), .c_out(carry[5]), .sum(prod[3]));

    //sum 4
    FA f3 (.a(carry[3]), .b(carry[4]), .c_in(carry[5]), .c_out(carry[6]), .sum(partialSum[3]));
    FA f4 (.a(pp[1][3]), .b(pp[0][4]), .c_in(partialSum[3]), .c_out(carry[7]), .sum(partialSum[4]));
    FA f5 (.a(pp[4][0]), .b(pp[3][1]), .c_in(partialSum[4]), .c_out(carry[8]), .sum(partialSum[5]));
    HA h3 (.a(pp[2][2]), .b(partialSum[5]), .c_out(carry[9]), .sum(prod[4]));   

    //sum 5
    FA f6 (.a(carry[6]), .b(carry[7]), .c_in(carry[8]), .c_out(carry[10]), .sum(partialSum[6]));
    HA h4 (.a(carry[9]), .b(partialSum[6]), .c_out(carry[11]), .sum(partialSum[7]));
    FA f7 (.a(pp[1][4]), .b(pp[0][5]), .c_in(partialSum[7]), .c_out(carry[12]), .sum(partialSum[8]));
    FA f8 (.a(pp[5][0]), .b(pp[4][1]), .c_in(partialSum[8]), .c_out(carry[13]), .sum(partialSum[9]));
    FA f9 (.a(pp[3][2]), .b(pp[2][3]), .c_in(partialSum[9]), .c_out(carry[14]), .sum(prod[5]));

    //sum 6
    FA f10 (.a(carry[10]), .b(carry[11]), .c_in(carry[12]), .c_out(carry[15]), .sum(partialSum[10]));
    FA f11 (.a(carry[13]), .b(partialSum[10]), .c_in(carry[14]), .c_out(carry[16]), .sum(partialSum[11]));
    FA f12 (.a(pp[1][5]), .b(pp[0][6]), .c_in(partialSum[11]), .c_out(carry[17]), .sum(partialSum[12]));
    FA f13 (.a(pp[6][0]), .b(pp[5][1]), .c_in(partialSum[12]), .c_out(carry[18]), .sum(partialSum[13]));
    FA f14 (.a(pp[4][2]), .b(pp[3][3]), .c_in(partialSum[13]), .c_out(carry[19]), .sum(partialSum[14]));
    HA h5  (.a(pp[2][4]), .b(partialSum[14]), .c_out(carry[20]), .sum(prod[6]));
    
    //sum 7
    FA f15 (.a(carry[15]), .b(carry[16]), .c_in(carry[17]), .c_out(carry[21]), .sum(partialSum[15]));
    FA f16 (.a(carry[18]), .b(partialSum[15]), .c_in(carry[19]), .c_out(carry[22]), .sum(partialSum[16]));
    HA h6  (.a(partialSum[16]), .b(carry[20]), .c_out(carry[23]), .sum(partialSum[17]));
    FA f17 (.a(pp[1][6]), .b(pp[0][7]), .c_in(partialSum[17]), .c_out(carry[24]), .sum(partialSum[18]));
    FA f18 (.a(pp[7][0]), .b(pp[6][1]), .c_in(partialSum[18]), .c_out(carry[25]), .sum(partialSum[19]));
    FA f19 (.a(pp[5][2]), .b(pp[4][3]), .c_in(partialSum[19]), .c_out(carry[26]), .sum(partialSum[20]));
    FA f20 (.a(pp[3][4]), .b(pp[2][5]), .c_in(partialSum[20]), .c_out(carry[27]), .sum(prod[7]));
    
    //sum 8
    FA f21 (.a(carry[21]), .b(carry[22]), .c_in(carry[23]), .c_out(carry[28]), .sum(partialSum[21]));
    FA f22 (.a(carry[24]), .b(partialSum[21]), .c_in(carry[25]), .c_out(carry[29]), .sum(partialSum[22]));
    FA f23 (.a(carry[26]), .b(partialSum[22]), .c_in(carry[27]), .c_out(carry[30]), .sum(partialSum[23]));
    FA f24 (.a(pp[2][6]),  .b(pp[1][7]), .c_in(partialSum[23]), .c_out(carry[31]), .sum(partialSum[24]));
    FA f25 (.a(pp[7][1]),  .b(pp[6][2]), .c_in(partialSum[24]), .c_out(carry[32]), .sum(partialSum[25]));
    FA f26 (.a(pp[5][3]),  .b(pp[4][4]), .c_in(partialSum[25]), .c_out(carry[33]), .sum(partialSum[26]));
    HA h7  (.a(pp[3][5]),  .b(partialSum[26]), .c_out(carry[34]), .sum(prod[8]));
    
    //sum 9
    FA f27 (.a(carry[28]), .b(carry[29]), .c_in(carry[30]), .c_out(carry[35]), .sum(partialSum[27]));
    FA f28 (.a(carry[31]), .b(partialSum[27]), .c_in(carry[32]), .c_out(carry[36]), .sum(partialSum[28]));
    FA f29 (.a(carry[33]), .b(partialSum[28]), .c_in(carry[34]), .c_out(carry[37]), .sum(partialSum[29]));
    FA f30 (.a(pp[3][6]),  .b(pp[2][7]), .c_in(partialSum[29]), .c_out(carry[38]), .sum(partialSum[30]));
    FA f31 (.a(pp[7][2]),  .b(pp[6][3]), .c_in(partialSum[30]), .c_out(carry[39]), .sum(partialSum[31]));
    FA f32 (.a(pp[5][4]),  .b(pp[4][5]), .c_in(partialSum[31]), .c_out(carry[40]), .sum(prod[9]));
    
    //sum 10
    FA f33 (.a(carry[35]), .b(carry[36]), .c_in(carry[37]), .c_out(carry[41]), .sum(partialSum[32]));
    FA f34 (.a(carry[38]), .b(partialSum[32]), .c_in(carry[39]), .c_out(carry[42]), .sum(partialSum[33]));
    FA f35 (.a(pp[4][6]),  .b(partialSum[33]), .c_in(carry[40]), .c_out(carry[43]), .sum(partialSum[34]));
    FA f36 (.a(pp[3][7]),  .b(pp[7][3]), .c_in(partialSum[34]), .c_out(carry[44]), .sum(partialSum[35]));
    FA f37 (.a(pp[6][4]),  .b(pp[5][5]), .c_in(partialSum[35]), .c_out(carry[45]), .sum(prod[10]));
    
    //sum 11
    FA f38 (.a(carry[41]), .b(carry[42]), .c_in(carry[43]), .c_out(carry[46]), .sum(partialSum[36]));
    FA f39 (.a(carry[44]), .b(partialSum[36]), .c_in(carry[45]), .c_out(carry[47]), .sum(partialSum[37]));
    FA f40 (.a(pp[5][6]),  .b(pp[4][7]), .c_in(partialSum[37]), .c_out(carry[48]), .sum(partialSum[38]));
    FA f41 (.a(pp[7][4]),  .b(pp[6][5]), .c_in(partialSum[38]), .c_out(carry[49]), .sum(prod[11]));
    
    //sum 12
    FA f42 (.a(carry[46]), .b(carry[47]), .c_in(carry[48]), .c_out(carry[50]), .sum(partialSum[39]));
    FA f43 (.a(pp[6][6]),  .b(partialSum[39]), .c_in(carry[49]), .c_out(carry[51]), .sum(partialSum[40]));
    FA f44 (.a(pp[7][5]),  .b(pp[5][7]), .c_in(partialSum[40]), .c_out(carry[52]), .sum(prod[12]));
    
    //sum 13
    FA f45 (.a(carry[50]), .b(carry[51]), .c_in(carry[52]), .c_out(carry[53]), .sum(partialSum[41]));
    FA f46 (.a(pp[7][6]),  .b(pp[6][7]),  .c_in(partialSum[41]), .c_out(carry[54]), .sum(prod[13]));
    
    //sum 14 and sum 15
    FA f47 (.a(pp[7][7]), .b(carry[53]), .c_in(carry[54]), .c_out(prod[15]), .sum(prod[14]));
    
endmodule
