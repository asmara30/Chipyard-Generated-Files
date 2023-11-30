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

module CLINT(
  input         clock,
                reset,
                auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [10:0] auto_in_a_bits_source,
  input  [25:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
                io_rtcTick,
  output        auto_int_out_0,
                auto_int_out_1,
                auto_in_a_ready,
                auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_size,
  output [10:0] auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data
);

  wire             out_woready_9;	// @[RegisterRouter.scala:82:24]
  wire             out_woready_17;	// @[RegisterRouter.scala:82:24]
  reg  [63:0]      time_0;	// @[CLINT.scala:69:23]
  reg  [63:0]      timecmp_0;	// @[CLINT.scala:73:41]
  reg              ipi_0;	// @[CLINT.scala:74:41]
  wire             out_front_bits_read = auto_in_a_bits_opcode == 3'h4;	// @[RegisterRouter.scala:71:36]
  wire             _out_out_bits_data_WIRE_1 = auto_in_a_bits_address[13:3] == 11'h0;	// @[Edges.scala:191:34, RegisterRouter.scala:72:19, :82:24]
  wire             valids_1_0 = out_woready_9 & auto_in_a_bits_mask[0];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_1_1 = out_woready_9 & auto_in_a_bits_mask[1];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_1_2 = out_woready_9 & auto_in_a_bits_mask[2];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_1_3 = out_woready_9 & auto_in_a_bits_mask[3];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_1_4 = out_woready_9 & auto_in_a_bits_mask[4];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_1_5 = out_woready_9 & auto_in_a_bits_mask[5];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_1_6 = out_woready_9 & auto_in_a_bits_mask[6];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_1_7 = out_woready_9 & auto_in_a_bits_mask[7];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_0 = out_woready_17 & auto_in_a_bits_mask[0];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_1 = out_woready_17 & auto_in_a_bits_mask[1];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_2 = out_woready_17 & auto_in_a_bits_mask[2];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_3 = out_woready_17 & auto_in_a_bits_mask[3];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_4 = out_woready_17 & auto_in_a_bits_mask[4];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_5 = out_woready_17 & auto_in_a_bits_mask[5];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_6 = out_woready_17 & auto_in_a_bits_mask[6];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             valids_7 = out_woready_17 & auto_in_a_bits_mask[7];	// @[Bitwise.scala:28:17, RegisterRouter.scala:82:24]
  wire             _out_wofireMux_T_2 = auto_in_a_valid & auto_in_d_ready & ~out_front_bits_read;	// @[RegisterRouter.scala:71:36, :82:24]
  assign out_woready_17 = _out_wofireMux_T_2 & auto_in_a_bits_address[15:14] == 2'h1 & _out_out_bits_data_WIRE_1;	// @[Cat.scala:33:92, OneHot.scala:57:35, RegisterRouter.scala:82:24]
  assign out_woready_9 = _out_wofireMux_T_2 & auto_in_a_bits_address[15:14] == 2'h2 & (&(auto_in_a_bits_address[13:3]));	// @[Cat.scala:33:92, Edges.scala:191:34, OneHot.scala:57:35, RegisterRouter.scala:72:19, :82:24]
  wire [3:0]       _GEN = {{1'h1}, {&(auto_in_a_bits_address[13:3])}, {_out_out_bits_data_WIRE_1}, {_out_out_bits_data_WIRE_1}};	// @[CLINT.scala:70:38, Edges.scala:191:34, MuxLiteral.scala:49:10, RegisterRouter.scala:72:19, :82:24]
  wire [3:0][63:0] _GEN_0 = {{64'h0}, {time_0}, {timecmp_0}, {{63'h0, ipi_0}}};	// @[CLINT.scala:69:23, :73:41, :74:41, MuxLiteral.scala:49:{10,48}]
  wire [2:0]       bundleIn_0_d_bits_opcode = {2'h0, out_front_bits_read};	// @[OneHot.scala:57:35, RegisterRouter.scala:71:36, :97:19]
  always @(posedge clock) begin
    if (reset) begin
      time_0 <= 64'h0;	// @[CLINT.scala:69:23]
      ipi_0 <= 1'h0;	// @[CLINT.scala:73:41, :74:41]
    end
    else begin
      if (valids_1_0 | valids_1_1 | valids_1_2 | valids_1_3 | valids_1_4 | valids_1_5 | valids_1_6 | valids_1_7)	// @[RegField.scala:154:27, RegisterRouter.scala:82:24]
        time_0 <= {valids_1_7 ? auto_in_a_bits_data[63:56] : time_0[63:56], valids_1_6 ? auto_in_a_bits_data[55:48] : time_0[55:48], valids_1_5 ? auto_in_a_bits_data[47:40] : time_0[47:40], valids_1_4 ? auto_in_a_bits_data[39:32] : time_0[39:32], valids_1_3 ? auto_in_a_bits_data[31:24] : time_0[31:24], valids_1_2 ? auto_in_a_bits_data[23:16] : time_0[23:16], valids_1_1 ? auto_in_a_bits_data[15:8] : time_0[15:8], valids_1_0 ? auto_in_a_bits_data[7:0] : time_0[7:0]};	// @[CLINT.scala:69:23, RegField.scala:151:57, :152:31, :154:52, :158:{20,33}, RegisterRouter.scala:82:24]
      else if (io_rtcTick)
        time_0 <= time_0 + 64'h1;	// @[CLINT.scala:69:23, :70:38]
      if (_out_wofireMux_T_2 & auto_in_a_bits_address[15:14] == 2'h0 & _out_out_bits_data_WIRE_1 & auto_in_a_bits_mask[0])	// @[Bitwise.scala:28:17, Cat.scala:33:92, OneHot.scala:57:35, RegisterRouter.scala:82:24]
        ipi_0 <= auto_in_a_bits_data[0];	// @[CLINT.scala:74:41, RegisterRouter.scala:82:24]
    end
    if (valids_0 | valids_1 | valids_2 | valids_3 | valids_4 | valids_5 | valids_6 | valids_7)	// @[RegField.scala:154:27, RegisterRouter.scala:82:24]
      timecmp_0 <= {valids_7 ? auto_in_a_bits_data[63:56] : timecmp_0[63:56], valids_6 ? auto_in_a_bits_data[55:48] : timecmp_0[55:48], valids_5 ? auto_in_a_bits_data[47:40] : timecmp_0[47:40], valids_4 ? auto_in_a_bits_data[39:32] : timecmp_0[39:32], valids_3 ? auto_in_a_bits_data[31:24] : timecmp_0[31:24], valids_2 ? auto_in_a_bits_data[23:16] : timecmp_0[23:16], valids_1 ? auto_in_a_bits_data[15:8] : timecmp_0[15:8], valids_0 ? auto_in_a_bits_data[7:0] : timecmp_0[7:0]};	// @[CLINT.scala:73:41, RegField.scala:151:57, :152:31, :154:52, :158:{20,33}, RegisterRouter.scala:82:24]
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        _RANDOM_3 = `RANDOM;
        _RANDOM_4 = `RANDOM;
        time_0 = {_RANDOM_0, _RANDOM_1};	// @[CLINT.scala:69:23]
        timecmp_0 = {_RANDOM_2, _RANDOM_3};	// @[CLINT.scala:73:41]
        ipi_0 = _RANDOM_4[0];	// @[CLINT.scala:74:41]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  TLMonitor_57 monitor (	// @[Nodes.scala:24:25]
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (auto_in_d_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_a_bits_corrupt),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (auto_in_a_valid),
    .io_in_d_bits_opcode  (bundleIn_0_d_bits_opcode),	// @[RegisterRouter.scala:97:19]
    .io_in_d_bits_size    (auto_in_a_bits_size),
    .io_in_d_bits_source  (auto_in_a_bits_source)
  );
  assign auto_int_out_0 = ipi_0;	// @[CLINT.scala:74:41]
  assign auto_int_out_1 = time_0 >= timecmp_0;	// @[CLINT.scala:69:23, :73:41, :79:43]
  assign auto_in_a_ready = auto_in_d_ready;
  assign auto_in_d_valid = auto_in_a_valid;
  assign auto_in_d_bits_opcode = bundleIn_0_d_bits_opcode;	// @[RegisterRouter.scala:97:19]
  assign auto_in_d_bits_size = auto_in_a_bits_size;
  assign auto_in_d_bits_source = auto_in_a_bits_source;
  assign auto_in_d_bits_data = _GEN[auto_in_a_bits_address[15:14]] ? _GEN_0[auto_in_a_bits_address[15:14]] : 64'h0;	// @[CLINT.scala:69:23, Cat.scala:33:92, MuxLiteral.scala:49:10, RegisterRouter.scala:82:24]
endmodule

