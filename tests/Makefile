export COCOTB_RESOLVE_X=RANDOM
VERILOG_SOURCES+=verilog/mkDMACsr_6_32.v
VERILOG_SOURCES+=verilog/mkDMACsr_32_32.v
VERILOG_SOURCES+=verilog/FIFO2.v
VERILOG_SOURCES+=verilog/SizedFIFO.v
VERILOG_SOURCES+=verilog/SizedFIFO0.v
VERILOG_SOURCES+=verilog/mkAXI4_3dma.v
VERILOG_SOURCES+=verilog/mkAXI4_top.v
VERILOG_SOURCES+=verilog/mkMDMA.v
VERILOG_SOURCES+=verilog/mkSdma.v

TOPLEVEL=mkDMACsr_6_32
MODULE=cocotbtest_dma

runtop:
	peakrdl cocotb_ralgen top.rdl -o .
	$(MAKE) sim WAVES=1 TOPLEVEL=mkMDMA MODULE=cocotbtest_mdma
run:
	peakrdl cocotb_ralgen DMA.rdl -o .
	$(MAKE) sim WAVES=1
include $(shell cocotb-config --makefiles)/Makefile.sim
.venv:
	python3 -m venv .venv
	source .venv/bin/activate && pip3 install -r requirements.txt
.PHONY:all clean test run
