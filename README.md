# peakrdl-cocotb-ralgen

A SystemRDL to Raltest converter for cocotb.

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
from <AddrMap Name>_RAL import <AddrMap Name>_RAL_Test
...
ral=<AddrMap Name>_RAL_Test(regmodel)
from <AddrMap_Name>_RAL import <AddrMap_Name>_RAL_Test as RAL
@cocotb.test
async def test_ral(dut):
    env=Env(dut)
    await env.ral.rw_test()
...
```

And in your cocotb env file
```
from <AddrMap_Name>.reg_model.<AddrMap_Name> import <AddrMap_Name>_cls
from <AddrMap_Name>.lib  import AsyncCallbackSet
from <AddrMap_Name>_RAL import <AddrMap_Name>_RAL_Test as RAL
class Env:
     def __init__(dut,...):
	self.reg=<AddrMap_Name>_cls(
		 callbacks=AsyncCallbackSet(
		    read_callback=self.readReg,
		    write_callback=self.writeReg
		    ))
        self.ral=RAL(self.reg)
    async def ral_rw(self):
        self.ral.rw_test()
...

```
for a complete working example check the tests folder.
