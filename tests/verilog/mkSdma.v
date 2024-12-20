//
// Generated by Bluespec Compiler, version 2024.01 (build ae2a2fc6)
//
//
// Ports:
// Name                         I/O  size props
// csr_axi4_awready               O     1 reg
// csr_axi4_wready                O     1 reg
// csr_axi4_bvalid                O     1 reg
// csr_axi4_bresp                 O     2 reg
// csr_axi4_arready               O     1 reg
// csr_axi4_rvalid                O     1 reg
// csr_axi4_rresp                 O     2 reg
// csr_axi4_rdata                 O    32 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// csr_axi4_awvalid               I     1
// csr_axi4_awaddr                I    32 reg
// csr_axi4_awprot                I     3 reg
// csr_axi4_wvalid                I     1
// csr_axi4_wdata                 I    32 reg
// csr_axi4_wstrb                 I     4 reg
// csr_axi4_bready                I     1
// csr_axi4_arvalid               I     1
// csr_axi4_araddr                I    32 reg
// csr_axi4_arprot                I     3 reg
// csr_axi4_rready                I     1
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkSdma(CLK,
	      RST_N,

	      csr_axi4_awvalid,
	      csr_axi4_awaddr,
	      csr_axi4_awprot,

	      csr_axi4_awready,

	      csr_axi4_wvalid,
	      csr_axi4_wdata,
	      csr_axi4_wstrb,

	      csr_axi4_wready,

	      csr_axi4_bvalid,

	      csr_axi4_bresp,

	      csr_axi4_bready,

	      csr_axi4_arvalid,
	      csr_axi4_araddr,
	      csr_axi4_arprot,

	      csr_axi4_arready,

	      csr_axi4_rvalid,

	      csr_axi4_rresp,

	      csr_axi4_rdata,

	      csr_axi4_rready);
  input  CLK;
  input  RST_N;

  // action method csr_axi4_m_awvalid
  input  csr_axi4_awvalid;
  input  [31 : 0] csr_axi4_awaddr;
  input  [2 : 0] csr_axi4_awprot;

  // value method csr_axi4_m_awready
  output csr_axi4_awready;

  // action method csr_axi4_m_wvalid
  input  csr_axi4_wvalid;
  input  [31 : 0] csr_axi4_wdata;
  input  [3 : 0] csr_axi4_wstrb;

  // value method csr_axi4_m_wready
  output csr_axi4_wready;

  // value method csr_axi4_m_bvalid
  output csr_axi4_bvalid;

  // value method csr_axi4_m_bresp
  output [1 : 0] csr_axi4_bresp;

  // value method csr_axi4_m_buser

  // action method csr_axi4_m_bready
  input  csr_axi4_bready;

  // action method csr_axi4_m_arvalid
  input  csr_axi4_arvalid;
  input  [31 : 0] csr_axi4_araddr;
  input  [2 : 0] csr_axi4_arprot;

  // value method csr_axi4_m_arready
  output csr_axi4_arready;

  // value method csr_axi4_m_rvalid
  output csr_axi4_rvalid;

  // value method csr_axi4_m_rresp
  output [1 : 0] csr_axi4_rresp;

  // value method csr_axi4_m_rdata
  output [31 : 0] csr_axi4_rdata;

  // value method csr_axi4_m_ruser

  // action method csr_axi4_m_rready
  input  csr_axi4_rready;

  // signals for module outputs
  wire [31 : 0] csr_axi4_rdata;
  wire [1 : 0] csr_axi4_bresp, csr_axi4_rresp;
  wire csr_axi4_arready,
       csr_axi4_awready,
       csr_axi4_bvalid,
       csr_axi4_rvalid,
       csr_axi4_wready;

  // ports of submodule axibus
  wire [31 : 0] axibus_v_from_masters_0_araddr,
		axibus_v_from_masters_0_awaddr,
		axibus_v_from_masters_0_rdata,
		axibus_v_from_masters_0_wdata,
		axibus_v_to_slaves_0_araddr,
		axibus_v_to_slaves_0_awaddr,
		axibus_v_to_slaves_0_rdata,
		axibus_v_to_slaves_0_wdata,
		axibus_v_to_slaves_1_araddr,
		axibus_v_to_slaves_1_awaddr,
		axibus_v_to_slaves_1_rdata,
		axibus_v_to_slaves_1_wdata,
		axibus_v_to_slaves_2_araddr,
		axibus_v_to_slaves_2_awaddr,
		axibus_v_to_slaves_2_rdata,
		axibus_v_to_slaves_2_wdata;
  wire [3 : 0] axibus_set_verbosity_verbosity,
	       axibus_v_from_masters_0_wstrb,
	       axibus_v_to_slaves_0_wstrb,
	       axibus_v_to_slaves_1_wstrb,
	       axibus_v_to_slaves_2_wstrb;
  wire [2 : 0] axibus_v_from_masters_0_arprot,
	       axibus_v_from_masters_0_awprot,
	       axibus_v_to_slaves_0_arprot,
	       axibus_v_to_slaves_0_awprot,
	       axibus_v_to_slaves_1_arprot,
	       axibus_v_to_slaves_1_awprot,
	       axibus_v_to_slaves_2_arprot,
	       axibus_v_to_slaves_2_awprot;
  wire [1 : 0] axibus_v_from_masters_0_bresp,
	       axibus_v_from_masters_0_rresp,
	       axibus_v_to_slaves_0_bresp,
	       axibus_v_to_slaves_0_rresp,
	       axibus_v_to_slaves_1_bresp,
	       axibus_v_to_slaves_1_rresp,
	       axibus_v_to_slaves_2_bresp,
	       axibus_v_to_slaves_2_rresp;
  wire axibus_EN_reset,
       axibus_EN_set_verbosity,
       axibus_v_from_masters_0_arready,
       axibus_v_from_masters_0_arvalid,
       axibus_v_from_masters_0_awready,
       axibus_v_from_masters_0_awvalid,
       axibus_v_from_masters_0_bready,
       axibus_v_from_masters_0_bvalid,
       axibus_v_from_masters_0_rready,
       axibus_v_from_masters_0_rvalid,
       axibus_v_from_masters_0_wready,
       axibus_v_from_masters_0_wvalid,
       axibus_v_to_slaves_0_arready,
       axibus_v_to_slaves_0_arvalid,
       axibus_v_to_slaves_0_awready,
       axibus_v_to_slaves_0_awvalid,
       axibus_v_to_slaves_0_bready,
       axibus_v_to_slaves_0_bvalid,
       axibus_v_to_slaves_0_rready,
       axibus_v_to_slaves_0_rvalid,
       axibus_v_to_slaves_0_wready,
       axibus_v_to_slaves_0_wvalid,
       axibus_v_to_slaves_1_arready,
       axibus_v_to_slaves_1_arvalid,
       axibus_v_to_slaves_1_awready,
       axibus_v_to_slaves_1_awvalid,
       axibus_v_to_slaves_1_bready,
       axibus_v_to_slaves_1_bvalid,
       axibus_v_to_slaves_1_rready,
       axibus_v_to_slaves_1_rvalid,
       axibus_v_to_slaves_1_wready,
       axibus_v_to_slaves_1_wvalid,
       axibus_v_to_slaves_2_arready,
       axibus_v_to_slaves_2_arvalid,
       axibus_v_to_slaves_2_awready,
       axibus_v_to_slaves_2_awvalid,
       axibus_v_to_slaves_2_bready,
       axibus_v_to_slaves_2_bvalid,
       axibus_v_to_slaves_2_rready,
       axibus_v_to_slaves_2_rvalid,
       axibus_v_to_slaves_2_wready,
       axibus_v_to_slaves_2_wvalid;

  // ports of submodule dma0
  wire [31 : 0] dma0_csr_axi4_araddr,
		dma0_csr_axi4_awaddr,
		dma0_csr_axi4_rdata,
		dma0_csr_axi4_wdata;
  wire [22 : 0] dma0_hwif_write_wdata;
  wire [3 : 0] dma0_csr_axi4_wstrb;
  wire [2 : 0] dma0_csr_axi4_arprot, dma0_csr_axi4_awprot;
  wire [1 : 0] dma0_csr_axi4_bresp, dma0_csr_axi4_rresp;
  wire dma0_csr_axi4_arready,
       dma0_csr_axi4_arvalid,
       dma0_csr_axi4_awready,
       dma0_csr_axi4_awvalid,
       dma0_csr_axi4_bready,
       dma0_csr_axi4_bvalid,
       dma0_csr_axi4_rready,
       dma0_csr_axi4_rvalid,
       dma0_csr_axi4_wready,
       dma0_csr_axi4_wvalid;

  // ports of submodule dma1
  wire [31 : 0] dma1_csr_axi4_araddr,
		dma1_csr_axi4_awaddr,
		dma1_csr_axi4_rdata,
		dma1_csr_axi4_wdata;
  wire [22 : 0] dma1_hwif_write_wdata;
  wire [3 : 0] dma1_csr_axi4_wstrb;
  wire [2 : 0] dma1_csr_axi4_arprot, dma1_csr_axi4_awprot;
  wire [1 : 0] dma1_csr_axi4_bresp, dma1_csr_axi4_rresp;
  wire dma1_csr_axi4_arready,
       dma1_csr_axi4_arvalid,
       dma1_csr_axi4_awready,
       dma1_csr_axi4_awvalid,
       dma1_csr_axi4_bready,
       dma1_csr_axi4_bvalid,
       dma1_csr_axi4_rready,
       dma1_csr_axi4_rvalid,
       dma1_csr_axi4_wready,
       dma1_csr_axi4_wvalid;

  // ports of submodule dma2
  wire [31 : 0] dma2_csr_axi4_araddr,
		dma2_csr_axi4_awaddr,
		dma2_csr_axi4_rdata,
		dma2_csr_axi4_wdata;
  wire [22 : 0] dma2_hwif_write_wdata;
  wire [3 : 0] dma2_csr_axi4_wstrb;
  wire [2 : 0] dma2_csr_axi4_arprot, dma2_csr_axi4_awprot;
  wire [1 : 0] dma2_csr_axi4_bresp, dma2_csr_axi4_rresp;
  wire dma2_csr_axi4_arready,
       dma2_csr_axi4_arvalid,
       dma2_csr_axi4_awready,
       dma2_csr_axi4_awvalid,
       dma2_csr_axi4_bready,
       dma2_csr_axi4_bvalid,
       dma2_csr_axi4_rready,
       dma2_csr_axi4_rvalid,
       dma2_csr_axi4_wready,
       dma2_csr_axi4_wvalid;

  // rule scheduling signals
  wire CAN_FIRE_RL_r,
       CAN_FIRE_RL_rl_rd_addr_channel,
       CAN_FIRE_RL_rl_rd_addr_channel_1,
       CAN_FIRE_RL_rl_rd_addr_channel_2,
       CAN_FIRE_RL_rl_rd_data_channel,
       CAN_FIRE_RL_rl_rd_data_channel_1,
       CAN_FIRE_RL_rl_rd_data_channel_2,
       CAN_FIRE_RL_rl_wr_addr_channel,
       CAN_FIRE_RL_rl_wr_addr_channel_1,
       CAN_FIRE_RL_rl_wr_addr_channel_2,
       CAN_FIRE_RL_rl_wr_data_channel,
       CAN_FIRE_RL_rl_wr_data_channel_1,
       CAN_FIRE_RL_rl_wr_data_channel_2,
       CAN_FIRE_RL_rl_wr_response_channel,
       CAN_FIRE_RL_rl_wr_response_channel_1,
       CAN_FIRE_RL_rl_wr_response_channel_2,
       CAN_FIRE_csr_axi4_m_arvalid,
       CAN_FIRE_csr_axi4_m_awvalid,
       CAN_FIRE_csr_axi4_m_bready,
       CAN_FIRE_csr_axi4_m_rready,
       CAN_FIRE_csr_axi4_m_wvalid,
       WILL_FIRE_RL_r,
       WILL_FIRE_RL_rl_rd_addr_channel,
       WILL_FIRE_RL_rl_rd_addr_channel_1,
       WILL_FIRE_RL_rl_rd_addr_channel_2,
       WILL_FIRE_RL_rl_rd_data_channel,
       WILL_FIRE_RL_rl_rd_data_channel_1,
       WILL_FIRE_RL_rl_rd_data_channel_2,
       WILL_FIRE_RL_rl_wr_addr_channel,
       WILL_FIRE_RL_rl_wr_addr_channel_1,
       WILL_FIRE_RL_rl_wr_addr_channel_2,
       WILL_FIRE_RL_rl_wr_data_channel,
       WILL_FIRE_RL_rl_wr_data_channel_1,
       WILL_FIRE_RL_rl_wr_data_channel_2,
       WILL_FIRE_RL_rl_wr_response_channel,
       WILL_FIRE_RL_rl_wr_response_channel_1,
       WILL_FIRE_RL_rl_wr_response_channel_2,
       WILL_FIRE_csr_axi4_m_arvalid,
       WILL_FIRE_csr_axi4_m_awvalid,
       WILL_FIRE_csr_axi4_m_bready,
       WILL_FIRE_csr_axi4_m_rready,
       WILL_FIRE_csr_axi4_m_wvalid;

  // action method csr_axi4_m_awvalid
  assign CAN_FIRE_csr_axi4_m_awvalid = 1'd1 ;
  assign WILL_FIRE_csr_axi4_m_awvalid = 1'd1 ;

  // value method csr_axi4_m_awready
  assign csr_axi4_awready = axibus_v_from_masters_0_awready ;

  // action method csr_axi4_m_wvalid
  assign CAN_FIRE_csr_axi4_m_wvalid = 1'd1 ;
  assign WILL_FIRE_csr_axi4_m_wvalid = 1'd1 ;

  // value method csr_axi4_m_wready
  assign csr_axi4_wready = axibus_v_from_masters_0_wready ;

  // value method csr_axi4_m_bvalid
  assign csr_axi4_bvalid = axibus_v_from_masters_0_bvalid ;

  // value method csr_axi4_m_bresp
  assign csr_axi4_bresp = axibus_v_from_masters_0_bresp ;

  // action method csr_axi4_m_bready
  assign CAN_FIRE_csr_axi4_m_bready = 1'd1 ;
  assign WILL_FIRE_csr_axi4_m_bready = 1'd1 ;

  // action method csr_axi4_m_arvalid
  assign CAN_FIRE_csr_axi4_m_arvalid = 1'd1 ;
  assign WILL_FIRE_csr_axi4_m_arvalid = 1'd1 ;

  // value method csr_axi4_m_arready
  assign csr_axi4_arready = axibus_v_from_masters_0_arready ;

  // value method csr_axi4_m_rvalid
  assign csr_axi4_rvalid = axibus_v_from_masters_0_rvalid ;

  // value method csr_axi4_m_rresp
  assign csr_axi4_rresp = axibus_v_from_masters_0_rresp ;

  // value method csr_axi4_m_rdata
  assign csr_axi4_rdata = axibus_v_from_masters_0_rdata ;

  // action method csr_axi4_m_rready
  assign CAN_FIRE_csr_axi4_m_rready = 1'd1 ;
  assign WILL_FIRE_csr_axi4_m_rready = 1'd1 ;

  // submodule axibus
  mkAXI4_3dma axibus(.CLK(CLK),
		     .RST_N(RST_N),
		     .set_verbosity_verbosity(axibus_set_verbosity_verbosity),
		     .v_from_masters_0_araddr(axibus_v_from_masters_0_araddr),
		     .v_from_masters_0_arprot(axibus_v_from_masters_0_arprot),
		     .v_from_masters_0_arvalid(axibus_v_from_masters_0_arvalid),
		     .v_from_masters_0_awaddr(axibus_v_from_masters_0_awaddr),
		     .v_from_masters_0_awprot(axibus_v_from_masters_0_awprot),
		     .v_from_masters_0_awvalid(axibus_v_from_masters_0_awvalid),
		     .v_from_masters_0_bready(axibus_v_from_masters_0_bready),
		     .v_from_masters_0_rready(axibus_v_from_masters_0_rready),
		     .v_from_masters_0_wdata(axibus_v_from_masters_0_wdata),
		     .v_from_masters_0_wstrb(axibus_v_from_masters_0_wstrb),
		     .v_from_masters_0_wvalid(axibus_v_from_masters_0_wvalid),
		     .v_to_slaves_0_arready(axibus_v_to_slaves_0_arready),
		     .v_to_slaves_0_awready(axibus_v_to_slaves_0_awready),
		     .v_to_slaves_0_bresp(axibus_v_to_slaves_0_bresp),
		     .v_to_slaves_0_bvalid(axibus_v_to_slaves_0_bvalid),
		     .v_to_slaves_0_rdata(axibus_v_to_slaves_0_rdata),
		     .v_to_slaves_0_rresp(axibus_v_to_slaves_0_rresp),
		     .v_to_slaves_0_rvalid(axibus_v_to_slaves_0_rvalid),
		     .v_to_slaves_0_wready(axibus_v_to_slaves_0_wready),
		     .v_to_slaves_1_arready(axibus_v_to_slaves_1_arready),
		     .v_to_slaves_1_awready(axibus_v_to_slaves_1_awready),
		     .v_to_slaves_1_bresp(axibus_v_to_slaves_1_bresp),
		     .v_to_slaves_1_bvalid(axibus_v_to_slaves_1_bvalid),
		     .v_to_slaves_1_rdata(axibus_v_to_slaves_1_rdata),
		     .v_to_slaves_1_rresp(axibus_v_to_slaves_1_rresp),
		     .v_to_slaves_1_rvalid(axibus_v_to_slaves_1_rvalid),
		     .v_to_slaves_1_wready(axibus_v_to_slaves_1_wready),
		     .v_to_slaves_2_arready(axibus_v_to_slaves_2_arready),
		     .v_to_slaves_2_awready(axibus_v_to_slaves_2_awready),
		     .v_to_slaves_2_bresp(axibus_v_to_slaves_2_bresp),
		     .v_to_slaves_2_bvalid(axibus_v_to_slaves_2_bvalid),
		     .v_to_slaves_2_rdata(axibus_v_to_slaves_2_rdata),
		     .v_to_slaves_2_rresp(axibus_v_to_slaves_2_rresp),
		     .v_to_slaves_2_rvalid(axibus_v_to_slaves_2_rvalid),
		     .v_to_slaves_2_wready(axibus_v_to_slaves_2_wready),
		     .EN_reset(axibus_EN_reset),
		     .EN_set_verbosity(axibus_EN_set_verbosity),
		     .RDY_reset(),
		     .RDY_set_verbosity(),
		     .v_from_masters_0_awready(axibus_v_from_masters_0_awready),
		     .v_from_masters_0_wready(axibus_v_from_masters_0_wready),
		     .v_from_masters_0_bvalid(axibus_v_from_masters_0_bvalid),
		     .v_from_masters_0_bresp(axibus_v_from_masters_0_bresp),
		     .v_from_masters_0_arready(axibus_v_from_masters_0_arready),
		     .v_from_masters_0_rvalid(axibus_v_from_masters_0_rvalid),
		     .v_from_masters_0_rresp(axibus_v_from_masters_0_rresp),
		     .v_from_masters_0_rdata(axibus_v_from_masters_0_rdata),
		     .v_to_slaves_0_awvalid(axibus_v_to_slaves_0_awvalid),
		     .v_to_slaves_0_awaddr(axibus_v_to_slaves_0_awaddr),
		     .v_to_slaves_0_awprot(axibus_v_to_slaves_0_awprot),
		     .v_to_slaves_0_wvalid(axibus_v_to_slaves_0_wvalid),
		     .v_to_slaves_0_wdata(axibus_v_to_slaves_0_wdata),
		     .v_to_slaves_0_wstrb(axibus_v_to_slaves_0_wstrb),
		     .v_to_slaves_0_bready(axibus_v_to_slaves_0_bready),
		     .v_to_slaves_0_arvalid(axibus_v_to_slaves_0_arvalid),
		     .v_to_slaves_0_araddr(axibus_v_to_slaves_0_araddr),
		     .v_to_slaves_0_arprot(axibus_v_to_slaves_0_arprot),
		     .v_to_slaves_0_rready(axibus_v_to_slaves_0_rready),
		     .v_to_slaves_1_awvalid(axibus_v_to_slaves_1_awvalid),
		     .v_to_slaves_1_awaddr(axibus_v_to_slaves_1_awaddr),
		     .v_to_slaves_1_awprot(axibus_v_to_slaves_1_awprot),
		     .v_to_slaves_1_wvalid(axibus_v_to_slaves_1_wvalid),
		     .v_to_slaves_1_wdata(axibus_v_to_slaves_1_wdata),
		     .v_to_slaves_1_wstrb(axibus_v_to_slaves_1_wstrb),
		     .v_to_slaves_1_bready(axibus_v_to_slaves_1_bready),
		     .v_to_slaves_1_arvalid(axibus_v_to_slaves_1_arvalid),
		     .v_to_slaves_1_araddr(axibus_v_to_slaves_1_araddr),
		     .v_to_slaves_1_arprot(axibus_v_to_slaves_1_arprot),
		     .v_to_slaves_1_rready(axibus_v_to_slaves_1_rready),
		     .v_to_slaves_2_awvalid(axibus_v_to_slaves_2_awvalid),
		     .v_to_slaves_2_awaddr(axibus_v_to_slaves_2_awaddr),
		     .v_to_slaves_2_awprot(axibus_v_to_slaves_2_awprot),
		     .v_to_slaves_2_wvalid(axibus_v_to_slaves_2_wvalid),
		     .v_to_slaves_2_wdata(axibus_v_to_slaves_2_wdata),
		     .v_to_slaves_2_wstrb(axibus_v_to_slaves_2_wstrb),
		     .v_to_slaves_2_bready(axibus_v_to_slaves_2_bready),
		     .v_to_slaves_2_arvalid(axibus_v_to_slaves_2_arvalid),
		     .v_to_slaves_2_araddr(axibus_v_to_slaves_2_araddr),
		     .v_to_slaves_2_arprot(axibus_v_to_slaves_2_arprot),
		     .v_to_slaves_2_rready(axibus_v_to_slaves_2_rready));

  // submodule dma0
  mkDMACsr_32_32 dma0(.CLK(CLK),
		      .RST_N(RST_N),
		      .csr_axi4_araddr(dma0_csr_axi4_araddr),
		      .csr_axi4_arprot(dma0_csr_axi4_arprot),
		      .csr_axi4_arvalid(dma0_csr_axi4_arvalid),
		      .csr_axi4_awaddr(dma0_csr_axi4_awaddr),
		      .csr_axi4_awprot(dma0_csr_axi4_awprot),
		      .csr_axi4_awvalid(dma0_csr_axi4_awvalid),
		      .csr_axi4_bready(dma0_csr_axi4_bready),
		      .csr_axi4_rready(dma0_csr_axi4_rready),
		      .csr_axi4_wdata(dma0_csr_axi4_wdata),
		      .csr_axi4_wstrb(dma0_csr_axi4_wstrb),
		      .csr_axi4_wvalid(dma0_csr_axi4_wvalid),
		      .hwif_write_wdata(dma0_hwif_write_wdata),
		      .csr_axi4_awready(dma0_csr_axi4_awready),
		      .csr_axi4_wready(dma0_csr_axi4_wready),
		      .csr_axi4_bvalid(dma0_csr_axi4_bvalid),
		      .csr_axi4_bresp(dma0_csr_axi4_bresp),
		      .csr_axi4_arready(dma0_csr_axi4_arready),
		      .csr_axi4_rvalid(dma0_csr_axi4_rvalid),
		      .csr_axi4_rresp(dma0_csr_axi4_rresp),
		      .csr_axi4_rdata(dma0_csr_axi4_rdata),
		      .hwif_read());

  // submodule dma1
  mkDMACsr_32_32 dma1(.CLK(CLK),
		      .RST_N(RST_N),
		      .csr_axi4_araddr(dma1_csr_axi4_araddr),
		      .csr_axi4_arprot(dma1_csr_axi4_arprot),
		      .csr_axi4_arvalid(dma1_csr_axi4_arvalid),
		      .csr_axi4_awaddr(dma1_csr_axi4_awaddr),
		      .csr_axi4_awprot(dma1_csr_axi4_awprot),
		      .csr_axi4_awvalid(dma1_csr_axi4_awvalid),
		      .csr_axi4_bready(dma1_csr_axi4_bready),
		      .csr_axi4_rready(dma1_csr_axi4_rready),
		      .csr_axi4_wdata(dma1_csr_axi4_wdata),
		      .csr_axi4_wstrb(dma1_csr_axi4_wstrb),
		      .csr_axi4_wvalid(dma1_csr_axi4_wvalid),
		      .hwif_write_wdata(dma1_hwif_write_wdata),
		      .csr_axi4_awready(dma1_csr_axi4_awready),
		      .csr_axi4_wready(dma1_csr_axi4_wready),
		      .csr_axi4_bvalid(dma1_csr_axi4_bvalid),
		      .csr_axi4_bresp(dma1_csr_axi4_bresp),
		      .csr_axi4_arready(dma1_csr_axi4_arready),
		      .csr_axi4_rvalid(dma1_csr_axi4_rvalid),
		      .csr_axi4_rresp(dma1_csr_axi4_rresp),
		      .csr_axi4_rdata(dma1_csr_axi4_rdata),
		      .hwif_read());

  // submodule dma2
  mkDMACsr_32_32 dma2(.CLK(CLK),
		      .RST_N(RST_N),
		      .csr_axi4_araddr(dma2_csr_axi4_araddr),
		      .csr_axi4_arprot(dma2_csr_axi4_arprot),
		      .csr_axi4_arvalid(dma2_csr_axi4_arvalid),
		      .csr_axi4_awaddr(dma2_csr_axi4_awaddr),
		      .csr_axi4_awprot(dma2_csr_axi4_awprot),
		      .csr_axi4_awvalid(dma2_csr_axi4_awvalid),
		      .csr_axi4_bready(dma2_csr_axi4_bready),
		      .csr_axi4_rready(dma2_csr_axi4_rready),
		      .csr_axi4_wdata(dma2_csr_axi4_wdata),
		      .csr_axi4_wstrb(dma2_csr_axi4_wstrb),
		      .csr_axi4_wvalid(dma2_csr_axi4_wvalid),
		      .hwif_write_wdata(dma2_hwif_write_wdata),
		      .csr_axi4_awready(dma2_csr_axi4_awready),
		      .csr_axi4_wready(dma2_csr_axi4_wready),
		      .csr_axi4_bvalid(dma2_csr_axi4_bvalid),
		      .csr_axi4_bresp(dma2_csr_axi4_bresp),
		      .csr_axi4_arready(dma2_csr_axi4_arready),
		      .csr_axi4_rvalid(dma2_csr_axi4_rvalid),
		      .csr_axi4_rresp(dma2_csr_axi4_rresp),
		      .csr_axi4_rdata(dma2_csr_axi4_rdata),
		      .hwif_read());

  // rule RL_rl_wr_addr_channel
  assign CAN_FIRE_RL_rl_wr_addr_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel = 1'd1 ;

  // rule RL_rl_wr_data_channel
  assign CAN_FIRE_RL_rl_wr_data_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel = 1'd1 ;

  // rule RL_rl_wr_response_channel
  assign CAN_FIRE_RL_rl_wr_response_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel = 1'd1 ;

  // rule RL_rl_rd_addr_channel
  assign CAN_FIRE_RL_rl_rd_addr_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel = 1'd1 ;

  // rule RL_rl_rd_data_channel
  assign CAN_FIRE_RL_rl_rd_data_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel = 1'd1 ;

  // rule RL_rl_wr_addr_channel_1
  assign CAN_FIRE_RL_rl_wr_addr_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_1 = 1'd1 ;

  // rule RL_rl_wr_data_channel_1
  assign CAN_FIRE_RL_rl_wr_data_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_1 = 1'd1 ;

  // rule RL_rl_wr_response_channel_1
  assign CAN_FIRE_RL_rl_wr_response_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_1 = 1'd1 ;

  // rule RL_rl_rd_addr_channel_1
  assign CAN_FIRE_RL_rl_rd_addr_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_1 = 1'd1 ;

  // rule RL_rl_rd_data_channel_1
  assign CAN_FIRE_RL_rl_rd_data_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_1 = 1'd1 ;

  // rule RL_rl_wr_addr_channel_2
  assign CAN_FIRE_RL_rl_wr_addr_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_2 = 1'd1 ;

  // rule RL_rl_wr_data_channel_2
  assign CAN_FIRE_RL_rl_wr_data_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_2 = 1'd1 ;

  // rule RL_rl_wr_response_channel_2
  assign CAN_FIRE_RL_rl_wr_response_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_2 = 1'd1 ;

  // rule RL_rl_rd_addr_channel_2
  assign CAN_FIRE_RL_rl_rd_addr_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_2 = 1'd1 ;

  // rule RL_rl_rd_data_channel_2
  assign CAN_FIRE_RL_rl_rd_data_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_2 = 1'd1 ;

  // rule RL_r
  assign CAN_FIRE_RL_r = 1'd1 ;
  assign WILL_FIRE_RL_r = 1'd1 ;

  // submodule axibus
  assign axibus_set_verbosity_verbosity = 4'h0 ;
  assign axibus_v_from_masters_0_araddr = csr_axi4_araddr ;
  assign axibus_v_from_masters_0_arprot = csr_axi4_arprot ;
  assign axibus_v_from_masters_0_arvalid = csr_axi4_arvalid ;
  assign axibus_v_from_masters_0_awaddr = csr_axi4_awaddr ;
  assign axibus_v_from_masters_0_awprot = csr_axi4_awprot ;
  assign axibus_v_from_masters_0_awvalid = csr_axi4_awvalid ;
  assign axibus_v_from_masters_0_bready = csr_axi4_bready ;
  assign axibus_v_from_masters_0_rready = csr_axi4_rready ;
  assign axibus_v_from_masters_0_wdata = csr_axi4_wdata ;
  assign axibus_v_from_masters_0_wstrb = csr_axi4_wstrb ;
  assign axibus_v_from_masters_0_wvalid = csr_axi4_wvalid ;
  assign axibus_v_to_slaves_0_arready = dma0_csr_axi4_arready ;
  assign axibus_v_to_slaves_0_awready = dma0_csr_axi4_awready ;
  assign axibus_v_to_slaves_0_bresp = dma0_csr_axi4_bresp ;
  assign axibus_v_to_slaves_0_bvalid = dma0_csr_axi4_bvalid ;
  assign axibus_v_to_slaves_0_rdata = dma0_csr_axi4_rdata ;
  assign axibus_v_to_slaves_0_rresp = dma0_csr_axi4_rresp ;
  assign axibus_v_to_slaves_0_rvalid = dma0_csr_axi4_rvalid ;
  assign axibus_v_to_slaves_0_wready = dma0_csr_axi4_wready ;
  assign axibus_v_to_slaves_1_arready = dma1_csr_axi4_arready ;
  assign axibus_v_to_slaves_1_awready = dma1_csr_axi4_awready ;
  assign axibus_v_to_slaves_1_bresp = dma1_csr_axi4_bresp ;
  assign axibus_v_to_slaves_1_bvalid = dma1_csr_axi4_bvalid ;
  assign axibus_v_to_slaves_1_rdata = dma1_csr_axi4_rdata ;
  assign axibus_v_to_slaves_1_rresp = dma1_csr_axi4_rresp ;
  assign axibus_v_to_slaves_1_rvalid = dma1_csr_axi4_rvalid ;
  assign axibus_v_to_slaves_1_wready = dma1_csr_axi4_wready ;
  assign axibus_v_to_slaves_2_arready = dma2_csr_axi4_arready ;
  assign axibus_v_to_slaves_2_awready = dma2_csr_axi4_awready ;
  assign axibus_v_to_slaves_2_bresp = dma2_csr_axi4_bresp ;
  assign axibus_v_to_slaves_2_bvalid = dma2_csr_axi4_bvalid ;
  assign axibus_v_to_slaves_2_rdata = dma2_csr_axi4_rdata ;
  assign axibus_v_to_slaves_2_rresp = dma2_csr_axi4_rresp ;
  assign axibus_v_to_slaves_2_rvalid = dma2_csr_axi4_rvalid ;
  assign axibus_v_to_slaves_2_wready = dma2_csr_axi4_wready ;
  assign axibus_EN_reset = 1'b0 ;
  assign axibus_EN_set_verbosity = 1'b0 ;

  // submodule dma0
  assign dma0_csr_axi4_araddr = axibus_v_to_slaves_0_araddr ;
  assign dma0_csr_axi4_arprot = axibus_v_to_slaves_0_arprot ;
  assign dma0_csr_axi4_arvalid = axibus_v_to_slaves_0_arvalid ;
  assign dma0_csr_axi4_awaddr = axibus_v_to_slaves_0_awaddr ;
  assign dma0_csr_axi4_awprot = axibus_v_to_slaves_0_awprot ;
  assign dma0_csr_axi4_awvalid = axibus_v_to_slaves_0_awvalid ;
  assign dma0_csr_axi4_bready = axibus_v_to_slaves_0_bready ;
  assign dma0_csr_axi4_rready = axibus_v_to_slaves_0_rready ;
  assign dma0_csr_axi4_wdata = axibus_v_to_slaves_0_wdata ;
  assign dma0_csr_axi4_wstrb = axibus_v_to_slaves_0_wstrb ;
  assign dma0_csr_axi4_wvalid = axibus_v_to_slaves_0_wvalid ;
  assign dma0_hwif_write_wdata = 23'd0 ;

  // submodule dma1
  assign dma1_csr_axi4_araddr = axibus_v_to_slaves_1_araddr ;
  assign dma1_csr_axi4_arprot = axibus_v_to_slaves_1_arprot ;
  assign dma1_csr_axi4_arvalid = axibus_v_to_slaves_1_arvalid ;
  assign dma1_csr_axi4_awaddr = axibus_v_to_slaves_1_awaddr ;
  assign dma1_csr_axi4_awprot = axibus_v_to_slaves_1_awprot ;
  assign dma1_csr_axi4_awvalid = axibus_v_to_slaves_1_awvalid ;
  assign dma1_csr_axi4_bready = axibus_v_to_slaves_1_bready ;
  assign dma1_csr_axi4_rready = axibus_v_to_slaves_1_rready ;
  assign dma1_csr_axi4_wdata = axibus_v_to_slaves_1_wdata ;
  assign dma1_csr_axi4_wstrb = axibus_v_to_slaves_1_wstrb ;
  assign dma1_csr_axi4_wvalid = axibus_v_to_slaves_1_wvalid ;
  assign dma1_hwif_write_wdata = 23'd0 ;

  // submodule dma2
  assign dma2_csr_axi4_araddr = axibus_v_to_slaves_2_araddr ;
  assign dma2_csr_axi4_arprot = axibus_v_to_slaves_2_arprot ;
  assign dma2_csr_axi4_arvalid = axibus_v_to_slaves_2_arvalid ;
  assign dma2_csr_axi4_awaddr = axibus_v_to_slaves_2_awaddr ;
  assign dma2_csr_axi4_awprot = axibus_v_to_slaves_2_awprot ;
  assign dma2_csr_axi4_awvalid = axibus_v_to_slaves_2_awvalid ;
  assign dma2_csr_axi4_bready = axibus_v_to_slaves_2_bready ;
  assign dma2_csr_axi4_rready = axibus_v_to_slaves_2_rready ;
  assign dma2_csr_axi4_wdata = axibus_v_to_slaves_2_wdata ;
  assign dma2_csr_axi4_wstrb = axibus_v_to_slaves_2_wstrb ;
  assign dma2_csr_axi4_wvalid = axibus_v_to_slaves_2_wvalid ;
  assign dma2_hwif_write_wdata = 23'd0 ;
endmodule  // mkSdma
