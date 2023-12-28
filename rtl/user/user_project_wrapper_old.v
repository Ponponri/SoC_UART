// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,

    output wbs_ack_o, // dma
    output [31:0] wbs_dat_o, // dma
    // output reg wbs_ack_o, // uart
    // output reg [31:0] wbs_dat_o, // uart

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/
localparam DATA_WIDTH = 32;
localparam DEPTH = 4;

wire [3:0]  cpu_wbs_sel_i;
wire [31:0] cpu_wbs_dat_i;
wire [31:0] cpu_wbs_adr_i;
wire cpu_wbs_ack_o;
wire [31:0] cpu_wbs_dat_o;
wire dram_burst_valid_o;
wire dram_wbs_stb_i;
wire dram_wbs_cyc_i;
wire dram_wbs_we_i;
wire dma_wbs_ack_o;
wire [31:0] dram_wbs_adr_i;
wire acc_data_valid_i;
wire [31:0] acc_data_i;
wire dram_fun_sel;

wire i_dram_wbs_ack;
wire [31:0] i_dram_wbs_dat;

wire no_use_burst_valid;
wire no_use_ack;

// // uart
// // wire [`MPRJ_IO_PADS-1:0]io_out;
// // wire [`MPRJ_IO_PADS-1:0]io_oeb;
// wire [31:0]wbs_dat_o_uart;
// wire wbs_ack_o_uart;
// // wire [2:0]user_irq;

// // wire [`MPRJ_IO_PADS-1:0]io_out_mprj;
// // wire [`MPRJ_IO_PADS-1:0]io_oeb_mprj;
// wire [31:0]wbs_dat_o_mprj;
// wire wbs_ack_o_mprj;
// wire [2:0]user_irq_mprj;


// wire tx_finish;

// reg io_in5_buf;
// reg io_in5_buf2;
// wire io_in5_neg;
// reg inflag;

// always @(posedge wb_clk_i or posedge wb_rst_i)begin
//     if(wb_rst_i)begin
//         io_in5_buf <= 1'b0;
//         io_in5_buf2 <= 1'b0;
//     end else begin
//         io_in5_buf <= io_in[5];
//         io_in5_buf2 <= io_in5_buf;
//     end
// end

// assign io_in5_neg = (~io_in5_buf) & io_in5_buf2;

// always @(posedge wb_clk_i or posedge wb_rst_i)begin
//     if(wb_rst_i)begin
//         inflag <= 1'b0;
//     end else begin
//         if(io_in5_neg)begin
//             inflag <= 1'b1;
//         // todo
//         end else if(tx_finish)begin
//             inflag <= 1'b0;
//         end else begin
//             inflag <= inflag;
//         end
//     end
// end

// assign wbs_dat_o = (inflag && wbs_ack_o_uart)?(wbs_dat_o_uart):(i_dram_wbs_dat); // mux
// assign wbs_ack_o = (inflag && wbs_ack_o_uart)?(wbs_ack_o_uart):(i_dram_wbs_ack); // mux

// // old
// // always @(*)begin
// //     if(inflag && wbs_ack_o_uart)begin
// //         wbs_dat_o = wbs_dat_o_uart;
// //         wbs_ack_o = wbs_ack_o_uart;

// //     end else begin
// //         // wbs_dat_o = wbs_dat_o_mprj; // uart
// //         // wbs_ack_o = wbs_ack_o_mprj; // uart
// //         wbs_dat_o = i_dram_wbs_dat; // dma
// //         wbs_ack_o = i_dram_wbs_ack; // dma
// //     end
// // end
// // end old

// // assign io_out = io_out;
// // assign io_oeb = io_oeb;
// // assign user_irq = user_irq;


// uart uart (
// `ifdef USE_POWER_PINS
// 	.vccd1(vccd1),	// User area 1 1.8V power
// 	.vssd1(vssd1),	// User area 1 digital ground
// `endif
//     .wb_clk_i(wb_clk_i),
//     .wb_rst_i(wb_rst_i),

//     // MGMT SoC Wishbone Slave

