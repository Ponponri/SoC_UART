module uart #(
  parameter BAUD_RATE = 9600 
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif
  // Wishbone Slave ports (WB MI A)
  input wire    wb_clk_i,
  input wire    wb_rst_i,
  input wire    wbs_stb_i,
  input wire    wbs_cyc_i,
  input wire    wbs_we_i,
  input wire    [3:0] wbs_sel_i,
  input wire    [31:0] wbs_dat_i,
  input wire    [31:0] wbs_adr_i,
  output wire   wbs_ack_o,
  output wire   [31:0] wbs_dat_o,

  // IO ports
  input  [`MPRJ_IO_PADS-1:0] io_in, // The io_in[..] signals are from the pad to the user project and are always
									// active unless the pad has been configured with the "input disable" bit set.
  output [`MPRJ_IO_PADS-1:0] io_out,// The io_out[..] signals are from the user project to the pad.
  output [`MPRJ_IO_PADS-1:0] io_oeb,// The io_oeb[..] signals are from the user project to the pad cell.  This
									// controls the direction of the pad when in bidirectional mode.  When set to
									// value zero, the pad direction is output and the value of io_out[..] appears
									// on the pad.  When set to value one, the pad direction is input and the pad
									// output buffer is disabled.

  // irq
  output [2:0] user_irq,

  // user-define
  output tx_finish
);

  localparam RX_DATA  = 32'h3000_0000;
  localparam TX_DATA	= 32'h3000_0004;


  // user-define
  assign tx_finish = tx_start_clear;

  // UART 
  wire  tx;
  wire  rx;

  assign io_oeb[6] = 1'b0; // Set mprj_io_31 to output
  assign io_oeb[5] = 1'b1; // Set mprj_io_30 to input
  assign io_out[6] = tx;	// Connect mprj_io_6 to tx
  assign rx = io_in[5];	// Connect mprj_io_5 to rx

  // irq
  wire irq;
  // assign user_irq = {2'b00,irq};	// Use USER_IRQ_0
  assign user_irq = {2'b00,rx_fifo_irq};	// Use USER_IRQ_0

  // CSR
  wire [7:0] rx_data; 
  wire irq_en;
  wire rx_finish;
  wire rx_busy;
  wire [7:0] tx_data;
  wire tx_start_clear;
  wire tx_start;
  wire tx_busy;
  wire wb_valid;
  wire frame_err;

  // rx fifo
  wire [7:0] rx_data_fifo; 
  wire [1:0] rx_cnt; 
  wire rx_isEmpty,rx_isFull;
  reg rx_fifo_irq;
  reg [1:0]rx_flag;

  // tx fifo
  wire [7:0] tx_data_fifo; 
  wire [1:0] tx_cnt; 
  wire tx_isEmpty,tx_isFull;
  // reg tx_fifo_irq;
  reg [1:0]tx_flag;
  wire tx_push;
  
  // ctrl
  wire [31:0]crtl_stat;
  reg  [31:0]crtl_stat_p;

  always @(posedge wb_clk_i or negedge wb_rst_i) begin
    if(wb_rst_i) crtl_stat_p <= 32'h0;
    else crtl_stat_p <= crtl_stat;
  end
  
  // 32'h3000_0000 memory regions of user project  
  assign wb_valid = (wbs_adr_i[31:8] == 32'h3000_00) ? wbs_cyc_i && wbs_stb_i : 1'b0;
  // assign wb_valid = (wbs_adr_i[31:8] == 32'h3000_00) ? 1'b1 : 1'b0;

  wire [31:0] clk_div;
  assign clk_div = 40000000 / BAUD_RATE;
  
  // tx start
  reg tx_start_fifo;
  always @(posedge wb_clk_i or negedge wb_rst_i) begin
    if(wb_rst_i) begin
      tx_start_fifo <= 1'b0;
    end else begin
      if(tx_cnt > 0 && !tx_busy && !tx_start_clear)
        tx_start_fifo <= 1'b1;
      else
        tx_start_fifo <= 1'b0;
    end
  end
  // tx push
  assign tx_push = (tx_flag == 2'b10)? 1'b1 : 1'b0;
  always @(posedge wb_clk_i or negedge wb_rst_i) begin
    if(wb_rst_i) begin
      tx_flag <= 2'b00;
    end else begin
      tx_flag[1] <= tx_start;
      tx_flag[0] <= tx_flag[1];
    end
  end

  // rx irq
  reg [1:0]irq_cnt;
  reg [1:0]irq_valid;
  reg [1:0]rx_irq_finish;

  always @(posedge wb_clk_i or negedge wb_rst_i) begin
    if(wb_rst_i) begin
      rx_irq_finish <= 2'b00;
    end
    else begin
      rx_irq_finish[1] <= rx_fifo_irq;
      rx_irq_finish[0] <= rx_irq_finish[1];
    end
  end

  always @(posedge wb_clk_i or negedge wb_rst_i) begin
    if(wb_rst_i) irq_cnt <= 2'b00;
    else if(irq) irq_cnt <= irq_cnt + 1'b1;
    else if(rx_irq_finish == 2'b10) irq_cnt <= irq_cnt - 1'b1;
    else irq_cnt <= irq_cnt;
  end

  always @(posedge wb_clk_i or negedge wb_rst_i) begin
    if(wb_rst_i) irq_valid <= 2'b11;
    // else if(wbs_adr_i == 32'hf0006810) irq_valid <= 1'b1;
    else if(crtl_stat == 32'h5 && crtl_stat_p == 32'h9) irq_valid <= 2'b01;
    else if(crtl_stat == 32'h5 && crtl_stat_p == 32'h5 && irq_valid == 2'b01) irq_valid <= 2'b10;
    else if(crtl_stat == 32'h5 && crtl_stat_p == 32'h5 && irq_valid == 2'b10) irq_valid <= 2'b11;
    // else if(wbs_adr_i == TX_DATA) irq_valid <= 1'b1;
    // else if(wbs_adr_i == 32'hf0006810) irq_valid[0] <= 1'b1;
    // else if(wbs_adr_i == 32'h100001b8 && irq_valid[0]) irq_valid[1] <= 1'b1;
    else if(rx_fifo_irq) irq_valid <= 2'b00;
    else irq_valid <= irq_valid;
  end

  always @(posedge wb_clk_i or negedge wb_rst_i) begin
    if(wb_rst_i) rx_fifo_irq <= 1'b0;
    else if(irq_cnt > 0 && irq_valid == 2'b11) rx_fifo_irq <= 1'b1;
    else rx_fifo_irq <= 1'b0;
  end

  // always @(posedge wb_clk_i or negedge wb_rst_i) begin
  //   if(wb_rst_i) rx_fifo_irq <= 1'b0;
  //   else rx_fifo_irq <= irq;
  // end

  // always @(posedge wb_clk_i or negedge wb_rst_i) begin
  //   if(wb_rst_i) begin
  //     rx_flag <= 2'b00;
  //   end else begin
  //     rx_flag[0] <= rx_flag[1];

  //     if(rx_cnt > 0 && !tx_busy && crtl_stat[3:0] == 4'h5)begin
  //       rx_flag[1] = 1'b1;
  //     end else begin
  //       rx_flag[1] = 1'b0;
  //     end
  //   end
  // end

  // always @(posedge wb_clk_i or posedge rx_flag) begin
  //   if(tx_finish && rx_cnt > 0)begin
  //   // if(rx_cnt > 0 && crtl_stat[3:0] == 4'h5)begin
  //     rx_fifo_irq = 1'b1;
  //   end else if(rx_flag == 2'b10)begin
  //     rx_fifo_irq = 1'b1;
  //   end else begin
  //     rx_fifo_irq = 1'b0;
  //   end
  // end


  uart_receive receive(
    .rst_n      (~wb_rst_i  ),
    .clk        (wb_clk_i   ),
    .clk_div    (clk_div    ),
    .rx         (rx         ),
    .rx_data    (rx_data    ),
    .rx_finish  (rx_finish  ),	// data receive finish
    .irq        (irq        ),
    .frame_err  (frame_err  ),
    .busy       (rx_busy    )
  );

  fifo_uart rx_fifo(
    .rst_n      (~wb_rst_i  ),
    .clk        (wb_clk_i   ),
    .data_i     (rx_data    ),
    .push       (irq        ),
    .pop        (rx_finish  ),

    .data_o     (rx_data_fifo),
    .cnt        (rx_cnt     ),
    .isEmpty    (rx_isEmpty ),
    .isFull     (rx_isFull  )
  );

  uart_transmission transmission(
    .rst_n      (~wb_rst_i  ),
    .clk        (wb_clk_i   ),
    .clk_div    (clk_div    ),
    .tx         (tx         ),
    // .tx_data    (tx_data    ),
    .tx_data    (tx_data_fifo),
    .clear_req  (tx_start_clear), // clear transmission request
    // .tx_start   (tx_start   ),
    .tx_start   (tx_start_fifo),
    .busy       (tx_busy    )
  );

  fifo_uart tx_fifo(
    .rst_n      (~wb_rst_i  ),
    .clk        (wb_clk_i   ),
    .data_i     (tx_data    ),
    .push       (tx_push    ),
    .pop        (tx_start_clear),

    .data_o     (tx_data_fifo),
    .cnt        (tx_cnt     ),
    .isEmpty    (tx_isEmpty ),
    .isFull     (tx_isFull  )
  );
  
  ctrl ctrl(
	.rst_n		(~wb_rst_i),
	.clk		  (wb_clk_i	),
  .i_wb_valid(wb_valid),
	.i_wb_adr	(wbs_adr_i),
	.i_wb_we	(wbs_we_i	),
	.i_wb_dat	(wbs_dat_i),
	.i_wb_sel	(wbs_sel_i),
	.o_wb_ack	(wbs_ack_o),
	.o_wb_dat (wbs_dat_o),
	// .i_rx		  (rx_data	),
  // .i_irq    (irq      ),
  .i_rx		  (rx_data_fifo	),
  .i_irq    (rx_fifo_irq  ),
  .i_frame_err  (frame_err),
  // .i_rx_busy    (rx_busy  ),
  .i_rx_busy    (1'b0  ),
	.o_rx_finish  (rx_finish),
	.o_tx		      (tx_data	),
	// .i_tx_start_clear(tx_start_clear), 
	.i_tx_start_clear(tx_push), 
  .i_tx_busy    (tx_busy  ),
	.o_tx_start	  (tx_start ),
  .stat_reg     (crtl_stat) // new
  );

endmodule


module fifo_uart(
  input rst_n,
  input clk,
  input [7:0]data_i,
  input push,
  input pop,

  output reg [7:0]data_o,
  output reg [1:0]cnt,
  output reg isEmpty,
  output reg isFull
);

reg [7:0]mem[3:0];
reg [1:0]start_ptr,end_ptr;

always @(*) begin
    if(start_ptr == end_ptr) begin
      isFull = 1'b0;
      isEmpty = 1'b1;
    end else if(start_ptr-1 == end_ptr) begin
      isFull = 1'b1;
      isEmpty = 1'b0;
    end else begin
      isFull = 1'b0;
      isEmpty = 1'b0;
    end
end

always @(*) begin
    data_o = mem[start_ptr];
    if(push) mem[end_ptr] = data_i;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      start_ptr <= 4'h0;
      end_ptr <= 4'h0;
      cnt <= 2'b00;
    end else begin
      if(push && !isFull) begin
        start_ptr <= start_ptr;
        end_ptr <= end_ptr + 4'h1;
        cnt <= cnt + 2'b1;
      end 
      if(pop && !isEmpty) begin
        start_ptr <= start_ptr + 4'h1;
        end_ptr <= end_ptr;
        cnt <= cnt - 2'b1;
      end
    end
end

endmodule
