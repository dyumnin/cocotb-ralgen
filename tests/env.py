import cocotb
import random
from cocotbext.axi import AxiBus, AxiSlave, AxiLiteBus, AxiLiteMaster, SparseMemoryRegion, AddressSpace
from cocotbext.dyulib.reset import reset_n,reset_end,clock_in_reset_start
from cocotb.clock import Clock
from cocotb.triggers import Timer, RisingEdge
from DMA_Reg.reg_model.DMA_Reg import DMA_Reg_cls
from DMA_Reg.lib  import AsyncCallbackSet
class Env:
    def __init__(self,dut):
        self.dut=dut
        self.axi_cfg = AxiLiteMaster(AxiLiteBus.from_prefix(dut,'csr_axi4'),dut.CLK,dut.RST_N,reset_active_level=False)
        self.default_ifc=self.axi_cfg
        self.reg=DMA_Reg_cls(
                callbacks=AsyncCallbackSet(
                    read_callback=self.readReg,
                    write_callback=self.writeReg
                    ))
        pass
    def start(self):
        dut=self.dut
        cocotb.start_soon(reset_n(dut.CLK,dut.RST_N,clock_cycles_in_reset=10))
        cocotb.start_soon(self.clock())




    async def clock(self):
        await clock_in_reset_start.wait()
        await Timer(10,'ns')
        cocotb.start_soon(Clock(self.dut.CLK,5,'ns').start())


    async def reset_done(self):
        await reset_end.wait()


    async def readReg(self,addr:int, width:int,accesswidth:int):
        rv = await self.default_ifc.read(addr,4)
        cocotb.log.info(f"RegRead addr={addr:x} rdata={hex(int.from_bytes(rv.data,'little'))}")
        return int.from_bytes(rv.data,'little')
        pass
    async def writeReg(self, addr: int, width: int, accesswidth: int, data: int):
        cocotb.log.info(f"RegWrite, addr={hex(addr)} data={hex(data)}")
        return await self.default_ifc.write(addr, int.to_bytes(data,4,'little'))
        pass


