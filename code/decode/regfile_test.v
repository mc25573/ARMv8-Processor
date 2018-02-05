`include "definitions.vh"

module regfile_test;
    
    wire read_clk; 
    wire write_clk;
    reg regWrite;
    reg read_reg1; //rn
    reg read_reg2; //rm
    reg write_reg; //rd
    reg write_data;
    wire read_data1;
    wire read_data2;
    
    oscillator clk_gen_read(write_clk);
    
    oscillator clk_gen_write(read_clk);
    
    regfile UUT(
        .read_clk(read_clk),
        .write_clk(write_clk),
        .regWrite(regWrite),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );
    
initial begin

regWrite <= 1'b0;
read_reg1 <= 10;//5'b01010;
read_reg2 <= 15;//5'b01111;

#(`CYCLE*2);

write_reg = 5'b01001;
write_data = 256;

end

endmodule
