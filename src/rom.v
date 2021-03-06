module rom (
    output [31:0] data_out,
    input  [31:0] addr    ,
    input  [31:0] data_in ,
    input         we      ,
    input         clk
);

    reg  [31:0] memory  [0:1023];
    wire [31:0] data_out        ;

    assign data_out = memory[addr>>2];

    always @(posedge clk) begin
        if (we) begin
            memory[addr>>2] <= data_in;
        end
    end

endmodule // rom