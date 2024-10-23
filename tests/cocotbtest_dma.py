"""Test for verilog simulation."""
import cocotb
from cocotb.triggers import RisingEdge
from DMA_Reg_RAL import DMA_Reg_RAL_Test as RAL
from env import Env
from peakrdl_cocotb_ralgen.callbacks.bsv import Callback
from peakrdl_cocotb_ralgen.testcases import rw_test, reset_test


@cocotb.test
async def test_ral_reset(dut):
    """Ral test reset."""
    env = Env(dut)
    ral = RAL(env.reg, callback=Callback(dut))
    env.start()
    await run_ral_reset_check(env, ral)


@cocotb.test
async def test_ral_fgwr_fgrd(dut):
    """Ral test foreground rd and write."""
    env = Env(dut)
    env.start()
    ral = RAL(env.reg)
    await run_ral_rw_check(env, ral)


@cocotb.test
async def test_ral_fgwr_bgrd(dut):
    """Ral test foreground write background read."""
    env = Env(dut)
    env.start()
    ral = RAL(env.reg, callback=Callback(dut))
    await run_ral_rw_check(env, ral, rdfg=False)


@cocotb.test
async def test_ral_bgwr_fgrd(dut):
    """Ral test Background wr foreground read."""
    env = Env(dut)
    env.start()
    ral = RAL(env.reg, callback=Callback(dut))
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
