// Generated by CIRCT unknown git version
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

module TLXbar_2(
  input         clock,
                reset,
                auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
                auto_in_a_bits_size,
  input  [6:0]  auto_in_a_bits_source,
  input  [30:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
                auto_out_1_a_ready,
                auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
                auto_out_1_d_bits_size,
  input  [6:0]  auto_out_1_d_bits_source,
  input  [63:0] auto_out_1_d_bits_data,
  input         auto_out_0_a_ready,
                auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
                auto_out_0_d_bits_size,
  input  [6:0]  auto_out_0_d_bits_source,
  input  [63:0] auto_out_0_d_bits_data,
  output        auto_in_a_ready,
                auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
                auto_in_d_bits_size,
  output [6:0]  auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
                auto_out_1_a_bits_param,
                auto_out_1_a_bits_size,
  output [6:0]  auto_out_1_a_bits_source,
  output [30:0] auto_out_1_a_bits_address,
  output [7:0]  auto_out_1_a_bits_mask,
  output [63:0] auto_out_1_a_bits_data,
  output        auto_out_1_a_bits_corrupt,
                auto_out_1_d_ready,
                auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
                auto_out_0_a_bits_param,
                auto_out_0_a_bits_size,
  output [6:0]  auto_out_0_a_bits_source,
  output [14:0] auto_out_0_a_bits_address,
  output [7:0]  auto_out_0_a_bits_mask,
  output [63:0] auto_out_0_a_bits_data,
  output        auto_out_0_a_bits_corrupt,
                auto_out_0_d_ready
);

  wire        _portsAOI_in_0_a_ready_WIRE = ~(auto_in_a_bits_address[30]) & auto_out_0_a_ready | auto_in_a_bits_address[30] & auto_out_1_a_ready;	// @[Mux.scala:27:73, Parameters.scala:137:{45,65}]
  reg  [2:0]  beatsLeft;	// @[Arbiter.scala:87:30]
  wire        idle = beatsLeft == 3'h0;	// @[Arbiter.scala:87:30, :88:28, Bundles.scala:259:74]
  wire [1:0]  readys_valid = {auto_out_1_d_valid, auto_out_0_d_valid};	// @[Cat.scala:33:92]
  reg  [1:0]  readys_mask;	// @[Arbiter.scala:23:23]
  wire [1:0]  _readys_filter_T_1 = readys_valid & ~readys_mask;	// @[Arbiter.scala:23:23, :24:{28,30}, Cat.scala:33:92]
  wire [1:0]  readys_readys = ~({readys_mask[1], _readys_filter_T_1[1] | readys_mask[0]} & {|_readys_filter_T_1, auto_out_1_d_valid | _readys_filter_T_1[0]});	// @[Arbiter.scala:23:23, :24:28, :25:58, :26:{18,29,39,48}, package.scala:254:43]
  wire        earlyWinner_0 = readys_readys[0] & auto_out_0_d_valid;	// @[Arbiter.scala:26:18, :95:86, :97:79]
  wire        earlyWinner_1 = readys_readys[1] & auto_out_1_d_valid;	// @[Arbiter.scala:26:18, :95:86, :97:79]
  wire        _sink_ACancel_earlyValid_T = auto_out_0_d_valid | auto_out_1_d_valid;	// @[Arbiter.scala:107:36]
  reg         state_0;	// @[Arbiter.scala:116:26]
  reg         state_1;	// @[Arbiter.scala:116:26]
  wire        muxStateEarly_0 = idle ? earlyWinner_0 : state_0;	// @[Arbiter.scala:88:28, :97:79, :116:26, :117:30]
  wire        muxStateEarly_1 = idle ? earlyWinner_1 : state_1;	// @[Arbiter.scala:88:28, :97:79, :116:26, :117:30]
  wire        out_9_valid = idle ? _sink_ACancel_earlyValid_T : state_0 & auto_out_0_d_valid | state_1 & auto_out_1_d_valid;	// @[Arbiter.scala:88:28, :107:36, :116:26, :125:29, Mux.scala:27:73]
  wire [6:0]  out_9_bits_source = (muxStateEarly_0 ? auto_out_0_d_bits_source : 7'h0) | (muxStateEarly_1 ? auto_out_1_d_bits_source : 7'h0);	// @[Arbiter.scala:117:30, Bundles.scala:259:74, Mux.scala:27:73]
  wire [2:0]  out_9_bits_size = (muxStateEarly_0 ? auto_out_0_d_bits_size : 3'h0) | (muxStateEarly_1 ? auto_out_1_d_bits_size : 3'h0);	// @[Arbiter.scala:117:30, Bundles.scala:259:74, Mux.scala:27:73]
  wire [2:0]  out_9_bits_opcode = (muxStateEarly_0 ? auto_out_0_d_bits_opcode : 3'h0) | (muxStateEarly_1 ? auto_out_1_d_bits_opcode : 3'h0);	// @[Arbiter.scala:117:30, Bundles.scala:259:74, Mux.scala:27:73]
  wire [12:0] _beatsDO_decode_T_5 = 13'h3F << auto_out_1_d_bits_size;	// @[package.scala:235:71]
  wire [12:0] _beatsDO_decode_T_1 = 13'h3F << auto_out_0_d_bits_size;	// @[package.scala:235:71]
  wire [1:0]  _readys_mask_T = readys_readys & readys_valid;	// @[Arbiter.scala:26:18, :28:29, Cat.scala:33:92]
  wire        latch = idle & auto_in_d_ready;	// @[Arbiter.scala:88:28, :89:24]
  wire        winnerQual_0 = readys_readys[0] & auto_out_0_d_valid;	// @[Arbiter.scala:26:18, :95:86, :98:79]
  wire        winnerQual_1 = readys_readys[1] & auto_out_1_d_valid;	// @[Arbiter.scala:26:18, :95:86, :98:79]
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 3'h0;	// @[Arbiter.scala:87:30, Bundles.scala:259:74]
      readys_mask <= 2'h3;	// @[Arbiter.scala:23:23]
      state_0 <= 1'h0;	// @[Arbiter.scala:116:26]
      state_1 <= 1'h0;	// @[Arbiter.scala:116:26]
    end
    else begin
      if (latch)	// @[Arbiter.scala:89:24]
        beatsLeft <= (winnerQual_0 & auto_out_0_d_bits_opcode[0] ? ~(_beatsDO_decode_T_1[5:3]) : 3'h0) | (winnerQual_1 & auto_out_1_d_bits_opcode[0] ? ~(_beatsDO_decode_T_5[5:3]) : 3'h0);	// @[Arbiter.scala:87:30, :98:79, :111:73, :112:44, Bundles.scala:259:74, Edges.scala:105:36, :220:14, package.scala:235:{46,71,76}]
      else	// @[Arbiter.scala:89:24]
        beatsLeft <= beatsLeft - {2'h0, auto_in_d_ready & out_9_valid};	// @[Arbiter.scala:87:30, :113:52, :125:29, ReadyValidCancel.scala:49:33]
      if (latch & (|readys_valid))	// @[Arbiter.scala:27:{18,27}, :89:24, Cat.scala:33:92]
        readys_mask <= _readys_mask_T | {_readys_mask_T[0], 1'h0};	// @[Arbiter.scala:23:23, :28:29, package.scala:245:{43,53}]
      if (idle) begin	// @[Arbiter.scala:88:28]
        state_0 <= winnerQual_0;	// @[Arbiter.scala:98:79, :116:26]
        state_1 <= winnerQual_1;	// @[Arbiter.scala:98:79, :116:26]
      end
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// @[Arbiter.scala:105:13]
      if (~reset & ~(~earlyWinner_0 | ~earlyWinner_1)) begin	// @[Arbiter.scala:97:79, :105:{13,61,64,67}]
        if (`ASSERT_VERBOSE_COND_)	// @[Arbiter.scala:105:13]
          $error("Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n");	// @[Arbiter.scala:105:13]
        if (`STOP_COND_)	// @[Arbiter.scala:105:13]
          $fatal;	// @[Arbiter.scala:105:13]
      end
      if (~reset & ~(~_sink_ACancel_earlyValid_T | earlyWinner_0 | earlyWinner_1)) begin	// @[Arbiter.scala:97:79, :107:{14,15,36,41}]
        if (`ASSERT_VERBOSE_COND_)	// @[Arbiter.scala:107:14]
          $error("Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n");	// @[Arbiter.scala:107:14]
        if (`STOP_COND_)	// @[Arbiter.scala:107:14]
          $fatal;	// @[Arbiter.scala:107:14]
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        beatsLeft = _RANDOM_0[2:0];	// @[Arbiter.scala:87:30]
        readys_mask = _RANDOM_0[4:3];	// @[Arbiter.scala:23:23, :87:30]
        state_0 = _RANDOM_0[5];	// @[Arbiter.scala:87:30, :116:26]
        state_1 = _RANDOM_0[6];	// @[Arbiter.scala:87:30, :116:26]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  TLMonitor_9 monitor (	// @[Nodes.scala:24:25]
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_portsAOI_in_0_a_ready_WIRE),	// @[Mux.scala:27:73]
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_a_bits_corrupt),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (out_9_valid),	// @[Arbiter.scala:125:29]
    .io_in_d_bits_opcode  (out_9_bits_opcode),	// @[Mux.scala:27:73]
    .io_in_d_bits_param   (2'h0),
    .io_in_d_bits_size    (out_9_bits_size),	// @[Mux.scala:27:73]
    .io_in_d_bits_source  (out_9_bits_source),	// @[Mux.scala:27:73]
    .io_in_d_bits_sink    (1'h0),
    .io_in_d_bits_denied  (1'h0),
    .io_in_d_bits_corrupt (1'h0)
  );
  assign auto_in_a_ready = _portsAOI_in_0_a_ready_WIRE;	// @[Mux.scala:27:73]
  assign auto_in_d_valid = out_9_valid;	// @[Arbiter.scala:125:29]
  assign auto_in_d_bits_opcode = out_9_bits_opcode;	// @[Mux.scala:27:73]
  assign auto_in_d_bits_size = out_9_bits_size;	// @[Mux.scala:27:73]
  assign auto_in_d_bits_source = out_9_bits_source;	// @[Mux.scala:27:73]
  assign auto_in_d_bits_data = (muxStateEarly_0 ? auto_out_0_d_bits_data : 64'h0) | (muxStateEarly_1 ? auto_out_1_d_bits_data : 64'h0);	// @[Arbiter.scala:117:30, Bundles.scala:259:74, Mux.scala:27:73]
  assign auto_out_1_a_valid = auto_in_a_valid & auto_in_a_bits_address[30];	// @[Parameters.scala:137:45, Xbar.scala:430:50]
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_1_a_bits_param = auto_in_a_bits_param;
  assign auto_out_1_a_bits_size = auto_in_a_bits_size;
  assign auto_out_1_a_bits_source = auto_in_a_bits_source;
  assign auto_out_1_a_bits_address = auto_in_a_bits_address;
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_1_a_bits_data = auto_in_a_bits_data;
  assign auto_out_1_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_1_d_ready = auto_in_d_ready & (idle ? readys_readys[1] : state_1);	// @[Arbiter.scala:26:18, :88:28, :95:86, :116:26, :121:24, :123:31]
  assign auto_out_0_a_valid = auto_in_a_valid & ~(auto_in_a_bits_address[30]);	// @[Parameters.scala:137:{45,65}, Xbar.scala:430:50]
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_0_a_bits_param = auto_in_a_bits_param;
  assign auto_out_0_a_bits_size = auto_in_a_bits_size;
  assign auto_out_0_a_bits_source = auto_in_a_bits_source;
  assign auto_out_0_a_bits_address = auto_in_a_bits_address[14:0];	// @[BundleMap.scala:247:19]
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_0_a_bits_data = auto_in_a_bits_data;
  assign auto_out_0_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_0_d_ready = auto_in_d_ready & (idle ? readys_readys[0] : state_0);	// @[Arbiter.scala:26:18, :88:28, :95:86, :116:26, :121:24, :123:31]
endmodule

