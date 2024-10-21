import pytest

import subprocess


def test_dma():
    subprocess.run("peakrdl cocotb_ralgen DMA.rdl -o .".split())
