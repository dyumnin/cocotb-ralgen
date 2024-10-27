"""Test for verilog simulation."""
import cocotb
from cocotb.triggers import RisingEdge
from env import Env
from peakrdl_cocotb_ralgen.callbacks.callback_base import CallbackBase
from peakrdl_cocotb_ralgen.testcases import rw_test, reset_test
from top_RAL import top_RAL_Test as RAL


@cocotb.test
async def test_ral_reset(dut):
    """Ral test reset."""
    env = Env(dut)
    ral = RAL(env.cfg, callback=BSVCallback(dut))
    env.start()
    await run_ral_reset_check(env, ral)


@cocotb.test
async def test_ral_fgwr_fgrd(dut):
    """Ral test foreground rd and write."""
    env = Env(dut)
    env.start()
    ral = RAL(env.cfg)
    await run_ral_rw_check(env, ral)


@cocotb.test
async def test_ral_fgwr_bgrd(dut):
    """Ral test foreground write background read."""
    env = Env(dut)
    env.start()
    ral = RAL(env.cfg, callback=BSVCallback(dut))
    await run_ral_rw_check(env, ral, rdfg=False)


@cocotb.test
async def test_ral_bgwr_fgrd(dut):
    """Ral test Background wr foreground read."""
    env = Env(dut)
    env.start()
    ral = RAL(env.cfg, callback=BSVCallback(dut))
    await run_ral_rw_check(env, ral, wrfg=False)


async def run_ral_reset_check(env, ral, *, wrfg=True, rdfg=True):
    """Run method of RAL test."""
    await env.clk_in_reset()
    await RisingEdge(env.dut.CLK)
    await reset_test.reset_test(ral, verbose=True)


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


class BSVCallback(CallbackBase):
    def sig(self, sigHash):
        print(sigHash)
        path = sigHash["path"]
        d = self.dut
        print(path[1:3])
        for i in path[1:3]:
            d = getattr(d, i)
        sig = f"s{path[3].lower()}{path[4]}"
        return getattr(d, sig) if hasattr(d, sig) else getattr(d, sig + "_wget")

        # {'high': 7, 'low': 0, 'path': ['top', 'sdma0', 'dma1', 'Cfg', 'a_burst_length']}
