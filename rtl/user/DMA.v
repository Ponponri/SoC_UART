`define CPU_WRITE 8'h30

module DMA #(
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 4
)(
    input wb_clk_i,
    input wb_rst_i,
    // Caravel Wb
    input  cpu_wbs_stb_i,
    input  cpu_wbs_cyc_i,
    input  cpu_wbs_we_i,
    input  [3:0]  cpu_wbs_sel_i,
    input  [31:0] cpu_wbs_dat_i,
    input  [31:0] cpu_wbs_adr_i,
    // output cpu_wbs_ack_o,
    // output [31:0] cpu_wbs_dat_o,
    // DRAM control
    input  dram_wbs_ack_o,
    input  dram_burst_en_o,
    input  [31:0] dram_wbs_dat_o,
    output dram_fun_sel,
    output dram_wbs_stb_i,
    output dram_wbs_cyc_i,
    output dram_wbs_we_i,
    output [31:0] dram_wbs_adr_i,
    // ACC
    output acc_data_valid_i,
    output [31:0] acc_data_i
);

localparam IDLE   = 2'd0;
localparam FETCH  = 2'd1;
localparam READ   = 2'd2;
localparam RESEND = 2'd3;

localparam INS_ADDR = 8;

// State Machine
reg ins_cnt_w, ins_cnt_r;
reg [1:0] ps, ns;
// Instruction Buffer
reg [15:0] ins_buff_w, ins_buff_r;
// CPU instruction
wire cpu_write;
wire cpu_write_sig;
wire [7:0] cpu_checkBit;
// FIFO
wire idle;
wire not_empty;
wire multiIns;
wire i_write_en;
wire i_read_en;
wire o_fifo_full;
wire o_fifo_empty;
wire o_fifo_valid;
wire [DATA_WIDTH:0] o_fifo_data;
reg write_en_w, write_en_r;
reg read_en_w,  read_en_r;
// SDRAM
reg  dram_wbs_stb_w, dram_wbs_stb_r;
reg  dram_wbs_cyc_w, dram_wbs_cyc_r;
reg  dram_wbs_we_w, dram_wbs_we_r;
reg  dram_fun_sel_w, dram_fun_sel_r;
wire dram_send_done;
// ACC
reg  acc_data_valid_w, acc_data_valid_r;
reg  [31:0] acc_data_w, acc_data_r;
// stage cnt
reg flag_w, flag_r;
//
wire empty_wr = cpu_write & o_fifo_empty;
reg  ins_start;
reg  [INS_ADDR-1:0] base_addr_w, base_addr_r;
reg  [INS_ADDR-1:0] end_addr_w, end_addr_r;

//=======================================================================================
// Continuous Assignment
//=======================================================================================
// CPU
assign cpu_write_sig = (cpu_wbs_cyc_i & cpu_wbs_stb_i & cpu_wbs_we_i);
assign cpu_checkBit = cpu_wbs_adr_i[31-:8];
assign cpu_write = (cpu_write_sig && cpu_checkBit == `CPU_WRITE);
// FIFO
assign i_write_en = write_en_r;
assign i_read_en  = read_en_r;
assign idle = (ps == IDLE);
assign not_empty = ~o_fifo_empty;
assign multiIns = idle & not_empty;
// SDRAM
assign dram_fun_sel   = dram_fun_sel_r;
assign dram_wbs_cyc_i = dram_wbs_cyc_r;
assign dram_wbs_stb_i = dram_wbs_stb_r;
assign dram_wbs_we_i  = dram_wbs_we_r;
assign dram_wbs_adr_i = (ins_start) ? {10'h1E0, 12'd0, 2'd2, base_addr_r} : 32'd0;
assign dram_send_done = ((base_addr_r == end_addr_r) && dram_burst_en_o);
// ACC
assign acc_data_i = acc_data_r;
assign acc_data_valid_i = acc_data_valid_r;

//=======================================================================================
// Module Block
//=======================================================================================
FIFO#(
    .DEPTH(DEPTH),
    .DATA_WIDTH(DATA_WIDTH+1)
)fifo_inst(
    .clk(wb_clk_i),
    .rst(wb_rst_i),
    .i_data({cpu_wbs_adr_i[20], cpu_wbs_dat_i}),
    .write_en(i_write_en),
    .read_en(i_read_en),
    .full(o_fifo_full),
    .empty(o_fifo_empty),
    .o_valid(o_fifo_valid),
    .o_data(o_fifo_data)
);

//=======================================================================================
// Combinational Block
//=======================================================================================
always @(*) begin
    case(ps)
        IDLE: begin
            if((empty_wr || ins_cnt_r) && !dram_burst_en_o) begin
                ns = READ;
            end else if(not_empty) begin
                ns = FETCH;
            end else begin
                ns = IDLE;
            end
        end
        FETCH: ns = (flag_r) ? READ : FETCH;
        READ: begin
            if(dram_send_done) begin
                ns = IDLE;
            end else if(dram_wbs_ack_o)begin
                ns = RESEND;
            end else begin
                ns = READ;
            end
        end
        RESEND:  ns = READ;
        default: ns = IDLE;
    endcase
end

always @(*) begin
    if(~(idle & o_fifo_empty & ~ins_cnt_r) & cpu_write) begin
        write_en_w = 1'b1;
    end else begin
        write_en_w = 1'b0;
    end
end

always @(*) begin
    if(multiIns && !ins_cnt_r) begin
        read_en_w = 1'b1;
    end else begin
        read_en_w = 1'b0;
    end
end

