`timescale 1ns / 1ps
`include "definitions.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2018 10:32:02 AM
// Design Name: 
// Module Name: adder_test
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


module adder_test;
    
    reg[`WORD - 1:0] in1;
    reg[`WORD - 1:0] in2;
    wire[`WORD - 1:0] out;
    
    adder UUT(
        .a_in(in1),
        .b_in(in2),
        .add_out(out)
        );
        
initial begin
    in1 <= 4;
    in2 <= 0;
        #200;
    in1 <= 4;
    in2 <= out;
        #200;
    in1 <= 4;
    in2 <= out;
        #200;
    in1 <= 4;
    in2 <= out;
        #200;
    in1 <= 4;
    in2 <= out;
 
end
endmodule
