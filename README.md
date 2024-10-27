# peakrdl-cocotb-ralgen

A SystemRDL to raltest converter for cocotb.

This VIP confirms to sysrdl 1.2 and ral 1.0 format.
# Installation

```
pip3 install peakrdl-cocotb-ralgen
```
# Usage

```
peakrdl cocotb_ralgen <SystemRDL File> -o <output folder>
peakrdl python <SystemRDL File> -o <output folder>
```

Then in your cocotb test file
```
...
from peakrdl_cocotb_ralgen.callbacks.bsv import Callback
from peakrdl_cocotb_ralgen.testcases import rw_test, reset_test
from <AddrMap Name>_RAL import <AddrMap_Name>_RAL_Test as RAL
...
```
To read and check the value of all registers at Reset.
```
@cocotb.test
async def test_ral_reset(dut):
    """Ral test reset."""
    env = Env(dut)
    ral = RAL(env.reg, callback=Callback(dut))
    env.start()
    await FallingEdge(dut.rst_n)
    await ReadOnly()
    await reset_test.reset_test(ral, verbose=True)
```

To perform read write checks:

```
@cocotb.test
async def test_ral_readwrite(dut):
    """Ral test reset."""
    env = Env(dut)
    ral = RAL(env.reg, callback=Callback(dut))
    await RisingEdge(dut.rst_n)
    await ReadOnly()
    await rw_test.rw_test(ral,
    verbose=True
        foreground_read=True,
        foreground_write=False,
        count=1,
        verbose=True,
    )
...
```
# Supporting different RTL generators.
For interfacing your RTL Generator generated code, ralgen needs to know the pattern used by you for signal naming.
You can provide this information by passing a Callback function which maps the signal from systemRDL to RTL and provides methods to read & write to it.

# Adding new tests.

New tests can be added to the testcases folder.

# Contribution
PR's for supporting different RTL generators or test strategies are welcome.

# Example

For a complete working example [check the tests folder](https://github.com/dyumnin/cocotb-ralgen/blob/main/tests/cocotbtest_dma.py).
