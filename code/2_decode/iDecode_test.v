`include "definitions.vh"

module iDecode_test;
    wire clk;
    reg [`INSTR_LEN-1:0] instr;
    reg [`WORD-1:0] write_data;        
    wire [`WORD-1:0] read_data1;
    wire [`WORD-1:0] read_data2;
    
    wire uncondbranch;
    wire branch;
    wire mem_read;
    wire mem_to_reg;
    wire [1:0] alu_op;
    wire mem_write;
    wire alu_src;
    
    wire [`WORD-1:0] ext_addr;
    
    wire [10:0] alu_con_instr;
    
oscillator clk_gen(clk);

iDecode UUT(
    .clk(clk),
    .instr(instr),
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

initial begin
    
    instr <= 64'hF84402C9; //1
    write_data <= 20;
    
    #(`CYCLE*2);
    instr <= 64'h8B0902A9; //2
    write_data <= 10;
    
    #(`CYCLE*2);
    instr <= 64'hCB0A028B; //3
    write_data <= 30;
        
    #(`CYCLE*2);
    instr <= 64'hF80602CB; //4
            
    #(`CYCLE*2);
    instr <= 64'hB4FFFF6B; //5
    
    #(`CYCLE*2);
    instr <= 64'hB4000109; //6
    
    #(`CYCLE*2);
    instr <= 64'h14000040; //7
        
    #(`CYCLE*2);
    instr <= 64'h17FFFFC9; //8
            
    #(`CYCLE*2);
    instr <= 64'hAA150149; //9
    write_data <= 0;
            
    #(`CYCLE*2);
    instr <= 64'h8A0A02CB?; //10
    write_data <= 0; 
   
end

endmodule
