.ONESHELL:
SHELL=/bin/bash
BO_DIR ?= bo
TOP_FILE = $(Dma_ROOT)/verilog/mkDma.v

build_opts= -elab -p /prj/tools/lib/bo:+ +RTS -K128M -RTS -u -verilog -remove-dollar -steps 10000000 -vdir ../verilog -bdir $(BO_DIR) -info-dir $(BO_DIR) -aggressive-conditions -no-warn-action-shadowing -no-show-timestamps -check-assert -show-range-conflict -keep-fires -keep-inlined-boundaries

build_bsv: bo
	bsc $(build_opts)   top.bsv

bo:
	mkdir bo
.PHONY:all clean test
