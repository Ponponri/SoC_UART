module SYSTOLIC #(
    parameter DATA_WIDTH = 32
)(
    input  clk,
    input  rst,
    input  func_sel,                   // 0 -> matrix multiplication, 1 -> fir 
    input  [DATA_WIDTH-1:0] i_data_11, // 11 means row 1, column 1
    input  [DATA_WIDTH-1:0] i_data_21,
    input  [DATA_WIDTH-1:0] i_fir_data_12,
    input  [DATA_WIDTH-1:0] i_fir_data_22,
    input  [DATA_WIDTH-1:0] i_tap_11,
    input  [DATA_WIDTH-1:0] i_tap_12,
    input  [DATA_WIDTH-1:0] i_fir_tap_21,
    input  [DATA_WIDTH-1:0] i_fir_tap_22,
    output [DATA_WIDTH-1:0] o_data_11,
    output [DATA_WIDTH-1:0] o_data_12,
    output [DATA_WIDTH-1:0] o_data_21,
    output [DATA_WIDTH-1:0] o_data_22
);

reg [DATA_WIDTH-1:0] tap_sel_21, tap_sel_22;
reg [DATA_WIDTH-1:0] data_sel_12, data_sel_22;

assign {PE[0].i_pe_data, PE[1].i_pe_data, PE[2].i_pe_data, PE[3].i_pe_data} = {i_data_11, data_sel_12, i_data_21, data_sel_22};
assign {PE[0].i_pe_tap,  PE[1].i_pe_tap,  PE[2].i_pe_tap,  PE[3].i_pe_tap}  = {i_tap_11, i_tap_12, tap_sel_21, tap_sel_22};
assign {o_data_11, o_data_12, o_data_21, o_data_22} = {PE[0].o_accumulate, PE[1].o_accumulate, PE[2].o_accumulate, PE[3].o_accumulate};

genvar i;
generate
    for(i = 0; i < 4; i = i + 1)  begin: PE
        wire [DATA_WIDTH-1:0] i_pe_data;
        wire [DATA_WIDTH-1:0] i_pe_tap;
        wire [DATA_WIDTH-1:0] o_pe_data;
        wire [DATA_WIDTH-1:0] o_pe_tap;
        wire [DATA_WIDTH-1:0] o_accumulate;
        PE #(
            .DATA_WIDTH(DATA_WIDTH)
        )PE_inst(
            .clk(clk),
            .rst(rst),
            .i_data(i_pe_data),
            .i_tap(i_pe_tap),
            .o_data_t(o_pe_data),
            .o_tap_t(o_pe_tap),
            .o_accumulate(o_accumulate)
        );
    end
endgenerate

always @(*) begin
    if(func_sel) begin
        data_sel_12 = i_fir_data_12;
        data_sel_22 = i_fir_data_22;
        tap_sel_21  = i_fir_tap_21;
        tap_sel_22  = i_fir_tap_22;
    end else begin
        data_sel_12 = PE[0].o_pe_data;
        data_sel_22 = PE[2].o_pe_data;
        tap_sel_21  = PE[0].o_pe_tap;
        tap_sel_22  = PE[1].o_pe_tap;
    end
end

endmodule
