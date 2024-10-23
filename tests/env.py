"""Environment for cocotb testcases."""
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from cocotbext.axi import AxiLiteBus, AxiLiteMaster
from cocotbext.dyulib.reset import clock_in_reset_start, reset_end, reset_n
from DMA_Reg.lib import AsyncCallbackSet
from DMA_Reg.reg_model.DMA_Reg import DMA_Reg_cls


class Env:
    """Environment for cocotb testcases."""

    def __init__(self, dut):
        """The init function instiantiates all VIP's and connects them."""
        self.dut = dut
        self.axi_cfg = AxiLiteMaster(
            AxiLiteBus.from_prefix(dut, "csr_axi4"),
            dut.CLK,
            dut.RST_N,
            reset_active_level=False,
        )
        self.default_ifc = self.axi_cfg
        self.reg = DMA_Reg_cls(
            callbacks=AsyncCallbackSet(
                read_callback=self.readReg,
                write_callback=self.writeReg,
            ),
        )

    def start(self):
        """Start verification, Launches Clock and Reset threads."""
        dut = self.dut
        cocotb.start_soon(reset_n(dut.CLK, dut.RST_N, clock_cycles_in_reset=10))
        cocotb.start_soon(self.clock())

    async def clock(self):
        """Clock generator.

        Waits for reset to reach a stage when clock is required and then starts clock generation
        """
        await clock_in_reset_start.wait()
        await Timer(10, "ns")
        cocotb.start_soon(Clock(self.dut.CLK, 5, "ns").start())

    async def clk_in_reset(self):
        """Wrapper over the reset_end event."""
        await clock_in_reset_start.wait()

    async def reset_done(self):
        """Wrapper over the reset_end event."""
        await reset_end.wait()

    async def readReg(self, addr: int, width: int, accesswidth: int):
        """Wrapper over the  read function for use by reg model."""
        rv = await self.default_ifc.read(addr, 4)
        cocotb.log.info(
            f"RegRead addr={addr:x} rdata={hex(int.from_bytes(rv.data,'little',))}",
        )
        return int.from_bytes(rv.data, "little")

    async def writeReg(self, addr: int, width: int, accesswidth: int, data: int):
        """Wrapper over the  write function for use by reg model."""
        cocotb.log.info(f"RegWrite, addr={hex(addr)} data={hex(data)}")
        return await self.default_ifc.write(addr, int.to_bytes(data, 4, "little"))
