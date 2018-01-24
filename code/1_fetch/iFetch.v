`include "definitions.vh"

module iFetch#(parameter STEP=`WORD'd4, SIZE=1024)(
    input clk,
    input reset,
    input pc_src,
    input [`WORD-1:0] branch_target,
    output [`WORD-1:0] incremented_pc,
    output [`INSTR_LEN-1:0] instruction,
    output[`WORD-1:0] cur_pc
    );
    wire [`WORD-1:0] new_pc;

    mux#(`WORD) pc_mux(
    .a_in(branch_target),
    .b_in(new_pc),
    .control(pc_src),
    .mux_out(incremented_pc)
    );
    
    register pc_register(
    .clk(clk),
    .reset(reset),
    .D(),
    .Q(cur_pc)
    );
    
    adder incrementer(
    .a_in(cur_pc),
    .b_in(STEP),
    .add_out(branch_target)
    );
       
    instr_mem#(SIZE) instr_mem(
    .clk(clk),
    .pc(cur_pc),
    .instruction(instruction)
    );
endmodule