`include "definitions.vh"


module delay(
    input a,
    output reg a_delayed
    );
    always@(*) begin      
       a_delayed <=  #1 a;
    end
    initial
        a_delayed<=a;
endmodule