always @(*) begin
    case(ps)
        IDLE, 
        RESEND:  flag_w = 1'b0;
        READ:    flag_w = 1'b1;
        FETCH:   flag_w = ~flag_r;
        default: flag_w = flag_r;
    endcase
    if(dram_send_done && ps == READ) begin
        ins_cnt_w = ~ins_cnt_r;
    end else begin
        ins_cnt_w = ins_cnt_r;
    end
end

always @(*) begin
    base_addr_w = base_addr_r;
    end_addr_w  = end_addr_r;
    dram_fun_sel_w = dram_fun_sel_r;
    ins_buff_w = ins_buff_r;
    case(ps)
        IDLE: begin
            if(ins_cnt_r) begin
                base_addr_w = ins_buff_r[15:8];
                end_addr_w  = ins_buff_r[7:0];
            end else if(empty_wr) begin
                base_addr_w = cpu_wbs_dat_i[15:8];
                end_addr_w  = cpu_wbs_dat_i[7:0];
            end
            if(empty_wr) begin
                dram_fun_sel_w = cpu_wbs_adr_i[20];
                ins_buff_w = cpu_wbs_dat_i[31-:16];
            end
        end
        FETCH: begin
            if(o_fifo_valid) begin
                base_addr_w = o_fifo_data[15:8];
                end_addr_w  = o_fifo_data[7:0];
                dram_fun_sel_w = o_fifo_data[DATA_WIDTH];
                ins_buff_w = o_fifo_data[31-:16];
            end
        end
        READ: begin
            if(dram_burst_en_o && !dram_send_done) begin
                base_addr_w = base_addr_r + 8'd4;
            end
        end
        default: begin
            base_addr_w = base_addr_r;
            end_addr_w  = end_addr_r;
        end
    endcase
end

always @(*) begin
    dram_wbs_stb_w = 1'b0;
    dram_wbs_cyc_w = 1'b0;
    dram_wbs_we_w  = 1'b0;
    case(ps)
        READ: begin
            if(!flag_r && !dram_burst_en_o) begin
                dram_wbs_stb_w = 1'b1;
                dram_wbs_cyc_w = 1'b1;
                dram_wbs_we_w  = 1'b0;
            end
            // if(!dram_burst_en_o) begin
                // dram_wbs_stb_w = 1'b1;
                // dram_wbs_cyc_w = 1'b1;
                // dram_wbs_we_w  = 1'b0;
            // end
        end
        default: begin
            dram_wbs_stb_w = 1'b0;
            dram_wbs_cyc_w = 1'b0;
            dram_wbs_we_w  = 1'b0;
        end
    endcase
end

always @(*) begin
    if(ps == READ && dram_burst_en_o) begin
        acc_data_w = dram_wbs_dat_o;
        acc_data_valid_w = 1'b1;
    end else begin
        acc_data_w = acc_data_r;
        acc_data_valid_w = 1'b0;
    end
end

//=======================================================================================
// Sequential Block
//=======================================================================================
always @(posedge wb_clk_i or posedge wb_rst_i) begin
    if(wb_rst_i) begin
        ps <= IDLE;
        ins_buff_r <= 16'd0;
    end else begin
        ps <= ns;
        ins_buff_r <= ins_buff_w;
    end
end

always @(posedge wb_clk_i or posedge wb_rst_i) begin
    if(wb_rst_i) begin
        read_en_r  <= 1'b0;
        write_en_r <= 1'b0;
    end else begin
        read_en_r  <= read_en_w;
        write_en_r <= write_en_w;
    end
end

always @(posedge wb_clk_i or posedge wb_rst_i) begin
    if(wb_rst_i) begin
        flag_r <= 1'b0;
        ins_cnt_r <= 1'b0;
    end else begin
        flag_r <= flag_w;
        ins_cnt_r <= ins_cnt_w;
    end
end

always @(posedge wb_clk_i or posedge wb_rst_i) begin
    if(wb_rst_i) begin
        base_addr_r <= {INS_ADDR{1'b0}};
        end_addr_r  <= {INS_ADDR{1'b0}};
    end else begin
        base_addr_r <= base_addr_w;
        end_addr_r  <= end_addr_w;
    end
end

always @(posedge wb_clk_i or posedge wb_rst_i) begin
    if(wb_rst_i) begin
        dram_wbs_stb_r <= 1'b0;
        dram_wbs_cyc_r <= 1'b0;
        dram_wbs_we_r  <= 1'b0;
        dram_fun_sel_r <= 1'b0;
    end else begin
        dram_wbs_stb_r <= dram_wbs_stb_w;
        dram_wbs_cyc_r <= dram_wbs_cyc_w;
        dram_wbs_we_r  <= dram_wbs_we_w;
        dram_fun_sel_r <= dram_fun_sel_w;
    end
end

always @(posedge wb_clk_i or posedge wb_rst_i) begin
    if(wb_rst_i) begin
        acc_data_valid_r <= 1'b0;
        acc_data_r <= 32'd0;
    end else begin
        acc_data_valid_r <= acc_data_valid_w;
        acc_data_r <= acc_data_w;
    end
end

always @(posedge wb_clk_i or posedge wb_rst_i) begin
    if(wb_rst_i) begin
        ins_start <= 1'b0;
    end else begin
        if(cpu_checkBit == `CPU_WRITE) begin
            ins_start <= 1'b1;
        end
    end
end

// always @(posedge wb_clk_i or posedge wb_rst_i) begin
//     if(wb_rst_i) begin
//         dram_wbs_adr_i <= 32'd0;
//     end else begin
//         if(ps == READ) begin
//             if(!flag_r) begin
//                 dram_wbs_adr_i <= {10'h1E0, 12'd0, 2'd2, base_addr_r}; 
//             end else begin
//                 dram_wbs_adr_i <= 32'd0;
//             end
//         end
//     end
// end

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
