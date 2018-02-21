`include "definitions.vh"

module datapath(
    
    input clk,
    input reset,
    input pc_src,
    
    input [`WORD-1:0] branch_target,
    input [`WORD-1:0] write_data,
    
    
    output [`WORD-1:0] read_data1,
    output [`WORD-1:0] read_data2,
    output [`WORD-1:0] incremented_pc,
    output [`INSTR_LEN-1:0] instruction,
    output[`WORD-1:0] cur_pc,
    output uncondbranch,
    output branch,
    output mem_read,
    output mem_to_reg,
    output [1:0] alu_op,
    output mem_write,
    output alu_src,
    
    output [`WORD-1:0] ext_addr,
    output [10:0] alu_con_instr 
    
        
    );
    wire [`INSTR_LEN-1:0] instruction;
    
    iFetch fetch(
    .clk(clk),
    .reset(reset),
    .pc_src(pc_src),
    .branch_target(branch_target),
    .incremented_pc(incremented_pc),
    .instruction(instruction), //The only wire that connects iFetch and iDecode
    .cur_pc(cur_pc)
    );
    
    iDecode decode(
    .clk(clk), 
    .read_clk(clk), 
    .write_clk(clk),
    .instr(instruction),
    .write_data(write_data),        
    .read_data1(read_data1),
    .read_data2(read_data2),
    .uncondbranch(uncondbranch),
    .branch(branch),
    .mem_read(mem_read),
    .mem_to_reg(mem_to_reg),
    .alu_op(alu_op),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .ext_addr(ext_addr),   
    .alu_con_instr(alu_con_instr)
    );
    
endmodule
