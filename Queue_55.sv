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

module Queue_55(
  input         clock,
                reset,
                io_enq_valid,
  input  [31:0] io_enq_bits_data_0_0,
                io_enq_bits_data_1_0,
                io_enq_bits_data_2_0,
                io_enq_bits_data_3_0,
                io_enq_bits_data_4_0,
                io_enq_bits_data_5_0,
                io_enq_bits_data_6_0,
                io_enq_bits_data_7_0,
                io_enq_bits_data_8_0,
                io_enq_bits_data_9_0,
                io_enq_bits_data_10_0,
                io_enq_bits_data_11_0,
                io_enq_bits_data_12_0,
                io_enq_bits_data_13_0,
                io_enq_bits_data_14_0,
                io_enq_bits_data_15_0,
  input         io_enq_bits_fromDMA,
  input  [31:0] io_enq_bits_scale_bits,
                io_enq_bits_igelu_qb,
                io_enq_bits_igelu_qc,
                io_enq_bits_iexp_qln2,
                io_enq_bits_iexp_qln2_inv,
  input  [2:0]  io_enq_bits_act,
  input         io_deq_ready,
  output        io_enq_ready,
                io_deq_valid,
  output [31:0] io_deq_bits_data_0_0,
                io_deq_bits_data_1_0,
                io_deq_bits_data_2_0,
                io_deq_bits_data_3_0,
                io_deq_bits_data_4_0,
                io_deq_bits_data_5_0,
                io_deq_bits_data_6_0,
                io_deq_bits_data_7_0,
                io_deq_bits_data_8_0,
                io_deq_bits_data_9_0,
                io_deq_bits_data_10_0,
                io_deq_bits_data_11_0,
                io_deq_bits_data_12_0,
                io_deq_bits_data_13_0,
                io_deq_bits_data_14_0,
                io_deq_bits_data_15_0,
  output        io_deq_bits_fromDMA,
  output [31:0] io_deq_bits_scale_bits,
                io_deq_bits_igelu_qb,
                io_deq_bits_igelu_qc,
                io_deq_bits_iexp_qln2,
                io_deq_bits_iexp_qln2_inv,
  output [2:0]  io_deq_bits_act,
  output        io_count
);

  wire         _io_enq_ready_output;	// @[Decoupled.scala:303:16, :323:{24,39}]
  wire [677:0] _ram_ext_R0_data;	// @[Decoupled.scala:273:95]
  reg          maybe_full;	// @[Decoupled.scala:276:27]
  wire         _io_deq_valid_output = io_enq_valid | maybe_full;	// @[Decoupled.scala:276:27, :302:16, :314:{24,39}]
  wire         do_enq = ~(~maybe_full & io_deq_ready) & _io_enq_ready_output & io_enq_valid;	// @[Decoupled.scala:276:27, :278:28, :280:27, :303:16, :315:17, :318:{26,35}, :323:{24,39}]
  assign _io_enq_ready_output = io_deq_ready | ~maybe_full;	// @[Decoupled.scala:276:27, :303:{16,19}, :323:{24,39}]
  always @(posedge clock) begin
    if (reset)
      maybe_full <= 1'h0;	// @[Decoupled.scala:276:27]
    else if (do_enq != (maybe_full & io_deq_ready & _io_deq_valid_output))	// @[Decoupled.scala:276:27, :280:27, :281:27, :293:15, :302:16, :314:{24,39}, :315:17, :317:14, :318:{26,35}]
      maybe_full <= do_enq;	// @[Decoupled.scala:276:27, :280:27, :315:17, :318:{26,35}]
  end // always @(posedge)
  `ifndef SYNTHESIS
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
        maybe_full = _RANDOM_0[0];	// @[Decoupled.scala:276:27]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  ram_combMem_50 ram_ext (	// @[Decoupled.scala:273:95]
    .R0_addr (1'h0),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .W0_addr (1'h0),
    .W0_en   (do_enq),	// @[Decoupled.scala:280:27, :315:17, :318:{26,35}]
    .W0_clk  (clock),
    .W0_data ({2'h0, io_enq_bits_act, io_enq_bits_iexp_qln2_inv, io_enq_bits_iexp_qln2, io_enq_bits_igelu_qc, io_enq_bits_igelu_qb, io_enq_bits_scale_bits, io_enq_bits_fromDMA, io_enq_bits_data_15_0, io_enq_bits_data_14_0, io_enq_bits_data_13_0, io_enq_bits_data_12_0, io_enq_bits_data_11_0, io_enq_bits_data_10_0, io_enq_bits_data_9_0, io_enq_bits_data_8_0, io_enq_bits_data_7_0, io_enq_bits_data_6_0, io_enq_bits_data_5_0, io_enq_bits_data_4_0, io_enq_bits_data_3_0, io_enq_bits_data_2_0, io_enq_bits_data_1_0, io_enq_bits_data_0_0}),	// @[Decoupled.scala:273:95]
    .R0_data (_ram_ext_R0_data)
  );
  assign io_enq_ready = _io_enq_ready_output;	// @[Decoupled.scala:303:16, :323:{24,39}]
  assign io_deq_valid = _io_deq_valid_output;	// @[Decoupled.scala:302:16, :314:{24,39}]
  assign io_deq_bits_data_0_0 = maybe_full ? _ram_ext_R0_data[31:0] : io_enq_bits_data_0_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_1_0 = maybe_full ? _ram_ext_R0_data[63:32] : io_enq_bits_data_1_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_2_0 = maybe_full ? _ram_ext_R0_data[95:64] : io_enq_bits_data_2_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_3_0 = maybe_full ? _ram_ext_R0_data[127:96] : io_enq_bits_data_3_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_4_0 = maybe_full ? _ram_ext_R0_data[159:128] : io_enq_bits_data_4_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_5_0 = maybe_full ? _ram_ext_R0_data[191:160] : io_enq_bits_data_5_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_6_0 = maybe_full ? _ram_ext_R0_data[223:192] : io_enq_bits_data_6_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_7_0 = maybe_full ? _ram_ext_R0_data[255:224] : io_enq_bits_data_7_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_8_0 = maybe_full ? _ram_ext_R0_data[287:256] : io_enq_bits_data_8_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_9_0 = maybe_full ? _ram_ext_R0_data[319:288] : io_enq_bits_data_9_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_10_0 = maybe_full ? _ram_ext_R0_data[351:320] : io_enq_bits_data_10_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_11_0 = maybe_full ? _ram_ext_R0_data[383:352] : io_enq_bits_data_11_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_12_0 = maybe_full ? _ram_ext_R0_data[415:384] : io_enq_bits_data_12_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_13_0 = maybe_full ? _ram_ext_R0_data[447:416] : io_enq_bits_data_13_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_14_0 = maybe_full ? _ram_ext_R0_data[479:448] : io_enq_bits_data_14_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_data_15_0 = maybe_full ? _ram_ext_R0_data[511:480] : io_enq_bits_data_15_0;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_fromDMA = maybe_full ? _ram_ext_R0_data[512] : io_enq_bits_fromDMA;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_scale_bits = maybe_full ? _ram_ext_R0_data[544:513] : io_enq_bits_scale_bits;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_igelu_qb = maybe_full ? _ram_ext_R0_data[576:545] : io_enq_bits_igelu_qb;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_igelu_qc = maybe_full ? _ram_ext_R0_data[608:577] : io_enq_bits_igelu_qc;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_iexp_qln2 = maybe_full ? _ram_ext_R0_data[640:609] : io_enq_bits_iexp_qln2;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_iexp_qln2_inv = maybe_full ? _ram_ext_R0_data[672:641] : io_enq_bits_iexp_qln2_inv;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_deq_bits_act = maybe_full ? _ram_ext_R0_data[675:673] : io_enq_bits_act;	// @[Decoupled.scala:273:95, :276:27, :310:17, :315:17, :316:19]
  assign io_count = maybe_full;	// @[Decoupled.scala:276:27]
endmodule

