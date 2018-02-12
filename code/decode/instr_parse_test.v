`include "definitions.vh"

module instr_parse_test;

    wire clk;
    reg [`INSTR_LEN-1:0] instruction;
    wire [10:0] opcode;
    wire [8:0] address;
    wire [4:0] rm_num;
    wire [4:0] rn_num;
    wire [4:0] rd_num;

oscillator clk_gen(clk);

instr_parse UUT
    (
    .clk(clk),
    .instruction(instruction),
    .address(address),
    .opcode(opcode),
    .rm_num(rm_num),
    .rn_num(rn_num),
    .rd_num(rd_num)
    );
    
initial begin

instruction = 32'b11111000010011110000000101001001;
#(2*`CYCLE);
instruction = 32'b10001011000010010000001010101001;
#(2*`CYCLE);
instruction = 32'b10010001000000000000011010101001;
#(2*`CYCLE);
instruction = 32'b11111000000011110000000101001001;  

end

endmodule