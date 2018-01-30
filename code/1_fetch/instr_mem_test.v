`timescale 1ns / 1ps
`include "definitions.vh"

module instr_mem_test;
wire clk;
reg[`WORD - 1:0] p_c;
wire [`INSTR_LEN-1:0] inst;

oscillator clk_gen(clk);

instr_mem UUT(
    .clk(clk),
    .pc(p_c),
    .instruction(inst)
    );

initial
begin
    p_c = 0;
    #`CYCLE;
    p_c = 4;
    #`CYCLE;
    p_c = 8;
    #`CYCLE;
    p_c = 12;
    #`CYCLE;
    p_c = 16;
    #`CYCLE;
    p_c = 20;
    #`CYCLE;
    p_c = 24;
    #`CYCLE;
    p_c = 28;
    #`CYCLE;
    p_c = 32;
    #`CYCLE;
    p_c = 36;
    #`CYCLE;
    p_c = 40;
    #`CYCLE;
    p_c = 44;
    #`CYCLE;
    p_c = 48;
    #`CYCLE;
    p_c = 52;
    #`CYCLE;
    
    
    
end 
endmodule 