`include "definitions.vh"

module alu_control(
    input [1:0] alu_op,
    input [10:0] opcode,
    output reg [3:0] control_bits   
    );
    
    always @(*)begin
        case(alu_op)
        
        default: begin            
            control_bits <= 4'b0010;            
        end
        
        `ALUOp_DTYPE: begin        
            control_bits <= 4'b0010;            
        end
         
        `ALUOp_RTYPE: begin         
            control_bits[3] <= 0;
            control_bits[2] <= opcode[9];
            control_bits[1] <= opcode[3];
            control_bits[0] <= opcode[8];            
        end
         
        `ALUOp_BRANCH: begin         
            control_bits <= 4'b0111;         
        end
        
        endcase
    
    end   
    
    
endmodule
