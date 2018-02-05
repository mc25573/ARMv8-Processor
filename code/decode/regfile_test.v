`include "definitions.vh"

module regfile_test;
    
    wire read_clk; 
    wire write_clk;
    reg regWrite;
    reg [4:0] read_reg1; //rn
    reg [4:0] read_reg2; //rm
    reg [4:0] write_reg; //rd
    reg [`WORD-1:0] write_data;
    wire [`WORD-1:0] read_data_1;
    wire [`WORD-1:0] read_data_2;
    
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
        .read_data1(read_data_1),
        .read_data2(read_data_2)
    );
    
initial begin

regWrite <= 1'b0;
read_reg1 <= 10;
read_reg2 <= 15;

#(`CYCLE*6);

regWrite <= 1'b1;
write_reg = 5'b01001;
write_data = 256;

#(`CYCLE*2);

regWrite <= 1'b0;
read_reg1 <= 2;
read_reg2 <= 32;

end

endmodule
