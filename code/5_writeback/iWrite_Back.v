`include "definitions.vh"


module iWrite_Back(
input [`WORD-1:0] alu_result,
input [`WORD-1:0] read_data_mem,
input mem_to_reg,
output [`WORD-1:0] result

    );

mux#(`WORD) write_back_mux(
    .a_in(alu_result),
    .b_in(read_data_mem),
    .control(mem_to_reg),
    .mux_out(result)
    );
    
    
endmodule