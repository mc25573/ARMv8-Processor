`include "definitions.vh"

module iDecode_test;
    wire clk, read_clk, write_clk;
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
    .clk(clk_plus_2),
    .read_clk(clk_plus_3),
    .write_clk(clk_plus_7),
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
    
    delay clk_delay_10(
        .a(clk_plus_9),
        .a_delayed(clk_plus_10)
    );
    
initial begin
    
    #(`CYCLE/2);    
    instr <= 64'hF84402C9; //1
    #(`CYCLE/2);   
    write_data <= 20;
    
    #(`CYCLE/2);
    instr <= 64'h8B09026A; //2
    #(`CYCLE/2);
    write_data <= 30;
    
    #(`CYCLE/2);
    instr <= 64'hCB0A028B; //3
    #(`CYCLE/2);
    write_data <= 0;
        
    #(`CYCLE/2);
    instr <= 64'hF80602CB; //4
    #(`CYCLE/2);
    write_data <= `WORD'd0;
            
    #(`CYCLE/2);
    instr <= 64'hB4FFFF6B; //5
    #(`CYCLE/2);
    write_data <= `WORD'd0;
    
    #(`CYCLE/2);
    instr <= 64'hB4000109; //6
    #(`CYCLE/2);
    write_data <= `WORD'd0;
    
    #(`CYCLE/2);
    instr <= 64'h14000040; //7
    #(`CYCLE/2);
    write_data <= `WORD'd0;
        
    #(`CYCLE/2);
    instr <= 64'h17FFFFC9; //8
    #(`CYCLE/2);
    write_data <= `WORD'd0;
            
    #(`CYCLE/2);
    instr <= 64'hAA150149; //9
    #(`CYCLE/2);
    write_data <= 30;
            
    #(`CYCLE/2);
    instr <= 64'h8A0A02C9; //10
    #(`CYCLE/2);
    write_data <= 14; 
   
end

endmodule
