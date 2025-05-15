`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CSULB
// Engineer: Jonathan Lopez
// 
// Create Date: 04/29/2024 09:14:50 PM
// Design Name: 
// Module Name: time_multiplexer
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


module time_multiplexer(
    input clk, reset, switchInput,
          // units, tens, hundreds, thousands...etc  
    input [3:0] in1, in2, in3, in4, in5, // 4-bit inputs w/ all possible scenarios for each 7-seg display (XXXX = 15, but we really only need to 9)
                                                          //       (anything less than 4-bits is too small, like XXX = 7)
    input [3:0] in1_A, in2_A, in3_A, in4_B, in5_B, in6_B,
    //output reg [19:0] curr_state,
    //output wire [19:0] next_state, 
                                                                                           
    output reg [7:0] anode, // anode for each individual 7-seg dislay                    
    output reg [7:0] cathode // cathode for each seg of each display
    );
  
    // 5.2ms is the total refresh period (combining all in time from simulation)                    123 456 789
    parameter N = 20; // 100Mhz / (2^17) = 763 Hz --> desired refresh rate for each digit (100Mhz = 100,000,000)
                                                                                                
    // internal registers
    reg [N-1:0] curr_state;
    wire [N-1:0] next_state;
    
    // current state logic
    always @ (posedge clk, posedge reset) begin
        
                if(reset)
                    curr_state <= 0;
                else
                    curr_state <= next_state;
       
        end
    // next state logic
    assign next_state = curr_state + 1; 
    
    wire [7:0] digit1, digit2, digit3, digit4, digit5;
    wire [7:0] digit1_A, digit2_A, digit3_A, digit4_B, digit5_B, digit6_B;
    
    // output logic
    always @ (*) begin
    
        if(switchInput == 0) begin
                case(curr_state[N-1:N-3]) // 3-bit value looking at the msb and one bit before the msb of curr_state
                (3'b000) : begin 
                              anode = 8'b1111_1110; // 000 001  010 011  100 101  110  111 
                              cathode = digit1; 
                        end
                (3'b001) : begin 
                              anode = 8'b1111_1101;
                              cathode = digit2; 
                        end 
                (3'b010) : begin
                              anode = 8'b1111_1011;
                              cathode = digit3; 
                        end  
                (3'b011) : begin 
                              anode = 8'b1111_0111; 
                              cathode = digit4; 
                        end
                (3'b100) : begin 
                              anode = 8'b1110_1111;
                              cathode = digit5; 
                        end 
                (3'b101) : begin
                              anode = 8'b1111_1111; // off anode orientation occurs more likely
                              //cathode = digit6;   but it doesn't interfere with 7-seg output
                        end 
                (3'b110) : begin 
                              anode = 8'b1111_1111;   
                              //cathode = digit7; 
                        end 
                 default : begin 
                             anode = 8'b1111_1111;   
                             //cathode = digit8; 
                        end    
               endcase 
           end  
        else begin
        
        
            case(curr_state[N-1:N-3]) // 3-bit value looking at the msb and one bit before the msb of curr_state
               (3'b000) : begin 
                             anode = 8'b1111_1110; // 000 001  010 011  100 101  110  111 
                             cathode = digit1_A; 
                        end
               (3'b001) : begin 
                             anode = 8'b1111_1101;
                             cathode = digit2_A; 
                        end 
               (3'b010) : begin
                             anode = 8'b1111_1011;
                             cathode = digit3_A; 
                        end  
               (3'b011) : begin 
                             anode = 8'b1111_1111; 
                             //cathode = digit4; 
                        end
               (3'b100) : begin 
                             anode = 8'b1111_1111;
                             //cathode = digit5; 
                        end 
               (3'b101) : begin
                             anode = 8'b1101_1111; 
                             cathode = digit4_B;   
                        end 
               (3'b110) : begin 
                             anode = 8'b1011_1111;   
                             cathode = digit5_B; 
                        end 
                default : begin 
                            anode = 8'b0111_1111;   
                            cathode = digit6_B; 
                        end    
               endcase 
        
        end         
    end
   
   
    BCD_to7Seg inst1(in1, digit1);
    BCD_to7Seg inst2(in2, digit2);
    BCD_to7Seg inst3(in3, digit3);
    BCD_to7Seg inst4(in4, digit4);
    BCD_to7Seg inst5(in5, digit5);
    
    
    BCD_to7Seg inst6(in1_A, digit1_A);
    BCD_to7Seg inst7(in2_A, digit2_A);
    BCD_to7Seg inst8(in3_A, digit3_A);
    BCD_to7Seg inst9(in4_B, digit4_B);
    BCD_to7Seg inst10(in5_B, digit5_B);
    BCD_to7Seg inst11(in6_B, digit6_B);

    
endmodule
