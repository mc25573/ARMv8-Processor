`include "definitions.vh"

module iDecode(
    input clk,
    input [`INSTR_LEN-1:0] instr,
    input [`WORD-1:0] write_data,        
    output [`WORD-1:0] read_data1,
    output [`WORD-1:0] read_data2,
    
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
    
    wire reg_write; 
    wire reg2_loc;
    wire [4:0] read_reg2; 
    wire [10:0] opcode; 
    wire [4:0] rm;
    wire [4:0] rn;
    wire [4:0] rd; 
    
    assign alu_con_instr = instr[31:21];
    
    instr_parse parse(
        .clk(clk),
        .instruction(instr),
        .opcode(opcode),
        .rm_num(rm),
        .rn_num(rn),
        .rd_num(rd)   
        );  
     
    mux#(5) parse_mux(
        .a_in(rm),
        .b_in(rd),
        .control(reg2_loc),
        .mux_out(read_reg2)
        );
        
   sign_extender ext(
        .instr(instr),
        .extended(ext_addr)
        );
        
   control con(
       .opcode_bits(opcode),
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
       .read_reg1(rn),
       .read_reg2(read_reg2),
       .write_reg(rd),
       .write_data(write_data),
       .read_data1(read_data1),
       .read_data2(read_data2)       
        );
    
endmodule
