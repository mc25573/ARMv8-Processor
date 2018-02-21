`include "definitions.vh"

module datapath(
    
    input clk,
    input reset,
    input pc_src,
    input [`WORD-1:0] branch_target,
    
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
    .incremented_pc(),
    .instruction(),
    .cur_pc()
    );
    
    iDecode decode(
    .clk(), .read_clk(), .write_clk(),
    .instr(),
    .write_data(),        
    .read_data1(),
    .read_data2(),
    .uncondbranch(),
    .branch(),
    .mem_read(),
    .mem_to_reg(),
    .alu_op(),
    .mem_write(),
    .alu_src(),
    .ext_addr(),   
    .alu_con_instr()
    );
    
endmodule
