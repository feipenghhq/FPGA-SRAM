// ---------------------------------------------------------------
// Copyright (c) 2022 Heqing Huang
//
// Template taken from ECE5760
// https://people.ece.cornell.edu/land/courses/ece5760/DE2/DDS_Example/sine_wave.v
//
// ---------------------------------------------------------------


module de2_top (
    // Clock Input
    input         CLOCK_50,    // 50 MHz
    // SRAM Interface
    inout  [15:0] SRAM_DQ,     // SRAM Data bus 16 Bits
    output [17:0] SRAM_ADDR,   // SRAM Address bus 18 Bits
    output        SRAM_UB_N,   // SRAM High-byte Data Mask
    output        SRAM_LB_N,   // SRAM Low-byte Data Mask
    output        SRAM_WE_N,   // SRAM Write Enable
    output        SRAM_CE_N,   // SRAM Chip Enable
    output        SRAM_OE_N    // SRAM Output Enable
);

    logic [1:0]     sram_be_n;

    assign SRAM_LB_N = sram_be_n[0];
    assign SRAM_UB_N = sram_be_n[1];


    // QSYS TOP LEVEL
    de2 sopc (
            .clk_clk            (CLOCK_50),
            .sram_addr          (SRAM_ADDR),
		    .sram_dq            (SRAM_DQ),
		    .sram_ce_n          (SRAM_CE_N),
		    .sram_oe_n          (SRAM_OE_N),
		    .sram_we_n          (SRAM_WE_N),
		    .sram_be_n          (sram_be_n)
    );

endmodule
