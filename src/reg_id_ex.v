module reg_id_ex (
    input      [ 7:0] id_aluop             ,
    input      [ 2:0] id_alusel            ,
    input      [31:0] id_opv1              ,
    input      [31:0] id_opv2              ,
    input             id_we                ,
    input      [ 4:0] id_waddr             ,
    output reg [ 7:0] ex_aluop             ,
    output reg [ 2:0] ex_alusel            ,
    output reg [31:0] ex_opv1              ,
    output reg [31:0] ex_opv2              ,
    output reg        ex_we                ,
    output reg [ 4:0] ex_waddr             ,
    input      [ 5:0] stall                ,
    input             id_cur_in_delay_slot ,
    input      [31:0] id_link_addr         ,
    input             id_next_in_delay_slot,
    output reg        ex_cur_in_delay_slot ,
    output reg [31:0] ex_link_addr         ,
    output reg        ex_next_in_delay_slot,
    input      [31:0] id_inst              ,
    output reg [31:0] ex_inst              ,
    input             clk                  ,
    input             rst
);

    always @(posedge clk) begin
        if (rst || (stall[2] && !stall[3])) begin
            ex_aluop <= 0; ex_alusel <= 0; // nop
            ex_opv1  <= 0; ex_opv2   <= 0;
            ex_we    <= 0; ex_waddr  <= 0;
            ex_cur_in_delay_slot  <= 0;
            ex_link_addr          <= 0;
            ex_next_in_delay_slot <= 0;
            ex_inst  <= 0;
        end else if (!stall[2]) begin
            ex_aluop  <= id_aluop ;
            ex_alusel <= id_alusel;
            ex_opv1   <= id_opv1  ;
            ex_opv2   <= id_opv2  ;
            ex_we     <= id_we    ;
            ex_waddr  <= id_waddr ;
            ex_cur_in_delay_slot  <= id_cur_in_delay_slot ;
            ex_link_addr          <= id_link_addr         ;
            ex_next_in_delay_slot <= id_next_in_delay_slot;
            ex_inst   <= id_inst;
        end
    end

endmodule // reg_id_ex
