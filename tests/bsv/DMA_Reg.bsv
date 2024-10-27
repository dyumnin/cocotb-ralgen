


typedef struct {
	Bit#(8) value;
}VERSION_MIN0_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(8) value;
}VERSION_MAX1_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(16) value;
}IP_ID2_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) value;
}BUSY3_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) value;
Bit#(1) singlepulse;}START7_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) value;
}GEN_INTERRUPT8_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) value;
}PD_IN_B9_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) value;
}FROM_B10_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) value;
}TO_A11_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) value;
}USE_PD12_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(16) value;
}PD_COUNT13_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) value;
Bit#(1) singlepulse;}INCR_COUNT14_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(8) value;
}A_BURST_LENGTH16_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(8) value;
}B_BURST_LENGTH17_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(2) value;
}SRC_BURST_TYPE18_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(2) value;
}DEST_BURST_TYPE19_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(32) value;
}ADDRESS20_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(32) value;
}ADDRESS21_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(32) value;
}LENGTH22_Read_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(32) value;
}PD23_Read_st deriving(Bits, Eq, FShow) ;

        typedef struct {
VERSION_MIN0_Read_st version_min;
VERSION_MAX1_Read_st version_max;
IP_ID2_Read_st ip_id;
	}Version_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
BUSY3_Read_st busy;
	}Status_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
START7_Read_st start;
GEN_INTERRUPT8_Read_st gen_interrupt;
PD_IN_B9_Read_st pd_in_b;
FROM_B10_Read_st from_b;
TO_A11_Read_st to_a;
USE_PD12_Read_st use_pd;
	}Ctrl_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
PD_COUNT13_Read_st pd_count;
INCR_COUNT14_Read_st incr_count;
	}PD_Count_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
A_BURST_LENGTH16_Read_st a_burst_length;
B_BURST_LENGTH17_Read_st b_burst_length;
SRC_BURST_TYPE18_Read_st src_burst_type;
DEST_BURST_TYPE19_Read_st dest_burst_type;
	}Cfg_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
ADDRESS20_Read_st address;
	}Src_Address_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
ADDRESS21_Read_st address;
	}Dest_Address_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
LENGTH22_Read_st length;
	}Length_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
PD23_Read_st pd;
	}PacketDescriptor_Address_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}Interrupt_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}Interrupt_Mask_Read_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}Interrupt_Test_Read_st deriving(Bits, Eq, FShow) ;



typedef struct {
Version_Read_st version;
Status_Read_st status;
Ctrl_Read_st ctrl;
PD_Count_Read_st pd_count;
Cfg_Read_st cfg;
Src_Address_Read_st src_address;
Dest_Address_Read_st dest_address;
Length_Read_st length;
PacketDescriptor_Address_Read_st packetdescriptor_address;
}DMA_Reg_Read  deriving(Bits, Eq, FShow) ;



typedef struct {
	Bit#(1) next;
}BUSY3_Write_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) next;
}A_ERROR4_Write_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) next;
}B_ERROR5_Write_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(16) next;
}CURRENT_PD_ID6_Write_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) next;
}DECR_COUNT15_Write_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) next;
}INT_A_ERROR24_Write_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) next;
}INT_B_ERROR25_Write_st deriving(Bits, Eq, FShow) ;


typedef struct {
	Bit#(1) next;
}INT_XFER_DONE26_Write_st deriving(Bits, Eq, FShow) ;

        typedef struct {
	}Version_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
BUSY3_Write_st busy;
A_ERROR4_Write_st a_error;
B_ERROR5_Write_st b_error;
CURRENT_PD_ID6_Write_st current_pd_id;
	}Status_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}Ctrl_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
DECR_COUNT15_Write_st decr_count;
	}PD_Count_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}Cfg_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}Src_Address_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}Dest_Address_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}Length_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}PacketDescriptor_Address_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
INT_A_ERROR24_Write_st int_a_error;
INT_B_ERROR25_Write_st int_b_error;
INT_XFER_DONE26_Write_st int_xfer_done;
	}Interrupt_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}Interrupt_Mask_Write_st deriving(Bits, Eq, FShow) ;
typedef struct {
	}Interrupt_Test_Write_st deriving(Bits, Eq, FShow) ;



typedef struct {
Status_Write_st status;
PD_Count_Write_st pd_count;
Interrupt_Write_st interrupt;
}DMA_Reg_Write  deriving(Bits, Eq, FShow) ;

