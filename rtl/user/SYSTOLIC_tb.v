`timescale 1ns/1ps
`define CYCLE 10

module SYSTOLIC_tb;

parameter DATA_WIDTH = 32;

integer i, j;
wire [DATA_WIDTH-1:0] o_data[0:3];
reg clk, rst;
reg [DATA_WIDTH-1:0] i_data[0:1];
reg [DATA_WIDTH-1:0] i_tap[0:1];
reg [DATA_WIDTH-1:0] i_fir_data_12, i_fir_data_22, i_fir_tap_21, i_fir_tap_22;
reg func_sel;

SYSTOLIC #(
    .DATA_WIDTH(DATA_WIDTH)
)SYSTOLIC_INST(
    .clk(clk),
    .rst(rst),
    .func_sel(func_sel),                   // 0 -> matrix multiplication, 1 -> fir 
    .i_data_11(i_data[0]), 
    .i_data_21(i_data[1]),
    .i_fir_data_12(i_fir_data_12),
    .i_fir_data_22(i_fir_data_22),
    .i_tap_11(i_tap[0]),
    .i_tap_12(i_tap[1]),
    .i_fir_tap_21(i_fir_tap_21),
    .i_fir_tap_22(i_fir_tap_22),
    .o_data_11(o_data[0]),
    .o_data_12(o_data[1]),
    .o_data_21(o_data[2]),
    .o_data_22(o_data[3])
);

initial begin
    clk = 0;
    forever begin
        #(`CYCLE/2) clk = ~clk;
    end
end

initial begin
    rst = 0;
    #(`CYCLE) rst = 1;
    #(`CYCLE * 10) rst = 0;
    for(i = 0; i < 4; i = i + 1) begin
        i_data[i] = 0;
        i_tap[i] = 0;
    end
    i_fir_data_12 = 0;
    i_fir_data_22 = 0;
    i_fir_tap_21 = 0;
    i_fir_tap_22 = 0;
    func_sel = 0;
    @(posedge clk);
    fork
        begin
            for(i = 0; i < 2; i = i + 1) begin
                @(posedge clk) i_data[0] = i+1;
                i_tap[0] = i + 1;
            end
            @(posedge clk) i_data[0] = 0;
            i_tap[0] = 0;
        end
        begin
            @(posedge clk);
            for(j = 0; j < 2; j = j + 1) begin
                @(posedge clk) i_data[1] = j + 1;
                i_tap[1] = j + 1;
            end
            @(posedge clk);
        end
    join
    for(i = 0; i < 4; i = i + 1) begin
        i_data[i] = 0;
        i_tap[i] = 0;
    end
end

endmodule

