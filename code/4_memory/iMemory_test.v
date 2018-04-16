`include "definitions.vh"

module iMemory_test;

    reg mem_read, mem_write, zero, branch, uncond_branch;
    reg [`WORD-1:0] alu_result, read_data2;
    wire or_result, clk;
    wire [`WORD-1:0] read_data; 
    
    oscillator clk_gen(clk);
    
    iMemory UUT(
        .mem_read(mem_read), 
        .mem_write(mem_write),
        .zero(zero),
        .branch(branch),
        .uncond_branch(uncond_branch),
        .clk(clk),
        .alu_result(alu_result), 
        .read_data2(read_data2),
        .or_result(or_result),
        .read_data(read_data)
        );
               
    
    initial begin
        #(`CYCLE/2)
        alu_result <= 1;
        read_data2 <= 1234;
        mem_read <= 1;
        mem_write <= 0;
        zero <= 0;
        branch <= 0;
        uncond_branch <= 0;
        #(`CYCLE)
        alu_result <= 2;
        mem_read <= 0;
        mem_write <= 1;
        #(`CYCLE)
        mem_read <= 1;
        mem_write <= 0;
        #(`CYCLE)
        mem_read <= 0;
        branch <= 1;          
        #(`CYCLE)
        zero <= 1;
        #(`CYCLE)
        branch <= 0;
        zero <= 0;
        uncond_branch <= 1;
        
    end
    

endmodule