import AXI4_Lite_Types::*;
import Semi_FIFOF :: *;
interface Ifc_DMA_Reg_CSR#(numeric type awidth,numeric type dwidth);
interface AXI4_Lite_Slave_IFC#(awidth,dwidth,0) csr_axi4;
(*always_ready,always_enabled*)
method DMA_Reg_Read hwif_read();
(*always_ready,always_enabled*)
method Action hwif_write(DMA_Reg_Write wdata);
endinterface
         module mkDMA_Reg_CSR(Ifc_DMA_Reg_CSR#(awidth,32));
        AXI4_Lite_Slave_Xactor_IFC#(awidth,32,0)  csr_axi <- mkAXI4_Lite_Slave_Xactor();
Wire#(DMA_Reg_Read) hwif_r <-mkDWire(unpack(0));
Wire#(DMA_Reg_Write) hwif_w <-mkWire();
Wire#(Bool) wtxn <- mkDWire(False);
Wire#(Bool) rtxn <- mkDWire(False);
Wire#(Bit#(32)) rdata <-mkWire();
Wire#(Bit#(32)) wdata <-mkWire();
Wire#(Bit#(awidth)) txn_address <-mkDWire(0);
let const_version ='h0;
Wire#(Bit#(8)) sversionversion_min <-mkDWire(0);
Wire#(Bit#(8)) sversionversion_max <-mkDWire(0);
Wire#(Bit#(16)) sversionip_id <-mkDWire(1);
let const_status ='h4;
Reg#(Bit#(1)) sstatusbusy <-mkRegA(0);
Reg#(Bit#(1)) sstatusa_error <-mkRegA(0);
Reg#(Bit#(1)) sstatusb_error <-mkRegA(0);
Wire#(Bit#(16)) sstatuscurrent_pd_id <-mkDWire(0);
let const_ctrl ='h8;
Reg#(Bit#(1)) sctrlstart <-mkRegA(0);
Reg#(Bit#(1)) sctrlgen_interrupt <-mkRegA(0);
Reg#(Bit#(1)) sctrlpd_in_b <-mkRegA(0);
Reg#(Bit#(1)) sctrlfrom_b <-mkRegA(0);
Reg#(Bit#(1)) sctrlto_a <-mkRegA(0);
Reg#(Bit#(1)) sctrluse_pd <-mkRegA(0);
let const_pd_count ='hc;
Reg#(Bit#(16)) spd_countpd_count <-mkRegA(0);
Reg#(Bit#(1)) spd_countincr_count <-mkRegA(0);
Wire#(Bit#(1)) spd_countdecr_count <-mkDWire(0);
let const_cfg ='h10;
Reg#(Bit#(8)) scfga_burst_length <-mkRegA(1);
Reg#(Bit#(8)) scfgb_burst_length <-mkRegA(1);
Reg#(Bit#(2)) scfgsrc_burst_type <-mkRegA(0);
Reg#(Bit#(2)) scfgdest_burst_type <-mkRegA(0);
let const_src_address ='h14;
Reg#(Bit#(32)) ssrc_addressaddress <-mkRegU();
let const_dest_address ='h18;
Reg#(Bit#(32)) sdest_addressaddress <-mkRegU();
let const_length ='h1c;
Reg#(Bit#(32)) slengthlength <-mkRegU();
let const_packetdescriptor_address ='h20;
Reg#(Bit#(32)) spacketdescriptor_addresspd <-mkRegU();
let const_interrupt ='h24;
Reg#(Bit#(1)) sinterruptint_a_error <-mkRegA(0);
Reg#(Bit#(1)) sinterruptint_b_error <-mkRegA(0);
Reg#(Bit#(1)) sinterruptint_xfer_done <-mkRegA(0);
let const_interrupt_mask ='h28;
Reg#(Bit#(1)) sinterrupt_maskmask_a_error <-mkRegA(0);
Reg#(Bit#(1)) sinterrupt_maskmask_b_error <-mkRegA(0);
Reg#(Bit#(1)) sinterrupt_maskmask_xfer_done <-mkRegA(0);
let const_interrupt_test ='h2c;
Reg#(Bit#(1)) sinterrupt_testmask_a_error <-mkRegA(0);
Reg#(Bit#(1)) sinterrupt_testmask_b_error <-mkRegA(0);
Reg#(Bit#(1)) sinterrupt_testmask_xfer_done <-mkRegA(0);

        rule rl_write;
        let addr=csr_axi.o_wr_addr.first();
        let data=csr_axi.o_wr_data.first();
        txn_address <= addr.awaddr;
        wdata <= data.wdata;
        wtxn <=True;
        endrule
        rule rl_read;
        let addr=csr_axi.o_rd_addr.first();
        txn_address <= addr.araddr;
        rtxn <=True;
        endrule
rule rl_DMA_Reg;

    	let hwif_r_var =unpack(0);
    	Bit#(32) rdata_var=0;

        let sversionversion_min_wtxn= txn_address == 0 && wtxn;
        let sversionversion_min_rtxn= txn_address == 0 && rtxn;
        let sversionversion_min_rclr = False && sversionversion_min_rtxn;
        let sversionversion_min_rset = False && sversionversion_min_rtxn;
        let sversionversion_min_swmod = False ;
        //let sversionversion_min_swwe = False ? hwif_w.version.version_min.swwe:True;
        //let sversionversion_min_swwel = False ? hwif_w.version.version_min.swwel:True;
        let sversionversion_min_woclr = False && sversionversion_min_wtxn && wdata[7 : 0] ==1;
        let sversionversion_min_woset = False && sversionversion_min_wtxn && wdata[7 : 0] ==1;
        let sversionversion_min_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(8) sversionversion_min_var=sversionversion_min;
        hwif_r_var.version.version_min.value=sversionversion_min_var;
	if(sversionversion_min_rtxn) rdata_var[7:0] = sversionversion_min_var;

        let sversionversion_max_wtxn= txn_address == 0 && wtxn;
        let sversionversion_max_rtxn= txn_address == 0 && rtxn;
        let sversionversion_max_rclr = False && sversionversion_max_rtxn;
        let sversionversion_max_rset = False && sversionversion_max_rtxn;
        let sversionversion_max_swmod = False ;
        //let sversionversion_max_swwe = False ? hwif_w.version.version_max.swwe:True;
        //let sversionversion_max_swwel = False ? hwif_w.version.version_max.swwel:True;
        let sversionversion_max_woclr = False && sversionversion_max_wtxn && wdata[15 : 8] ==1;
        let sversionversion_max_woset = False && sversionversion_max_wtxn && wdata[15 : 8] ==1;
        let sversionversion_max_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(8) sversionversion_max_var=sversionversion_max;
        hwif_r_var.version.version_max.value=sversionversion_max_var;
	if(sversionversion_max_rtxn) rdata_var[15:8] = sversionversion_max_var;

        let sversionip_id_wtxn= txn_address == 0 && wtxn;
        let sversionip_id_rtxn= txn_address == 0 && rtxn;
        let sversionip_id_rclr = False && sversionip_id_rtxn;
        let sversionip_id_rset = False && sversionip_id_rtxn;
        let sversionip_id_swmod = False ;
        //let sversionip_id_swwe = False ? hwif_w.version.ip_id.swwe:True;
        //let sversionip_id_swwel = False ? hwif_w.version.ip_id.swwel:True;
        let sversionip_id_woclr = False && sversionip_id_wtxn && wdata[31 : 16] ==1;
        let sversionip_id_woset = False && sversionip_id_wtxn && wdata[31 : 16] ==1;
        let sversionip_id_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(16) sversionip_id_var=sversionip_id;
        hwif_r_var.version.ip_id.value=sversionip_id_var;
	if(sversionip_id_rtxn) rdata_var[31:16] = sversionip_id_var;

        let sstatusbusy_wtxn= txn_address == 4 && wtxn;
        let sstatusbusy_rtxn= txn_address == 4 && rtxn;
        let sstatusbusy_rclr = False && sstatusbusy_rtxn;
        let sstatusbusy_rset = False && sstatusbusy_rtxn;
        let sstatusbusy_swmod = False ;
        //let sstatusbusy_swwe = False ? hwif_w.status.busy.swwe:True;
        //let sstatusbusy_swwel = False ? hwif_w.status.busy.swwel:True;
        let sstatusbusy_woclr = False && sstatusbusy_wtxn && wdata[0 : 0] ==1;
        let sstatusbusy_woset = False && sstatusbusy_wtxn && wdata[0 : 0] ==1;
        let sstatusbusy_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sstatusbusy_var=sstatusbusy;
        hwif_r_var.status.busy.value=sstatusbusy_var;
	sstatusbusy_var=hwif_w.status.busy.next;
	if(sstatusbusy_rtxn) rdata_var[0:0] = sstatusbusy_var;
	sstatusbusy<=sstatusbusy_var;

        let sstatusa_error_wtxn= txn_address == 4 && wtxn;
        let sstatusa_error_rtxn= txn_address == 4 && rtxn;
        let sstatusa_error_rclr = True && sstatusa_error_rtxn;
        let sstatusa_error_rset = False && sstatusa_error_rtxn;
        let sstatusa_error_swmod = False ;
        //let sstatusa_error_swwe = False ? hwif_w.status.a_error.swwe:True;
        //let sstatusa_error_swwel = False ? hwif_w.status.a_error.swwel:True;
        let sstatusa_error_woclr = False && sstatusa_error_wtxn && wdata[1 : 1] ==1;
        let sstatusa_error_woset = False && sstatusa_error_wtxn && wdata[1 : 1] ==1;
        let sstatusa_error_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sstatusa_error_var=sstatusa_error;
        if(sstatusa_error_rclr||sstatusa_error_woclr) sstatusa_error_var=0;
	sstatusa_error_var=hwif_w.status.a_error.next;
	if(sstatusa_error_rtxn) rdata_var[1:1] = sstatusa_error_var;
	if(sstatusa_error_wtxn)sstatusa_error_var=wdata[1 : 1];
	sstatusa_error<=sstatusa_error_var;

        let sstatusb_error_wtxn= txn_address == 4 && wtxn;
        let sstatusb_error_rtxn= txn_address == 4 && rtxn;
        let sstatusb_error_rclr = True && sstatusb_error_rtxn;
        let sstatusb_error_rset = False && sstatusb_error_rtxn;
        let sstatusb_error_swmod = False ;
        //let sstatusb_error_swwe = False ? hwif_w.status.b_error.swwe:True;
        //let sstatusb_error_swwel = False ? hwif_w.status.b_error.swwel:True;
        let sstatusb_error_woclr = False && sstatusb_error_wtxn && wdata[2 : 2] ==1;
        let sstatusb_error_woset = False && sstatusb_error_wtxn && wdata[2 : 2] ==1;
        let sstatusb_error_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sstatusb_error_var=sstatusb_error;
        if(sstatusb_error_rclr||sstatusb_error_woclr) sstatusb_error_var=0;
	sstatusb_error_var=hwif_w.status.b_error.next;
	if(sstatusb_error_rtxn) rdata_var[2:2] = sstatusb_error_var;
	if(sstatusb_error_wtxn)sstatusb_error_var=wdata[2 : 2];
	sstatusb_error<=sstatusb_error_var;

        let sstatuscurrent_pd_id_wtxn= txn_address == 4 && wtxn;
        let sstatuscurrent_pd_id_rtxn= txn_address == 4 && rtxn;
        let sstatuscurrent_pd_id_rclr = False && sstatuscurrent_pd_id_rtxn;
        let sstatuscurrent_pd_id_rset = False && sstatuscurrent_pd_id_rtxn;
        let sstatuscurrent_pd_id_swmod = False ;
        //let sstatuscurrent_pd_id_swwe = False ? hwif_w.status.current_pd_id.swwe:True;
        //let sstatuscurrent_pd_id_swwel = False ? hwif_w.status.current_pd_id.swwel:True;
        let sstatuscurrent_pd_id_woclr = False && sstatuscurrent_pd_id_wtxn && wdata[31 : 16] ==1;
        let sstatuscurrent_pd_id_woset = False && sstatuscurrent_pd_id_wtxn && wdata[31 : 16] ==1;
        let sstatuscurrent_pd_id_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(16) sstatuscurrent_pd_id_var=sstatuscurrent_pd_id;
        sstatuscurrent_pd_id_var=hwif_w.status.current_pd_id.next;
	if(sstatuscurrent_pd_id_rtxn) rdata_var[31:16] = sstatuscurrent_pd_id_var;

        let sctrlstart_wtxn= txn_address == 8 && wtxn;
        let sctrlstart_rtxn= txn_address == 8 && rtxn;
        let sctrlstart_rclr = False && sctrlstart_rtxn;
        let sctrlstart_rset = False && sctrlstart_rtxn;
        let sctrlstart_swmod = False ;
        //let sctrlstart_swwe = False ? hwif_w.ctrl.start.swwe:True;
        //let sctrlstart_swwel = False ? hwif_w.ctrl.start.swwel:True;
        let sctrlstart_woclr = False && sctrlstart_wtxn && wdata[0 : 0] ==1;
        let sctrlstart_woset = False && sctrlstart_wtxn && wdata[0 : 0] ==1;
        let sctrlstart_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sctrlstart_var=sctrlstart;
        hwif_r_var.ctrl.start.singlepulse=pack(sctrlstart_wtxn && wdata[0 : 0] == 1);
	hwif_r_var.ctrl.start.value=sctrlstart_var;
	if(sctrlstart_rtxn) rdata_var[0:0] = sctrlstart_var;
	if(sctrlstart_wtxn)sctrlstart_var=wdata[0 : 0];
	sctrlstart<=sctrlstart_var;

        let sctrlgen_interrupt_wtxn= txn_address == 8 && wtxn;
        let sctrlgen_interrupt_rtxn= txn_address == 8 && rtxn;
        let sctrlgen_interrupt_rclr = False && sctrlgen_interrupt_rtxn;
        let sctrlgen_interrupt_rset = False && sctrlgen_interrupt_rtxn;
        let sctrlgen_interrupt_swmod = False ;
        //let sctrlgen_interrupt_swwe = False ? hwif_w.ctrl.gen_interrupt.swwe:True;
        //let sctrlgen_interrupt_swwel = False ? hwif_w.ctrl.gen_interrupt.swwel:True;
        let sctrlgen_interrupt_woclr = False && sctrlgen_interrupt_wtxn && wdata[1 : 1] ==1;
        let sctrlgen_interrupt_woset = False && sctrlgen_interrupt_wtxn && wdata[1 : 1] ==1;
        let sctrlgen_interrupt_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sctrlgen_interrupt_var=sctrlgen_interrupt;
        hwif_r_var.ctrl.gen_interrupt.value=sctrlgen_interrupt_var;
	if(sctrlgen_interrupt_rtxn) rdata_var[1:1] = sctrlgen_interrupt_var;
	if(sctrlgen_interrupt_wtxn)sctrlgen_interrupt_var=wdata[1 : 1];
	sctrlgen_interrupt<=sctrlgen_interrupt_var;

        let sctrlpd_in_b_wtxn= txn_address == 8 && wtxn;
        let sctrlpd_in_b_rtxn= txn_address == 8 && rtxn;
        let sctrlpd_in_b_rclr = False && sctrlpd_in_b_rtxn;
        let sctrlpd_in_b_rset = False && sctrlpd_in_b_rtxn;
        let sctrlpd_in_b_swmod = False ;
        //let sctrlpd_in_b_swwe = False ? hwif_w.ctrl.pd_in_b.swwe:True;
        //let sctrlpd_in_b_swwel = False ? hwif_w.ctrl.pd_in_b.swwel:True;
        let sctrlpd_in_b_woclr = False && sctrlpd_in_b_wtxn && wdata[2 : 2] ==1;
        let sctrlpd_in_b_woset = False && sctrlpd_in_b_wtxn && wdata[2 : 2] ==1;
        let sctrlpd_in_b_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sctrlpd_in_b_var=sctrlpd_in_b;
        hwif_r_var.ctrl.pd_in_b.value=sctrlpd_in_b_var;
	if(sctrlpd_in_b_rtxn) rdata_var[2:2] = sctrlpd_in_b_var;
	if(sctrlpd_in_b_wtxn)sctrlpd_in_b_var=wdata[2 : 2];
	sctrlpd_in_b<=sctrlpd_in_b_var;

        let sctrlfrom_b_wtxn= txn_address == 8 && wtxn;
        let sctrlfrom_b_rtxn= txn_address == 8 && rtxn;
        let sctrlfrom_b_rclr = False && sctrlfrom_b_rtxn;
        let sctrlfrom_b_rset = False && sctrlfrom_b_rtxn;
        let sctrlfrom_b_swmod = False ;
        //let sctrlfrom_b_swwe = False ? hwif_w.ctrl.from_b.swwe:True;
        //let sctrlfrom_b_swwel = False ? hwif_w.ctrl.from_b.swwel:True;
        let sctrlfrom_b_woclr = False && sctrlfrom_b_wtxn && wdata[3 : 3] ==1;
        let sctrlfrom_b_woset = False && sctrlfrom_b_wtxn && wdata[3 : 3] ==1;
        let sctrlfrom_b_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sctrlfrom_b_var=sctrlfrom_b;
        hwif_r_var.ctrl.from_b.value=sctrlfrom_b_var;
	if(sctrlfrom_b_rtxn) rdata_var[3:3] = sctrlfrom_b_var;
	if(sctrlfrom_b_wtxn)sctrlfrom_b_var=wdata[3 : 3];
	sctrlfrom_b<=sctrlfrom_b_var;

        let sctrlto_a_wtxn= txn_address == 8 && wtxn;
        let sctrlto_a_rtxn= txn_address == 8 && rtxn;
        let sctrlto_a_rclr = False && sctrlto_a_rtxn;
        let sctrlto_a_rset = False && sctrlto_a_rtxn;
        let sctrlto_a_swmod = False ;
        //let sctrlto_a_swwe = False ? hwif_w.ctrl.to_a.swwe:True;
        //let sctrlto_a_swwel = False ? hwif_w.ctrl.to_a.swwel:True;
        let sctrlto_a_woclr = False && sctrlto_a_wtxn && wdata[4 : 4] ==1;
        let sctrlto_a_woset = False && sctrlto_a_wtxn && wdata[4 : 4] ==1;
        let sctrlto_a_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sctrlto_a_var=sctrlto_a;
        hwif_r_var.ctrl.to_a.value=sctrlto_a_var;
	if(sctrlto_a_rtxn) rdata_var[4:4] = sctrlto_a_var;
	if(sctrlto_a_wtxn)sctrlto_a_var=wdata[4 : 4];
	sctrlto_a<=sctrlto_a_var;

        let sctrluse_pd_wtxn= txn_address == 8 && wtxn;
        let sctrluse_pd_rtxn= txn_address == 8 && rtxn;
        let sctrluse_pd_rclr = False && sctrluse_pd_rtxn;
        let sctrluse_pd_rset = False && sctrluse_pd_rtxn;
        let sctrluse_pd_swmod = False ;
        //let sctrluse_pd_swwe = False ? hwif_w.ctrl.use_pd.swwe:True;
        //let sctrluse_pd_swwel = False ? hwif_w.ctrl.use_pd.swwel:True;
        let sctrluse_pd_woclr = False && sctrluse_pd_wtxn && wdata[5 : 5] ==1;
        let sctrluse_pd_woset = False && sctrluse_pd_wtxn && wdata[5 : 5] ==1;
        let sctrluse_pd_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sctrluse_pd_var=sctrluse_pd;
        hwif_r_var.ctrl.use_pd.value=sctrluse_pd_var;
	if(sctrluse_pd_rtxn) rdata_var[5:5] = sctrluse_pd_var;
	if(sctrluse_pd_wtxn)sctrluse_pd_var=wdata[5 : 5];
	sctrluse_pd<=sctrluse_pd_var;

        let spd_countpd_count_wtxn= txn_address == 12 && wtxn;
        let spd_countpd_count_rtxn= txn_address == 12 && rtxn;
        let spd_countpd_count_rclr = False && spd_countpd_count_rtxn;
        let spd_countpd_count_rset = False && spd_countpd_count_rtxn;
        let spd_countpd_count_swmod = False ;
        //let spd_countpd_count_swwe = False ? hwif_w.pd_count.pd_count.swwe:True;
        //let spd_countpd_count_swwel = False ? hwif_w.pd_count.pd_count.swwel:True;
        let spd_countpd_count_woclr = False && spd_countpd_count_wtxn && wdata[15 : 0] ==1;
        let spd_countpd_count_woset = False && spd_countpd_count_wtxn && wdata[15 : 0] ==1;
        let spd_countpd_count_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(16) spd_countpd_count_var=spd_countpd_count;
        hwif_r_var.pd_count.pd_count.value=spd_countpd_count_var;
	if(spd_countpd_count_rtxn) rdata_var[15:0] = spd_countpd_count_var;
	spd_countpd_count<=spd_countpd_count_var;

        let spd_countincr_count_wtxn= txn_address == 12 && wtxn;
        let spd_countincr_count_rtxn= txn_address == 12 && rtxn;
        let spd_countincr_count_rclr = False && spd_countincr_count_rtxn;
        let spd_countincr_count_rset = False && spd_countincr_count_rtxn;
        let spd_countincr_count_swmod = False ;
        //let spd_countincr_count_swwe = False ? hwif_w.pd_count.incr_count.swwe:True;
        //let spd_countincr_count_swwel = False ? hwif_w.pd_count.incr_count.swwel:True;
        let spd_countincr_count_woclr = False && spd_countincr_count_wtxn && wdata[16 : 16] ==1;
        let spd_countincr_count_woset = False && spd_countincr_count_wtxn && wdata[16 : 16] ==1;
        let spd_countincr_count_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) spd_countincr_count_var=spd_countincr_count;
        hwif_r_var.pd_count.incr_count.singlepulse=pack(spd_countincr_count_wtxn && wdata[16 : 16] == 1);
	hwif_r_var.pd_count.incr_count.value=spd_countincr_count_var;
	if(spd_countincr_count_wtxn)spd_countincr_count_var=wdata[16 : 16];
	spd_countincr_count<=spd_countincr_count_var;

        let spd_countdecr_count_wtxn= txn_address == 12 && wtxn;
        let spd_countdecr_count_rtxn= txn_address == 12 && rtxn;
        let spd_countdecr_count_rclr = False && spd_countdecr_count_rtxn;
        let spd_countdecr_count_rset = False && spd_countdecr_count_rtxn;
        let spd_countdecr_count_swmod = False ;
        //let spd_countdecr_count_swwe = False ? hwif_w.pd_count.decr_count.swwe:True;
        //let spd_countdecr_count_swwel = False ? hwif_w.pd_count.decr_count.swwel:True;
        let spd_countdecr_count_woclr = False && spd_countdecr_count_wtxn && wdata[17 : 17] ==1;
        let spd_countdecr_count_woset = False && spd_countdecr_count_wtxn && wdata[17 : 17] ==1;
        let spd_countdecr_count_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) spd_countdecr_count_var=spd_countdecr_count;
        spd_countdecr_count_var=hwif_w.pd_count.decr_count.next;
	if(spd_countdecr_count_rtxn) rdata_var[17:17] = spd_countdecr_count_var;

        let scfga_burst_length_wtxn= txn_address == 16 && wtxn;
        let scfga_burst_length_rtxn= txn_address == 16 && rtxn;
        let scfga_burst_length_rclr = False && scfga_burst_length_rtxn;
        let scfga_burst_length_rset = False && scfga_burst_length_rtxn;
        let scfga_burst_length_swmod = False ;
        //let scfga_burst_length_swwe = False ? hwif_w.cfg.a_burst_length.swwe:True;
        //let scfga_burst_length_swwel = False ? hwif_w.cfg.a_burst_length.swwel:True;
        let scfga_burst_length_woclr = False && scfga_burst_length_wtxn && wdata[7 : 0] ==1;
        let scfga_burst_length_woset = False && scfga_burst_length_wtxn && wdata[7 : 0] ==1;
        let scfga_burst_length_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(8) scfga_burst_length_var=scfga_burst_length;
        hwif_r_var.cfg.a_burst_length.value=scfga_burst_length_var;
	if(scfga_burst_length_rtxn) rdata_var[7:0] = scfga_burst_length_var;
	if(scfga_burst_length_wtxn)scfga_burst_length_var=wdata[7 : 0];
	scfga_burst_length<=scfga_burst_length_var;

        let scfgb_burst_length_wtxn= txn_address == 16 && wtxn;
        let scfgb_burst_length_rtxn= txn_address == 16 && rtxn;
        let scfgb_burst_length_rclr = False && scfgb_burst_length_rtxn;
        let scfgb_burst_length_rset = False && scfgb_burst_length_rtxn;
        let scfgb_burst_length_swmod = False ;
        //let scfgb_burst_length_swwe = False ? hwif_w.cfg.b_burst_length.swwe:True;
        //let scfgb_burst_length_swwel = False ? hwif_w.cfg.b_burst_length.swwel:True;
        let scfgb_burst_length_woclr = False && scfgb_burst_length_wtxn && wdata[15 : 8] ==1;
        let scfgb_burst_length_woset = False && scfgb_burst_length_wtxn && wdata[15 : 8] ==1;
        let scfgb_burst_length_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(8) scfgb_burst_length_var=scfgb_burst_length;
        hwif_r_var.cfg.b_burst_length.value=scfgb_burst_length_var;
	if(scfgb_burst_length_rtxn) rdata_var[15:8] = scfgb_burst_length_var;
	if(scfgb_burst_length_wtxn)scfgb_burst_length_var=wdata[15 : 8];
	scfgb_burst_length<=scfgb_burst_length_var;

        let scfgsrc_burst_type_wtxn= txn_address == 16 && wtxn;
        let scfgsrc_burst_type_rtxn= txn_address == 16 && rtxn;
        let scfgsrc_burst_type_rclr = False && scfgsrc_burst_type_rtxn;
        let scfgsrc_burst_type_rset = False && scfgsrc_burst_type_rtxn;
        let scfgsrc_burst_type_swmod = False ;
        //let scfgsrc_burst_type_swwe = False ? hwif_w.cfg.src_burst_type.swwe:True;
        //let scfgsrc_burst_type_swwel = False ? hwif_w.cfg.src_burst_type.swwel:True;
        let scfgsrc_burst_type_woclr = False && scfgsrc_burst_type_wtxn && wdata[17 : 16] ==1;
        let scfgsrc_burst_type_woset = False && scfgsrc_burst_type_wtxn && wdata[17 : 16] ==1;
        let scfgsrc_burst_type_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(2) scfgsrc_burst_type_var=scfgsrc_burst_type;
        hwif_r_var.cfg.src_burst_type.value=scfgsrc_burst_type_var;
	if(scfgsrc_burst_type_rtxn) rdata_var[17:16] = scfgsrc_burst_type_var;
	if(scfgsrc_burst_type_wtxn)scfgsrc_burst_type_var=wdata[17 : 16];
	scfgsrc_burst_type<=scfgsrc_burst_type_var;

        let scfgdest_burst_type_wtxn= txn_address == 16 && wtxn;
        let scfgdest_burst_type_rtxn= txn_address == 16 && rtxn;
        let scfgdest_burst_type_rclr = False && scfgdest_burst_type_rtxn;
        let scfgdest_burst_type_rset = False && scfgdest_burst_type_rtxn;
        let scfgdest_burst_type_swmod = False ;
        //let scfgdest_burst_type_swwe = False ? hwif_w.cfg.dest_burst_type.swwe:True;
        //let scfgdest_burst_type_swwel = False ? hwif_w.cfg.dest_burst_type.swwel:True;
        let scfgdest_burst_type_woclr = False && scfgdest_burst_type_wtxn && wdata[19 : 18] ==1;
        let scfgdest_burst_type_woset = False && scfgdest_burst_type_wtxn && wdata[19 : 18] ==1;
        let scfgdest_burst_type_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(2) scfgdest_burst_type_var=scfgdest_burst_type;
        hwif_r_var.cfg.dest_burst_type.value=scfgdest_burst_type_var;
	if(scfgdest_burst_type_rtxn) rdata_var[19:18] = scfgdest_burst_type_var;
	if(scfgdest_burst_type_wtxn)scfgdest_burst_type_var=wdata[19 : 18];
	scfgdest_burst_type<=scfgdest_burst_type_var;

        let ssrc_addressaddress_wtxn= txn_address == 20 && wtxn;
        let ssrc_addressaddress_rtxn= txn_address == 20 && rtxn;
        let ssrc_addressaddress_rclr = False && ssrc_addressaddress_rtxn;
        let ssrc_addressaddress_rset = False && ssrc_addressaddress_rtxn;
        let ssrc_addressaddress_swmod = False ;
        //let ssrc_addressaddress_swwe = False ? hwif_w.src_address.address.swwe:True;
        //let ssrc_addressaddress_swwel = False ? hwif_w.src_address.address.swwel:True;
        let ssrc_addressaddress_woclr = False && ssrc_addressaddress_wtxn && wdata[31 : 0] ==1;
        let ssrc_addressaddress_woset = False && ssrc_addressaddress_wtxn && wdata[31 : 0] ==1;
        let ssrc_addressaddress_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(32) ssrc_addressaddress_var=ssrc_addressaddress;
        hwif_r_var.src_address.address.value=ssrc_addressaddress_var;
	if(ssrc_addressaddress_rtxn) rdata_var[31:0] = ssrc_addressaddress_var;
	if(ssrc_addressaddress_wtxn)ssrc_addressaddress_var=wdata[31 : 0];
	ssrc_addressaddress<=ssrc_addressaddress_var;

        let sdest_addressaddress_wtxn= txn_address == 24 && wtxn;
        let sdest_addressaddress_rtxn= txn_address == 24 && rtxn;
        let sdest_addressaddress_rclr = False && sdest_addressaddress_rtxn;
        let sdest_addressaddress_rset = False && sdest_addressaddress_rtxn;
        let sdest_addressaddress_swmod = False ;
        //let sdest_addressaddress_swwe = False ? hwif_w.dest_address.address.swwe:True;
        //let sdest_addressaddress_swwel = False ? hwif_w.dest_address.address.swwel:True;
        let sdest_addressaddress_woclr = False && sdest_addressaddress_wtxn && wdata[31 : 0] ==1;
        let sdest_addressaddress_woset = False && sdest_addressaddress_wtxn && wdata[31 : 0] ==1;
        let sdest_addressaddress_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(32) sdest_addressaddress_var=sdest_addressaddress;
        hwif_r_var.dest_address.address.value=sdest_addressaddress_var;
	if(sdest_addressaddress_rtxn) rdata_var[31:0] = sdest_addressaddress_var;
	if(sdest_addressaddress_wtxn)sdest_addressaddress_var=wdata[31 : 0];
	sdest_addressaddress<=sdest_addressaddress_var;

        let slengthlength_wtxn= txn_address == 28 && wtxn;
        let slengthlength_rtxn= txn_address == 28 && rtxn;
        let slengthlength_rclr = False && slengthlength_rtxn;
        let slengthlength_rset = False && slengthlength_rtxn;
        let slengthlength_swmod = False ;
        //let slengthlength_swwe = False ? hwif_w.length.length.swwe:True;
        //let slengthlength_swwel = False ? hwif_w.length.length.swwel:True;
        let slengthlength_woclr = False && slengthlength_wtxn && wdata[31 : 0] ==1;
        let slengthlength_woset = False && slengthlength_wtxn && wdata[31 : 0] ==1;
        let slengthlength_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(32) slengthlength_var=slengthlength;
        hwif_r_var.length.length.value=slengthlength_var;
	if(slengthlength_rtxn) rdata_var[31:0] = slengthlength_var;
	if(slengthlength_wtxn)slengthlength_var=wdata[31 : 0];
	slengthlength<=slengthlength_var;

        let spacketdescriptor_addresspd_wtxn= txn_address == 32 && wtxn;
        let spacketdescriptor_addresspd_rtxn= txn_address == 32 && rtxn;
        let spacketdescriptor_addresspd_rclr = False && spacketdescriptor_addresspd_rtxn;
        let spacketdescriptor_addresspd_rset = False && spacketdescriptor_addresspd_rtxn;
        let spacketdescriptor_addresspd_swmod = False ;
        //let spacketdescriptor_addresspd_swwe = False ? hwif_w.packetdescriptor_address.pd.swwe:True;
        //let spacketdescriptor_addresspd_swwel = False ? hwif_w.packetdescriptor_address.pd.swwel:True;
        let spacketdescriptor_addresspd_woclr = False && spacketdescriptor_addresspd_wtxn && wdata[31 : 0] ==1;
        let spacketdescriptor_addresspd_woset = False && spacketdescriptor_addresspd_wtxn && wdata[31 : 0] ==1;
        let spacketdescriptor_addresspd_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(32) spacketdescriptor_addresspd_var=spacketdescriptor_addresspd;
        hwif_r_var.packetdescriptor_address.pd.value=spacketdescriptor_addresspd_var;
	if(spacketdescriptor_addresspd_rtxn) rdata_var[31:0] = spacketdescriptor_addresspd_var;
	if(spacketdescriptor_addresspd_wtxn)spacketdescriptor_addresspd_var=wdata[31 : 0];
	spacketdescriptor_addresspd<=spacketdescriptor_addresspd_var;

        let sinterruptint_a_error_wtxn= txn_address == 36 && wtxn;
        let sinterruptint_a_error_rtxn= txn_address == 36 && rtxn;
        let sinterruptint_a_error_rclr = False && sinterruptint_a_error_rtxn;
        let sinterruptint_a_error_rset = False && sinterruptint_a_error_rtxn;
        let sinterruptint_a_error_swmod = False ;
        //let sinterruptint_a_error_swwe = False ? hwif_w.interrupt.int_a_error.swwe:True;
        //let sinterruptint_a_error_swwel = False ? hwif_w.interrupt.int_a_error.swwel:True;
        let sinterruptint_a_error_woclr = True && sinterruptint_a_error_wtxn && wdata[0 : 0] ==1;
        let sinterruptint_a_error_woset = False && sinterruptint_a_error_wtxn && wdata[0 : 0] ==1;
        let sinterruptint_a_error_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sinterruptint_a_error_var=sinterruptint_a_error;
        if(sinterruptint_a_error_rclr||sinterruptint_a_error_woclr) sinterruptint_a_error_var=0;
	sinterruptint_a_error_var=hwif_w.interrupt.int_a_error.next;
	if(sinterruptint_a_error_rtxn) rdata_var[0:0] = sinterruptint_a_error_var;
	if(sinterruptint_a_error_wtxn)sinterruptint_a_error_var=wdata[0 : 0];
	sinterruptint_a_error<=sinterruptint_a_error_var;

        let sinterruptint_b_error_wtxn= txn_address == 36 && wtxn;
        let sinterruptint_b_error_rtxn= txn_address == 36 && rtxn;
        let sinterruptint_b_error_rclr = False && sinterruptint_b_error_rtxn;
        let sinterruptint_b_error_rset = False && sinterruptint_b_error_rtxn;
        let sinterruptint_b_error_swmod = False ;
        //let sinterruptint_b_error_swwe = False ? hwif_w.interrupt.int_b_error.swwe:True;
        //let sinterruptint_b_error_swwel = False ? hwif_w.interrupt.int_b_error.swwel:True;
        let sinterruptint_b_error_woclr = True && sinterruptint_b_error_wtxn && wdata[1 : 1] ==1;
        let sinterruptint_b_error_woset = False && sinterruptint_b_error_wtxn && wdata[1 : 1] ==1;
        let sinterruptint_b_error_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sinterruptint_b_error_var=sinterruptint_b_error;
        if(sinterruptint_b_error_rclr||sinterruptint_b_error_woclr) sinterruptint_b_error_var=0;
	sinterruptint_b_error_var=hwif_w.interrupt.int_b_error.next;
	if(sinterruptint_b_error_rtxn) rdata_var[1:1] = sinterruptint_b_error_var;
	if(sinterruptint_b_error_wtxn)sinterruptint_b_error_var=wdata[1 : 1];
	sinterruptint_b_error<=sinterruptint_b_error_var;

        let sinterruptint_xfer_done_wtxn= txn_address == 36 && wtxn;
        let sinterruptint_xfer_done_rtxn= txn_address == 36 && rtxn;
        let sinterruptint_xfer_done_rclr = False && sinterruptint_xfer_done_rtxn;
        let sinterruptint_xfer_done_rset = False && sinterruptint_xfer_done_rtxn;
        let sinterruptint_xfer_done_swmod = False ;
        //let sinterruptint_xfer_done_swwe = False ? hwif_w.interrupt.int_xfer_done.swwe:True;
        //let sinterruptint_xfer_done_swwel = False ? hwif_w.interrupt.int_xfer_done.swwel:True;
        let sinterruptint_xfer_done_woclr = True && sinterruptint_xfer_done_wtxn && wdata[2 : 2] ==1;
        let sinterruptint_xfer_done_woset = False && sinterruptint_xfer_done_wtxn && wdata[2 : 2] ==1;
        let sinterruptint_xfer_done_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sinterruptint_xfer_done_var=sinterruptint_xfer_done;
        if(sinterruptint_xfer_done_rclr||sinterruptint_xfer_done_woclr) sinterruptint_xfer_done_var=0;
	sinterruptint_xfer_done_var=hwif_w.interrupt.int_xfer_done.next;
	if(sinterruptint_xfer_done_rtxn) rdata_var[2:2] = sinterruptint_xfer_done_var;
	if(sinterruptint_xfer_done_wtxn)sinterruptint_xfer_done_var=wdata[2 : 2];
	sinterruptint_xfer_done<=sinterruptint_xfer_done_var;

        let sinterrupt_maskmask_a_error_wtxn= txn_address == 40 && wtxn;
        let sinterrupt_maskmask_a_error_rtxn= txn_address == 40 && rtxn;
        let sinterrupt_maskmask_a_error_rclr = False && sinterrupt_maskmask_a_error_rtxn;
        let sinterrupt_maskmask_a_error_rset = False && sinterrupt_maskmask_a_error_rtxn;
        let sinterrupt_maskmask_a_error_swmod = False ;
        //let sinterrupt_maskmask_a_error_swwe = False ? hwif_w.interrupt_mask.mask_a_error.swwe:True;
        //let sinterrupt_maskmask_a_error_swwel = False ? hwif_w.interrupt_mask.mask_a_error.swwel:True;
        let sinterrupt_maskmask_a_error_woclr = False && sinterrupt_maskmask_a_error_wtxn && wdata[0 : 0] ==1;
        let sinterrupt_maskmask_a_error_woset = False && sinterrupt_maskmask_a_error_wtxn && wdata[0 : 0] ==1;
        let sinterrupt_maskmask_a_error_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sinterrupt_maskmask_a_error_var=sinterrupt_maskmask_a_error;
        if(sinterrupt_maskmask_a_error_rtxn) rdata_var[0:0] = sinterrupt_maskmask_a_error_var;
	if(sinterrupt_maskmask_a_error_wtxn)sinterrupt_maskmask_a_error_var=wdata[0 : 0];
	sinterrupt_maskmask_a_error<=sinterrupt_maskmask_a_error_var;

        let sinterrupt_maskmask_b_error_wtxn= txn_address == 40 && wtxn;
        let sinterrupt_maskmask_b_error_rtxn= txn_address == 40 && rtxn;
        let sinterrupt_maskmask_b_error_rclr = False && sinterrupt_maskmask_b_error_rtxn;
        let sinterrupt_maskmask_b_error_rset = False && sinterrupt_maskmask_b_error_rtxn;
        let sinterrupt_maskmask_b_error_swmod = False ;
        //let sinterrupt_maskmask_b_error_swwe = False ? hwif_w.interrupt_mask.mask_b_error.swwe:True;
        //let sinterrupt_maskmask_b_error_swwel = False ? hwif_w.interrupt_mask.mask_b_error.swwel:True;
        let sinterrupt_maskmask_b_error_woclr = False && sinterrupt_maskmask_b_error_wtxn && wdata[1 : 1] ==1;
        let sinterrupt_maskmask_b_error_woset = False && sinterrupt_maskmask_b_error_wtxn && wdata[1 : 1] ==1;
        let sinterrupt_maskmask_b_error_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sinterrupt_maskmask_b_error_var=sinterrupt_maskmask_b_error;
        if(sinterrupt_maskmask_b_error_rtxn) rdata_var[1:1] = sinterrupt_maskmask_b_error_var;
	if(sinterrupt_maskmask_b_error_wtxn)sinterrupt_maskmask_b_error_var=wdata[1 : 1];
	sinterrupt_maskmask_b_error<=sinterrupt_maskmask_b_error_var;

        let sinterrupt_maskmask_xfer_done_wtxn= txn_address == 40 && wtxn;
        let sinterrupt_maskmask_xfer_done_rtxn= txn_address == 40 && rtxn;
        let sinterrupt_maskmask_xfer_done_rclr = False && sinterrupt_maskmask_xfer_done_rtxn;
        let sinterrupt_maskmask_xfer_done_rset = False && sinterrupt_maskmask_xfer_done_rtxn;
        let sinterrupt_maskmask_xfer_done_swmod = False ;
        //let sinterrupt_maskmask_xfer_done_swwe = False ? hwif_w.interrupt_mask.mask_xfer_done.swwe:True;
        //let sinterrupt_maskmask_xfer_done_swwel = False ? hwif_w.interrupt_mask.mask_xfer_done.swwel:True;
        let sinterrupt_maskmask_xfer_done_woclr = False && sinterrupt_maskmask_xfer_done_wtxn && wdata[2 : 2] ==1;
        let sinterrupt_maskmask_xfer_done_woset = False && sinterrupt_maskmask_xfer_done_wtxn && wdata[2 : 2] ==1;
        let sinterrupt_maskmask_xfer_done_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sinterrupt_maskmask_xfer_done_var=sinterrupt_maskmask_xfer_done;
        if(sinterrupt_maskmask_xfer_done_rtxn) rdata_var[2:2] = sinterrupt_maskmask_xfer_done_var;
	if(sinterrupt_maskmask_xfer_done_wtxn)sinterrupt_maskmask_xfer_done_var=wdata[2 : 2];
	sinterrupt_maskmask_xfer_done<=sinterrupt_maskmask_xfer_done_var;

        let sinterrupt_testmask_a_error_wtxn= txn_address == 44 && wtxn;
        let sinterrupt_testmask_a_error_rtxn= txn_address == 44 && rtxn;
        let sinterrupt_testmask_a_error_rclr = False && sinterrupt_testmask_a_error_rtxn;
        let sinterrupt_testmask_a_error_rset = False && sinterrupt_testmask_a_error_rtxn;
        let sinterrupt_testmask_a_error_swmod = False ;
        //let sinterrupt_testmask_a_error_swwe = False ? hwif_w.interrupt_test.mask_a_error.swwe:True;
        //let sinterrupt_testmask_a_error_swwel = False ? hwif_w.interrupt_test.mask_a_error.swwel:True;
        let sinterrupt_testmask_a_error_woclr = False && sinterrupt_testmask_a_error_wtxn && wdata[0 : 0] ==1;
        let sinterrupt_testmask_a_error_woset = False && sinterrupt_testmask_a_error_wtxn && wdata[0 : 0] ==1;
        let sinterrupt_testmask_a_error_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sinterrupt_testmask_a_error_var=sinterrupt_testmask_a_error;
        if(sinterrupt_testmask_a_error_rtxn) rdata_var[0:0] = sinterrupt_testmask_a_error_var;
	if(sinterrupt_testmask_a_error_wtxn)sinterrupt_testmask_a_error_var=wdata[0 : 0];
	sinterrupt_testmask_a_error<=sinterrupt_testmask_a_error_var;

        let sinterrupt_testmask_b_error_wtxn= txn_address == 44 && wtxn;
        let sinterrupt_testmask_b_error_rtxn= txn_address == 44 && rtxn;
        let sinterrupt_testmask_b_error_rclr = False && sinterrupt_testmask_b_error_rtxn;
        let sinterrupt_testmask_b_error_rset = False && sinterrupt_testmask_b_error_rtxn;
        let sinterrupt_testmask_b_error_swmod = False ;
        //let sinterrupt_testmask_b_error_swwe = False ? hwif_w.interrupt_test.mask_b_error.swwe:True;
        //let sinterrupt_testmask_b_error_swwel = False ? hwif_w.interrupt_test.mask_b_error.swwel:True;
        let sinterrupt_testmask_b_error_woclr = False && sinterrupt_testmask_b_error_wtxn && wdata[1 : 1] ==1;
        let sinterrupt_testmask_b_error_woset = False && sinterrupt_testmask_b_error_wtxn && wdata[1 : 1] ==1;
        let sinterrupt_testmask_b_error_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sinterrupt_testmask_b_error_var=sinterrupt_testmask_b_error;
        if(sinterrupt_testmask_b_error_rtxn) rdata_var[1:1] = sinterrupt_testmask_b_error_var;
	if(sinterrupt_testmask_b_error_wtxn)sinterrupt_testmask_b_error_var=wdata[1 : 1];
	sinterrupt_testmask_b_error<=sinterrupt_testmask_b_error_var;

        let sinterrupt_testmask_xfer_done_wtxn= txn_address == 44 && wtxn;
        let sinterrupt_testmask_xfer_done_rtxn= txn_address == 44 && rtxn;
        let sinterrupt_testmask_xfer_done_rclr = False && sinterrupt_testmask_xfer_done_rtxn;
        let sinterrupt_testmask_xfer_done_rset = False && sinterrupt_testmask_xfer_done_rtxn;
        let sinterrupt_testmask_xfer_done_swmod = False ;
        //let sinterrupt_testmask_xfer_done_swwe = False ? hwif_w.interrupt_test.mask_xfer_done.swwe:True;
        //let sinterrupt_testmask_xfer_done_swwel = False ? hwif_w.interrupt_test.mask_xfer_done.swwel:True;
        let sinterrupt_testmask_xfer_done_woclr = False && sinterrupt_testmask_xfer_done_wtxn && wdata[2 : 2] ==1;
        let sinterrupt_testmask_xfer_done_woset = False && sinterrupt_testmask_xfer_done_wtxn && wdata[2 : 2] ==1;
        let sinterrupt_testmask_xfer_done_anded = False;
        // TODO HWENABLE,HWMask,hwset,hwclr,we,wel

        Bit#(1) sinterrupt_testmask_xfer_done_var=sinterrupt_testmask_xfer_done;
        if(sinterrupt_testmask_xfer_done_rtxn) rdata_var[2:2] = sinterrupt_testmask_xfer_done_var;
	if(sinterrupt_testmask_xfer_done_wtxn)sinterrupt_testmask_xfer_done_var=wdata[2 : 2];
	sinterrupt_testmask_xfer_done<=sinterrupt_testmask_xfer_done_var;

        hwif_r<=hwif_r_var
	;
        //rdata<=rdata_var;
        if(wtxn)begin
            	csr_axi.o_wr_addr.deq();
            	csr_axi.o_wr_data.deq();
            	csr_axi.i_wr_resp.enq(AXI4_Lite_Wr_Resp{bresp:AXI4_LITE_OKAY,buser:0});
        end
        if(rtxn)begin
            	csr_axi.o_rd_addr.deq();
            	csr_axi.i_rd_data.enq(AXI4_Lite_Rd_Data{rresp:AXI4_LITE_EXOKAY,rdata:rdata_var,ruser:0});
        end
endrule


interface AXI4_Lite_Slave_IFC csr_axi4=csr_axi.axi_side;

method DMA_Reg_Read hwif_read();
    return hwif_r;
endmethod
method Action hwif_write(DMA_Reg_Write w);
     hwif_w<=w;
endmethod

endmodule//DMA_Reg
