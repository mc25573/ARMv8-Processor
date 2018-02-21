`include "definitions.vh"

module instr_parse(
    input clk,
    input [`INSTR_LEN-1:0] instruction,
    output reg [10:0] opcode,
    output reg [8:0] address,
    output reg [4:0] rm_num,
    output reg [4:0] rn_num,
    output reg [4:0] rd_num
    
    );
    
    always @(posedge(clk))begin    
            opcode  = instruction[31:21];                                 
            address = instruction[20:12];                               
            rm_num  = instruction[20:16];                               
            rn_num  = instruction[9:5];                                
            rd_num  = instruction[4:0];             
    end      
    
endmodule
