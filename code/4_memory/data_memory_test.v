`include "definitions.vh"


module data_memory_test;

wire clk;
reg[`WORD-1:0] write_data, address;
reg mem_write, mem_read; 
wire[`WORD-1:0] read_data;

data_memory UUT(
    .clk(clk), 
    .mem_write(mem_write), 
    .mem_read(mem_read),
    .address(address), 
    .write_data(write_data),
    .read_data(read_data)
);

oscillator clk_gen(clk);

initial begin

    write_data <= 1;
    address <= 2;
    mem_read <= 1;
    mem_write <= 0;
    #(2*`CYCLE);    
    mem_read <= 0;
    mem_write <= 1;
    
end

endmodule
