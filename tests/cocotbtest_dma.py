"""Test for verilog simulation."""
import cocotb
from cocotb.triggers import RisingEdge
from cocotb.handle import Force
from DMA_Reg_RAL import DMA_Reg_RAL_Test as RAL
from env import Env


def getsignal(dut, h):
    """Finds the actual signal in RTL and returns its value."""
    sig = f"s{h['reg'].lower()}{h['sig']}"
    rv = (
        getattr(dut, sig).value
        if hasattr(dut, sig)
        else getattr(dut, sig + "_wget").value
    )
    cocotb.log.info(f"{sig} rv={rv.value}")
    return rv


def setsignal(dut, h, wr):
    """Finds the actual signal in RTL and sets its value."""
    sig = f"s{h['reg'].lower()}{h['sig']}"
    rv = getattr(dut, sig) if hasattr(dut, sig) else getattr(dut, sig + "_wget")
    rv.value = Force(wr >> h["low"] & int("1" * (h["high"] - h["low"] + 1), 2))


@cocotb.test
async def test_ral_reset(dut):
    """Ral test reset."""
    env = Env(dut)
    ral = RAL(env.reg, bg_rdFn=lambda h: getsignal(dut, h))
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
    ral = RAL(env.reg, bg_rdFn=lambda h: getsignal(dut, h))
    await run_ral_rw_check(env, ral, rdfg=False)


@cocotb.test
async def test_ral_bgwr_fgrd(dut):
    """Ral test Background wr foreground read."""
    env = Env(dut)
    env.start()
    ral = RAL(env.reg, bg_wrFn=lambda h, wr: setsignal(dut, h, wr))
    await run_ral_rw_check(env, ral, wrfg=False)


async def run_ral_reset_check(env, ral, *, wrfg=True, rdfg=True):
    """Run method of RAL test."""
    await env.clk_in_reset()
    await RisingEdge(env.dut.CLK)
    await ral.reset_test(verbose=True)


async def run_ral_rw_check(env, ral, *, wrfg=True, rdfg=True):
    """Run method of RAL test."""
    await env.reset_done()
    await RisingEdge(env.dut.CLK)
    await ral.rw_test(
        foreground_read=rdfg,
        foreground_write=wrfg,
        count=1,
        verbose=True,
    )
