`include "definitions.vh"

module datapath;
   
   wire clk;
   reg rst;
   wire [`WORD-1:0] write_data;
   wire [`WORD-1:0] read_data1;
   wire [`WORD-1:0] read_data2;
   wire [`WORD-1:0] incremented_pc;
   wire [`WORD-1:0] cur_pc;
   wire uncondbranch;
   wire branch;
   wire mem_read;
   wire mem_to_reg;
   wire [1:0] alu_op;
   wire mem_write;
   wire alu_src;    
   wire [`WORD-1:0] ext_addr;    
   wire [`INSTR_LEN-1:0] instruct;
   wire [`WORD-1:0] execute_branch_target;
   wire [`WORD-1:0] alu_result;
   wire [`WORD-1:0] read_data;
   wire zero;
   wire branch_decision;
   
    oscillator clk_gen(clk);
    
    iFetch fetch(
    .clk(clk),
    .reset(rst),
    .pc_src(branch_decision),
    .branch_target(execute_branch_target),
    .incremented_pc(incremented_pc),
    .instruction(instruct), //The only wire that connects iFetch and iDecode
    .cur_pc(cur_pc)
    );
    
    iDecode decode(
    .clk(clk_plus_2),
    .read_clk(clk_plus_3),
    .write_clk(clk_plus_9),
    .instr(instruct),
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
    .ext_addr(ext_addr)
    );
    
    iExecute execute(
      .pc_in(cur_pc),
      .read_data1(read_data1),
      .read_data2(read_data2),
      .sign_extended_output(ext_addr),
      .branch_target(execute_branch_target),
      .alu_result(alu_result),
      .zero(zero),    
      .alu_op(alu_op), 
      .opcode(instruct[31:21]),
      .alu_src(alu_src)
     );
      
     iMemory memory( 
      .mem_read(mem_read), 
      .mem_write(mem_write), 
      .zero(zero), 
      .branch(branch), 
      .uncond_branch(uncondbranch),
      .clk(clk_plus_7),
      .alu_result(alu_result), 
      .read_data2(read_data2),
      .or_result(branch_decision),
      .read_data(read_data) 
      );
        
     iWrite_Back writeback(
      .read_data_mem(read_data),
      .alu_result(alu_result),
      .mem_to_reg(mem_to_reg),
      .result(write_data)
      );              
      
    delay clk_delay_1(
        .a(clk),
        .a_delayed(clk_plus_1)
    );   
        
    delay clk_delay_2(
        .a(clk_plus_1),
        .a_delayed(clk_plus_2)
    );
    
    delay clk_delay_3(
        .a(clk_plus_2),
        .a_delayed(clk_plus_3)
    );
    
        delay clk_delay_4(
        .a(clk_plus_3),
        .a_delayed(clk_plus_4)
    );   
    
    delay clk_delay_5(
        .a(clk_plus_4),
        .a_delayed(clk_plus_5)
    );
    
    delay clk_delay_6(
        .a(clk_plus_5),
        .a_delayed(clk_plus_6)
    );    
        delay clk_delay_7(
        .a(clk_plus_6),
        .a_delayed(clk_plus_7)
    );    
    
       delay clk_delay_8(
       .a(clk_plus_7),
       .a_delayed(clk_plus_8)
    );       
          
       delay clk_delay_9(
       .a(clk_plus_8),
       .a_delayed(clk_plus_9)
    );  
     
initial    
        begin
            rst <= 1;
            #(`CYCLE/1.5);
            rst <= 0;       
           /* write_data <= `WORD'd20; 
            #(`CYCLE);
            write_data <= `WORD'd30; // Addition result 
            #(`CYCLE);
            write_data <= `WORD'd0; // Subtraction Result 
            #(`CYCLE);
            write_data <= `WORD'd0; // N/A 
            #(`CYCLE);
            write_data <= `WORD'd0; // N/A 
            #(`CYCLE);
            write_data <= `WORD'd0; // N/A 
            #(`CYCLE);
            write_data <= `WORD'd0; // N/A 
            #(`CYCLE);
            write_data <= `WORD'd0; // N/A 
            #(`CYCLE);
            write_data <= `WORD'd30; // ORR result 
            #(`CYCLE);
            write_data <= `WORD'd14; // Writing                 
           */
        end
            
endmodule
