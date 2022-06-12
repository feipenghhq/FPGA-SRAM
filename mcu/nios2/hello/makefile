
#########################################################
# Makefile
#########################################################

GIT_ROOT ?= $(shell git rev-parse --show-toplevel)
BOARD ?= de2

SOPC_DIR ?= $(GIT_ROOT)/fpga/$(BOARD)/src
SOPC ?= $(BOARD)

include $(GIT_ROOT)/tools/nios2/makefile.mk
