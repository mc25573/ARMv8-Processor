`include "definitions.vh"

module iMemory(
    input mem_read, mem_write, zero, branch, uncond_branch, clk,
    input [`WORD-1:0] alu_result, read_data2,
    output or_result,
    output [`WORD-1:0] read_data 
    );
    
    wire and_result;
    
    assign and_result = branch & zero;
    assign or_result = uncond_branch | and_result;
    
    data_memory dataMemory(
        .clk(clk), 
        .mem_write(mem_write), 
        .mem_read(mem_read),
        .address(alu_result), 
        .write_data(read_data2),
        .read_data(read_data)
        );
        
endmodule
