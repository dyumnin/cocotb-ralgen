"""Test for verilog simulation."""
import cocotb
from cocotb.triggers import RisingEdge
from soc_env import SOCEnv
from peakrdl_cocotb_ralgen.callbacks.callback_base import CallbackBase
from peakrdl_cocotb_ralgen.testcases import rw_test, reset_test
from soc_RAL import soc_RAL_Test as RAL


@cocotb.test
async def test_ral_reset(dut):
    """Ral test reset."""
    env = SOCEnv(dut)
    ral = RAL(env.cfg, callback=BSVCallback(dut))
    env.start()
    await run_ral_reset_check(env, ral)


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
    """Signal finder for the SOC Hierarchy."""

    def sig(self, sighash):
        """Signal finder function."""
        path = sighash["path"]
        d = self.dut
        for i in path[1:3]:
            d = getattr(d, i)
        sig = f"s{path[3].lower()}{path[4]}"
        return getattr(d, sig) if hasattr(d, sig) else getattr(d, sig + "_wget")
