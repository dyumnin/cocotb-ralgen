import cocotb
from env import Env
from cocotb.triggers import RisingEdge
from DMA_Reg_RAL import DMA_Reg_RAL_Test as RAL


@cocotb.test
async def test_ral(dut):
    env = Env(dut)
    env.start()
    ral = RAL(env.reg)
    await run_ral_rw_check(env, ral)


async def run_ral_rw_check(env, ral):
    await env.reset_done()
    await RisingEdge(env.dut.CLK)
    await ral.rw_test()
