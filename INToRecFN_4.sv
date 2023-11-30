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

module INToRecFN_4(
  input  [31:0] io_in,
  output [32:0] io_out
);

  wire [31:0] intAsRawFloat_absIn = io_in[31] ? 32'h0 - io_in : io_in;	// @[Cat.scala:33:92, rawFloatFromIN.scala:50:34, :51:{24,31}]
  wire [4:0]  intAsRawFloat_adjustedNormDist = intAsRawFloat_absIn[31] ? 5'h0 : intAsRawFloat_absIn[30] ? 5'h1 : intAsRawFloat_absIn[29] ? 5'h2 : intAsRawFloat_absIn[28] ? 5'h3 : intAsRawFloat_absIn[27] ? 5'h4 : intAsRawFloat_absIn[26] ? 5'h5 : intAsRawFloat_absIn[25] ? 5'h6 : intAsRawFloat_absIn[24] ? 5'h7 : intAsRawFloat_absIn[23] ? 5'h8 : intAsRawFloat_absIn[22] ? 5'h9 : intAsRawFloat_absIn[21] ? 5'hA : intAsRawFloat_absIn[20] ? 5'hB : intAsRawFloat_absIn[19] ? 5'hC : intAsRawFloat_absIn[18] ? 5'hD : intAsRawFloat_absIn[17] ? 5'hE : intAsRawFloat_absIn[16] ? 5'hF : intAsRawFloat_absIn[15] ? 5'h10 : intAsRawFloat_absIn[14] ? 5'h11 : intAsRawFloat_absIn[13] ? 5'h12 : intAsRawFloat_absIn[12] ? 5'h13 : intAsRawFloat_absIn[11] ? 5'h14 : intAsRawFloat_absIn[10] ? 5'h15 : intAsRawFloat_absIn[9] ? 5'h16 : intAsRawFloat_absIn[8] ? 5'h17 : intAsRawFloat_absIn[7] ? 5'h18 : intAsRawFloat_absIn[6] ? 5'h19 : intAsRawFloat_absIn[5] ? 5'h1A : intAsRawFloat_absIn[4] ? 5'h1B : intAsRawFloat_absIn[3] ? 5'h1C : intAsRawFloat_absIn[2] ? 5'h1D : {4'hF, ~(intAsRawFloat_absIn[1])};	// @[Mux.scala:47:70, primitives.scala:92:52, rawFloatFromIN.scala:51:24, :52:56]
  wire [62:0] _intAsRawFloat_sig_T = {31'h0, intAsRawFloat_absIn} << intAsRawFloat_adjustedNormDist;	// @[Mux.scala:47:70, rawFloatFromIN.scala:51:24, :55:22]
  RoundAnyRawFNToRecFN_8 roundAnyRawFNToRecFN (	// @[INToRecFN.scala:59:15]
    .io_in_isZero (~(_intAsRawFloat_sig_T[31])),	// @[rawFloatFromIN.scala:55:{22,41}, :61:{23,28}]
    .io_in_sign   (io_in[31]),	// @[rawFloatFromIN.scala:50:34]
    .io_in_sExp   ({3'h2, ~intAsRawFloat_adjustedNormDist}),	// @[Mux.scala:47:70, rawFloatFromIN.scala:63:{39,75}]
    .io_in_sig    ({1'h0, _intAsRawFloat_sig_T[31:0]}),	// @[rawFloatFromIN.scala:51:31, :55:{22,41}, :64:20]
    .io_out       (io_out)
  );
endmodule

