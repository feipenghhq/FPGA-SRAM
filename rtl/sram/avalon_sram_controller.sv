/* ---------------------------------------------------------------
 * Copyright (c) 2022. Heqing Huang (feipenghhq@gmail.com)
 *
 * Author: Heqing Huang
 * Date Created: 04/19/2022
 * ---------------------------------------------------------------
 * General SRAM controller with avalon inteface
 * ---------------------------------------------------------------
 */

module avalon_sram_controller #(
    parameter   SRAM_AW = 18,   // SRAM address width
    parameter   SRAM_DW = 16,   // SRAM data width
    parameter   AVS_AW = 19,    // Input bus address
    parameter   AVS_DW = 16     // Input bus data width
) (
    input                   clk,
    input                   reset,
    // Avalon interface bus
    input                   avs_read,
    input                   avs_write,
    input  [AVS_AW-1:0]     avs_address,
    input  [AVS_DW-1:0]     avs_writedata,
    input  [AVS_DW/8-1:0]   avs_byteenable,
    output [AVS_DW-1:0]     avs_readdata,
    // sram interface
    output                  sram_ce_n,
    output                  sram_oe_n,
    output                  sram_we_n,
    output [SRAM_DW/8-1:0]  sram_be_n,
    output [SRAM_AW-1:0]    sram_addr,
    output [SRAM_DW-1:0]    sram_dq_write,
    output [SRAM_DW-1:0]    sram_dq_en,
    input  [SRAM_DW-1:0]    sram_dq_read
);

    // --------------------------------------------
    //  Signal Declaration
    // --------------------------------------------

    reg                   avs_read_s0;
    reg                   avs_write_s0;
    reg  [AVS_AW-1:0]     avs_address_s0;
    reg  [AVS_DW-1:0]     avs_writedata_s0;
    reg  [AVS_DW/8-1:0]   avs_byteenable_s0;

    // --------------------------------------------
    //  main logic
    // --------------------------------------------

    // register the user bus
    always @(posedge clk) begin
        if (reset) begin
            avs_read_s0 <= 0;
            avs_write_s0 <= 0;
        end
        else begin
            avs_read_s0 <= avs_read;
            avs_write_s0 <= avs_write;
        end
    end

    always @(posedge clk) begin
        avs_address_s0 <= avs_address;
        avs_writedata_s0 <= avs_writedata;
        avs_byteenable_s0 <= avs_byteenable;
    end

    // drive the sram interface
    assign sram_addr = avs_address_s0;
    assign sram_ce_n = ~(avs_read_s0 | avs_write_s0);
    assign sram_oe_n = ~avs_read_s0;
    assign sram_we_n = ~avs_write_s0;
    assign sram_be_n = ~avs_byteenable_s0;
    assign sram_dq_write = avs_writedata_s0;
    assign sram_dq_en = avs_write_s0;

    // read data to user bus
    assign avs_readdata = sram_dq_read;

endmodule