//     .wbs_stb_i(wbs_stb_i),
//     .wbs_cyc_i(wbs_cyc_i),
//     .wbs_we_i(wbs_we_i),
//     .wbs_sel_i(wbs_sel_i),
//     .wbs_dat_i(wbs_dat_i),
//     .wbs_adr_i(wbs_adr_i),
//     .wbs_ack_o(wbs_ack_o_uart),
//     .wbs_dat_o(wbs_dat_o_uart),
//     //.wbs_ack_o(wbs_ack_o),
//     //.wbs_dat_o(wbs_dat_o),

//     // IO ports
//     .io_in  (io_in      ),
//     .io_out (io_out     ),
//     .io_oeb (io_oeb     ),
//     //.io_out (io_out     ),
//     //.io_oeb (io_oeb     ),

//     // irq
//     .user_irq (user_irq),

//     //user-define
//     .tx_finish(tx_finish)
// );

// // end uart



user_proj_example mprj (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    // MGMT SoC Wishbone Slave
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_ack_o(i_dram_wbs_ack), // dma
    .wbs_dat_o(i_dram_wbs_dat), // dma

    // // uart
    // .wbs_ack_o(wbs_ack_o_mprj),
    // .wbs_dat_o(wbs_dat_o_mprj),
    // // end uart

    // Logic Analyzer
    .la_data_in(la_data_in),
    .la_data_out(la_data_out),
    .la_oenb (la_oenb),

    // IO Pads
    .io_in (io_in),
    .io_out(io_out),
    .io_oeb(io_oeb),
    // IRQ
    .irq(user_irq),

    // // uart
    // // IO Pads
    // .io_in (io_in),
    // .io_out(io_out_mprj),
    // .io_oeb(io_oeb_mprj),
    // // uart
    // // IRQ
    // .irq(user_irq_mprj),
    // // end uart

    // DMA
    .dma_fun_sel(dram_fun_sel),
    .dma_wbs_cyc_i(dram_wbs_cyc_i),
    .dma_wbs_stb_i(dram_wbs_stb_i),
    .dma_wbs_we_i(dram_wbs_we_i),
    .dma_wbs_adr_i(dram_wbs_adr_i),
    .dma_brust_valid(dram_burst_valid_o),
    .dma_wbs_ack_o(dma_wbs_ack_o)
);

user_proj_example onlyCPU(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    // MGMT SoC Wishbone Slave
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_dat_o(wbs_dat_o),

    // Logic Analyzer
    .la_data_in(la_data_in),
    .la_data_out(la_data_out),
    .la_oenb (la_oenb),

    // IO Pads
    .io_in (io_in),
    .io_out(io_out),
    .io_oeb(io_oeb),

    // IRQ
    .irq(user_irq),

    // DMA
    .dma_fun_sel    (dram_fun_sel),
    .dma_wbs_cyc_i  (dram_wbs_cyc_i),
    .dma_wbs_stb_i  (dram_wbs_stb_i),
    .dma_wbs_we_i   (dram_wbs_we_i),
    .dma_wbs_adr_i  (32'd0),
    .dma_brust_valid(no_use_burst_valid),
    .dma_wbs_ack_o  (no_use_ack)
);

DMA #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH)
)DMA_inst(
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    // Caravel W)b
    .cpu_wbs_stb_i(wbs_stb_i),
    .cpu_wbs_cyc_i(wbs_cyc_i),
    .cpu_wbs_we_i(wbs_we_i),
    .cpu_wbs_sel_i(wbs_sel_i),
    .cpu_wbs_dat_i(wbs_dat_i),
    .cpu_wbs_adr_i(wbs_adr_i),
    // DRAM control
    .dram_fun_sel(dram_fun_sel),
    .dram_burst_en_o(dram_burst_valid_o),
    .dram_wbs_ack_o(dma_wbs_ack_o),
    .dram_wbs_dat_o(i_dram_wbs_dat),
    .dram_wbs_stb_i(dram_wbs_stb_i),
    .dram_wbs_cyc_i(dram_wbs_cyc_i),
    .dram_wbs_we_i(dram_wbs_we_i),
    .dram_wbs_adr_i(dram_wbs_adr_i),
    // ACC
    .acc_data_valid_i(acc_data_valid_i),
    .acc_data_i(acc_data_i)

);


endmodule	// user_project_wrapper

`default_nettype wire
