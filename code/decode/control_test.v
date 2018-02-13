`include "definitions.vh"

module control_test;

    reg [10:0] opcode_bits;
    wire reg2_loc;
    wire uncondbranch;
    wire branch;
    wire mem_read;
    wire mem_to_reg;
    wire [1:0] alu_op;
    wire mem_write;
    wire alu_src;
    wire reg_write;
    
    control UUT
        (
        .opcode_bits(opcode_bits),
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
    
    initial begin
    
    opcode_bits <= 11'b11111000010; //1
    #`CYCLE;
    opcode_bits <= 11'b10001011000; //2
    #`CYCLE;
    opcode_bits <= 11'b11001011000; //3
    #`CYCLE;
    opcode_bits <= 11'b11111000000; //4
    #`CYCLE;
    opcode_bits <= 8'b10110100; //5
    #`CYCLE;
    opcode_bits <= 8'b10110100; //6
    #`CYCLE;
    opcode_bits <= 6'b000101; //7
    #`CYCLE;
    opcode_bits <= 6'b000101; //8
    #`CYCLE;
    opcode_bits <= 11'b10101010000; //9
    #`CYCLE;
    opcode_bits <= 11'b10001010000; //10
        
    end

endmodule
