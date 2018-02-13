`include "definitions.vh"

module control(
    input [10:0] opcode_bits,
    output reg reg2_loc,
    output reg uncondbranch,
    output reg branch,
    output reg mem_read,
    output reg mem_to_reg,
    output reg [1:0] alu_op,
    output reg mem_write,
    output reg alu_src,
    output reg reg_write
    );
   
    always @(*)begin
        casex (opcode_bits)
        // ADD, SUB, AND, ORR, LDUR, STUR, CBZ, and B should be
        // defined in definitions.vh.  CBZ and B instructions should
        // use X to fill in the extra bits in the 11 bit opcode
        // casex treats these bits as 'don't cares' 
        `ADD:  begin
                reg2_loc<=0;
                uncondbranch<=0;
                branch<=0;
                mem_read<=0;
                mem_to_reg<=0;
                alu_op<=`ALUOp_RTYPE;
                mem_write<=0;
                alu_src<=0;
                reg_write<=1;
               end
         `SUB: begin
                reg2_loc<=0;
                uncondbranch<=0;
                branch<=0;
                mem_read<=0;
                mem_to_reg<=0;
                alu_op<=`ALUOp_RTYPE;
                mem_write<=0;
                alu_src<=0;
                reg_write<=1;                       
               end
         `AND: begin
                reg2_loc<=0;
                uncondbranch<=0;
                branch<=0;
                mem_read<=0;
                mem_to_reg<=0;
                alu_op<=`ALUOp_RTYPE;
                mem_write<=0;
                alu_src<=0;
                reg_write<=1;  
               end  
         `ORR: begin
                reg2_loc<=0;
                uncondbranch<=0;
                branch<=0;
                mem_read<=0;
                mem_to_reg<=0;
                alu_op<=`ALUOp_RTYPE;
                mem_write<=0;
                alu_src<=0;
                reg_write<=1;  
               end      
         `LDUR: begin
                reg2_loc<=0;
                uncondbranch<=0;
                branch<=0;
                mem_read<=1;
                mem_to_reg<=1;
                alu_op<=`ALUOp_DTYPE;
                mem_write<=0;
                alu_src<=1;
                reg_write<=1;  
               end   
         `LDUR: begin
                reg2_loc<=0;
                uncondbranch<=0;
                branch<=0;
                mem_read<=1;
                mem_to_reg<=1;
                alu_op<=`ALUOp_DTYPE;
                mem_write<=0;
                alu_src<=1;
                reg_write<=1;  
               end   
         `STUR: begin
                reg2_loc<=1;
                uncondbranch<=0;
                branch<=0;
                mem_read<=0;
                mem_to_reg<=0;
                alu_op<=`ALUOp_DTYPE;
                mem_write<=1;
                alu_src<=1;
                reg_write<=0;  
               end  
         `CBZ: begin
                reg2_loc<=1;
                uncondbranch<=0;
                branch<=1;
                mem_read<=0;
                mem_to_reg<=0;
                alu_op<=`ALUOp_BRANCH;
                mem_write<=0;
                alu_src<=0;
                reg_write<=0;  
               end  
         `B: begin
                reg2_loc<=0;
                uncondbranch<=1;
                branch<=0;
                mem_read<=0;
                mem_to_reg<=0;
                alu_op<=`ALUOp_BRANCH;
                mem_write<=0;
                alu_src<=0;
                reg_write<=0;  
               end                                                                                              
       endcase
   end
endmodule
