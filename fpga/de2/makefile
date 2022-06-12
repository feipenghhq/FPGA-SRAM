
#########################################################
# Makefile for project
#########################################################

# Common variable
GIT_ROOT = $(shell git rev-parse --show-toplevel)
PWD		 = $(shell pwd)
OUT_DIR  = $(PWD)/quartus

#########################################################
# Project specific variable
#########################################################

PROJECT = de2
TOP = de2_top
SDC	= $(PWD)/src/de2.sdc
PIN = $(PWD)/src/de2_pin.tcl
QSYS = de2
QSYS_DIR = $(PWD)/src
QSYS_SEARCH = $(GIT_ROOT)/rtl/sram

VERILOG += $(PWD)/src/de2_top.sv

include $(GIT_ROOT)/tools/quartus/makefile.qsys.mk
