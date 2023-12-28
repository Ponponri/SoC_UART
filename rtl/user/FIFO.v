module FIFO#(
    parameter DEPTH = 4,
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst,
    input [DATA_WIDTH-1:0] i_data,
    input write_en,
    input read_en,
    output full,
    output empty,
    output reg o_valid,
    output reg [DATA_WIDTH-1:0] o_data
);

integer i;
wire mem_write;
wire mem_read;
reg [DATA_WIDTH-1:0] memory[0:DEPTH-1];
reg [clog2(DEPTH)-1:0] read_ptr;
reg [clog2(DEPTH)-1:0] write_ptr;
reg [clog2(DEPTH):0]   cnt;

assign empty = (cnt == {(clog2(DEPTH)+1){1'b0}} && read_ptr == write_ptr);
assign full  = (cnt == DEPTH && read_ptr == write_ptr);
assign mem_write = (write_en && ~full);
assign mem_read  = (read_en  && ~empty);

// Debug
wire [DATA_WIDTH-1:0] fifo_buf0 = memory[0];
wire [DATA_WIDTH-1:0] fifo_buf1 = memory[1];
wire [DATA_WIDTH-1:0] fifo_buf2 = memory[2];
wire [DATA_WIDTH-1:0] fifo_buf3 = memory[3];


always @(posedge clk or posedge rst) begin
    if(rst) begin
        read_ptr  <= {clog2(DEPTH){1'b0}};
        write_ptr <= {clog2(DEPTH){1'b0}};
        cnt <= {clog2(DEPTH){1'b0}};
        for(i = 0; i < DEPTH; i = i + 1) begin
            memory[i] <= {DATA_WIDTH{1'b0}};
        end
        o_valid <= 1'b0;
        o_data <= {DATA_WIDTH{1'b0}};
    end else begin
        read_ptr  <= (mem_read) ? read_ptr + 1'b1 : read_ptr;
        write_ptr <= (mem_write)  ? write_ptr + 1'b1 : write_ptr;
        if(mem_write) begin
            cnt <= cnt + 1'b1;
        end else if(mem_read) begin
            cnt <= cnt + {(clog2(DEPTH)+1){1'b1}};
        end
        if(mem_write) begin
            memory[write_ptr] <= i_data;
        end
        if(mem_read) begin
            o_valid <= 1'b1;
            o_data <= memory[read_ptr];
        end else begin
            o_valid <= 1'b0;
            o_data <= o_data;
        end
    end
end

//=============================================================

function integer clog2;
    input integer value;
    integer temp;
    begin
        temp = value - 1;
        for (clog2 = 0; temp > 0; clog2 = clog2 + 1) begin
            temp = temp >> 1;
        end
    end
endfunction

endmodule
