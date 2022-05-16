# ==================================================================================
# Makefile
# ==================================================================================


GIT_ROOT = $(shell git rev-parse --show-toplevel)
PWD 	 = $(shell pwd)

# defaults
SIM ?= verilator
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(GIT_ROOT)/rtl/sram/avalon_sram_controller.sv
TOPLEVEL = avalon_sram_controller

MODULE 	 =

DUMP ?= 0
COVR ?= 0
LINT ?= 0

ifeq ($(SIM),verilator)
EXTRA_ARGS += -I$(GIT_ROOT)/rtl/common
ifeq ($(COVR), 1)
	EXTRA_ARGS += --coverage
endif
ifeq ($(DUMP), 1)
	EXTRA_ARGS += --trace-fst --trace-structs
endif
ifeq ($(LINT), 1)
	EXTRA_ARGS += --lint-only
endif
endif

# Other variable
export COCOTB_RESOLVE_X=RANDOM
export PYTHONPATH = $(GIT_ROOT)/cocotb

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
