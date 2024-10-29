# peakrdl-cocotb-ralgenerator

A SystemRDL to raltest converter for cocotb.

This VIP confirms to sysrdl 1.2 and ral 1.0 format.
# Installation

```
pip3 install peakrdl-cocotb-ralgenerator
```
# Usage

```
peakrdl cocotb_ralgenerator <SystemRDL File> -o <output folder>
```

## Cocotb test file

Standard cocotb header

```python3
"""Test for verilog simulation."""
import cocotb
from cocotb.triggers import RisingEdge
```

* All agents are in SOCEnv
* CallbackBase defines read and write function for background read/write
* rw_test: supports foreground+background read/write tests to the register space
* reset_test: Checks the register value at reset.

```python3
from soc_env import SOCEnv
from peakrdl_cocotb_ralgenerator.callbacks.callback_base import CallbackBase
from peakrdl_cocotb_ralgenerator.testcases import rw_test, reset_test
from soc_RAL import soc_RAL_Test as RAL
```
### RAL Reset Test

```python3
@cocotb.test
async def test_ral_reset(dut):
    """Ral test reset."""
    env = SOCEnv(dut)
```
We are creating an instance of the ral model with a custom callback for background access. This callback function (defined later in this file) traverses through the soc hierarchy to find the correct leaf module for each register.


* The start function starts the reset and clock generator.
* env.cfg provides a consistent read write interface over the `cocotbext-axi` driver
* We have a function in env which awaits for the clock_on event in the reset stage.
* To accommodate registers with sync reset we wait for one cycle
* The reset_test.reset_test performs the following action:
	* Takes the reset value from systemRDL description
	* Masks it with donttest_mask and reset_mask
	* Reads the value from RTL
	* Masks it with donttest_mask and reset_mask
	* Tests equality of systemRDL value and RTL value

*Note:* This test fails with the provided RTL because of an aggressive optimization performed on the read data bus.

```python3
    ral = RAL(env.cfg, callback=BSVCallback(dut))
    env.start()
    await env.clk_in_reset()
    await RisingEdge(env.dut.CLK)
    await reset_test.reset_test(ral, verbose=True)
```

### RAL Read Write Test
The read write test performs the following function.

1. Performs a background read of all registers.
2. Masks any bits marked `donttest`
3. Stores the read values in `default_read` dict
4. Performs a transaction on each register with the following steps:
	1. Write random/user selected value to register:
		1. If the write is background update entry for register in `default_read` dict with `wdata & donttest_mask`
		2. If the write is foreground update entry for register in `default_read` dict with `wdata & write_mask &donttest_mask`
	2. Perform a background read of all register spaces and ensure that there are no mismatches.
	3. Read the register:
		1. If the read is foreground ensure that the read data matches `default_read[reg] & read_mask`
		2. If the read is background ensure that the read data matches `default_read[reg]

```python3
@cocotb.test
async def test_ral_fgwr_fgrd(dut):
    """Ral test foreground rd and write."""
    env = SOCEnv(dut)
    env.start()
    ral = RAL(env.cfg)
    await run_ral_rw_check(env, ral)


@cocotb.test
async def test_ral_fgwr_bgrd(dut):
    """Ral test foreground write background read."""
    env = SOCEnv(dut)
    env.start()
    ral = RAL(env.cfg, callback=BSVCallback(dut))
    await run_ral_rw_check(env, ral, rdfg=False)


@cocotb.test
async def test_ral_bgwr_fgrd(dut):
    """Ral test Background wr foreground read."""
    env = SOCEnv(dut)
    env.start()
    ral = RAL(env.cfg, callback=BSVCallback(dut))
    await run_ral_rw_check(env, ral, wrfg=False)

async def run_ral_rw_check(env, ral, *, wrfg=True, rdfg=True):
    """Run method of RAL test."""
    await env.reset_done()
    await RisingEdge(env.dut.CLK)
    await rw_test.rw_test(
        ral,
        foreground_read=rdfg,
        foreground_write=wrfg,
        count=1,
        verbose=True,
    )
```

### Signal Finder

The hierarchical location of the register module and the actual signal name is implementation dependent. A mapping function is required to facilitate background access.

For most cases the read and writes happen to the same signals so these are encapsulated in the CallbackBase class.
in BSVCallback we write the sig function which uses the path array to locate the signal.

```python3
class BSVCallback(CallbackBase):
    """Signal finder for the SOC Hierarchy."""

    def sig(self, sighash):
        """Signal finder function."""
        path = sighash["path"]
        d = self.dut
        for i in path[1:3]:
            d = getattr(d, i)
        sig = f"s{path[3].lower()}{path[4]}"
        return getattr(d, sig) if hasattr(d, sig) else getattr(d, sig + "_wget")
```
# Supporting different RTL generators.
For interfacing your RTL Generator generated code, ralgenerator needs to know the pattern used by you for signal naming.
You can provide this information by passing a Callback function which maps the signal from systemRDL to RTL and provides methods to read & write to it.

# Adding new tests.

New tests can be added to the testcases folder.

# Contribution
PR's for supporting different RTL generators or test strategies are welcome.

# Example

For a complete working example [check the tests folder](https://github.com/dyumnin/cocotb-ralgenerator/blob/main/tests/cocotbtest_dma.py).
