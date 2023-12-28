module PE #(
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst,
    input  [DATA_WIDTH-1:0] i_data,
    input  [DATA_WIDTH-1:0] i_tap,
    output [DATA_WIDTH-1:0] o_data_t,
    output [DATA_WIDTH-1:0] o_tap_t,
    output [DATA_WIDTH-1:0] o_accumulate
);

reg [DATA_WIDTH-1:0] temp_data;
reg [DATA_WIDTH-1:0] temp_tap;
reg [DATA_WIDTH-1:0] o_accumulate_w, o_accumulate_r;

assign o_data_t = temp_data;
assign o_tap_t  = temp_tap;
assign o_accumulate = o_accumulate_r;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        temp_data <= {DATA_WIDTH{1'b0}};
        temp_tap  <= {DATA_WIDTH{1'b0}};
    end else begin
        temp_data <= i_data;
        temp_tap  <= i_tap;
    end
end

always @(*) begin
    o_accumulate_w = temp_data * temp_tap + o_accumulate_r;
end

always @(posedge clk or posedge rst) begin
    if(rst) begin
        o_accumulate_r <= {DATA_WIDTH{1'b0}};
    end else begin
        o_accumulate_r <= o_accumulate_w;
    end
end

endmodule
