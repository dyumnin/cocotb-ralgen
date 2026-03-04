import AXI4_Lite_Types      :: *;
import AXI4_Lite_Fabric_dyu::*;
import fabric::*;
import DMA_Reg::*;
import Connectable :: * ;
interface TopIfc;
interface AXI4_Lite_Slave_IFC#(32,32,0) csr_axi4;
endinterface

(*synthesize*)
module mkMDMA(TopIfc);
	AXI4_2Slv axibus <- mkAXI4_top();
	TopIfc sdma0 <- mkSdma();
	TopIfc sdma1 <- mkSdma();
	mkConnection(axibus.v_to_slaves[0],sdma0.csr_axi4);
	mkConnection(axibus.v_to_slaves[1],sdma1.csr_axi4);

	interface AXI4_Lite_Slave_IFC csr_axi4 =axibus.v_from_masters[0];
endmodule
(*synthesize*)
module mkSdma(TopIfc);
	Ifc_DMA_Reg_CSR#(32,32) dma0 <- mkDMACsr_32_32();
	Ifc_DMA_Reg_CSR#(32,32) dma1 <- mkDMACsr_32_32();
	Ifc_DMA_Reg_CSR#(32,32) dma2 <- mkDMACsr_32_32();
	AXI4_3Slv axibus <- mkAXI4_3dma();
	mkConnection(axibus.v_to_slaves[0],dma0.csr_axi4);
	mkConnection(axibus.v_to_slaves[1],dma1.csr_axi4);
	mkConnection(axibus.v_to_slaves[2],dma2.csr_axi4);
	rule r;
		dma0.hwif_write(unpack(0));
		dma1.hwif_write(unpack(0));
		dma2.hwif_write(unpack(0));
		endrule
	interface AXI4_Slave_IFC csr_axi4 =axibus.v_from_masters[0];
endmodule

(*synthesize*)
module mkDMACsr_32_32(Ifc_DMA_Reg_CSR#(32,32));
	let ifc();
	mkDMA_Reg_CSR _t(ifc);
	return ifc;
endmodule
