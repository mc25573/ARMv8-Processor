`include "definitions.vh"

module iDecode(
    input clk,
    input [31:0] instr,
    input [`WORD-1:0] write_data,        
    output reg [`WORD-1:0] read_data1,
    output reg [`WORD-1:0] read_data2,
    
    output reg uncondbranch,
    output reg branch,
    output reg mem_read,
    output reg mem_to_reg,
    output reg [1:0] alu_op,
    output reg mem_write,
    output reg alu_src,
    
    output reg [`WORD-1:0] ext_addr,
    
    output reg [10:0] alu_con_instr 
        
    );
    
    wire reg_write; 
    wire reg2_loc;
    wire read_reg2;    
     
    mux#(`WORD) parse_mux(
        .a_in(instr[20:16]),
        .b_in(instr[4:0]),
        .control(reg2_loc),
        .mux_out(read_reg2)
        );
        
   sign_extender ext(
        .instr(instr),
        .extended(ext_addr)
        );
        
   control con(
       .opcode_bits(instr[31:21]),
       .reg2_loc(reg2_loc),
       .uncondbranch(uncondbranch),
       .branch(branch),
       .mem_read(mem_read),
       .mem_to_reg(mem_to_reg),
       .alu_op(alu_op),
       .mem_write(mem_write),
       .alu_src(alu_src),
       .reg_write(reg_write)       
       );
       
   regfile regf(
       .read_clk(clk),
       .write_clk(clk),
       .regWrite(reg_write),
       .read_reg1(instr[9:5]),
       .read_reg2(read_reg2),
       .write_reg(instr[4:0]),
       .write_data(write_data),
       .read_data1(read_data1),
       .read_data2(read_data2)       
        );
    
endmodule
