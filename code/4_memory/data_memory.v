`include "definitions.vh"

module data_memory#(
parameter SIZE=1024)(
    input clk, mem_write, mem_read,
    input [`WORD - 1:0] address, write_data,
    output reg [`WORD - 1:0] read_data
    );
    
    reg[`WORD - 1:0] dmem [SIZE-1:0];
        
        //handle output
         always @(posedge(clk))   
            if(mem_read==1) begin            
                read_data <= dmem[address];     
            end
            
        always @(posedge(clk))    
            if(mem_write==1) begin           
                dmem[address] <= write_data;          
            end
            
        //initialize memory from file
        initial
            $readmemb(`DMEMFILE, dmem);
            
endmodule
