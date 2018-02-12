`include "definitions.vh"

module regfile(
    input read_clk,
    input write_clk,
    input regWrite,
    input [4:0] read_reg1,
    input [4:0] read_reg2,
    input [4:0] write_reg,
    input [`WORD-1:0] write_data,
    output reg [`WORD-1:0] read_data1,
    output reg [`WORD-1:0] read_data2
    );
        
    reg [`WORD-1:0] regs [31:0];
       
    always @(posedge(read_clk))begin
        read_data1 <= regs[read_reg1];
        read_data2 <= regs[read_reg2];
    end
    
    always @(posedge(write_clk))begin
        if (regWrite == 1'b1)
            regs[write_reg] <= write_data;           
    end
     
    initial
            $readmemb(`RMEMFILE, regs);
            
    
endmodule
