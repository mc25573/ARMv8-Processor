`include "definitions.vh"


module shifter(
    
    input [`WORD-1:0] offset,
    output reg [`WORD-1:0] result
    );
    
   always @(*)begin
      result <= offset << 2;     
   end   
   
endmodule
