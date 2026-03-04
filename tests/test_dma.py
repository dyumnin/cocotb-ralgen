"""Test compilation of DMA RDL."""
import subprocess


def test_dma():
    """Test compilation of DMA RDL."""
    subprocess.run("peakrdl cocotb_ralgen DMA.rdl -o .".split(), check=False)
