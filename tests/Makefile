export COCOTB_RESOLVE_X=RANDOM
VERILOG_SOURCES+=verilog/mkDMACsr_6_32.v
VERILOG_SOURCES+=verilog/FIFO2.v
TOPLEVEL=mkDMACsr_6_32
MODULE=cocotbtest_dma

run:
	peakrdl cocotb_ralgen DMA.rdl -o .
	peakrdl python DMA.rdl -o . --async
	# peakrdl bsv DMA.rdl -o verilog
	$(MAKE) sim WAVES=1
include $(shell cocotb-config --makefiles)/Makefile.sim
.venv:
	python3 -m venv .venv
	source .venv/bin/activate && pip3 install -r requirements.txt
.PHONY:all clean test run
