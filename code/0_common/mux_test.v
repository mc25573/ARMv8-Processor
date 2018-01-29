`timescale 1ns / 1ps
`include "definitions.vh"

module mux_test;

    reg[`WORD-1:0] in1;
    reg[`WORD-1:0] in2;
    reg con;
    wire[`WORD-1:0] out;
    
mux#(64) UUT(
    .a_in(in1),
    .b_in(in2),
    .control(con),
    .mux_out(out)
    );
 
 initial begin
 
 in1 <= 5;
 in2 <= 8;
 con <= 0;
 #200;
 con <= 1;
 #200
 con <= 0;
 #200
 in1 <= 23455;
 in2 <= 1234567898;
 con <= 1;
 
 end
 
endmodule
