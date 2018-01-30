`timescale 1ns / 1ps
`include "definitions.vh"

module iFetch_test;
    wire clk;
    reg rst;
    reg pc_s;
    reg [`WORD-1:0] branch;
    wire [`WORD-1:0] inc_pc;
    wire [`INSTR_LEN-1:0] instr;
    wire [`WORD-1:0] c_pc;
      
oscillator clk_gen(clk);
    
iFetch UUT(
    .clk(clk),
    .reset(rst),
    .pc_src(pc_s),
    .branch_target(branch),
    .incremented_pc(inc_pc),
    .instruction(instr),
    .cur_pc(c_pc)
    );
     
 initial begin
 pc_s = 0;
 rst <= 0;
 #(4*`CYCLE);
 pc_s = 1;
 branch <= 4;
 #(2*`CYCLE);
 pc_s =0;
 
end 
endmodule

