# FPGA SRAM

- [FPGA SRAM](#fpga-sram)
  - [Introduction](#introduction)
  - [Running Demo Project on DE2 FPGA Board](#running-demo-project-on-de2-fpga-board)

## Introduction

Avalon Memory Mapped SRAM controller for FPGA

## Running Demo Project on DE2 FPGA Board

```sh
# 1. Generate Quartus Programming file using Quartus 13.0sp1
cd fpga/de2
make sof

# 2. Program sof into FPGA.
make pgm

# 3. Generate software collateral
cd demo/hello
make env        # Enter Altera Nios2 Command Shell
make compile    # Compile BSP and APP

# 4. Open nios2-terminal in another terminal (Terminal 2)
cd demo/hello
make env
nios2-terminal

# 4. Download the elf files to NIOS II CPU (Terminal 1)
make download

# Now you should see the program print hello world and calculate fib number 1 - 40.
```

