`include "definitions.vh"

module sign_extender(
    input [`INSTR_LEN-1:0] instr,
    output reg [`WORD-1:0] extended
    );
     
   always @(*)begin
       casex (instr[`INSTR_LEN-1:21])
       
       `LDUR: begin       
               extended[8:0] <= instr[20:12];
               if(extended[8] == 1'b1)             
                   extended[63:9] <= 55'b1111111111111111111111111111111111111111111111111111111; 
               else
                   extended[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;         
              end
               
       `STUR: begin
               extended[8:0] <= instr[20:12];
               if(extended[8] == 1'b1)             
                    extended[63:9] <= 55'b1111111111111111111111111111111111111111111111111111111; 
               else
                    extended[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;        
               end
               
       `CBZ:  begin
              extended[18:0] <= instr[23:5];
              if(extended[18] == 1'b1)             
                   extended[63:19] <= 45'b111111111111111111111111111111111111111111111;
              else
                   extended[63:19] <= 45'b000000000000000000000000000000000000000000000;            
              end  
               
       `B:    begin
              extended[25:0] <= instr[25:0];
              if(extended[25] == 1'b1)             
                   extended[63:26] <= 38'b11111111111111111111111111111111111111;
              else
                   extended[63:26] <= 38'b00000000000000000000000000000000000000;                        
              end 
                    
       endcase
   end
   
endmodule
