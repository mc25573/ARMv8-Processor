`include "definitions.vh"

module iExecute(
    
    input [`WORD-1:0] pc_in,
    input [`WORD-1:0] read_data1,
    input [`WORD-1:0] read_data2,
    input [`WORD-1:0] sign_extended_output,
    output [`WORD-1:0] branch_target,
    output [`WORD-1:0] alu_result,
    output zero,    
    input [1:0] alu_op, 
    input [10:0] opcode,
    input alu_src    
    );
    
wire [`WORD-1:0] mux_out;
wire [`WORD-1:0] shift_result;
wire [3:0] control;
     
mux#(`WORD) alu_mux(
    .a_in(read_data2),
    .b_in(sign_extended_output),
    .control(alu_src),
    .mux_out(mux_out)
    );
        
shifter alu_shifter(
    .offset(sign_extended_output),
    .result(shift_result)
    );

adder branch_adder(
    .a_in(pc_in),
    .b_in(shift_result),
    .add_out(branch_target)
    );
      
alu_control ex_alu_con(
    .alu_op(alu_op),
    .opcode(opcode),
    .control_bits(control)   
    );
 
ALU ex_alu(
    .data_1(read_data1), 
    .data_2(mux_out),
    .control(control),
    .result(alu_result),
    .flag(zero)
    );    
    
endmodule