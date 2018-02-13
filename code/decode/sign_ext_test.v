`include "definitions.vh"

module sign_ext_test;

    reg [`INSTR_LEN-1:0] instr;
    wire[`WORD-1:0] extended;
  
    sign_extender UUT
        (
        .instr(instr),
        .extended(extended)
        );
        
        initial begin
        
        instr <= 64'hF84402C9; //ldur
        #`CYCLE;
        instr <= 64'hF80602CB; //stur
        #`CYCLE;        
        instr <= 64'hB4FFFF6B; //cbz
        #`CYCLE; 
        instr <= 64'h17FFFFC9; //b       
 
        end

endmodule
